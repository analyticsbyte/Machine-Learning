#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Mon Apr  9 00:25:10 2018

@author: abhishekkumarsarkar
"""

# -------- Import the liabrary ----------------------

import pandas as pd # Liabrary to deal with importing dataset
from sklearn.preprocessing import Imputer # Preprocessing the Dataset

# ------------- Import the dataset --------------------
dataset = pd.read_csv('Data.csv')

# ------------- Slicing Coloumns --------------------
X = dataset.iloc[:, :-1].values # Independant variables :: (First three coloumns)
                                # Take all the rows, all 
                                # the coloumns except last one 
                                
Y = dataset.iloc[:, -1].values  # Dependent Variables:: (Last Coloumn)
                                # Take all the rows, and
                                # only the first coloumn
                                

# ------------- Taking care of the missing data ---------------

#Imputer(self, missing_values="NaN", strategy="mean", axis=0, verbose=0, copy=True)
# Click on the cmd+i to inspect and get the info in Help tab
  # The axis along which to impute.
  #      If axis=0, then impute along columns.
  #      If axis=1, then impute along rows.

imputer = Imputer(missing_values='NaN', strategy='mean', axis=0)

imputer = imputer.fit(X[:,1:3]) # fit this imputer object to our Matrix-X
                # We only fit the imputer to the only missing coloumns 
                # not all the coloumns
                
X[:,1:3] = imputer.transform(X[:,1:3]) # replace the missing data 
                                       # with mean of the cloumn

