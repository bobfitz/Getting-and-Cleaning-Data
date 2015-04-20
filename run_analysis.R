run_analysis <- function() {
# read all the text files in
#
#       test files
        subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")
        X_test <- read.table("UCI HAR Dataset/test/X_test.txt")
        y_test <- read.table("UCI HAR Dataset/test/y_test.txt")
        merged_test <- cbind(subject_test, y_test, X_test)
#       training file 
        subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
        X_train <- read.table("UCI HAR Dataset/train/X_train.txt")
        y_train <- read.table("UCI HAR Dataset/train/y_train.txt")
        merged_train <- cbind(subject_train, y_train, X_train)
#       
#       other stuff
#        
        activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt", stringsAsFactors = FALSE )
        
        features <- read.table("UCI HAR Dataset/features.txt")
#
#       combine test and train
#       
        merged <- rbind(merged_test, merged_train)
#       rename columns
        names(merged)[1] <- "Subjects"
        names(merged)[2] <- "Labels"
#
#       grep for the std and mean columns and save in an index
        stdidx <- grep ("-std()", features$V2, fixed = TRUE)
        meanidx <- grep("-mean()", features$V2, fixed = TRUE)
        srtidx <- sort(c(stdidx, meanidx))
        mainidx <- srtidx
        for (i in 1:length(srtidx)) mainidx[i] = srtidx[i] + 3
#
#       use merge to get the activity labels on 
        maindata <- merge(activity_labels, merged, by.x = "V1", by.y = "Labels")
#
#       put nicenames on variables
        for (i in 1:length(srtidx)) names(maindata)[mainidx[i]] <- as.character(features[srtidx[i],2])
#       rename columns
        names(maindata)[1] <- "Labels"
        names(maindata)[2] <- "Activities"
#
# get the final dataset
        tempds <- maindata[ , c(2,3,mainidx)]
#       reorder the columns for subject and activities
        endofds <- ncol(tempds)
        step5ds <-tempds[ , c(2,1,3:endofds)]
#
#       Step 5
#        
#       figure which columns you need to mean
#
        end <- ncol(step5ds)
        meands <- aggregate(step5ds[ ,3:end], list(step5ds$Subjects, step5ds$Activities), FUN=mean)
        names(meands)[1] <- "Subjects"
        names(meands)[2] <- "Activities"
return(meands)
}