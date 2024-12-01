# Introduction

This is a codebook for the Data Science course 3 / week 4 assignment.

# Files in the repository

## Included files

- run_analysis.R - the main script to clean and tidy the dataset
- Codebook.md - markdown file that explains the cleaning process
- tidy.txt - tidy dataset
- README.md - this markdown file

## Excluded files

- Original data files are excluded from this repository:
  x_test.txt
  x_train.txt
  y_test.txt
  y_train.txt
  subject_test.txt
  subject_train.txt
  
# Variables

## New columns: Activity and Subject

These two columns are created from "y_.txt" and "subject_.txt" files.

## Variable names

All other variable names are loaded from the "features.txt" file.
  
# How it works?

run_analysis.R file needs the original data files listed in excluded files section above. *The data files must be in course3 folder* for the script to work.

## 1 - Reading from text files

Data files are read into respective variables from the txt files using read.table commands.

## 2 - Checking load accuracy

Number of rows in each dataset are compared for visual checking, row counts are retrived with nrow() command.

## 3 - Binding test and train datasets

Test and train datasets are merged into respective "x_merged", "y_merged", "subject_merged". This is row merging so we use rbind() command.

## 4 - Assigning column labels from features.txt

First we read features.txt into a vector and then we use names(dataframe) command to assign the vector to the column names.

## 5 - Creating Activity and Subject columns

We create Activity and Subject columns and assign vectors from y_merged and subject_merged dataframes' V1 column respectively.

## 6 - Selecting columns with mean, std and Activity, Subject

We create a vector with required column names. We use grep() function to select the desired columns. Then we subset from x_merged dataset with the desired columns.

## 7 - Converting Activity numbers to text labels

We create a mapping of numeric values to text labels using activity_labels.txt file. We apply the mapping to Activity column of the new dataframe.

## 8 - Create a new data set with the average of each variable, by activity and subject

We use chain %>% command operator and group dataset by activity and subject and calculate the means of the variables and assign it to a new "tidy_df" dataframe.

## 9 - Save the data set to text file

We use write.table() command to save the new data set to the file.