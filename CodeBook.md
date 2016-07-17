#Code Book

###Experiment Overview

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 


The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.See 'features_info.txt' for more details. 

For each record it is provided:

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.


###Description
Raw data are processed with run_analysis.R script

**Load Data**

The source files retrieved from the UCI repo are extracted to working directory

The uncompressed zip file contains a number of files use for this project are listed below:

1. features.txt
1. activity_labels.txt
1. subject_train.txt
1. subject_test.txt
1. x_train.txt
1. x_test.txt
1. y_train.txt
1. y_test.txt
 
Those text files are read to individual table. 

**Table below merge to one data set (merged_data)**

- Test and training data(X\_train, X\_test) to x\_data
- activity data (y\_train, y\_test) to y\_data
- subject data (subject\_train, subject\_test) to subject\_data
 

**Extracts only the measurements on the mean and standard deviation for each measurement.** 

- Subset of the selected variables with labels contains mean or std in test and training data (x\_data) are extracted

**Uses descriptive activity names to name the activities in the data set**

- activity dataset (y\_data) are assigned with labels from the activity_labels table

**Appropriately labels the data set with descriptive variable names.** 

- Variables are assigned from **features.txt**


**Creates an independent tidy data set with the average of each variable for each activity and each subject**

- The mean from merged_data table has been collected and write to tidy data set **("tidydata.txt")** 