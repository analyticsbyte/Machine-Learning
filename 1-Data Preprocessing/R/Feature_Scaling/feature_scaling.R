
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

# -------- Encoding categorical data ------

#factor function = convert catagorical variables to numeric values.
#                  it will see the variables as factors.
#                  we can change the catagory
#                  No need to make three coloumns

dataset$Country = factor(dataset$Country, # data which we want to transform into factors
                         levels = c('France', 'Spain', 'Germany'),#names of catagorical coloumns
                                                                  # c is the vector of levels
                         labels = c(1, 2, 3)) #labels value is to give differentiate but not to compare
                        
dataset$Purchased = factor(dataset$Purchased,
                           levels = c('Yes', 'No'),
                           labels = c(0,1))


# --------------- Splitting into Training & Test Set -----------------

#install.packages('caTools') # we have to download this liabrary for splitting

library(caTools) # to include the liabrary to the script

set.seed(123)

#This will return only True and False
#                   True = observation in training set
#                   False = observation in test set

split = sample.split(dataset$Purchased, # put the dependant variable only
                     SplitRatio = 0.8) # Training set 80%


training_set =  subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)


#----------- Feature Scaling -----------------------

#training_set =  scale(training_set) # this will show an error as coloumn 1 and 4 
                                    # are factors not numeric
#test_set =  scale(test_set)

training_set[, 2:3] =  scale(training_set[, 2:3])
test_set[, 2:3] =  scale(test_set[, 2:3])



