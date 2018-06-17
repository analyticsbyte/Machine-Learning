# Data Preprocessing

# ------------- Importing the libraries -------
import numpy as np
import matplotlib.pyplot as plt
import pandas as pd

# ------------- Importing the dataset --------------
dataset = pd.read_csv('Data.csv')
X = dataset.iloc[:, :-1].values
Y = dataset.iloc[:, 3].values


# --------------- Splitting into Training & Test Set -----------------

from sklearn.cross_validation import train_test_split

X_train, X_test, Y_train, Y_Test = train_test_split(X, Y, # array i.e the matrix
                                                    test_size = 0.2, # 20% test data
                                                    random_state = 0) # 


# --------------- Feature Scaling ------------

"""from sklearn.preprocessing import StandardScaler

sc_X = StandardScaler()
X_train = sc_X.fit_transform(X_train) # we have to to fit the sc scaler and then transform
X_test = sc_X.transform(X_test) # as we have made the fit to training set, in test set
                                # only transform is required"""

