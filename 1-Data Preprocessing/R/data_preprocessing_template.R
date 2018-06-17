
#First you have to set the working directory from "More" option menu

# --------- Importing the dataset -------------
dataset = read.csv('Data.csv')
#dataset = dataset[, 2:3]

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

#training_set[, 2:3] =  scale(training_set[, 2:3])
#test_set[, 2:3] =  scale(test_set[, 2:3])



