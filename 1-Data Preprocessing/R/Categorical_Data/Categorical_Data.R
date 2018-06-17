
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







