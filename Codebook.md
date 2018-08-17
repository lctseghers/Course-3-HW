Codebook for Tidy Data Set Assignment

Data Set Information:

This data originated from the site: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
For details about the data source, see: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

For each record in the dataset the following were provided: 
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration. 
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

The first tidy data set created by the script "run_analysis.R" is the result of the following processing:

Initial column names for the measurements were taken from the features.txt file, cleaned of punctuation, filtered to retain only mean and standard deviation measurements, and relabeled for easier readability.  Some more recognizable abbreviations were used, such as fft for Fast Fourier Transform and stdev for standard deviation.  The following is a list of what column name components were expanded.
    ## t means time*
    ## f means Fast Fourier Transform, used abbreviation fft
    ## Acc means linear acceleration
    ## Gyro means angular velocity
    ## Mag indicates a calculated magnitude
    ## std is the standard deviation, used abbreviation stdev
    ## X is the X-axis
    ## Y is the Y-axis
    ## Z is the Z-axis
    
    Notes from the original documentation: 
    1.  The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz.
    2.  Features are normalized and bounded within [-1,1], which results in some negative "time" values.
    3.  Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 
    4.  Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals).
    
For each of the following measurements, mean and standard deviation was provided, resulting in 66 measurement types.
                                            
 [3] "time.body.linear-acceleration.mean.x-axis"              "time.body.linear-acceleration.mean.y-axis"             
 [5] "time.body.linear-acceleration.mean.z-axis"              "time.gravity.linear-acceleration.mean.x-axis"          
 [7] "time.gravity.linear-acceleration.mean.y-axis"           "time.gravity.linear-acceleration.mean.z-axis"          
 [9] "time.body.linear-acceleration.jerk.mean.x-axis"         "time.body.linear-acceleration.jerk.mean.y-axis"        
[11] "time.body.linear-acceleration.jerk.mean.z-axis"         "time.body.angular-velocity.mean.x-axis"                
[13] "time.body.angular-velocity.mean.y-axis"                 "time.body.angular-velocity.mean.z-axis"                
[15] "time.body.angular-velocity.jerk.mean.x-axis"            "time.body.angular-velocity.jerk.mean.y-axis"           
[17] "time.body.angular-velocity.jerk.mean.z-axis"            "time.body.linear-acceleration.magnitude.mean"          
[19] "time.gravity.linear-acceleration.magnitude.mean"        "time.body.linear-acceleration.jerk.magnitude.mean"     
[21] "time.body.angular-velocity.magnitude.mean"              "time.body.angular-velocity.jerk.magnitude.mean"        
[23] "fft.body.linear-acceleration.mean.x-axis"               "fft.body.linear-acceleration.mean.y-axis"              
[25] "fft.body.linear-acceleration.mean.z-axis"               "fft.body.linear-acceleration.jerk.mean.x-axis"         
[27] "fft.body.linear-acceleration.jerk.mean.y-axis"          "fft.body.linear-acceleration.jerk.mean.z-axis"         
[29] "fft.body.angular-velocity.mean.x-axis"                  "fft.body.angular-velocity.mean.y-axis"                 
[31] "fft.body.angular-velocity.mean.z-axis"                  "fft.body.linear-acceleration.magnitude.mean"           
[33] "fft.body.body.linear-acceleration.jerk.magnitude.mean"  "fft.body.body.angular-velocity.magnitude.mean"         
[35] "fft.body.body.angular-velocity.jerk.magnitude.mean"     "time.body.linear-acceleration.stdev.x-axis"            
[37] "time.body.linear-acceleration.stdev.y-axis"             "time.body.linear-acceleration.stdev.z-axis"            
[39] "time.gravity.linear-acceleration.stdev.x-axis"          "time.gravity.linear-acceleration.stdev.y-axis"         
[41] "time.gravity.linear-acceleration.stdev.z-axis"          "time.body.linear-acceleration.jerk.stdev.x-axis"       
[43] "time.body.linear-acceleration.jerk.stdev.y-axis"        "time.body.linear-acceleration.jerk.stdev.z-axis"       
[45] "time.body.angular-velocity.stdev.x-axis"                "time.body.angular-velocity.stdev.y-axis"               
[47] "time.body.angular-velocity.stdev.z-axis"                "time.body.angular-velocity.jerk.stdev.x-axis"          
[49] "time.body.angular-velocity.jerk.stdev.y-axis"           "time.body.angular-velocity.jerk.stdev.z-axis"          
[51] "time.body.linear-acceleration.magnitude.stdev"          "time.gravity.linear-acceleration.magnitude.stdev"      
[53] "time.body.linear-acceleration.jerk.magnitude.stdev"     "time.body.angular-velocity.magnitude.stdev"            
[55] "time.body.angular-velocity.jerk.magnitude.stdev"        "fft.body.linear-acceleration.stdev.x-axis"             
[57] "fft.body.linear-acceleration.stdev.y-axis"              "fft.body.linear-acceleration.stdev.z-axis"             
[59] "fft.body.linear-acceleration.jerk.stdev.x-axis"         "fft.body.linear-acceleration.jerk.stdev.y-axis"        
[61] "fft.body.linear-acceleration.jerk.stdev.z-axis"         "fft.body.angular-velocity.stdev.x-axis"                
[63] "fft.body.angular-velocity.stdev.y-axis"                 "fft.body.angular-velocity.stdev.z-axis"                
[65] "fft.body.linear-acceleration.magnitude.stdev"           "fft.body.body.linear-acceleration.jerk.magnitude.stdev"
[67] "fft.body.body.angular-velocity.magnitude.stdev"         "fft.body.body.angular-velocity.jerk.magnitude.stdev"

Activities were initially represented by numbers 1-6, so these were replaced with character strings (converted to lower case) representing the names of the activities from the activity_labels.txt file.  The activities, in variable "activities", are:
1. walking
2. walking_upstairs
3. walking_downstairs
4. sitting
5. standing
6. laying

Subjects were numbered from 1-30 and are in variable "subject".

The resulting data set is arranged by subject (ascending) and activity (alphabetically) type.

The second tidy data set "mean_and_std" was first melted and then cast so that the means for each measurement type are organized by activity and then by subject.  The same column headings were retained.
