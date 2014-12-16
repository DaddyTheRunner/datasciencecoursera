###################
#
# run_analysis.R
# Author:  Jason M.
# Date:  2014-12-12
# 
# Description:
#   R script for the Getting and Cleaning Data course project
#
###################

## Load the required libraries
require(stringi)
require(dplyr)

## Check to see if we are in the correct working directory
if (!stri_endswith_fixed(getwd(), "get-clean-data-proj")) {
  stop("Not runing in the get-clean-data-proj directory!")
}

## Create a local directory for the data if it doesn't already exist
data.dir <- "./Data"
if (!file.exists(data.dir)) { dir.create(data.dir) }

## Download the dataset if it doesn't already exist locally
data.file <- "dataset.zip"
if (!file.exists(file.path(data.dir, data.file))) {
  ## Note:  I converted the url from https: to http: to avoid certificate issues
  url.data <- "http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  download.file(url.data, file.path(data.dir, data.file), mode="wb")
}

## Unzip the file if necessary
if (!file.exists(file.path(data.dir, "UCI HAR Dataset"))) {
  unzip(file.path(data.dir, data.file), exdir = data.dir)
}

## Set some file names for reading in the data files
## First update the data directory
data.dir <- "./Data/UCI HAR Dataset/"
features.fn <- "features.txt"
xTrain.fn <- "train/X_train.txt"
xTest.fn <- "test/X_test.txt"
yTrain.fn <- "train/y_train.txt"
yTest.fn <- "test/y_test.txt"
subjTrain.fn <- "train/subject_train.txt"
subjTest.fn <- "test/subject_test.txt"
actLbls.fn <- "activity_labels.txt"

## Now read in the data
features <- read.table(file.path(data.dir, features.fn), stringsAsFactors = FALSE)
xTrain <- read.table(file.path(data.dir, xTrain.fn), stringsAsFactors = FALSE)
yTrain <- read.table(file.path(data.dir, yTrain.fn), stringsAsFactors = FALSE)
xTest <- read.table(file.path(data.dir, xTest.fn), stringsAsFactors = FALSE)
yTest <- read.table(file.path(data.dir, yTest.fn), stringsAsFactors = FALSE)
subjTrain <- read.table(file.path(data.dir, subjTrain.fn), stringsAsFactors = FALSE)
subjTest <- read.table(file.path(data.dir, subjTest.fn), stringsAsFactors = FALSE)
actLbls <- read.table(file.path(data.dir, actLbls.fn), stringsAsFactors = FALSE)

## Now we need to stitch the data together
## first combine the x test and x train data frames into one large data frame
xAll <- rbind_list(xTrain, xTest)
rm(xTrain, xTest)

## Next combine the subject train and test data frames
subjAll <- rbind_list(subjTrain, subjTest)
rm(subjTrain, subjTest)

## Next combine the activity IDs for the train and test data frames
yAll <- rbind_list(yTrain, yTest)
rm(yTrain, yTest)

## Now filter out the features we don't need for this project
features <- filter(features, grepl('mean\\(\\)|std\\(\\)', V2))
colsToKeep <- paste("V", features$V1, sep="")
## Convert xAll into a table for dplyr to work with
xAll <- tbl_df(xAll)
xAll <- select(xAll, one_of(colsToKeep))

## Clean up the feature names to make them valid column names
features$V2 <- make.names(features$V2) %>%
  stri_replace_all_fixed("...", ".") %>%
  stri_replace_all_fixed("..", "") %>%
  stri_replace("time.", regex="^t") %>%
  stri_replace("freq.", regex="^f") %>%
  stri_replace_first_fixed("BodyAcc", "Body.Acceleration") %>%
  stri_replace_first_fixed("GravityAcc", "Gravity.Acceleration") %>%
  stri_replace_first_fixed("BodyGyro", "Body.Gyroscope") %>%
  stri_replace_first_fixed("Jerk", ".Jerk") %>%
  stri_replace_first_fixed("Mag", ".Magnitude") %>%
  stri_replace_all_fixed("BodyBody", "Body")

# Apply the feature names to the columns
names(xAll) <- features$V2

## Clean up the activity names and merge them into the dataset as a factor
actLbls$V2 <- actLbls$V2 %>%
  stri_replace_all_fixed("_", ".")
Activities <- left_join(yAll, actLbls)[,2]
names(Activities) <- "Activity"
Activity <- factor(Activities$Activity, levels=actLbls$V2, ordered=TRUE)
xAll <- cbind(Activity, xAll)

## Now add in the subject IDs
names(subjAll) <- "Subject.ID"
xAll <- cbind(subjAll, xAll)

## Now group the data by Subj ID and Activity
xAll <- group_by(xAll, Subject.ID, Activity)

## Calculate the mean for each variable and each pairing of subject and activity
result <- summarise_each(xAll, funs(mean))

## Write the results to a file
write.table(result, "./Data/summary-results.txt", row.names=FALSE)
