# getdata-014_courseproject
Couse project for Getting and Cleaning Data on Coursera

The run_analysis script assumes that the Samsung data has been unzipped and is in the working directory under "UCI HAR Dataset" folder.
It direct reads in the training data (subject, activity and feature) as one table and test data as another.
It then merges the two into a single table.
It reads in the feature names from the provided text file and assigns them accordingly.
Then only the mean and standard deviation columns are extracted out.
After that, it replaces the numbers representing the activities with the activity names themselves.
Then it creates a second table with the average of each feature, grouped by subject and activity.
Finally, this aggregated table is written out in a text file.
