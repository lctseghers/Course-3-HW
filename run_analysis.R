## This script contains the code for obtaining, merging, and cleaning two datasets, X_test.txt and X_train.txt.
## The original source of these datasets is:
## "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
## The zip file was saved locally prior to loading into RStudio (v3.5.1)
## Unzipped files were put in directories "/test" and "/train" as appropriate

## load relevant packages

library(tidyverse)
library(readr)
library(plyr)
library(dplyr)
library(data.table)
library(stringr)
library(reshape2)

## read test dataset text file and store as "X_test"
## read train dataset text file and store as "X_train"

X_test <- read.table("test/X_test.txt")
X_train <- read.table("train/X_train.txt")

## rename the columns in both data sets using the features.txt file

features <- read.table("test/features.txt")
headers <- as.character(features$V2)
colnames(X_test) <- headers
colnames(X_train) <- headers

## read in test and training labels text files
## add columns for test and training labels to their respective datasets

test_activities <- read.table("test/y_test.txt")
train_activities <- read.table("train/y_train.txt")

test_activity <- test_activities$V1
X_test <- cbind(activities=test_activity, X_test)
train_activity <- train_activities$V1
X_train <- cbind(activities=train_activity, X_train)

## read in test and training subjects text files
## add columns for test and training subjects to their respective datasets

subject_test <- read.table("test/subject_test.txt")
subject_train <- read.table("train/subject_train.txt")

sub_test <- subject_test$V1
X_test <- cbind(subject=sub_test, X_test)
sub_train <- subject_train$V1
X_train <- cbind(subject=sub_train, X_train)

## merge the two sets by appending X_train to X_test using rbind

fullset <- rbind(X_test, X_train)

## clean up the variable names by removing all punctuation
## subset by subject, label, and mean and std dev for each measurement type
## remove extra columns with angle and mean frequency measurements
## Note that mean variables use both mean and Mean

colnames(fullset) <- gsub("[[:punct:]]", "", colnames(fullset))
mean_and_std <- fullset[, c(grep("subject", colnames(fullset)), 
                            grep("activities", colnames(fullset)), 
                            grep("[Mm]ean", colnames(fullset)), 
                            grep("std", colnames(fullset)))]
mean_and_std <- mean_and_std[, c(-grep("angle", colnames(mean_and_std)),
                                 -grep("meanFreq", colnames(mean_and_std)))]

## label variables with descriptive names rather than abbreviations
## per features_info.txt:
    ## t means time
    ## f means Fast Fourier Transform, use common abbreviation fft
    ## Acc means linear acceleration
    ## Gyro means angular velocity
    ## Mag indicates a calculated magnitude
    ## mean is the mean
    ## std is the standard deviation
    ## X is the X-axis
    ## Y is the Y-axis
    ## Z is the Z-axis

colnames(mean_and_std) <- str_replace_all(colnames(mean_and_std), 
                                c("^t" = "time.",
                                 "^f" = "fft.",
                                  "Body" = "body.",
                                  "[Gg]ravity" = "gravity.",
                                  "Acc" = "linear-acceleration.",
                                  "Gyro" = "angular-velocity.",
                                  "Jerk" = "jerk.",
                                  "Mag" = "magnitude.",
                                  "[Mm]ean" = "mean",
                                  "std" = "stdev",
                                  "[Xx]$" = ".x-axis",
                                  "[Yy]$" = ".y-axis",
                                  "[Zx]$" = ".z-axis"))

## read in activity labels, adjust to lower case, and map to label column values
## sort by subject and by activity (now in alphabetic order)

## first tidy data set = "mean_and_std"

act_labels <- read.table("test/activity_labels.txt")
activities <- as.character(tolower(act_labels$V2))
mean_and_std$activities <- mapvalues(mean_and_std$activities, c("1", "2", "3", "4", "5", "6"), activities)
mean_and_std <- arrange(mean_and_std, subject, activities)


## create independent tidy data set with means of each (measured) variable by activity and subject
## melt the first tidy data set preserving subject and activity as id's
## melt creates a third id called variable to identify measurement type
## cast the means for each easurement type by activity and subject

## second tidy data set = "measure_means"

melt_data <- melt(mean_and_std, id = c("subject", "activities"))
measure_means <- dcast(melt_data, activities + subject ~ variable, mean)
