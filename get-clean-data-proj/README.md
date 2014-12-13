# Getting and Cleaning Data Course Project

This directory contains all of the files used for the Getting and
Cleaning Data course project.

## Project Description

This project demonstrates how to create a clean tidy data set.
The project uses a publically available dataset created from a
study using smartphone accelerometers which were used to track
individuals daily activities.

A detailed description of the publically available data can be
obtained [here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

The specific dataset used for this project was obtained from the
course instructors' Amazon cloudFront directory at the following
link:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Note:  The class's dataset may be different than the dataset
hosted at UCI since it represents a snapshot in time based on
when the instructors obtained the dataset from the source.

## Descriptionn of Project Script

`run_analysis.R` is the main script used in this project.  It
performs all tasks necessary to complete the project.  The script
is written in a way that allows a user to reproduce the results
starting with an empty working directory.  However, it is smart enough
not to re-download the data if it already exists in the data directory.

Here are the steps taken by `run_analysis.R`:

1. Check for and create a data directory if needed
2. Check for and download the raw dataset if needed
3. Unzip the dataset if needed



## List of Project Files

This section describes the directories and files used in this project.
It only lists the files that were created for this project.  See the project
[codebook](https://github.com/DaddyTheRunner/datasciencecoursera/blob/get-clean-data-proj/get-clean-data-proj/Codebook.Rmd) for a description of the files in
the dataset.

### Directories

These are the directories used in this project.

|Directory Name|Description|
|--------------|-----------|
|Data|Contains all of the public data used in this project|


### Source Files

These are the files that should be edited.  They are used to generate
all of the other files in the project.  The links take you to the GitHub
copy of the files.

|File Name|Description|
|---------|-----------|
|[README.md](https://github.com/DaddyTheRunner/datasciencecoursera/blob/get-clean-data-proj/get-clean-data-proj/README.md)|This file.|
|[Codebook.Rmd](https://github.com/DaddyTheRunner/datasciencecoursera/blob/get-clean-data-proj/get-clean-data-proj/Codebook.Rmd)|Source R markdown file for the project codebook.|
|[run_analysis.R]()|R script that obtains the data and converts it into a tidy dataset.|


### Generated Files

Note:  These files are automatically generated from the source files.
Any manual edits to these files will be lost when the source files are
reprocessed.

|File Name|Description|
|---------|-----------|
|Codebook.md|Compiled markdown codebook from the Rmd file.|
|Codebook.html|Compiled HTML codebook from the Rmd file.|
