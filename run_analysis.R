run_analysis <- function() {
  # load and merge main data, expecting train and test directory under the working dir
  X_train_data <- read.table("train/X_train.txt")
  X_test_data <- read.table("test/X_test.txt")
  X_merged_data <- rbind(X_train_data, X_test_data)

  # load and merge subject data
  subject_train_data <- read.table("train/subject_train.txt")
  subject_test_data <- read.table("test/subject_test.txt")
  subject_merged_data <- rbind(subject_train_data, subject_test_data)

  # load and merge activiy data
  activity_train_data <- read.table("train/y_train.txt")
  activity_test_data <- read.table("test/y_test.txt")
  activity_merged_data <- rbind(activity_train_data, activity_test_data)

  # merge subject, activity and main data
  all_data <- cbind(subject_merged_data, activity_merged_data, X_merged_data)
  
  # creating another data set with subject, activity, mean and standart deviation cols
  mean_std_data <- all_data[,c(1,2,203,204,216,217,229,230,242,243,255,256,
                               505,506,518,519,531,532,544,545)]
  
  # set descriptive column headers
  names(mean_std_data) <- 
    c("Subject","Activity",
    "Time Body Acc Mag Mean","Time Body Acc Mag Standard Deviation",
    "Time Gravity AccMag Mean","Time Gravity AccMag Standard Deviation",
    "Time Body Acc Jerk Mag Mean","Time Body Acc Jerk Mag Standard Deviation
",  "Time Body Gyro Mag Mean","Time Body Gyro Mag Standard Deviation",        
    "Time Body Gyro Jerk Mag Mean","Time Body Gyro Jerk Mag Standard Deviation",
    "Frequency Body Acc Mag Mean","Frequency Body Acc Mag Standard Deviation",
    "Frequency Body Body Acc Jerk Mag Mean","Frequency Body Body Acc Jerk Mag Standard Deviation",
    "Frequency Body Body Gyro Mag Mean","Frequency Body Body Gyro Mag Standard Deviation",
    "Frequency Body Body Gyro Jerk Mag Mean","Frequency Body Body Gyro Jerk Mag Standard Deviation")
  
  # aggregate by subject and activity and then write the output
  step5_data <- aggregate(mean_std_data, by=list("Subject Group"=mean_std_data$Subject, "Activity Group"=mean_std_data$Activity), FUN=mean)
  write.table(step5_data, "step5_data.txt", row.names=FALSE)
}
