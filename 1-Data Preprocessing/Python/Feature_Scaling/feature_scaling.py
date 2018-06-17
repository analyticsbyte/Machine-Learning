# Data Preprocessing

# Importing the libraries
import pandas as pd

# Importing the dataset
dataset = pd.read_csv('Data.csv')
X = dataset.iloc[:, :-1].values
Y = dataset.iloc[:, 3].values

# -------  Taking care of missing data ------------

from sklearn.preprocessing import Imputer
imputer = Imputer(missing_values = 'NaN', strategy = 'mean', axis = 0)
imputer = imputer.fit(X[:, 1:3])
X[:, 1:3] = imputer.transform(X[:, 1:3])

# ---------- Encoding categorical data -------------

from sklearn.preprocessing import LabelEncoder, OneHotEncoder

# Encoding the Dependent Variable
labelencoder_Y = LabelEncoder()
Y = labelencoder_Y.fit_transform(Y)

# Encoding the Independent Variable :: We can not catogorize as 0,1,2
# as it will show comparison between countries.

labelencoder_X = LabelEncoder()
X[:, 0] = labelencoder_X.fit_transform(X[:, 0])

# are wrong. We have to create seperate coloumns for countries using
# OneHotEncoder

onehotencoder_X = OneHotEncoder(categorical_features = [0])
X = onehotencoder_X.fit_transform(X).toarray()

#*** OnHotEncoder() can not convert from String to Float. So first convert to integer
# using LabelEncoder() ...



# --------------- Splitting into Training & Test Set -----------------

from sklearn.cross_validation import train_test_split

X_train, X_test, Y_train, Y_Test = train_test_split(X, Y, # array i.e the matrix
                                                    test_size = 0.2, # 20% test data
                                                    random_state = 0) # 


# --------------- Feature Scaling ------------

# Feature Scaling = to transform all the variable to same scale

from sklearn.preprocessing import StandardScaler

sc_X = StandardScaler()
X_train = sc_X.fit_transform(X_train) # we have to to fit the sc scaler and then transform
X_test = sc_X.transform(X_test) # as we have made the fit to training set, in test set
                                # only transform is required

# is scalling is required on Dummy variable ? It depends on situations
# for Y scaling is not required                               

