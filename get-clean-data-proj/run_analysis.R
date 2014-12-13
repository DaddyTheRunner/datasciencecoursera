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
