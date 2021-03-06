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


## Project Codebook

The project codebook was written using R Markdown which contains
some R code to generate some of the tables.  If you are viewing
the codebook on GitHub, it is best to view the markdown version
([Codebook.md](https://github.com/DaddyTheRunner/datasciencecoursera/blob/get-clean-data-proj/get-clean-data-proj/Codebook.md))
which is automatically generated by knitr while producing the
standalone HTML version.


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
4. Reads in each of the files used into separate data frames
5. Combines the data frames into a single project data frame
6. Filters out the features (i.e. columns) not needed for this project
7. Cleans up the feature names to make them valid R variable names
8. Applies the activity names as a factor
9. Groups the large dataset by subject ID and activity
10. Calculates the mean for each of the 66 variables and 180 groupings of subject ID and activity.  (180 = 30 subjects x 6 activities)
11. Writes the results to a text file

Details of each step are documented in the R code file.

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
|[run_analysis.R](https://github.com/DaddyTheRunner/datasciencecoursera/blob/get-clean-data-proj/get-clean-data-proj/run_analysis.R)|R script that obtains the data and converts it into a tidy dataset.|


### Generated Files

Note:  These files are automatically generated from the source files.
Any manual edits to these files will be lost when the source files are
reprocessed.

|File Name|Description|
|---------|-----------|
|[Codebook.md](https://github.com/DaddyTheRunner/datasciencecoursera/blob/get-clean-data-proj/get-clean-data-proj/Codebook.md)|Compiled markdown codebook from the Rmd file.|
|[Codebook.html](https://github.com/DaddyTheRunner/datasciencecoursera/blob/get-clean-data-proj/get-clean-data-proj/Codebook.html)|Compiled HTML codebook from the Rmd file.|
