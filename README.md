# Getting the data

###The data can be found at https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
  and **the zip file must be unzipped in the working directory for the R script to work properly**. 

##The raw data comes from:
###==================================================
###Human Activity Recognition Using Smartphones Dataset
###Version 1.0
###==================================================
###Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
###Smartlab - Non Linear Complex Systems Laboratory
###DITEN - Universit‡ degli Studi di Genova.
###Via Opera Pia 11A, I-16145, Genoa, Italy.
###activityrecognition@smartlab.ws
###www.smartlab.ws
###==================================================

###For each record it is provided:
###======================================

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.


###Feature Selection 
###=================

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
mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean

The complete list of variables of each feature vector is available in 'features.txt'

###The dataset includes the following files:
###=========================================

- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

###Notes: 
###======
- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.

For more information about this dataset contact: activityrecognition@smartlab.ws


###Tidy Data
###========
The output from the run_analysis.R program is a data frame containing the merged test and training data with the calculated average by each subject and activity for every mean and standard deviation for each measurement. Each record is is one subject and activity.  



##How to run run_analysis
##===================
Once the dataset is unzipped in the working directory run_analysis is sourced and then run in R without any parameters. When unzipped all the data will be in a directory called UCI HAR Dataset.

x <- run_analysis()


##Processing steps
##============= 
1. for each text file it uses read.table() to load them into RStudio running the following:    
**R version 3.1.2 (2014-10-31) -- "Pumpkin Helmet”**
**Copyright (C) 2014 The R Foundation for Statistical Computing**
**Platform: x86_64-apple-darwin13.4.0 (64-bit)**

2. 	it combines data files by first binding the subject, x, and y files together for test and train and then merging the test and train to get a complete set. 
	
3. 	It uses grep to find std and mean columns and saves them in an index.

4. 	It puts the activity labels on with the merge() command.

5.  	It puts the features on as nice names for column names  using a for loop.

6. 	It subsets the data to get the mean() and std() columns for the tidy dataset by using the index saved in step 3.  
7.  	It generates a mean for each variable by each subject and activity and returns the tidy dataset.


##Code Book
##=========


Subjects	2 Integer
		Code to identify the subjects in the study	
		Range is from 01 to 30 

Activities	18 Character
		Activities of the subjects 
		 WALKING
		 WALKING_UPSTAIRS
		 WALKING_DOWNSTAIRS
		 SITTING
		 STANDING
		 LAYING
		
tBodyAcc-mean()-X 5 Numeric 
		Average of the raw data with the same name

tBodyAcc-mean()-Y 5 Numeric 
		Average of the raw data with the same name

tBodyAcc-mean()-Z 5 Numeric 
		Average of the raw data with the same name          

tBodyAcc-std()-X 5 Numeric 
		Average of the raw data with the same name

tBodyAcc-std()-Y 5 Numeric 
		Average of the raw data with the same name

tBodyAcc-std()-Z 5 Numeric 
		Average of the raw data with the same name

tGravityAcc-mean()-X 5 Numeric 
		Average of the raw data with the same name

tGravityAcc-mean()-Y 5 Numeric 
		Average of the raw data with the same name

tGravityAcc-mean()-Z 5 Numeric 
		Average of the raw data with the same name

tGravityAcc-std()-X 5 Numeric 
		Average of the raw data with the same name

tGravityAcc-std()-Y 5 Numeric 
		Average of the raw data with the same name

tGravityAcc-std()-Z 5 Numeric 
		Average of the raw data with the same name

tBodyAccJerk-mean()-X 5 Numeric 
		Average of the raw data with the same name

tBodyAccJerk-mean()-Y 5 Numeric 
		Average of the raw data with the same name

tBodyAccJerk-mean()-Z 5 Numeric 
		Average of the raw data with the same name

tBodyAccJerk-std()-X 5 Numeric 
		Average of the raw data with the same name

tBodyAccJerk-std()-Y 5 Numeric 
		Average of the raw data with the same name

tBodyAccJerk-std()-Z 5 Numeric 
		Average of the raw data with the same name

tBodyGyro-mean()-X 5 Numeric 
		Average of the raw data with the same name

tBodyGyro-mean()-Y 5 Numeric 
		Average of the raw data with the same name

tBodyGyro-mean()-Z 5 Numeric 
		Average of the raw data with the same name

tBodyGyro-std()-X 5 Numeric 
		Average of the raw data with the same name

tBodyGyro-std()-Y 5 Numeric 
		Average of the raw data with the same name

tBodyGyro-std()-Z 5 Numeric 
		Average of the raw data with the same name

tBodyGyroJerk-mean()-X 5 Numeric 
		Average of the raw data with the same name

tBodyGyroJerk-mean()-Y 5 Numeric 
		Average of the raw data with the same name

tBodyGyroJerk-mean()-Z 5 Numeric 
		Average of the raw data with the same name

tBodyGyroJerk-std()-X 5 Numeric 
		Average of the raw data with the same name

tBodyGyroJerk-std()-Y 5 Numeric 
		Average of the raw data with the same name

tBodyGyroJerk-std()-Z 5 Numeric 
		Average of the raw data with the same name

tBodyAccMag-mean() 5 Numeric 
		Average of the raw data with the same name

tBodyAccMag-std() 5 Numeric 
		Average of the raw data with the same name

tGravityAccMag-mean() 5 Numeric 
		Average of the raw data with the same name

tGravityAccMag-std() 5 Numeric 
		Average of the raw data with the same name

tBodyAccJerkMag-mean() 5 Numeric 
		Average of the raw data with the same name

tBodyAccJerkMag-std() 5 Numeric 
		Average of the raw data with the same name

tBodyGyroMag-mean() 5 Numeric 
		Average of the raw data with the same name

tBodyGyroMag-std() 5 Numeric 
		Average of the raw data with the same name

tBodyGyroJerkMag-mean() 5 Numeric 
		Average of the raw data with the same name

tBodyGyroJerkMag-std() 5 Numeric 
		Average of the raw data with the same name

fBodyAcc-mean()-X 5 Numeric 
		Average of the raw data with the same name

fBodyAcc-mean()-Y 5 Numeric 
		Average of the raw data with the same name

fBodyAcc-mean()-Z 5 Numeric 
		Average of the raw data with the same name

fBodyAcc-std()-X 5 Numeric 
		Average of the raw data with the same name

fBodyAcc-std()-Y 5 Numeric 
		Average of the raw data with the same name

fBodyAcc-std()-Z 5 Numeric 
		Average of the raw data with the same name

fBodyAccJerk-mean()-X 5 Numeric 
		Average of the raw data with the same name

fBodyAccJerk-mean()-Y 5 Numeric 
		Average of the raw data with the same name

fBodyAccJerk-mean()-Z 5 Numeric 
		Average of the raw data with the same name

fBodyAccJerk-std()-X 5 Numeric 
		Average of the raw data with the same name

fBodyAccJerk-std()-Y 5 Numeric 
		Average of the raw data with the same name

fBodyAccJerk-std()-Z 5 Numeric 
		Average of the raw data with the same name

fBodyGyro-mean()-X 5 Numeric 
		Average of the raw data with the same name

fBodyGyro-mean()-Y 5 Numeric 
		Average of the raw data with the same name

fBodyGyro-mean()-Z 5 Numeric 
		Average of the raw data with the same name

fBodyGyro-std()-X 5 Numeric 
		Average of the raw data with the same name

fBodyGyro-std()-Y 5 Numeric 
		Average of the raw data with the same name

fBodyGyro-std()-Z 5 Numeric 
		Average of the raw data with the same name

fBodyAccMag-mean() 5 Numeric 
		Average of the raw data with the same name

fBodyAccMag-std() 5 Numeric 
		Average of the raw data with the same name

fBodyBodyAccJerkMag-mean() 5 Numeric 
		Average of the raw data with the same name

fBodyBodyAccJerkMag-std() 5 Numeric 
		Average of the raw data with the same name

fBodyBodyGyroMag-mean() 5 Numeric 
		Average of the raw data with the same name

fBodyBodyGyroMag-std() 5 Numeric 
		Average of the raw data with the same name

fBodyBodyGyroJerkMag-mean() 5 Numeric 
		Average of the raw data with the same name

fBodyBodyGyroJerkMag-std() 5 Numeric 
		Average of the raw data with the same name


 

