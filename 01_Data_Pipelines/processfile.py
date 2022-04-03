import pandas as pd
import numpy as np
import os
from datetime import date, datetime
import sys
 
filename = sys.argv[1]
# print(filename)

now = datetime.now()
dt_string = now.strftime("%Y-%m-%d_%H%M%S_%f")[:-3]

outputpath = './output/'+str(dt_string)+'_output.csv'

data = filename
df= pd.read_csv(data)

# clean names
df['name'].replace('(\,|\.|Miss|Ms.|Mrs.|Mrs. |Jr.|Jr. |Dr.|Dr. |Mr.|Mr. |,Mr.|MD|DDS|PhD|DVM|II|III|IV)','',regex=True, inplace=True)
df['name'] = df['name'].str.strip()
df['first_name'] = df['name'].str.split(" ").str[0]
df['last_name'] = df['name'].str.split(" ").str[-1]

df.dropna(subset= ['name','first_name','last_name', 'price'],inplace =True)

# Ensure all values are float not strings 
df['price'] = df['price'].astype(float)
# Get values above 100
df['above_100'] = df['price'].apply(lambda x: 'true' if x > 100 else 'false')

df = df.drop(['name'],axis =1)

# reindex for presentation 
df = df[['first_name','last_name','price','above_100']]
df.to_csv(outputpath,index = False)

print("OK")