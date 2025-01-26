# -*- coding: utf-8 -*-
"""
Created on Mon Dec  9 03:57:27 2024

@author: G Thirumala Vasu
"""

#Data cleaning

import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns
from sklearn.impute import SimpleImputer
from sklearn.preprocessing import LabelEncoder
from sklearn.preprocessing import OneHotEncoder
import category_encoders as ce


data=pd.read_csv(r"C:\Users\G Thirumala Vasu\OneDrive\Desktop\Modified_Glass_Manufacturing_Energy_Optimization.csv")
data.info()
data.describe()

##Type casting
print(data.dtypes)
data['Date'] = pd.to_datetime(data['Date'], format='%Y-%m-%d %H:%M:%S')

data['Date'] = data['Date'].dt.date

print(data)

## checking for duplicates

d = data.duplicated()
print(d.sum())

#No duplicates


#boxplot to visualize outliers in Production_Output (tons) column
sns.boxplot(data['Production_Output (tons)'])
plt.title("Boxplot of Production Output (tons)")
plt.ylabel("Production Output (tons)")


# detecting the outliers in Production_Output (tons) column
q1 = data['Production_Output (tons)'].quantile(0.25)
q3 = data["Production_Output (tons)"].quantile(0.75)

Iqr = q3-q1

lowerbound = q1-1.5 * Iqr
upperbound = q3+1.5 * Iqr

print(f"Lower bound: {lowerbound}")
print(f"Upper bound: {upperbound}")

outliers = data[(data['Production_Output (tons)'] < lowerbound) | (data['Production_Output (tons)'] > upperbound)]
print(f"Number of Outliers: {len(outliers)}")
print(outliers)


#There are 20 outliers and the data is not normally destributed and positively skeweed
#The outliers are extreamly high so performing median imputation on outliers

#Replaceing outliers with median
median_value = data['Production_Output (tons)'].median()
data['Production_Output (tons)'] = data['Production_Output (tons)'].apply(
    lambda x: median_value if (x < lowerbound or x > upperbound) else x)


#boxplot to visualize outliers after replaceing outliers with median
sns.boxplot(data['Production_Output (tons)'])
plt.title("Boxplot of Production Output (tons)")
plt.ylabel("Production Output (tons)")

#histogram to see the data distribution after removing outliers
sns.histplot(data['Production_Output (tons)'],kde=True, color='skyblue', bins=30)
plt.title("Histogram of Production Output (tons)")
plt.xlabel("Production Output (tons)")
plt.ylabel("Frequency")
plt.show()

# ********************************************************************************************
data.info()
#boxplot to visualize outliers in Energy_Consumption (kWh)
sns.boxplot(data['Energy_Consumption (kWh)'])
plt.title("Boxplot of Energy_Consumption (kWh)")
plt.ylabel("Energy_Consumption (kWh)")


# detecting the outliers in Energy_Consumption (kWh) column
q1 = data['Energy_Consumption (kWh)'].quantile(0.25)
q3 = data["Energy_Consumption (kWh)"].quantile(0.75)

Iqr = q3-q1

lowerbound = q1-1.5 * Iqr
upperbound = q3+1.5 * Iqr

print(f"Lower bound: {lowerbound}")
print(f"Upper bound: {upperbound}")

outliers = data[(data['Energy_Consumption (kWh)'] < lowerbound) | (data['Energy_Consumption (kWh)'] > upperbound)]
print(f"Number of Outliers: {len(outliers)}")
print(outliers)


#There are 18 outliers and the data is not normally destributed and positively skeweed
#The outliers are extreamly high so performing median imputation on outliers

#Replaceing outliers with median
median_value = data['Energy_Consumption (kWh)'].median()
data['Energy_Consumption (kWh)'] = data['Energy_Consumption (kWh)'].apply(
    lambda x: median_value if (x < lowerbound or x > upperbound) else x)


#boxplot to visualize outliers after replaceing outliers with median
sns.boxplot(data['Energy_Consumption (kWh)'])
plt.title("Boxplot of Energy_Consumption (kWh)")
plt.ylabel("Energy_Consumption (kWh)")

#histogram to see the data distribution after removing outliers
sns.histplot(data['Energy_Consumption (kWh)'],kde=True, color='skyblue', bins=30)
plt.title("Histogram of Energy_Consumption (kWh)")
plt.xlabel("Energy_Consumption (kWh)")
plt.ylabel("Frequency")
plt.show()

# **********************************************************************************************

data.info()
#boxplot to visualize outliers in Furnace_Temperature (°C)
sns.boxplot(data['Furnace_Temperature (°C)'])
plt.title("Boxplot of Furnace_Temperature (°C)")
plt.ylabel("Furnace_Temperature (°C)")


# detecting the outliers in Furnace_Temperature (°C) column
q1 = data['Furnace_Temperature (°C)'].quantile(0.25)
q3 = data["Furnace_Temperature (°C)"].quantile(0.75)

Iqr = q3-q1

lowerbound = q1-1.5 * Iqr
upperbound = q3+1.5 * Iqr

print(f"Lower bound: {lowerbound}")
print(f"Upper bound: {upperbound}")

outliers = data[(data['Furnace_Temperature (°C)'] < lowerbound) | (data['Furnace_Temperature (°C)'] > upperbound)]
print(f"Number of Outliers: {len(outliers)}")
print(outliers)


#There are 20 outliers and the data is not normally destributed and positively skeweed
#The outliers are extreamly high so performing median imputation on outliers

#Replaceing outliers with median
median_value = data['Furnace_Temperature (°C)'].median()
data['Furnace_Temperature (°C)'] = data['Furnace_Temperature (°C)'].apply(
    lambda x: median_value if (x < lowerbound or x > upperbound) else x)


#boxplot to visualize outliers after replacing outliers with median
sns.boxplot(data['Furnace_Temperature (°C)'])
plt.title("Boxplot of Furnace_Temperature (°C)")
plt.ylabel("Furnace_Temperature (°C)")

#histogram to see the data distribution after removing outliers
sns.histplot(data['Furnace_Temperature (°C)'], kde=True, color='skyblue', bins=30)
plt.title("Histogram of Furnace_Temperature (°C)")
plt.xlabel("Furnace_Temperature (°C)")
plt.ylabel("Frequency")
plt.show()

# *******************************************************************************************8


#boxplot to visualize outliers in Annealing_Time (hrs)
sns.boxplot(data['Annealing_Time (hrs)'])
plt.title("Boxplot of Annealing_Time (hrs)")
plt.ylabel("Annealing_Time (hrs)")


# detecting the outliers in Annealing_Time (hrs) column
q1 = data['Annealing_Time (hrs)'].quantile(0.25)
q3 = data["Annealing_Time (hrs)"].quantile(0.75)

Iqr = q3-q1

lowerbound = q1-1.5 * Iqr
upperbound = q3+1.5 * Iqr

print(f"Lower bound: {lowerbound}")
print(f"Upper bound: {upperbound}")

outliers = data[(data['Annealing_Time (hrs)'] < lowerbound) | (data['Annealing_Time (hrs)'] > upperbound)]
print(f"Number of Outliers: {len(outliers)}")
print(outliers)


#There are 18 outliers and the data is not normally destributed and positively skeweed
#The outliers are extreamly high so performing median imputation on outliers

#Replaceing outliers with median
median_value = data['Annealing_Time (hrs)'].median()
data['Annealing_Time (hrs)'] = data['Annealing_Time (hrs)'].apply(
    lambda x: median_value if (x < lowerbound or x > upperbound) else x)


#boxplot to visualize outliers after replacing outliers with median
sns.boxplot(data['Annealing_Time (hrs)'])
plt.title("Boxplot of Annealing_Time (hrs)")
plt.ylabel("Annealing_Time (hrs)")

#histogram to see the data distribution after removing outliers
sns.histplot(data['Annealing_Time (hrs)'], kde=True, color='skyblue', bins=30)
plt.title("Histogram of Annealing_Time (hrs)")
plt.xlabel("Annealing_Time (hrs)")
plt.ylabel("Frequency")
plt.show()

# *********************************************************************************************

#boxplot to visualize outliers in Downtime (hrs)
sns.boxplot(data['Downtime (hrs)'])
plt.title("Boxplot of Downtime (hrs)")
plt.ylabel("Downtime (hrs)")


# detecting the outliers in Downtime (hrs) column
q1 = data['Downtime (hrs)'].quantile(0.25)
q3 = data["Downtime (hrs)"].quantile(0.75)

Iqr = q3-q1

lowerbound = q1-1.5 * Iqr
upperbound = q3+1.5 * Iqr

print(f"Lower bound: {lowerbound}")
print(f"Upper bound: {upperbound}")

outliers = data[(data['Downtime (hrs)'] < lowerbound) | (data['Downtime (hrs)'] > upperbound)]
print(f"Number of Outliers: {len(outliers)}")
print(outliers)


#There are 14 outliers and the data is not normally destributed and positively skeweed
#The outliers are extreamly high so performing median imputation on outliers

#Replaceing outliers with median
median_value = data['Downtime (hrs)'].median()
data['Downtime (hrs)'] = data['Downtime (hrs)'].apply(
    lambda x: median_value if (x < lowerbound or x > upperbound) else x)


#boxplot to visualize outliers after replacing outliers with median
sns.boxplot(data['Downtime (hrs)'])
plt.title("Boxplot of Downtime (hrs)")
plt.ylabel("Downtime (hrs)")

#histogram to see the data distribution after removing outliers
sns.histplot(data['Downtime (hrs)'], kde=True, color='skyblue', bins=30)
plt.title("Histogram of Downtime (hrs)")
plt.xlabel("Downtime (hrs)")
plt.ylabel("Frequency")
plt.show()

# *****************************************************************************************************

#boxplot to visualize outliers in Ambient_Temperature (°C)
sns.boxplot(data['Ambient_Temperature (°C)'])
plt.title("Boxplot of Ambient_Temperature (°C)")
plt.ylabel("Ambient_Temperature (°C)")


# detecting the outliers in Ambient_Temperature (°C) column
q1 = data['Ambient_Temperature (°C)'].quantile(0.25)
q3 = data["Ambient_Temperature (°C)"].quantile(0.75)

Iqr = q3-q1

lowerbound = q1-1.5 * Iqr
upperbound = q3+1.5 * Iqr

print(f"Lower bound: {lowerbound}")
print(f"Upper bound: {upperbound}")

outliers = data[(data['Ambient_Temperature (°C)'] < lowerbound) | (data['Ambient_Temperature (°C)'] > upperbound)]
print(f"Number of Outliers: {len(outliers)}")
print(outliers)


#There are 20 outliers and the data is not normally destributed and positively skeweed
#The outliers are extreamly high so performing median imputation on outliers

#Replaceing outliers with median
median_value = data['Ambient_Temperature (°C)'].median()
data['Ambient_Temperature (°C)'] = data['Ambient_Temperature (°C)'].apply(
    lambda x: median_value if (x < lowerbound or x > upperbound) else x)


#boxplot to visualize outliers after replacing outliers with median
sns.boxplot(data['Ambient_Temperature (°C)'])
plt.title("Boxplot of Ambient_Temperature (°C)")
plt.ylabel("Ambient_Temperature (°C)")

#histogram to see the data distribution after removing outliers
sns.histplot(data['Ambient_Temperature (°C)'], kde=True, color='skyblue', bins=30)
plt.title("Histogram of Ambient_Temperature (°C)")
plt.xlabel("Ambient_Temperature (°C)")
plt.ylabel("Frequency")
plt.show()

# **************************************************************************************************

#boxplot to visualize outliers in Recycled_Content (%)
sns.boxplot(data['Recycled_Content (%)'])
plt.title("Boxplot of Recycled_Content (%)")
plt.ylabel("Recycled_Content (%)")


# detecting the outliers in Recycled_Content (%) column
q1 = data['Recycled_Content (%)'].quantile(0.25)
q3 = data["Recycled_Content (%)"].quantile(0.75)

Iqr = q3-q1

lowerbound = q1-1.5 * Iqr
upperbound = q3+1.5 * Iqr

print(f"Lower bound: {lowerbound}")
print(f"Upper bound: {upperbound}")

outliers = data[(data['Recycled_Content (%)'] < lowerbound) | (data['Recycled_Content (%)'] > upperbound)]
print(f"Number of Outliers: {len(outliers)}")
print(outliers)


#There are 15 outliers and the data is not normally destributed and positively skeweed
#The outliers are extreamly high so performing median imputation on outliers

#Replaceing outliers with median
median_value = data['Recycled_Content (%)'].median()
data['Recycled_Content (%)'] = data['Recycled_Content (%)'].apply(
    lambda x: median_value if (x < lowerbound or x > upperbound) else x)


#boxplot to visualize outliers after replacing outliers with median
sns.boxplot(data['Recycled_Content (%)'])
plt.title("Boxplot of Recycled_Content (%)")
plt.ylabel("Recycled_Content (%)")

#histogram to see the data distribution after removing outliers
sns.histplot(data['Recycled_Content (%)'], kde=True, color='skyblue', bins=30)
plt.title("Histogram of Recycled_Content (%)")
plt.xlabel("Recycled_Content (%)")
plt.ylabel("Frequency")
plt.show()

# ***************************************************************************************************

#boxplot to visualize outliers in Glass_Thickness (mm)
sns.boxplot(data['Glass_Thickness (mm)'])
plt.title("Boxplot of Glass_Thickness (mm)")
plt.ylabel("Glass_Thickness (mm)")


# detecting the outliers in Glass_Thickness (mm) column
q1 = data['Glass_Thickness (mm)'].quantile(0.25)
q3 = data["Glass_Thickness (mm)"].quantile(0.75)

Iqr = q3-q1

lowerbound = q1-1.5 * Iqr
upperbound = q3+1.5 * Iqr

print(f"Lower bound: {lowerbound}")
print(f"Upper bound: {upperbound}")

outliers = data[(data['Glass_Thickness (mm)'] < lowerbound) | (data['Glass_Thickness (mm)'] > upperbound)]
print(f"Number of Outliers: {len(outliers)}")
print(outliers)


#There are 19 outliers and the data is not normally destributed and positively skeweed
#The outliers are extreamly high so performing median imputation on outliers

#Replaceing outliers with median
median_value = data['Glass_Thickness (mm)'].median()
data['Glass_Thickness (mm)'] = data['Glass_Thickness (mm)'].apply(
    lambda x: median_value if (x < lowerbound or x > upperbound) else x)


#boxplot to visualize outliers after replacing outliers with median
sns.boxplot(data['Glass_Thickness (mm)'])
plt.title("Boxplot of Glass_Thickness (mm)")
plt.ylabel("Glass_Thickness (mm)")

#histogram to see the data distribution after removing outliers
sns.histplot(data['Glass_Thickness (mm)'], kde=True, color='skyblue', bins=30)
plt.title("Histogram of Glass_Thickness (mm)")
plt.xlabel("Glass_Thickness (mm)")
plt.ylabel("Frequency")
plt.show()

# **********************************************************************************

#boxplot to visualize outliers in Production_Target (tons)
sns.boxplot(data['Production_Target (tons)'])
plt.title("Boxplot of Production_Target (tons)")
plt.ylabel("Production_Target (tons)")


# detecting the outliers in Production_Target (tons) column
q1 = data['Production_Target (tons)'].quantile(0.25)
q3 = data["Production_Target (tons)"].quantile(0.75)

Iqr = q3-q1

lowerbound = q1-1.5 * Iqr
upperbound = q3+1.5 * Iqr

print(f"Lower bound: {lowerbound}")
print(f"Upper bound: {upperbound}")

outliers = data[(data['Production_Target (tons)'] < lowerbound) | (data['Production_Target (tons)'] > upperbound)]
print(f"Number of Outliers: {len(outliers)}")
print(outliers)


#There are 20 outliers and the data is not normally destributed and positively skeweed
#The outliers are extreamly high so performing median imputation on outliers

#Replaceing outliers with median
median_value = data['Production_Target (tons)'].median()
data['Production_Target (tons)'] = data['Production_Target (tons)'].apply(
    lambda x: median_value if (x < lowerbound or x > upperbound) else x)


#boxplot to visualize outliers after replacing outliers with median
sns.boxplot(data['Production_Target (tons)'])
plt.title("Boxplot of Production_Target (tons)")
plt.ylabel("Production_Target (tons)")

#histogram to see the data distribution after removing outliers
sns.histplot(data['Production_Target (tons)'], kde=True, color='skyblue', bins=30)
plt.title("Histogram of Production_Target (tons)")
plt.xlabel("Production_Target (tons)")
plt.ylabel("Frequency")
plt.show()

# *******************************************************************************************************

#boxplot to visualize outliers in Defects_Percentage (%)
sns.boxplot(data['Defects_Percentage (%)'])
plt.title("Boxplot of Defects_Percentage (%)")
plt.ylabel("Defects_Percentage (%)")


# detecting the outliers in Defects_Percentage (%) column
q1 = data['Defects_Percentage (%)'].quantile(0.25)
q3 = data["Defects_Percentage (%)"].quantile(0.75)

Iqr = q3-q1

lowerbound = q1-1.5 * Iqr
upperbound = q3+1.5 * Iqr

print(f"Lower bound: {lowerbound}")
print(f"Upper bound: {upperbound}")

outliers = data[(data['Defects_Percentage (%)'] < lowerbound) | (data['Defects_Percentage (%)'] > upperbound)]
print(f"Number of Outliers: {len(outliers)}")
print(outliers)


#There are 14 outliers and the data is not normally destributed and positively skeweed
#histogram to see the data distribution 
sns.histplot(data['Defects_Percentage (%)'], kde=True, color='skyblue', bins=30)
plt.title("Histogram of Defects_Percentage (%)")
plt.xlabel("Defects_Percentage (%)")
plt.ylabel("Frequency")
plt.show()

# *****************************************************************************************

#boxplot to visualize outliers in Melting_Time (hrs)
sns.boxplot(data['Melting_Time (hrs)'])
plt.title("Boxplot of Melting_Time (hrs)")
plt.ylabel("Melting_Time (hrs)")


# detecting the outliers in Melting_Time (hrs) column
q1 = data['Melting_Time (hrs)'].quantile(0.25)
q3 = data["Melting_Time (hrs)"].quantile(0.75)

Iqr = q3-q1

lowerbound = q1-1.5 * Iqr
upperbound = q3+1.5 * Iqr

print(f"Lower bound: {lowerbound}")
print(f"Upper bound: {upperbound}")

outliers = data[(data['Melting_Time (hrs)'] < lowerbound) | (data['Melting_Time (hrs)'] > upperbound)]
print(f"Number of Outliers: {len(outliers)}")
print(outliers)


#There are 19 outliers and the data is not normally destributed and positively skeweed
#The outliers are extreamly high so performing median imputation on outliers

#Replaceing outliers with median
median_value = data['Melting_Time (hrs)'].median()
data['Melting_Time (hrs)'] = data['Melting_Time (hrs)'].apply(
    lambda x: median_value if (x < lowerbound or x > upperbound) else x)


#boxplot to visualize outliers after replacing outliers with median
sns.boxplot(data['Melting_Time (hrs)'])
plt.title("Boxplot of Melting_Time (hrs)")
plt.ylabel("Melting_Time (hrs)")

#histogram to see the data distribution after removing outliers
sns.histplot(data['Melting_Time (hrs)'], kde=True, color='skyblue', bins=30)
plt.title("Histogram of Melting_Time (hrs)")
plt.xlabel("Melting_Time (hrs)")
plt.ylabel("Frequency")
plt.show()

# *********************************************************************************************

#boxplot to visualize outliers in Cooling_Energy (kWh)
sns.boxplot(data['Cooling_Energy (kWh)'])
plt.title("Boxplot of Cooling_Energy (kWh)")
plt.ylabel("Cooling_Energy (kWh)")


# detecting the outliers in Cooling_Energy (kWh) column
q1 = data['Cooling_Energy (kWh)'].quantile(0.25)
q3 = data["Cooling_Energy (kWh)"].quantile(0.75)

Iqr = q3-q1

lowerbound = q1-1.5 * Iqr
upperbound = q3+1.5 * Iqr

print(f"Lower bound: {lowerbound}")
print(f"Upper bound: {upperbound}")

outliers = data[(data['Cooling_Energy (kWh)'] < lowerbound) | (data['Cooling_Energy (kWh)'] > upperbound)]
print(f"Number of Outliers: {len(outliers)}")
print(outliers)


#There are 18 outliers and the data is not normally destributed and positively skeweed
#The outliers are extreamly high so performing median imputation on outliers

#Replaceing outliers with median
median_value = data['Cooling_Energy (kWh)'].median()
data['Cooling_Energy (kWh)'] = data['Cooling_Energy (kWh)'].apply(
    lambda x: median_value if (x < lowerbound or x > upperbound) else x)


#boxplot to visualize outliers after replacing outliers with median
sns.boxplot(data['Cooling_Energy (kWh)'])
plt.title("Boxplot of Cooling_Energy (kWh)")
plt.ylabel("Cooling_Energy (kWh)")

#histogram to see the data distribution after removing outliers
sns.histplot(data['Cooling_Energy (kWh)'], kde=True, color='skyblue', bins=30)
plt.title("Histogram of Cooling_Energy (kWh)")
plt.xlabel("Cooling_Energy (kWh)")
plt.ylabel("Frequency")
plt.show()

###################################################################################################################################

# Label Encoding for 'Maintenance_Flag'
label_encoder = LabelEncoder()
data['Maintenance_Flag_Encoded'] = label_encoder.fit_transform(data['Maintenance_Flag'])

# Ordinal Encoding for 'Energy_Rating' (A > B > C)
energy_rating_order = {'A': 1, 'B': 2, 'C': 3}
data['Energy_Rating_Encoded'] = data['Energy_Rating'].map(energy_rating_order)

#Binary encoding for Furnance_ID
encoder = ce.BinaryEncoder(cols=['Furnace_ID'])
data = encoder.fit_transform(data)


# One-Hot Encoding for 'Shift', 'Furnace_Type', 'Batch_Type', 'Fuel_Type'
data = pd.get_dummies(data, columns=['Shift', 'Furnace_Type', 'Batch_Type', 'Fuel_Type'])

# **********************************************************************************************

#Missing values

# imputing the missing values with mean
data.isna().sum()
mean_imputer = SimpleImputer(strategy='mean')
columns_to_impute = ["Production_Output (tons)","Energy_Consumption (kWh)","Furnace_Temperature (°C)","Annealing_Time (hrs)",
                     "Downtime (hrs)","Ambient_Temperature (°C)","Recycled_Content (%)","Glass_Thickness (mm)","Production_Target (tons)",
                     "Defects_Percentage (%)","Melting_Time (hrs)","Cooling_Energy (kWh)"]

data[columns_to_impute] = mean_imputer.fit_transform(data[columns_to_impute])
data.isna().sum()
#no missing values

# ******************************************************************************************************
data.to_csv('cleaned Manufacturing_Energy_Optimization.csv',index = False) 


