# Step1
# Reading data from various file. Data is gathered for 30 people.
# Training data contains for 21 people and Test Data is for 9 people
# y_test and y _train provides data for each of the activity

x_test <- read.table("./test/X_test.txt")
y_test <- read.table("./test/y_test.txt")

# Giving descriptive name to Variable as Active_Name
names(y_test) <- sub("V1","Activity_name",names(y_test))

x_train <- read.table("./train/X_train.txt")
y_train <- read.table("./train/y_train.txt")

# Giving descriptive name to Variable as Active_Name
names(y_train) <- sub("V1","Activity_name",names(y_train))

sub_test <- read.table("./test/subject_test.txt")
# Giving descriptive name to Variable as Sub_test
names(sub_test) <- sub("V1","Subject_id",names(sub_test))

sub_train <- read.table("./train/subject_train.txt")
names(sub_train) <- sub("V1","Subject_id",names(sub_train))

# Creating Dataset for Test 
test_ds <- c(x_test,y_test,sub_test)
test_ds <- as.data.frame(test_ds)

# Creating Dataset for Train
train_ds <- c(x_train,y_train,sub_train)
train_ds <- as.data.frame(train_ds)

# Merging Test and Train Datasets
final_ds <- rbind.data.frame(test_ds,train_ds)

# Step2 Extracts only the measurements on the mean and standard deviation for each measurement. 
features <- read.table("features.txt")

# Extract mean columns
meancol <- grep("mean()",features$V2)
# Extract Standard Deviation columns
stdcol <-  grep("std()",features$V2)

# Merging mean and SD variables
meanstd <- c(meancol,stdcol)

final_ds2 <- final_ds
# replacing V from variable name with ""
names(final_ds2) <- sub("V","",names(final_ds2))

# Selecting onservations for columns with only mean and SD
meanstd_ds <- select(final_ds2,c(meanstd),Activity_name,Subject_id)

# step 3 Uses descriptive activity names to name the activities in the data set
# Creating a vector variable for 6 activities
vec <- c("WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS","SITTING","STANDING","LAYING")
for (i in 1:6){
  #final_ds2$Activity_name[final_ds2$Activity_name==i] <- vec[i]
  meanstd_ds$Activity_name[final_ds2$Activity_name==i] <- vec[i]
}

# Step 4 Appropriately labels the data set with descriptive variable names. 
final_ds3 <- meanstd_ds
for (i in meanstd){
  names(final_ds3)[names(final_ds3)==i] <-   as.character(features[[2]][i])
}
# Step5 From the data set in step 4, creates a second, independent tidy data set with the average of 
# each variable for each activity and each subject.
datastep5 <- final_ds3 %>%
  group_by(Subject_id,Activity_name) %>%
  summarise_each(funs(mean))

  
