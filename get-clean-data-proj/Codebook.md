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
|features.txt| 561 | 2 |List of all features.|
|activity_labels.txt| 6 | 2 |Links the activity label IDs with their activity name.|
|train/X_train.txt| 7352 | 561 |Training dataset.|
|train/y_train.txt| 7352 | 1 |Each row identifies the activity label IDs associated with each window sample in the training dataset.  Its range is from 1 to 6.|
|test/X_test.txt| 2947 | 561 |Test dataset.|
|test/y_test.txt| 2947 | 1 |Each row identifies the activity label IDs associated with each window sample in the test dataset.  Its range is from 1 to 6.|
|train/subject\_train.txt| 7352 | 1 |Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.|
|test/subject\_test.txt| 2947 | 1 |Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.|

The following diagram shows the relationship between the various files

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

Here is the list of features used in this project:


FeatureID   Feature                     
----------  ----------------------------
1           tBodyAcc-mean()-X           
2           tBodyAcc-mean()-Y           
3           tBodyAcc-mean()-Z           
4           tBodyAcc-std()-X            
5           tBodyAcc-std()-Y            
6           tBodyAcc-std()-Z            
41          tGravityAcc-mean()-X        
42          tGravityAcc-mean()-Y        
43          tGravityAcc-mean()-Z        
44          tGravityAcc-std()-X         
45          tGravityAcc-std()-Y         
46          tGravityAcc-std()-Z         
81          tBodyAccJerk-mean()-X       
82          tBodyAccJerk-mean()-Y       
83          tBodyAccJerk-mean()-Z       
84          tBodyAccJerk-std()-X        
85          tBodyAccJerk-std()-Y        
86          tBodyAccJerk-std()-Z        
121         tBodyGyro-mean()-X          
122         tBodyGyro-mean()-Y          
123         tBodyGyro-mean()-Z          
124         tBodyGyro-std()-X           
125         tBodyGyro-std()-Y           
126         tBodyGyro-std()-Z           
161         tBodyGyroJerk-mean()-X      
162         tBodyGyroJerk-mean()-Y      
163         tBodyGyroJerk-mean()-Z      
164         tBodyGyroJerk-std()-X       
165         tBodyGyroJerk-std()-Y       
166         tBodyGyroJerk-std()-Z       
201         tBodyAccMag-mean()          
202         tBodyAccMag-std()           
214         tGravityAccMag-mean()       
215         tGravityAccMag-std()        
227         tBodyAccJerkMag-mean()      
228         tBodyAccJerkMag-std()       
240         tBodyGyroMag-mean()         
241         tBodyGyroMag-std()          
253         tBodyGyroJerkMag-mean()     
254         tBodyGyroJerkMag-std()      
266         fBodyAcc-mean()-X           
267         fBodyAcc-mean()-Y           
268         fBodyAcc-mean()-Z           
269         fBodyAcc-std()-X            
270         fBodyAcc-std()-Y            
271         fBodyAcc-std()-Z            
345         fBodyAccJerk-mean()-X       
346         fBodyAccJerk-mean()-Y       
347         fBodyAccJerk-mean()-Z       
348         fBodyAccJerk-std()-X        
349         fBodyAccJerk-std()-Y        
350         fBodyAccJerk-std()-Z        
424         fBodyGyro-mean()-X          
425         fBodyGyro-mean()-Y          
426         fBodyGyro-mean()-Z          
427         fBodyGyro-std()-X           
428         fBodyGyro-std()-Y           
429         fBodyGyro-std()-Z           
503         fBodyAccMag-mean()          
504         fBodyAccMag-std()           
516         fBodyBodyAccJerkMag-mean()  
517         fBodyBodyAccJerkMag-std()   
529         fBodyBodyGyroMag-mean()     
530         fBodyBodyGyroMag-std()      
542         fBodyBodyGyroJerkMag-mean() 
543         fBodyBodyGyroJerkMag-std()  

