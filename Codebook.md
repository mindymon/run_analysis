---
title: "Codebook.md"
author: "Mindy Montgomery"
date: "April 26, 2015"
output: html_document
---
For information regarding the original data set, please see the end of this document.  

Most data used in this analysis was taken "as-is" from the original UCI Machine Learning Repository: Human Activity Recognition Using Smartphones Data Set found here: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones#, however several transformations were made.  Namely, 

The training and test data sets were combined.
The features data set was appended with the "Subject" and "Activity" data sets.
Activites that were originally integer values were mapped/replaced with character factors to make them more human readable in the output file.

One the data was fully combined (feature set + activities + subjects), a subset of data was taken to examine only those variables/features that were the calculated standard deviation and mean from the observed raw data sets.  Those data values are described in the information below, from the original data set code book.  In a nutshell, these were the mean and standard deviation of readings from the gyroscopes and acclerometers contained within the smartphone.  In addition, there were other dervied statistics included, based on a combination of the readings from both of the instruments.

From the original data set codebook: Feature Selection 
=================

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation