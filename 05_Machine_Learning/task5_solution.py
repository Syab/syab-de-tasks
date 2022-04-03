# -*- coding: utf-8 -*-
"""task5_solution.ipynb

Automatically generated by Colaboratory.

Original file is located at
    https://colab.research.google.com/drive/1pucCJE9PD7TYrqrp7lDCBccjC-ekrYag
"""

from google.colab import files
uploaded = files.upload()

# Commented out IPython magic to ensure Python compatibility.
import os
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns 
# %matplotlib inline

data = './car.csv'
df= pd.read_csv(data, header=None)

print("Data dimensions")
print(df.shape, "\n")
print("Data Snapshot - First 10 records")
df.head(10)

"""## Exploratory Data Analysis"""

col_names = ['buying', 'maint', 'doors', 'persons', 'lug_boot', 'safety', 'class']
df.columns = col_names
col_names

df.head(10)

df.info()

# Target Variable is "buying" column, check distribution.

df['buying'].value_counts()

# Check for any missing values if any
df.isnull().sum()

"""# Feature Vector and Target Variable

"""

X=pd.get_dummies(df.drop(['buying'], axis=1))
y=df['buying']

X.head()

from sklearn import preprocessing
le = preprocessing.LabelEncoder()
# Encode categorical variables
le.fit(df["buying"])
buying = le.transform(df["buying"])
le.classes_

print(buying)

"""# Split data into Training and Test set"""

from sklearn.model_selection import train_test_split

X_train, X_test, y_train, y_test = train_test_split(
    X, y, test_size = 0.33, 
    random_state = 42
    )

X_train.shape, X_test.shape

X_train.head()

X_test.head()

"""# Decision Tree Classifier

"""

from sklearn.tree import DecisionTreeClassifier

clf_gini = DecisionTreeClassifier(criterion='gini', max_depth=3, random_state=0)

# fit the model
clf_gini.fit(X_train, y_train)

y_pred_gini = clf_gini.predict(X_test)

from sklearn.metrics import accuracy_score

print('Model accuracy score with criterion gini index: {0:0.4f}'. format(accuracy_score(y_test, y_pred_gini)))

y_pred_train_gini = clf_gini.predict(X_train)

y_pred_train_gini

print('Training-set accuracy score: {0:0.4f}'. format(accuracy_score(y_train, y_pred_train_gini)))

# Check overfitting and underfitting

print('Training set score: {:.4f}'.format(clf_gini.score(X_train, y_train)))

print('Test set score: {:.4f}'.format(clf_gini.score(X_test, y_test)))

plt.figure(figsize=(12,8))

from sklearn import tree

tree.plot_tree(clf_gini.fit(X_train, y_train))