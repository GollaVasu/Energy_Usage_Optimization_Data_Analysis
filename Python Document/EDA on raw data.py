# -*- coding: utf-8 -*-
"""
Created on Mon Dec  9 00:06:47 2024

@author: G Thirumala Vasu"""


import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns


data=pd.read_csv(r"C:\Users\G Thirumala Vasu\OneDrive\Desktop\Modified_Glass_Manufacturing_Energy_Optimization.csv")
data.info()
data.describe()


column_name = input("Enter column name:")

if column_name in data.columns:
    
    #First moment business decision
    # Calculate mean, median, and mode
    mean_value = data[column_name].mean()
    median_value = data[column_name].median()
    mode_value = data[column_name].mode()
    
    # Print the results
    print(f"Mean: {mean_value}")
    print(f"Median: {median_value}")
    print(f"Mode: {mode_value}")
    
    
    
    #Second moment Business Decision
    variance_value = data[column_name].var()
    stdev_value = data[column_name].std()
    range_value = data[column_name].max()-data[column_name].min()
    
    # Print the results
    print(f"Variance: {variance_value}")
    print(f"Stdev: {stdev_value}")
    print(f"range: {range_value}")
    
    
    
    #Third moment business decision
    skewness_value = data[column_name].skew()
    print(f"Skewness: {skewness_value}")  
    
    
    #Forth moment business decision
    kurtosis_value = data[column_name].kurtosis()
    print(f"kurtosis: {kurtosis_value}")
    
    
else:
    print(f"Column '{column_name}' not found in the dataset.")
    
import sweetviz as sv
s = sv.analyze(data)
s.show_html()
    
