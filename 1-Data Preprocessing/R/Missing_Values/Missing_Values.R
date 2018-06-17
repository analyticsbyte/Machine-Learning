
#First you have to set the working directory from "More" option menu

# --------- Importing the dataset -------------
dataset = read.csv('Data.csv')

# --------- Taking care of missing data individual coloumn ----------
dataset$Age = ifelse(is.na(dataset$Age), # condition checking:: if value in cloumn Age is missing or not
                     ave(dataset$Age, FUN = function(x) mean(x, na.rm = TRUE)), # if True :: then do the Mean
                     dataset$Age) #if False :: then print Age

dataset$Salary = ifelse(is.na(dataset$Salary),
                     ave(dataset$Salary, FUN = function(x) mean(x, na.rm = TRUE)),
                     dataset$Salary)

