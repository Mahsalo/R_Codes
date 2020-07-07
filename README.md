# R_Codes
This folder includes all the R codes I have written to tackle small side-projects
The R folder consists of all of the R codes I have written for the side-projects.
The explanation of each file and the corresponding dataset is given below:


(1) Project corresponding to “Best.R”, “Rankall.R”, “Rankhospital.R” , Dataset: “hospital-data.csv”, “outcome-of-care-measures.csv”  


The data for this assignment come from the Hospital Compare web site (http://hospitalcompare.hhs.gov) run by the U.S. Department of Health and Human Services. The purpose of the web site is to provide data and information about the quality of care at over 4,000 Medicare-certified hospitals in the U.S. This dataset essentially covers all major U.S. hospitals. 

The Hospital Compare web site contains a lot of data and we will only look at a small subset for this assignment. 

• outcome-of-care-measures.csv: Contains information about 30-day mortality and readmission rates for heart attacks, heart failure, and pneumonia for over 4,000 hospitals. 

• hospital-data.csv: Contains information about each hospital. 

• Hospital_Revised_Flatfiles.pdf: Descriptions of the variables in each file


-“Best.R” is a function that takes two arguments: the 2-character abbreviated name of a state and an outcome name. This function reads the outcome-of-care-measures.csv file and returns a character vector with the name of the hospital that has the best (i.e. lowest) 30-day mortality for the specified outcome in that state. The hospital name is the name provided in the Hospital.Name variable. The outcomes can be one of “heart attack”, “heart failure”, or “pneumonia”. Hospitals that do not have data on a particular outcome should be excluded from the set of hospitals when deciding the rankings. If there is a tie for the best hospital for a given outcome, then the hospital names should be sorted in alphabetical order and the first hospital in that set should be chosen (i.e. if hospitals “b”, “c”, and “f” are tied for best, then hospital “b” should be returned).
This function also checks the validity of its arguments. If an invalid state value is passed to best, the function throws an error via the stop function with the exact message “invalid state”. If an invalid outcome value is passed to best, the function throws an error via the stop function with the exact message “invalid outcome”.

-“Rankhospital.R”  is a function that takes three arguments: the 2-character abbreviated name of a state (state), an outcome (outcome), and the ranking of a hospital in that state for that outcome (num). The function reads the outcome-of-care-measures.csv file and returns a character vector with the name of the hospital that has the ranking specified by the num argument. The num argument can take values “best”, “worst”, or an integer indicating the ranking (smaller numbers are better). If the number given by num is larger than the number of hospitals in that state, then the function should return NA. Hospitals that do not have data on a particular outcome should be excluded from the set of hospitals when deciding the rankings. It may occur that multiple hospitals have the same 30-day mortality rate for a given cause of death. In those cases ties should be broken by using the hospital name. 

-“Rankall.R” is a function that takes two arguments: an outcome name (outcome) and a hospital ranking (num). The function reads the outcome-of-care-measures.csv file and returns a 2-column data frame containing the hospital in each state that has the ranking specified in num. For example the function call rankall("heart attack", "best") would return a data frame containing the names of the hospitals that are the best in their respective states for 30-day heart attack death rates. The function should return a value for every state (some may be NA). The first column in the data frame is named hospital, which contains the hospital name, and the second column is named state, which contains the 2-character abbreviation for the state name. Hospitals that do not have data on a particular outcome should be excluded from the set of hospitals when deciding the rankings. Handling ties. The rankall function should handle ties in the 30-day mortality rates in the same way that the rankhospital function handles ties.


(2) Project corresponding to “pollutantmean.R”, “complete.R” and “corr.R”. Dataset: “spectate.csv”

The zip file contains 332 comma-separated-value (CSV) files containing pollution monitoring data for fine particulate matter (PM) air pollution at 332 locations in the United States. Each file contains data from a single monitor and the ID number for each monitor is contained in the file name. For example, data for monitor 200 is contained in the file "200.csv". Each file contains three variables:

• Date: the date of the observation in YYYY-MM-DD format (year-month-day)

• sulfate: the level of sulfate PM in the air on that date (measured in micrograms per cubic meter)

• nitrate: the level of nitrate PM in the air on that date (measured in micrograms per cubic meter)

-“pollutant mean.R” is a function that calculates the mean of a pollutant (sulfate or nitrate) across a specified list of monitors. The function 'pollutantmean' takes three arguments: 'directory', 'pollutant', and 'id'. Given a vector monitor ID numbers, 'pollutantmean' reads that monitors' particulate matter data from the directory specified in the 'directory' argument and returns the mean of the pollutant across all of the monitors, ignoring any missing values coded as NA. 

-“complete.R”  is a function that reads a directory full of files and reports the number of completely observed cases in each data file. The function should return a data frame where the first column is the name of the file and the second column is the number of complete cases. 

-“corr.R” is a function that takes a directory of data files and a threshold for complete cases and calculates the correlation between sulfate and nitrate for monitor locations where the number of completely observed cases (on all variables) is greater than the threshold. The function should return a vector of correlations for the monitors that meet the threshold requirement. If no monitors meet the threshold requirement, then the function should return a numeric vector of length 0. 





