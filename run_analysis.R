
rm(list=ls())

library(dplyr)
library(plyr)

if(!file.exists("."))
{
  download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip","Dataset.zip")
}


unzip("Dataset.zip")

#load data

#features
features<-read.table("./UCI HAR Dataset/features.txt",header = FALSE)
activity_labels<-read.table("./UCI HAR Dataset/activity_labels.txt",header = FALSE)


#subject
subject_train<-read.table("./UCI HAR Dataset/train/subject_train.txt",header = FALSE)
subject_test<-read.table("./UCI HAR Dataset/test/subject_test.txt",header = FALSE)

#X
X_train<-read.table("./UCI HAR Dataset/train/X_train.txt",header = FALSE)
X_test<-read.table("./UCI HAR Dataset/test/X_test.txt",header = FALSE)

#Y
y_train<-read.table("./UCI HAR Dataset/train/y_train.txt",header = FALSE)
y_test<-read.table("./UCI HAR Dataset/test/y_test.txt",header = FALSE)

#1. Merges the training and the test sets to create one data set.
x_data<-rbind(X_train,X_test)
y_data<-rbind(y_train,y_test)
subject_data<-rbind(subject_train,subject_test)


#column name to data set
names(y_data)<-c("activity")
names(subject_data)<-c("subject")

#2.	Extracts only the measurements on the mean and standard deviation for each measurement. 
mean_std_names<-features[grep("mean\\(\\)|std\\(\\)",features$V2),]
selected_x_data<-subset(x_data,select=mean_std_names$V1)



#3.	Uses descriptive activity names to name the activities in the data set
y_data[,1]<-activity_labels[y_data[,1],2]


#4.	Appropriately labels the data set with descriptive variable names
#put column name to selected data
names(selected_x_data)<-c(as.character(mean_std_names$V2))

#merge all data together
merged_data<-cbind(selected_x_data,y_data,subject_data)

#5.	From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
avg_data<-aggregate(.~subject+activity,merged_data,mean)
write.table(avg_data,file="tidydata.txt",row.names = FALSE)
