#library(dplyr)
library(data.table)

# Features and activity data
feature <- read.table("./UCI HAR Dataset/features.txt")
activity <- read.table("./UCI HAR Dataset/activity_labels.txt")

# Load train and test data
X.train <- read.table("./UCI HAR Dataset/train/X_train.txt")
y.train <- read.table("./UCI HAR Dataset/train/y_train.txt")
X.test <- read.table("./UCI HAR Dataset/test/X_test.txt")
y.test <- read.table("./UCI HAR Dataset/test/y_test.txt")
subject.train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
subject.test <- read.table("./UCI HAR Dataset/test/subject_test.txt")

# Change column names to features and activity
# Note: This is actually Step 4 of the instructions
colnames(X.train) <- feature$V2
colnames(X.test) <- feature$V2
X.train$activity <- y.train$V1
X.test$activity <- y.test$V1
X.train$subject <- factor(subject.train$V1)
X.test$subject <- factor(subject.test$V1)

# Step 1: Merge data
dataset <- rbind(X.test, X.train)

# Step 2: Select only columns that display the mean and standard deviations
filteredColnames <- grep("std\\(\\)|mean\\(\\)|activity|subject", colnames(dataset), value = TRUE)
filteredDataset <- dataset[, filteredColnames]

# Step 3: Use descriptive activity names to name the activities in the data set
filteredDataset$activityLabel <- factor(
  filteredDataset$activity, 
  labels = c("Walking", "Walking_Upstairs", "Walking_Downstairs", "Sitting", "Standing", "Laying"))

# Tidy dataset
featureColnames <- grep("std\\(\\)|mean\\(\\)", colnames(dataset), value = TRUE)
meltDataset <- melt(filteredDataset, id = c("activityLabel", "subject"), measure.vars = featureColnames)
tidyDataset <- dcast(meltDataset, activityLabel + subject ~ variable, mean)

write.table(tidyDataset, file = "tidyDataset.txt", row.names = FALSE)
