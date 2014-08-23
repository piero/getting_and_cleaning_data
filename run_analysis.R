#
# 1. Merge the training and the test sets to create one data set.
#
# Based on the dimension of the input files, the one data set is arranged as:
#
#  features.txt |     "subject"     | "activity"
# --------------+-------------------+-------------
#  X_train.txt  | subject_train.txt | y_train.txt
#  X_test.txt   | subject_test.txt  | y_test.txt
#
# First temporary tables are created, which are then bound together into 'data'.
#

features <- scan("features.txt", what = "", sep = "\n")
activity_names <- read.table('activity_labels.txt', header = FALSE)
colnames(activity_names) <- c("id", "name")

# Train set
x_train <- read.table("train/X_train.txt", header = FALSE)
colnames(x_train) <- features

subject_train <- read.table("train/subject_train.txt", header = FALSE)
colnames(subject_train) <- "subject"

activity_train <- read.table("train/y_train.txt", header = FALSE)
colnames(activity_train) <- "activity"

# Test set
x_test <- read.table("test/X_test.txt", header = FALSE)
colnames(x_test) <- features

subject_test <- read.table("test/subject_test.txt", header = FALSE)
colnames(subject_test) <- "subject"

activity_test <- read.table("test/y_test.txt", header = FALSE)
colnames(activity_test) <- "activity"

x <- x_train
x <- rbind(x, x_test)

subject <- subject_train
subject <- rbind(subject, subject_test)

activity <- activity_train
activity <- rbind(activity, activity_test)

data <- cbind(x, subject, activity)


#
# 2. Extract only the measurements on the mean and standard deviation
#    for each measurement. 
#
# From the 'features_info.txt' file we know that the columns that represent mean
# and standard deviation contain "mean()" and "std()" in the names respectively.
#

stdColumns <- grep("std\\(\\)", features, value = TRUE)
meanColumns <- grep("mean\\(\\)", features, value = TRUE)
columnsToKeep <- c(stdColumns, meanColumns, "subject", "activity")
data <- data[columnsToKeep]


#
# 3. Use descriptive activity names to name the activities in the data set
#
# Activities are "described" by natural numbers, therefore they're not easy to
# read. However the file 'activity_labels.txt' contains a mapping between
# numbers and human-readable activity names (e.g. "RUNNING"). Those strings are 
# all upper-case and words are separated by underscore (e.g. "WALKING_UPSTAIRS")
# which is not elegant.
#
# The following lines replace activity numbers with their names and convert them
# into camel-case (e.g. "Running", "WalkingUpstairs"), which is a compact, yet
# readable, representation.
#

data$activity <- with(activity_names, name[match(data$activity, id)])

toCamelCase <- function(x) {
  x <- tolower(as.character(x))
  s <- strsplit(x, "_")[[1]]
  paste(toupper(substring(s, 1,1)), substring(s, 2),
        sep="", collapse="")
}

data$activity <- sapply(data$activity, toCamelCase)


#
# 4. Appropriately label the data set with descriptive variable names. 
#
# There are numerous conventions for the format of variable names. In this case
# the names are quite long, so camel case is used to make them readable yet
# compact. Any leading number is stripped off and characterizations (e.g. domain,
# mean, dimension) are expressed in lower case and separated by dots.
#
# Examples:
#
# tBodyAcc-std()-X -> time.BodyAcc.std.x (body accel. std along X in time domain)
# fBodyAcc-mean()-Z -> freq.BodyAcc.mean.z (body accel. mean along Z in freq domain)
#

fixLabels <- function(x) {
  x <- as.character(x)
  x <- sub("^[0-9]{1,3} ", "", x)
  x <- sub("^t", "time.", x)
  x <- sub("^f", "freq.", x)
  x <- sub("-std\\(\\)", ".std", x)
  x <- sub("-mean\\(\\)", ".mean", x)
  x <- sub("-([X|Y|Z])", ".\\L\\1\\E", x, perl = TRUE)
  x
}

colnames(data) <- fixLabels(colnames(data))

#
# 5. Create a second, independent tidy data set with the average of each
#    variable for each activity and each subject.
#
# Only the columns related to measurements should be averaged, so "subject" and
# "activity" are removed from the vector of columns to be processed.
# The output data set will be ordered per subject and per activity, and exported
# to a .txt file in order to keep consistency with the input format.
#

measurementCols <- names(data)[names(data) != c("subject", "activity")]
averaged_data <- aggregate(data[measurementCols],
                   by = list(data$subject,data$activity),
                   function(x) { ave(as.numeric(x))[1] })
colnames(averaged_data)[1:2] <- c("subject", "activity")

write.table(averaged_data,
            file = "averaged_variables_per_subject_and_activity.txt",
            row.names = FALSE)
