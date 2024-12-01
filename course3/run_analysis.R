# Read data for X and Y
x_test <- read.table("X_test.txt", header = FALSE)
x_train <- read.table("X_train.txt", header = FALSE)
y_test <- read.table("y_test.txt", header = FALSE)
y_train <- read.table("y_train.txt", header = FALSE)
subject_test <- read.table("subject_test.txt", header = FALSE)
subject_train <- read.table("subject_train.txt", header = FALSE)

# library
library(dplyr)

# Summarise the data frame
nrow(x_test)
nrow(x_train)
nrow(y_test)
nrow(y_train)
nrow(subject_test)
nrow(subject_train)

# Merge rows from x_train and x_test, y_train, y_test
x_merged <- rbind(x_train, x_test)
y_merged <- rbind(y_train, y_test)
subject_merged <- rbind(subject_train, subject_test)

#read names of columns
columns <- read.table("features.txt", header = FALSE)
View(columns)

#assign new names to the merged df
names(x_merged) <- columns$V2

# Display the merged data frame
View(x_merged)
View(y_merged)

# add y as new "Activity" column to x_merged
x_merged$Activity <- y_merged$V1
x_merged$Subject <- subject_merged$V1
View(x_merged)

# Find column indices containing the required text
cols_to_select <- grep("mean()|std()|Activity|Subject", names(x_merged))
cols_to_select

# Create a new data frame with selected columns
new_df <- x_merged[, cols_to_select]

# Display the new data frame
View(new_df)

#create a mapping for activity labels
mapping <- c("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING")

# Replace numeric values with labels in the 'Activity' column
new_df$Activity <- mapping[new_df$Activity]
View(new_df)

# Create the new data set with averages
tidy_df <- new_df %>%
  group_by(Subject, Activity) %>%
  summarise_all(mean, na.rm = TRUE)

# Display the new data set
View(tidy_df)

write.table(tidy_df, "tidy.txt", row.names=FALSE)


