##Merges the training and the test sets to create one data set. - merge the data files 
##Extracts only the measurements on the mean and standard deviation for each measurement. 
##Uses descriptive activity names to name the activities in the data set - assign column names to each column = subject, activity, Readings headings
##Appropriately labels the data set with descriptive variable names.  - replace numeric labels for activity with named labels from y_train.txt and y_test.txt
##From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each ##subject.

## Using dplyr and reshape2 packages

##Read in all of the data files
trainingData <- read.table("X_train.txt")
testingData <- read.table("X_test.txt")
featureNames <- read.table("features.txt")
activityTest <- read.table("y_test.txt")
activityTrain <- read.table("y_train.txt")
testSubjectsTrain <- read.table("subject_train.txt")
testSubjectsTest <- read.table("subject_test.txt")
activityNames <- read.table("activity_labels.txt")

##Transform feature names to a column from a row
columnNames <- t(tolower(featureNames[,2]))

#add column names to testing and training subjects
names(testSubjectsTest)[1] <- "Subject"
names(testSubjectsTrain)[1] <- "Subject"

#add column names to testing and training activities
names(activityTest)[1] <- "Activity"
names(activityTrain)[1] <- "Activity"

##Assign column names to each data set
namedTrainingData <- setNames(data.frame(trainingData), columnNames)
namedTestingData <- setNames(data.frame(testingData), columnNames)

##Add activity information to each observation
namedTestingData <- cbind(activityTest, namedTestingData)
namedTrainingData <- cbind(activityTrain, namedTrainingData)

##Add test subject information to each observation
namedTestingData <- cbind(testSubjectsTest, namedTestingData)
namedTrainingData <- cbind(testSubjectsTrain, namedTrainingData)

##merge the data sets
mergedData = rbind(namedTestingData, namedTrainingData)

##create list of activity names
activityNames <- t(as.character(activityNames[ ,"V2"]))

##replace numeric activities with activity names
mergedData$Activity[mergedData$Activity == 1] <- activityNames[1]
mergedData$Activity[mergedData$Activity == 2] <- activityNames[2]
mergedData$Activity[mergedData$Activity == 3] <- activityNames[3]
mergedData$Activity[mergedData$Activity == 4] <- activityNames[4]
mergedData$Activity[mergedData$Activity == 5] <- activityNames[5]
mergedData$Activity[mergedData$Activity == 6] <- activityNames[6]

mergedData <- mergedData[ !duplicated(names(mergedData)) ]
##subset the columns that contain observations of mean and standard deviation for each observed value, also solves the duplicate column name issue
stdMeanData <- select(mergedData, matches("Subject"), matches("Activity"), contains("std()"), contains("mean()"))

##labels the variables with more descriptive names

##create a tidy dataset with the mean for each variable given a subject and an activity
meltedData <- melt(stdMeanData, id = c("Subject", "Activity"))
names(meltedData) <- c("Subject", "Activity", "Measurement", "Value")
meanMeltedData <-aggregate(meltedData$Value, list(meltedData$Subject, meltedData$Activity, meltedData$Measurement), mean)
names(meanMeltedData) <- c("Subject", "Activity", "Measurement", "Value")

##write the file to submit for the course
write.table(meanMeltedData, file = "MindyMontgomeryRunAnalysis.txt", row.names = FALSE)
