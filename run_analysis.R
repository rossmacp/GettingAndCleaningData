#'# Coursera Get and Clean Data Assignment
#'# Not Impossible

  library(dplyr)
# source packages
  
  # features.txt
  # TEST set files: X_test.txt  subject_test.txt y_test.txt
  # TRAIN set files: X_train.txt subject_train.txt y_train.txt
  # These 7 files are necessary
  
  featurefile <- read.table("features.txt", sep = "")
  header1 <- as.vector(featurefile[,2])
  # Descriptive variable names are in Column 2 of features.txt
  # header1 contains these future column headers
  
  Addcols <- c("OriginalSet", "Subject","Activity")
  header2 <- c(Addcols,header1)
  # header2 has names for 3 Factor columns plus Descriptive variable names 
  
  testdata <- read.table("X_test.txt", sep = "")
  testDataSubject <- read.table("subject_test.txt", sep = "")
  testDataActivity <- read.table("y_test.txt", sep = "")
  test <- cbind("TestSet", testDataSubject, testDataActivity, testdata) 
  # read and combine train data, Subject annotation, Activity annotation 
  # Adds a column to annotate this is the Test set data
  # Not in the requirements but I think it's good practice to record the origin
  
  colnames(test) <- header2
  # add header with descriptive variable names
  
  traindata <- read.table("X_train.txt", sep = "")
  trainDataSubject <- read.table("subject_train.txt", sep = "")
  trainDataActivity <- read.table("y_train.txt", sep = "")
  train <- cbind("TrainingSet", trainDataSubject, trainDataActivity, traindata) 
  # read and combine train data, Subject annotation, Activity annotation 
  # Add a column to annotate this is the Training set data
  # Not in the requirements but I think it's good practice to record the origin
  
  colnames(train) <- header2
  # adds the header with descriptive variable names
  
  dataset1 <- rbind(train, test)
  # Point 1. merges the training and test sets to create one dataset
  
  keeps <- c(1:305, 348:385, 427:464, 505:564)
  subdataset1 <- dataset1[,keeps]
  # remove columns 306:347 386:426 and 465:504 which duplicate variable names 
  # duplicate variable names throw an error in dplyr functions
  
  dataset2 <- select(subdataset1, 1:3, contains("mean()"), contains("std()"))
  # keeps columns 1:3 and columns with 'mean' or 'std' in variable name
  # First independent tidy dataset
  # Point 2. Extracts only the mean and STD for each measurement.
  
  dataset2$Activity[dataset2$Activity == "1"] <- "WALKING"
  dataset2$Activity[dataset2$Activity == "2"] <- "WALKING_UPSTAIRS"
  dataset2$Activity[dataset2$Activity == "3"] <- "WALKING_DOWNSTAIRS"
  dataset2$Activity[dataset2$Activity == "4"] <- "SITTING"
  dataset2$Activity[dataset2$Activity == "5"] <- "STANDING"
  dataset2$Activity[dataset2$Activity == "6"] <- "LAYING"
  # Point 3. Uses Descriptive activity names for the activities in the dataset
  
  # Point 4. Variables descriptive names were assigned on row 40
  
  dataset3 <- aggregate(dataset2[,4:69], 
                        list(OriginalSet = dataset2$OriginalSet, 
                          Subject = dataset2$Subject, 
                             Activity = dataset2$Activity), FUN = "mean")
  # Computes the averages for variables in columns 4 through 69
  # grouped according to Subject (30) and activity (6) = 180 observations
  
  foo <-colnames(dataset3)
  fbody <-gsub("fBody", "Mean_fBody", foo)
  tbody <-gsub("tBody", "Mean_tBody", fbody)
  tgravity <-gsub("tGravity", "Mean_tGravity", tbody)
  colnames(dataset3) <- tgravity
  # rename the variable columns 
  # to reflect fact that they are now the means of previous measurements
  
  # Point 5. Second Independent Tidy data set 
  # with the average of each variable for each activity and each subject
  
  write.table(dataset3, file = "tidydata.txt", row.names = FALSE)
  # as per the Assignment upload instructions 
  # tidy data in .txt file created with write.table() using row.name=FALSE
  # that can be read into R with 
  # foo <- read.table("tidydata.txt", header=TRUE)
  
  