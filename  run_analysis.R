##load the data
test.dir<-file.path('./UCI HAR Dataset/test')
train.dir<-file.path('./UCI HAR Dataset/train')
##load variable names
activity.labels<-read.table('./UCI HAR Dataset/activity_labels.txt', 
                            colClasses = c("integer", "character"))##use scan
feature.labels<-read.table('./UCI HAR Dataset/features.txt', 
                           colClasses = c("integer", "character"))

##load the test data
test.data<-read.table(file.path(test.dir, "X_test.txt"), colClasses = "numeric",
                      col.names = feature.labels[,2])
test.data$activity<-scan(file.path(test.dir, "y_test.txt"), what = integer())
test.data$subject<-scan(file.path(test.dir, "subject_test.txt"),what = integer())
#test.data$set<-rep("test", dim(test.data)[1])

##load the train data
train.data<-read.table(file.path(train.dir, "X_train.txt"),colClasses = "numeric",
                       col.names=feature.labels[,2])
train.data$activity<-scan(file.path(train.dir, "y_train.txt"),what = integer())
train.data$subject<-scan(file.path(train.dir, "subject_train.txt"),what = integer())
#train.data$set<-rep("train", dim(train.data)[1])

####merge sets
merged.data<-rbind(test.data, train.data)

##extract mean and std variables
mstd.vind<-c(grep(pattern = "mean()", feature.labels[,2] , fixed = T,value = F),
grep(pattern = "std()", feature.labels[,2] , fixed = T,value = F)))
add.ind<-seq(to = dim(merged.data)[2], from = dim(merged.data)[2]-1)#keep added variables
## dataset will include following activities   feature.labels[mstd.vind,2]
merged.data<-merged.data[,c(mstd.vind,add.ind)]

##label activities correctly
merged.data$activity<-factor(merged.data$activity, levels = activity.labels[,1],
                             labels = activity.labels[,2])
#merged.data$set<-factor(merged.data$set)
tidy.data<-aggregate(.~subject+activity, FUN = "mean", data = merged.data)
write.table(tidy.data, file = "tidy_data.txt", sep = ",", row.names = F)
