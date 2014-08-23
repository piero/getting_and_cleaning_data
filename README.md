datasciencecoursera
===================

run_analysis.R
--------------

The ```run_analysis.R``` script merges the original "training" and "test" data sets (as downloaded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) into a one data set with the following structure:

<pre>
  features.txt |     "subject"     | "activity"
 --------------+-------------------+-------------
  X_train.txt  | subject_train.txt | y_train.txt
  X_test.txt   | subject_test.txt  | y_test.txt
</pre>


The script then extracts only the measurements on the mean and standard deviation for each measurement.
From the 'features_info.txt' file we know that the columns that represent mean and standard deviation contain "mean()" and "std()" in the names respectively.
The script therefore creates a vector of the column names to keep and updates the data set accordingly.

Subjects were originally identified by natural numbers [1:30] and there wasn't any reason to change this. Therefore the pristine method has been preserved.

The script then adopts descriptive activity names to name the activities in the data set.
Activities are originally "described" by natural numbers, therefore they're not easy to read.
However the file ```activity_labels.txt``` contains a mapping between numbers and human-readable activity names (e.g. "RUNNING").
Those strings are all upper-case and words are separated by underscore (e.g. "WALKING_UPSTAIRS") which is not elegant.
The script therefore replaces activity numbers with their names and converts them into camel-case (e.g. "Running", "WalkingUpstairs"), which is a compact, yet readable, representation.


The next step is to appropriately label the data set with descriptive variable names.
There are numerous conventions for the format of variable names. In this case the names were quite long, so camel-case is used to make them readable yet compact. Any leading number is stripped off and characterizations (e.g. domain, mean, dimension) are expressed in lower case and separated by dots.

Examples:

* ```tBodyAcc-std()-X``` -> ```time.BodyAcc.std.x``` (body acceleration's standard deviation along X in the time domain)

* ```fBodyAcc-mean()-Z``` -> ```freq.BodyAcc.mean.z``` (body acceleration's mean along Z in the frequency domain)


Finally, the script creates a second, independent tidy data set with the average of each variable for each activity and each subject.
Only the columns related to measurements should be averaged, so "subject" and "activity" are removed from the vector of columns to be processed.
The output data set will be ordered per subject and per activity, and exported to a .txt file in order to keep consistency with the input format.
