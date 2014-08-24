# The purpose of this script (run_analysis.R is to merge and clean the data set.
## Here is how the script works.
* expecting test and train dir to exist under working directory, 
** it reads train and test data for main, subbject and activity data and theen merge those individually using rbind
** it then merges all three into one column wise using cbind
** next, it create another data frame using the original, extracting subject, and asked data elements (mean , standard deviation)
** then it add the appropriate headers for each column usng "names"
** finally, the script aggregate the data by Subject and Activiy and write using write.table
