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
actLbls.fn <- read.table(file.path(data.dir, actLbls.fn), stringsAsFactors = FALSE)

## Now we need to stitch the data together
