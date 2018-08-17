# Course-3-HW
Homework from Week 4 of Data Science Course 3

Include a README.md in the repo with your scripts. This document explains how all of the scripts work and how they are connected.

The script "run_analysis.R" will take the given data files, merge as appropriate, and convert to a tidy data set ("mean_and_std") with the following constraints.  The script will also create a second tidy data set ("measure_means") matching the description in the homework instructions.

The script should:
1. Merge the training and the test sets to create one data set.
2. Extract only the measurements on the mean and standard deviation for each measurement.
3. Use descriptive activity names to name the activities in the data set
4. Appropriately label the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Prior to running the script, the zip file from the given path was saved and unzipped locally.  The data were obtained from:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The script reads in the primary X_test.txt and X_train.txt data files from local directories, as well as the features.txt, activity_labels.txt, activity files (y_test.txt and y_train.txt), and subject files (subject_test.txt and subject_train.txt).  The features file provides the column names, while activities and subjects become variables in their respective primary data sets.  The two primary data files are merged by subject number.

The column names are cleaned of punctuation and filtered to keep only those representing the mean and standard deviation for each measurement.  The names are expanded to be more readable (using some abbreviations such as fft for Fast Fourier Transform and stdev for standard deviation).

Activities are initially represented by numbers 1-6, so these are replaced with character strings representing the names of the activities from the activity_labels.txt file.  Finally, the data set is arranged by subject (ascending) and activity (alphabetically) type.

The last two lines of code take the resulting data set "mean_and_std", melt it, and cast it so that the means for each measurement type are organized by activity and then by subject.
