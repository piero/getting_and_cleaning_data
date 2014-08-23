Code Book
=========

Background
----------

This data set has been obtained by processing the files from the "_Human Activity Recognition Using Smartphones Data Set_" (http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

The original files, as downloaded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip, have been merged into a one data set with the following structure:

<pre>
  features.txt |     "subject"     | "activity"
 --------------+-------------------+-------------
  X_train.txt  | subject_train.txt | y_train.txt
  X_test.txt   | subject_test.txt  | y_test.txt
</pre>

For each measurement (_feature_), only the values related to _mean_ and _standard deviation_ have been extracted.

The present data set contains the __average__ of those measurements.


Subject identifier (_subject_)
------------------------------

Subjects were originally identified by natural numbers [1:30] and there wasn't any reason to change this. Therefore the pristine method has been preserved.


Activity names (_activity_)
---------------------------

The activity names, originally expressed as natural numbers, have been replaced with human-readable camel-case strings, in order to be descriptive yet preserving a compact nature.


Feature names
-------------

There are numerous conventions for the format of variable names. In this case the names were quite long, so camel-case is used to make them readable yet compact. Any leading number is stripped off and characterizations (e.g. domain, mean, dimension) are expressed in lower case and separated by dots.

Examples:

* ```tBodyAcc-std()-X``` -> ```time.BodyAcc.std.x``` (body acceleration's standard deviation along X in the time domain)

* ```fBodyAcc-mean()-Z``` -> ```freq.BodyAcc.mean.z``` (body acceleration's mean along Z in the frequency domain)


Features description
--------------------

As mentioned above, the measurements (features) in this data set are the average values of the original measurements relative to _mean_ and _standard deviation_. Their description therefore reflects the original one: in particular, the measurements express:

* ```time.XXX```: Measurements in the time domain
* ```freq.XXX```: Measurements in the frequency domain (i.e. after FFT has been applied)

* ```BodyAcc.XXX```: Tri-axial measurement of estimated body acceleration
* ```GravityAcc.XXX```: Tri-axial measurement of estimated gravitational acceleration

the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ).

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 


This is the full column list of the data set:

* subject

Unique ID of the subject performing the activity.

* activity

Description of the activity being performed.

* time.BodyAcc.std.x
* time.BodyAcc.std.y
* time.BodyAcc.std.z

Triaxial body acceleration in the time domain (standard deviation).

* time.GravityAcc.std.x
* time.GravityAcc.std.y
* time.GravityAcc.std.z

Triaxial gravitational acceleration in the time domain (standard deviation).

* time.BodyAccJerk.std.x
* time.BodyAccJerk.std.y
* time.BodyAccJerk.std.z

Triaxial Jerk signal derived from body acceleration in the time domain (standard deviation).

* time.BodyGyro.std.x
* time.BodyGyro.std.y
* time.BodyGyro.std.z

Triaxial gyroscopic signals relative to the body in the time domain (standard deviation).

* time.BodyGyroJerk.std.x
* time.BodyGyroJerk.std.y
* time.BodyGyroJerk.std.z

Triaxial Jerk signals derived from the gyroscopic signals relative to the body in the time domain (standard deviation).

* time.BodyAccMag.std

Magnitute of the body acceleration in the time domain (standard deviation).
 
* time.GravityAccMag.std

Magnitute of the gravitational acceleration in the time domain (standard deviation).

* time.BodyAccJerkMag.std

Jerk signal derived from the magnitute of the body acceleration in the time domain (standard deviation).

* time.BodyGyroMag.std

Magnitude of the gyroscopic signal relative to the body in the time domain (standard deviation).

* time.BodyGyroJerkMag.std

Jerk signal derived from the magnitude of the gyroscopic signal relative to the body in the time domain (standard deviation).

* freq.BodyAcc.std.x
* freq.BodyAcc.std.y
* freq.BodyAcc.std.z

Triaxial body acceleration in the frequency domain (standard deviation).

* freq.BodyAccJerk.std.x
* freq.BodyAccJerk.std.y
* freq.BodyAccJerk.std.z

Triaxial Jerk signal derived from body acceleration in the frequency domain (standard deviation).

* freq.BodyGyro.std.x
* freq.BodyGyro.std.y
* freq.BodyGyro.std.z

Triaxial gyroscopic signals relative to the body in the frequency domain (standard deviation).

* freq.BodyAccMag.std

Magnitute of the body acceleration in the frequency domain (standard deviation).

* freq.BodyBodyAccJerkMag.std

Jerk signal derived from the magnitute of the body acceleration in the frequency domain (standard deviation).

* freq.BodyBodyGyroMag.std

Magnitude of the gyroscopic signal relative to the body in the frequency domain (standard deviation).

* freq.BodyBodyGyroJerkMag.std

Jerk signal derived from the magnitude of the gyroscopic signal relative to the body in the frequency domain (standard deviation).

* time.BodyAcc.mean.x
* time.BodyAcc.mean.y
* time.BodyAcc.mean.z

Triaxial body acceleration in the time domain (mean).

* time.GravityAcc.mean.x
* time.GravityAcc.mean.y
* time.GravityAcc.mean.z

Triaxial gravitational acceleration in the time domain (mean).

* time.BodyAccJerk.mean.x
* time.BodyAccJerk.mean.y
* time.BodyAccJerk.mean.z

Triaxial Jerk signal derived from body acceleration in the time domain (mean).

* time.BodyGyro.mean.x
* time.BodyGyro.mean.y
* time.BodyGyro.mean.z

Triaxial gyroscopic signals relative to the body in the time domain (mean).

* time.BodyGyroJerk.mean.x
* time.BodyGyroJerk.mean.y
* time.BodyGyroJerk.mean.z

Triaxial Jerk signals derived from the gyroscopic signals relative to the body in the time domain (mean).

* time.BodyAccMag.mean

Magnitute of the body acceleration in the time domain (mean).

* time.GravityAccMag.mean

Magnitute of the gravitational acceleration in the time domain (mean).

* time.BodyAccJerkMag.mean

Jerk signal derived from the magnitute of the body acceleration in the time domain (mean).

* time.BodyGyroMag.mean

Magnitude of the gyroscopic signal relative to the body in the time domain (mean).

* time.BodyGyroJerkMag.mean

Jerk signal derived from the magnitude of the gyroscopic signal relative to the body in the time domain (mean).

* freq.BodyAcc.mean.x
* freq.BodyAcc.mean.y
* freq.BodyAcc.mean.z

Triaxial body acceleration in the frequency domain (mean).

* freq.BodyAccJerk.mean.x
* freq.BodyAccJerk.mean.y
* freq.BodyAccJerk.mean.z

Triaxial Jerk signal derived from body acceleration in the frequency domain (mean).

* freq.BodyGyro.mean.x
* freq.BodyGyro.mean.y
* freq.BodyGyro.mean.z

Triaxial gyroscopic signals relative to the body in the frequency domain (mean).

* freq.BodyAccMag.mean

Magnitute of the body acceleration in the frequency domain (mean).

* freq.BodyBodyAccJerkMag.mean

Jerk signal derived from the magnitute of the body acceleration in the frequency domain (mean).

* freq.BodyBodyGyroMag.mean

Magnitude of the gyroscopic signal relative to the body in the frequency domain (mean).

* freq.BodyBodyGyroJerkMag.mean

Jerk signal derived from the magnitude of the gyroscopic signal relative to the body in the frequency domain (mean).
