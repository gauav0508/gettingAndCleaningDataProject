# This file provides the details of run_analysis.R file. The source data can be downloaded from 
# https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

# Step1
# Reading data from various file. The Source Data is gathered for 30 people.
# Training data contains for 21 people and Test Data is for 9 people
# y_test and y _train provides data for each of the activity
# Extract x_Test data and y_test Data in two data frame object
# The column in y_test represnts the activitycode. Rename the column from V1 to "Activity_Name"

# Extract x_Train data and y_train Data in two separate data frame object
# The column in y_train represents the activitycode. Rename the column from V1 to "Activity_Name"

# read data for subjects taken test and replace the variable name V1 to Subject_Id
# read data for subjects taken training and replace the variable name V1 to Subject_Id

# Create Dataset for Test by merging x_test, y_test and Sub_test

# Create Dataset for Train by merging x_train, y_train,sub_train

# Merging Test and Train Datasets and store it in final_ds data frame

# Step2 
# Extracts only the measurements on the mean and standard deviation for each measurement. 
# read data from features.txt and store in a data frame

# Extract mean columns from the above dataset using grep function
# Extract Standard Deviation columns from the above dataset using grep function

# Combine columns for mean and standard deviations

# replace V from variable name with "" (blank)
 # names(final_ds2) <- sub("V","",names(final_ds2))

# Selecting onservations for columns with only mean and SD using select function dplyr package

# step 3 
# Uses descriptive activity names to name the activities in the data set
# Create a vector variable for 6 activities
 # vec <- c("WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS","SITTING","STANDING","LAYING")
 # use for Loop replace activity code with activity name in the dataset

# Step 4 
# Appropriately labels the data set with descriptive variable names. 
# change the name of the columns with the meaning ful name by using column names from featues.txt ( Step2)

# Step5 
#From the data set in step 4, creates a second, independent tidy data set with the average of 
# each variable for each activity and each subject.
# use group by function to group the dataset by each subject and  activity for each subject. This will give 6 *30=180 observations
# use summarise_each function to get the mean of each variable for each subject and activity

