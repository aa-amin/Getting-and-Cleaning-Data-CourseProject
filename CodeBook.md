# CodeBook for the Peer-graded Assignment: Getting and Cleaning Data Course Project
This codebook descripes in details the functionality of the **run_analysis.R** script, which first downloads and prepares the dataset, and then executes the required 5 tasks of the course project. the script functionality is descripted as follows. 


1. **Downloads the project dataset**
    - The project dataset is downloaded with zip file name **DataCleaningProjectData.zip** and unzipped in the folder called **UCI HAR Dataset**.
    
2. **Loads date tables for training set and testing set**
    - `subject_train` dataframe from **test/subject_train.txt**, which is  7352 rows and 1 column. It contains the train data of 21 volunteer subjects being observed (out of 30 volunteers).
    
    - `subject_test` dataframe from **test/subject_test.txt**, which is  2947 rows and 1 column. It contains the test data of 9 volunteer test subjects being observed (out of 30 volunteers).
    
    - `activities` dataframe from **activity_labels.txt**, which is 6 rows and 2 columns: `label` and `activity`. It contains the list of activities performed when the corresponding measurements were taken and its coresponding labels.     
    
    - `features` dataframe from **features.txt**, which is 561 rows and 2 columns. These features come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ.

    - `x_train` dataframe from **test/X_train.txt**, which is 7352 rows and 561 columns.  It contains the recorded features for the training set.
    - `y_train` dataframe is loaded from **test/y_train.txt**, which is 7352 rows, 1 columns. It contains the activities labels for the training set.
    
    - `x_test` dataframe from **test/X_test.txt**, which is  2947 rows and 561 columns. It contains the recorded features for the testing set.
    
    - `y_test` dataframe from **test/y_test.txt**, which is  2947 rows and 1 columns. It contains the activities labels for the testing set.
    
    
3. **Step 1: Merges the training set and the testing set to create one dataset**
    - `Subject` dataframe which is 10299 rows and 1 column created by merging `subject_train` and `subject_test` using **rbind()** function.
    
    - `x_data` dataframe which is 10299 rows and 561 columns created by merging `x_train` and `x_test` using **rbind()** function.
    
    - `y_data` dataframe which is 10299 rows and 1 column created by merging `y_train` and `y_test` using **rbind()** function.

    - `merged_data` dataframe which is 10299 rows and 563 column created by merging `Subject`, `y_data` and `x_data` using **cbind()** function.
   
    
4. **Step 2: Extracts only the measurements on the mean and standard deviation for each measurement**
    - `reduced_data` dataframe which is 10299 rows and 88 columns created by selecting the columns: `subject`, `label` and the measurements on the mean and standard deviation (std) for each measurement from `merged_data` dataframe.

    
5. **Step 3: Uses descriptive activity names to name the activities in the data set**
    - `label` column in the `reduced_data` replaced with corresponding activity names taken from the second column of the `activities` dataframe.


6. **Step 4: Appropriately labels the data set with descriptive variable names**
    - `label` column in `reduced_data` is renamed into `activity`.
    -  All columns names start with character `f` is replaced by `Frequency`.
    -  All columns names start with character `t` is replaced by `Time`.
    -  All columns names with `BodyBody` is replaced by `Body`.
    -  All columns names with `Acc` is replaced by `Accelerometer`.
    -  All columns names with `Gyro` is replaced by `Gyroscope`.
    -  All columns names with `Mag` is replaced by `Magnitude`.
    -  All columns names with `angle` is replaced by `Angle`.
    -  All columns names with `gravity` is replaced by `Gravity`.
    -  All columns names with `-mean()` is replaced by `_Mean`.
    -  All columns names with `-std()` is replaced by `_STD`.
    -  All columns names with `-mean()-` is replaced by `_Mean_`.
    -  All columns names with `-std()-` is replaced by `_STD_`.
    

7. **Step 5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject**
    - `tidy_data` dataframe which is 180 rows and 88 columns, created by sumarizing `reduced_data`, i.e. grouping `reduced_data` by subject and activity and then calculating the mean for each variable.
    - `tidy_data` is exported into `tidy_data.txt` file.
    
    