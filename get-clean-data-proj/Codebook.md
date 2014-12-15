# Getting and Cleaning Data Course Project Codebook

*Author:  Daddy the Runner*  
*Date:  2012-12-12*

This codebook describes the data and processes used to
complete the Getting and Cleaning Data Science course project.

## Data Description

A detailed description is located in the `README.txt` file that came with
the dataset.

Dataset file:  ./Data/dataset.zip  
Public source of dataset:  https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The data comes from an experiment involving 30 volunteers ranging in age from
19 to 48 years.  Each volunteer wore a Samsung Galaxy S2 smartphone while
conducting the following six activities:

1. Walking
2. Walking Up Stairs
3. Walking Up Stairs
4. Sitting
5. Standing
6. Laying

The experiment captured 3-axial linear acceleration and 3-axial angular
velocity using the embedded accelerometer and gyroscope at a constant 50Hz
rate.  The experimental data was randomly partitioned into two sets.  70% of
the volunteers were selected to generate the training data and the remaining
30% were used to generate the test data.  Details on how the data were
processed by the experimental team are contained in the dataset's `README.txt`
file.

Each observation contains 561 variables which the experimental team calls
features.  The features cover both the time and frequency domains.  Details
of the features are contained in the `features_info.txt` and `features.txt`
files.

### Dataset Files

The dataset contains the following files that were used in this project:

|File Name|Rows|Cols|Description|
|---------|----|----|-----------|
|README.txt| | |Experiment description|
|features_info.txt| | |Shows information about the variables used on the feature vector.|
|features.txt| 561 | 2 |List of all features.^1^|
|activity_labels.txt| 6 | 2 |Links the activity label IDs with their activity name.|
|train/X_train.txt| 7352 | 561 |Training dataset.|
|train/y_train.txt| 7352 | 1 |Each row identifies the activity label IDs associated with each window sample in the training dataset.  Its range is from 1 to 6.|
|test/X_test.txt| 2947 | 561 |Test dataset.|
|test/y_test.txt| 2947 | 1 |Each row identifies the activity label IDs associated with each window sample in the test dataset.  Its range is from 1 to 6.|
|train/subject\_train.txt| 7352 | 1 |Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.|
|test/subject\_test.txt| 2947 | 1 |Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.|

^1^ Note:  features.txt contains 42 sets of duplicates.  It appears that the original dataset includes a mistake in the features.txt file and that these 42 sets of duplicates are missing the axis designators (i.e. -x, -y, -z).  However, this does not pose a
problem for this project since none of the features that have duplicate names involve the means or standard deviations we are extracting for this project.
The following diagram shows the relationship between the various files.

![Diagram of file relationships](Data-Files-Diagram.png)

Diagram courtesy of David Hood.  Source:  https://class.coursera.org/getdata-016/forum/thread?thread_id=50#comment-333

The following additional files are available for both the train and test data. Simply
replace the word `train` with `test` for the test data.  However, these were not used
in this project.

|File Name|Description|
|---------|-----------|
|train/Inertial\ Signals/total\_acc\_x\_train.txt|The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the total\_acc\_y\_train.txt and total\_acc\_z\_train.txt files for the Y and Z axis.|
|train/Inertial\ Signals/body\_acc\_x\_train.txt|The body acceleration signal obtained by subtracting the gravity from the total acceleration.|
|train/Inertial\ Signals/body\_gyro\_x\_train.txt|The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second.|


## Description of the Project

For the purpose of this project, all of the training and test data were
combined into a single dataset.  Additionally, only the features that
involved calculations of means or standard deviations were used in this
project.  The features were filtered such that their names had to contain
either `mean()` or `std()`.  This choice of features specifically ignored
features that contained the strings `mean` and `std` if they weren't
immediately followed by `()`.

The feature names from the original dataset were modified to produce more
meaningful names.  Here is a list of transformations that were made:

1. All names were converted to R compatible variable names with words
separated by periods (.)
2. All t prefixes were converted to time. to indicate time domain values
3. All f prefixes were converted to freq. to indicate frequency domain values
4. Acc was expanded to Acceleration
5. Gyro was expanded to Gyroscope
6. A few of the features had a double Body (i.e. BodyBody).  The duplicate
Body was removed from the name.

Here is the list of features used in this project with their original name
as they appear in the features.txt file and the new name used in this
project:


FeatureID   Original Name                 New Name                                   
----------  ----------------------------  -------------------------------------------
1           tBodyAcc-mean()-X             time.Body.Acceleration.mean.X              
2           tBodyAcc-mean()-Y             time.Body.Acceleration.mean.Y              
3           tBodyAcc-mean()-Z             time.Body.Acceleration.mean.Z              
4           tBodyAcc-std()-X              time.Body.Acceleration.std.X               
5           tBodyAcc-std()-Y              time.Body.Acceleration.std.Y               
6           tBodyAcc-std()-Z              time.Body.Acceleration.std.Z               
41          tGravityAcc-mean()-X          time.Gravity.Acceleration.mean.X           
42          tGravityAcc-mean()-Y          time.Gravity.Acceleration.mean.Y           
43          tGravityAcc-mean()-Z          time.Gravity.Acceleration.mean.Z           
44          tGravityAcc-std()-X           time.Gravity.Acceleration.std.X            
45          tGravityAcc-std()-Y           time.Gravity.Acceleration.std.Y            
46          tGravityAcc-std()-Z           time.Gravity.Acceleration.std.Z            
81          tBodyAccJerk-mean()-X         time.Body.Acceleration.Jerk.mean.X         
82          tBodyAccJerk-mean()-Y         time.Body.Acceleration.Jerk.mean.Y         
83          tBodyAccJerk-mean()-Z         time.Body.Acceleration.Jerk.mean.Z         
84          tBodyAccJerk-std()-X          time.Body.Acceleration.Jerk.std.X          
85          tBodyAccJerk-std()-Y          time.Body.Acceleration.Jerk.std.Y          
86          tBodyAccJerk-std()-Z          time.Body.Acceleration.Jerk.std.Z          
121         tBodyGyro-mean()-X            time.Body.Gyroscope.mean.X                 
122         tBodyGyro-mean()-Y            time.Body.Gyroscope.mean.Y                 
123         tBodyGyro-mean()-Z            time.Body.Gyroscope.mean.Z                 
124         tBodyGyro-std()-X             time.Body.Gyroscope.std.X                  
125         tBodyGyro-std()-Y             time.Body.Gyroscope.std.Y                  
126         tBodyGyro-std()-Z             time.Body.Gyroscope.std.Z                  
161         tBodyGyroJerk-mean()-X        time.Body.Gyroscope.Jerk.mean.X            
162         tBodyGyroJerk-mean()-Y        time.Body.Gyroscope.Jerk.mean.Y            
163         tBodyGyroJerk-mean()-Z        time.Body.Gyroscope.Jerk.mean.Z            
164         tBodyGyroJerk-std()-X         time.Body.Gyroscope.Jerk.std.X             
165         tBodyGyroJerk-std()-Y         time.Body.Gyroscope.Jerk.std.Y             
166         tBodyGyroJerk-std()-Z         time.Body.Gyroscope.Jerk.std.Z             
201         tBodyAccMag-mean()            time.Body.Acceleration.Magnitude.mean      
202         tBodyAccMag-std()             time.Body.Acceleration.Magnitude.std       
214         tGravityAccMag-mean()         time.Gravity.Acceleration.Magnitude.mean   
215         tGravityAccMag-std()          time.Gravity.Acceleration.Magnitude.std    
227         tBodyAccJerkMag-mean()        time.Body.Acceleration.Jerk.Magnitude.mean 
228         tBodyAccJerkMag-std()         time.Body.Acceleration.Jerk.Magnitude.std  
240         tBodyGyroMag-mean()           time.Body.Gyroscope.Magnitude.mean         
241         tBodyGyroMag-std()            time.Body.Gyroscope.Magnitude.std          
253         tBodyGyroJerkMag-mean()       time.Body.Gyroscope.Jerk.Magnitude.mean    
254         tBodyGyroJerkMag-std()        time.Body.Gyroscope.Jerk.Magnitude.std     
266         fBodyAcc-mean()-X             freq.Body.Acceleration.mean.X              
267         fBodyAcc-mean()-Y             freq.Body.Acceleration.mean.Y              
268         fBodyAcc-mean()-Z             freq.Body.Acceleration.mean.Z              
269         fBodyAcc-std()-X              freq.Body.Acceleration.std.X               
270         fBodyAcc-std()-Y              freq.Body.Acceleration.std.Y               
271         fBodyAcc-std()-Z              freq.Body.Acceleration.std.Z               
345         fBodyAccJerk-mean()-X         freq.Body.Acceleration.Jerk.mean.X         
346         fBodyAccJerk-mean()-Y         freq.Body.Acceleration.Jerk.mean.Y         
347         fBodyAccJerk-mean()-Z         freq.Body.Acceleration.Jerk.mean.Z         
348         fBodyAccJerk-std()-X          freq.Body.Acceleration.Jerk.std.X          
349         fBodyAccJerk-std()-Y          freq.Body.Acceleration.Jerk.std.Y          
350         fBodyAccJerk-std()-Z          freq.Body.Acceleration.Jerk.std.Z          
424         fBodyGyro-mean()-X            freq.Body.Gyroscope.mean.X                 
425         fBodyGyro-mean()-Y            freq.Body.Gyroscope.mean.Y                 
426         fBodyGyro-mean()-Z            freq.Body.Gyroscope.mean.Z                 
427         fBodyGyro-std()-X             freq.Body.Gyroscope.std.X                  
428         fBodyGyro-std()-Y             freq.Body.Gyroscope.std.Y                  
429         fBodyGyro-std()-Z             freq.Body.Gyroscope.std.Z                  
503         fBodyAccMag-mean()            freq.Body.Acceleration.Magnitude.mean      
504         fBodyAccMag-std()             freq.Body.Acceleration.Magnitude.std       
516         fBodyBodyAccJerkMag-mean()    freq.Body.Acceleration.Jerk.Magnitude.mean 
517         fBodyBodyAccJerkMag-std()     freq.Body.Acceleration.Jerk.Magnitude.std  
529         fBodyBodyGyroMag-mean()       freq.Body.Gyroscope.Magnitude.mean         
530         fBodyBodyGyroMag-std()        freq.Body.Gyroscope.Magnitude.std          
542         fBodyBodyGyroJerkMag-mean()   freq.Body.Gyroscope.Jerk.Magnitude.mean    
543         fBodyBodyGyroJerkMag-std()    freq.Body.Gyroscope.Jerk.Magnitude.std     
