Study design
=====================================

**Data collection**
* The data was downloaded from: (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip), and extracted into the working directory (yielding _./UCI HAR Dataset/_, as data directory).  
*  Description of the original measured features can be found within the _./UCI HAR Dataset/features_info.txt_, _./UCI HAR Dataset/features.txt_ and _./UCI HAR Dataset/README.txt_ that comes with the data.  


**Summary choices**
 * Summary variables included in the tidy dataset were all estimated means and standard deviations of the original signals. Only features with _mean()_ or _std()_
 within the feature names were chosen, hence the additionaly, angle()-based means were not included.
 * These estimates from the original dataset were summarized by calculating their average in dependence of _activity_ and _subject_.
 
**Experimental study design**
  * The training and test data set were loaded into R from files: _./UCI HAR Dataset  /train/X_train.txt_ and _./UCI HAR Dataset/test/X_test.txt_, respectively.  
  * Variables _subject_ and _activity_ were added to both sets, loading the _subject_test.txt_/_subject_train.txt_ files and the _y_test.txt_/_y_train.txt_ from their respective subdirectory into R.  
  * Both datasets were combined by appending to the columns.  
  * Feature Labels were loaded from _./UCI HAR Dataset/features.txt_ and used as column names. These were directly integrated into the newly loaded sets as col.names, thereby undergoing _check.names_, which transforms names that are not very valuable for R into adequate ones (using the function _make.names()_).    
  * The merged dataset was subsetted for Feature Labels (column names) that contained _mean()_ or _std()_ as a substring.  
  * The merged and subsetted data set was summarized by combinations(interactions) of factors _subject_ and _activity_ using the mean function. This represents the tidy data set.  
  * The tidy data was written to _./tidy_data.txt_, with "," as separator.

Code book
===============================================
**run_analysis.R**

_variables_     | _description_  
:-----------    |:-------------  
train.dir       | subdirectory containing the _train dataset_    
test.dir        |subdirectory containing the _test dataset_   
activity.labels | factor levels for activity variable according to _activity.txt_  
feature.labels  | feature names corresponding to the coulumn names in both datasets   according to _features.txt_  
test.data       | the original test set with additional variables _subject_ and _activity_  
train.data      | the original train set with additional variables _subject_ and _activity_  
merged.data     | the train and test dataset merged by features (i.e. columns)  
mstd.vind       | indices of all feature variables that estimated mean() or std() of the signals  
add.ind         | indices of additional variables _subject_ and _activity_ in both sets  
tidy.data       | the tidy data set, i.e. the dataset that only contains the summarized data






**tidy_data.txt**

*tidy_data.txt* contains a data frame with the summarized variables, each of which can be easily deduced from the *features.txt* and *features_info.txt*, that come along the downloaded data;

**Note:** all variables have been normalized and range within [-1, 1]; beacuse of the normalization they are unit-less

`tidy.data` _variables_ | _description_
----------------------:|--------------------------:
subject               |subject id
activity              |activities                   
tBodyAcc.mean...X     |**mean() values**  
tBodyAcc.mean...Y     | 
tBodyAcc.mean...Z     |
tGravityAcc.mean...X  |  
tGravityAcc.mean...Y  | 
tGravityAcc.mean...Z  |
tBodyAccJerk.mean...X | 
tBodyAccJerk.mean...Y |  
tBodyAccJerk.mean...Z |
tBodyGyro.mean...X|  
tBodyGyro.mean...Y|  
tBodyGyro.mean...Z|  
tBodyGyroJerk.mean...X|  
tBodyGyroJerk.mean...Y|  
tBodyGyroJerk.mean...Z|  
tBodyAccMag.mean..|           
tGravityAccMag.mean..|         
tBodyAccJerkMag.mean..|       
tBodyGyroMag.mean..|           
tBodyGyroJerkMag.mean..|      
fBodyAcc.mean...X|             
fBodyAcc.mean...Y|            
fBodyAcc.mean...Z|             
fBodyAccJerk.mean...X|        
fBodyAccJerk.mean...Y|         
fBodyAccJerk.mean...Z|        
fBodyGyro.mean...X|            
fBodyGyro.mean...Y|           
fBodyGyro.mean...Z|            
fBodyAccMag.mean..|           
fBodyBodyAccJerkMag.mean..|    
fBodyBodyGyroMag.mean..|      
fBodyBodyGyroJerkMag.mean..|   
tBodyAcc.mean...X.1|          
tBodyAcc.mean...Y.1|           
tBodyAcc.mean...Z.1|          
tGravityAcc.mean...X.1|        
tGravityAcc.mean...Y.1|       
tGravityAcc.mean...Z.1|        
tBodyAccJerk.mean...X.1|      
tBodyAccJerk.mean...Y.1|       
tBodyAccJerk.mean...Z.1|      
tBodyGyro.mean...X.1|          
tBodyGyro.mean...Y.1|         
tBodyGyro.mean...Z.1|          
tBodyGyroJerk.mean...X.1|     
tBodyGyroJerk.mean...Y.1|      
tBodyGyroJerk.mean...Z.1|     
tBodyAccMag.mean...1|          
tGravityAccMag.mean...1|      
tBodyAccJerkMag.mean...1|      
tBodyGyroMag.mean...1|        
tBodyGyroJerkMag.mean...1|     
fBodyAcc.mean...X.1|          
fBodyAcc.mean...Y.1|           
fBodyAcc.mean...Z.1|          
fBodyAccJerk.mean...X.1|       
fBodyAccJerk.mean...Y.1|      
fBodyAccJerk.mean...Z.1|       
fBodyGyro.mean...X.1|         
fBodyGyro.mean...Y.1|          
fBodyGyro.mean...Z.1|         
fBodyAccMag.mean...1|          
fBodyBodyAccJerkMag.mean...1|  
fBodyBodyGyroMag.mean...1|     
fBodyBodyGyroJerkMag.mean...1|
tBodyAcc.std...X| **std() values**            
tBodyAcc.std...Y|             
tBodyAcc.std...Z|              
tGravityAcc.std...X|          
tGravityAcc.std...Y|           
tGravityAcc.std...Z|          
tBodyAccJerk.std...X|          
tBodyAccJerk.std...Y|         
tBodyAccJerk.std...Z|          
tBodyGyro.std...X|            
tBodyGyro.std...Y|             
tBodyGyro.std...Z|            
tBodyGyroJerk.std...X|         
tBodyGyroJerk.std...Y|        
tBodyGyroJerk.std...Z|         
tBodyAccMag.std..|            
tGravityAccMag.std..|          
tBodyAccJerkMag.std..|        
tBodyGyroMag.std..|            
tBodyGyroJerkMag.std..|       
fBodyAcc.std...X|              
fBodyAcc.std...Y|             
fBodyAcc.std...Z|              
fBodyAccJerk.std...X|         
fBodyAccJerk.std...Y|          
fBodyAccJerk.std...Z|         
fBodyGyro.std...X|             
fBodyGyro.std...Y|            
fBodyGyro.std...Z|             
fBodyAccMag.std..|            
fBodyBodyAccJerkMag.std..|     
fBodyBodyGyroMag.std..|       
fBodyBodyGyroJerkMag.std..|   