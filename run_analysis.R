#===== Download dataset
filename <- "DataCleaningProjectData.zip"

# Check and download if does not exist:
if (!file.exists(filename)){
  fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  download.file(fileURL, filename, method="curl")
}  

# Check and unzip if folder does not exist:
if (!file.exists("UCI HAR Dataset")) { 
  unzip(filename) 
}

#===== Load  data files 
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "subject")
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
activities <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("label", "activity"))
features <- read.table("UCI HAR Dataset/features.txt", col.names = c("number","variable"))

x_train <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = features$variable)
x_test <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = features$variable)
y_train <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "label")
y_test <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "label")



#===== Step 1: Merges the training and the test sets to create one data set.
subject <- rbind(subject_train, subject_test)
y_data <- rbind(y_train, y_test)
x_data <- rbind(x_train, x_test)
merged_data <- cbind(subject, y_data, x_data)

#===== Step 2: Extracts only the measurements on the mean and standard deviation for each measurement.
library(dplyr)
reduced_data <- merged_data %>% select(subject, label, contains("mean"), contains("std"))

#===== Step 3: Uses descriptive activity names to name the activities in the data set.
reduced_data$label <- activities[reduced_data$label, 2]

#===== Step 4: Appropriately labels the data set with descriptive variable names.
# I use "gsub" to improve the variable names
names(reduced_data)[2] = "activity"
names(reduced_data)<-gsub("^t", "Time", names(reduced_data))
names(reduced_data)<-gsub("^f", "Frequency", names(reduced_data))
names(reduced_data)<-gsub("BodyBody", "Body", names(reduced_data))
names(reduced_data)<-gsub("Acc", "Accelerometer", names(reduced_data))
names(reduced_data)<-gsub("Gyro", "Gyroscope", names(reduced_data))
names(reduced_data)<-gsub("Mag", "Magnitude", names(reduced_data))
names(reduced_data)<-gsub("angle", "Angle", names(reduced_data))
names(reduced_data)<-gsub("gravity", "Gravity", names(reduced_data))
names(reduced_data)<-gsub("\\.mean\\...", "_Mean_", names(reduced_data), ignore.case = TRUE)
names(reduced_data)<-gsub("\\.mean\\..", "_Mean", names(reduced_data), ignore.case = TRUE)
names(reduced_data)<-gsub("\\.meanFreq\\..", "_MeanFrequency", names(reduced_data), ignore.case = TRUE)
names(reduced_data)<-gsub("\\.std\\...", "_STD_", names(reduced_data), ignore.case = TRUE)
names(reduced_data)<-gsub("\\.std\\..", "_STD", names(reduced_data), ignore.case = TRUE)

#===== Step 5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
tidy_data <- reduced_data %>%
  group_by(subject, activity) %>%
  summarise_all(funs(mean))

#--- export final tidy dataset in text file:
write.table(tidy_data, "tidy_data.txt", row.name=FALSE)
