---
title: "README.md"
author: "Mindy Montgomery"
date: "April 26, 2015"
output: html_document
---

This file describes the set up and configuration for run_anlysis.R, a Course Project for "Getting and Cleaning Data" from Coursera.

Data used for this project is from the UCI Machine Learning Repository: Human Activity Recognition Using Smartphones Data Set found here: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones#

The following packages are used as part of this analysis:

dplyr
reshape2

There is only one script file used in this analysis: run_analysis.R.  This script contains all of the necessary functions needed to complete the assignment.  

1) Merges the training and the test sets to create one data set.
2) Extracts only the measurements on the mean and standard deviation for each measurement. 
3) Uses descriptive activity names to name the activities in the data set
4) Appropriately labels the data set with descriptive variable names. 
5) From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

More specifically, the script performs the following steps:
- Read in all of the data files needed for the analysis
- Transform feature names to a column from a row
- Add Subject column names to testing and training subjects
- Add Activity column names to testing and training activities
- Assign column names to each data set
- Add activity information to each observation
- Add test subject information to each observation
- Merge the testing and training data sets
- Create list of activity names to assign to the numeric values
- Replace numeric activities with activity names
- Subset the columns that contain observations of mean and standard deviation for each observed value
- Label the variables with more descriptive names
- Create a tidy dataset with the mean for each variable given a subject and an activity
- Write the file to submit for the course assessment
