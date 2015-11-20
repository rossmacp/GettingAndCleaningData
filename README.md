---
title: "run_analysis.R"
author: "PRM"
date: "11/19/2015"
---

##Script Function


###This script requires 7 files in the working directory,  obtained from the resource "Human Activity Recognition Using Smartphones Dataset Version 1.0" described below.


* 'features.txt': List of all features which are variable names.

* 'X_train.txt': Training set Subject annotation.

* 'y_train.txt': Training Activity annotation labels.

* 'subject_train.txt': Training data.

* 'X_test.txt': Test set Subject annotation.

* 'y_test.txt': Test Activity annotation labels.

* 'subject_test.txt': Test data.


### The script does these steps:

- Sources the dplyr package

- Obtains descriptive variable names from features.txt

- Creates names for 3 Annotation columns plus Descriptive variable names 


- Reads and combine for Training: data, Subject annotation, Activity annotation 

- Adds a column to annotate this is the Training set data

- Adds header with descriptive variable names


- Reads and combine for Test: data, Subject annotation, Activity annotation 

- Adds a column to annotate this is the Test set data.

- Adds header with descriptive variable names.


- __Rubric 1:__ Merges the training and test sets to create one dataset.
  
- Removes columns 306:347 386:426 and 465:504 which duplicate variable names. 

- __Rubric 2:__ Keeps Annotation columns 1:3 and any variable columns with 'mean' or 'std' in variable name.
  
- __Rubric 3:__ Adds Descriptive activity names for the activities in the dataset.
  
- Computes the averages for variables grouped according to Subject (30) and activity (6) = 180 observations.

- __Rubric 4:__ Renames the variable columns to reflect that they are now the means of previous measurements.
  
- __Rubric 5:__ Creates tidy data in .txt file that can be read into R with foo <- read.table("tidydata.txt", header=TRUE)



##File source

Human Activity Recognition Using Smartphones Dataset
Version 1.0


Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws

www.smartlab.ws

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

__For each record it is provided:__

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

For more information about this dataset contact: activityrecognition@smartlab.ws

__License:__

Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.

=======
# GettingAndCleaningData
Repo for Coursera Get Clean Data Course Project
>>>>>>> 3469630e08ee5489cf2e3b6f65a152ed6919450e
