# Variables in the dataset
## Initial variables
The data is taken from [UCI HAR Dataset](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip). The variables are:
1. `subject` - ID of participant
2. `activity` - ID of activity type
Mean and standart deviation for the following features (other values are presented in initial dataset, but for this reasearch only these parameters were used)
	+ `tBodyAcc-XYZ`
	+ `tGravityAcc-XYZ`
	+ `tBodyAccJerk-XYZ`
	+ `tBodyGyro-XYZ`
	+ `tBodyGyroJerk-XYZ`
	+ `tBodyAccMag`
	+ `tGravityAccMag`
	+ `tBodyAccJerkMag`
	+ `tBodyGyroMag`
	+ `tBodyGyroJerkMag`
	+ `fBodyAcc-XYZ`
	+ `fBodyAccJerk-XYZ`
	+ `fBodyGyro-XYZ`
	+ `fBodyAccMag`
	+ `fBodyAccJerkMag`
	+ `fBodyGyroMag`
	+ `fBodyGyroJerkMag`

## Added variables
1. `activityLabel` - factor variable for activities with the following levels:
	+ "Walking"
	+ "Walking_Upstairs"
 	+ "Walking_Downstairs"
	+ "Sitting"
	+ "Standing"
	+ "Laying"
2. Tidy dataset was build as a mean values of features grouped by `activityLabel` and `subject` - for each subject and activity type determined mean values over all activities of that type.
