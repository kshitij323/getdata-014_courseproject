## This function runs the analysis required to generate tidy data table for course project

run_analysis <- function() {
  
  traindata<-cbind(read.table("UCI HAR Dataset/train/subject_train.txt"),read.table("UCI HAR Dataset/train/Y_train.txt"),read.table("UCI HAR Dataset/train/X_train.txt"))
  
  testdata<-cbind(read.table("UCI HAR Dataset/test/subject_test.txt"),read.table("UCI HAR Dataset/test/Y_test.txt"),read.table("UCI HAR Dataset/test/X_test.txt"))
    
  ## merging the train & test data
  alldata<-rbind(traindata,testdata)
    
  ## getting headers for features
  colheaders = read.table("UCI HAR Dataset/features.txt")
  
  ## assigning column headers to table
  colnames(alldata) <- c("Subject","Activity",as.character(colheaders$V2))
  
  ## extracting only the measurements on the mean and standard deviation
  meanstddata<-alldata[,grep('mean()|std()|Subject|Activity',names(alldata))]
  
  ## using descriptive activity names to name the activities
  activitynames = read.table("UCI HAR Dataset/activity_labels.txt")
  
  for (ids in 1:nrow(meanstddata)) {
    for (idt in 1:6) {
      if (meanstddata[ids,2]==activitynames[idt,1]) {
        meanstddata[ids,2]=as.character(activitynames[idt,2])
      }
    }
  }
  
  ## creating a second, independent tidy data set with the average of each variable for each activity and each subject
  aggdata <-aggregate(meanstddata[,3:length(meanstddata)], by=list(Subject=meanstddata$Subject,Activity=meanstddata$Activity),FUN=mean, na.rm=TRUE)
  
  write.table(aggdata, file = "aggdata.txt",row.name=FALSE)
  
}