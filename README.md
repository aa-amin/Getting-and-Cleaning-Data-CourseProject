# Peer-graded Assignment: Getting and Cleaning Data Course Project 


This repository is for **Getting and Cleaning Data Course Project**. 
It has the instructions on how to load, merge, clean and wrangle the dataset of **Human Activity recognition**. 
In the following I explain how all of the scripts work and how they are connected.


## Project Dataset

The data are collected from the accelerometers from the Samsung Galaxy S smartphone, and a full description along with the data is available at the following website:
[Human Activity Recognition Using Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)



## Project Files Description 

- **run_analysis.R** first downloads, loads and  prepares the project dataset, and then executes the required tasks of the course project as follows: 
    1. Merges the training and the test sets to create one data set.
    
    2. Extracts only the measurements on the mean and standard deviation for each measurement.
    
    3. Uses descriptive activity names to name the activities in the data set.
    
    4. Appropriately labels the data set with descriptive variable names.
    
    5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
    
    
- **CodeBook.md** describes the variables, the data, and any transformations or work that I performed to clean up the data.

- **FinalData.txt** is the final exported data after doing all the required tasks, i.e. tidy dataset with the average of each variable for each activity and each subject.
