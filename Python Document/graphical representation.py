# -*- coding: utf-8 -*-
"""
Created on Wed Dec 11 20:43:21 2024

@author: G Thirumala Vasu
"""
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns

#Univariate Analysis

# The below code represents boxplot for all the columns in dataset

data = pd.read_csv(r"C:\Users\G Thirumala Vasu\Documents\copy cleaned Manufacturing_Energy_Optimization.csv")
data.describe()

column_name = input("Enter column name:")

if column_name in data.columns:
    sns.boxplot(data[column_name])
    plt.title(f"Box plot of {column_name}")
    plt.ylabel('frequency')
    plt.show()
else:
    print("Column not found")
    
#Insights from the boxplot of each column

"""
Production_Output (tons):
Consistent output reflects stable manufacturing operations. Meeting targets efficiently 
suggests effective production planning. No variability ensures customer demands are met reliably.


Energy_Consumption (kWh):
Steady energy consumption indicates optimized operations. No waste implies efficient
 energy management. This helps reduce production costs and environmental impact.


Furnace_Temperature (°C):
Uniform temperature ensures consistent product quality. Proper control avoids material 
defects and inefficiencies. It highlights robust thermal management in production.


Annealing_Time (hrs):
Consistent annealing times ensure durability and quality. It reflects standardized 
processes across production batches. This minimizes the risk of variability in product properties.


Downtime (hrs):
Low downtime showcases well-maintained equipment. Reliable machines ensure uninterrupted
 operations. This reduces repair costs and increases profitability.


Ambient_Temperature (°C):
Stable ambient conditions maintain production efficiency. It minimizes the risk of 
temperature-induced defects. Controlled environments lead to better product quality.


Recycled_Content (%):
Consistent usage of recycled content supports sustainability goals. It ensures no 
compromise in material quality. This enhances the company’s eco-friendly reputation.


Glass_Thickness (mm):
Stable thickness ensures consistent product specifications. It improves customer 
satisfaction with reliable quality. Precision manufacturing reduces material waste.


Production_Target (tons):
Consistently meeting targets reflects efficient resource use. It highlights good 
capacity planning and process control. This ensures profitability and on-time delivery.


Defects_Percentage (%):
High defect rates indicate inefficiencies in the quality control process. 
This leads to increased waste and customer dissatisfaction. Addressing this issue 
is critical to improving product quality and maintaining the company’s reputation.


Melting_Time (hrs):
Stable melting times indicate well-calibrated heating processes. It reduces energy costs 
and ensures quality. Consistent times prevent unnecessary delays.

Cooling_Energy (kWh):
Optimized cooling energy ensures minimal waste. It highlights energy-efficient cooling 
processes. This reduces costs and supports sustainable practices."""


# Histogram plot for all the columns

column_name = input("Enter column name:")

if column_name in data.columns:
    sns.histplot(data[column_name], kde= True ,bins = 15,color="ORANGE")
    plt.title(f"Histogram of {column_name}")
    plt.ylabel('frequency')
    plt.show()
else:
    print("Column not found")

# Insights
""" 
Production_Output (tons):
A symmetrical distribution indicates consistent production with minimal variability. 
This suggests efficient production processes and stable resource utilization.

Energy_Consumption (kWh):
 energy consumption reflects a well-controlled process with predictable
 energy usage. This supports cost-efficient operations and energy management.

Furnace_Temperature (°C):
A  furnace temperature distribution ensures uniform product quality. 
This indicates a robust process with minimal temperature fluctuations.

Annealing_Time (hrs):
Consistency in annealing times reduces variability in product strength and durability.
 This highlights effective thermal control during the manufacturing process.

Downtime (hrs):
Symmetrical downtime distribution indicates well-planned maintenance schedules and
 minimal unexpected machine failures. This ensures uninterrupted production.

Ambient_Temperature (°C):
A distribution of ambient temperature suggests controlled environmental 
conditions, minimizing external effects on production quality.

Recycled_Content (%):
Consistent use of recycled content reflects sustainable manufacturing practices. 
This ensures material quality while meeting environmental standards.


Glass_Thickness (mm):
A  distribution of glass thickness ensures consistent product specifications.
 This reduces defects and enhances customer satisfaction.

Production_Target (tons):
Meeting production targets indicates effective planning and resource 
utilization. This ensures operational efficiency and predictable outputs.

Defects_Percentage (%):
The high defect rate signals that there may be significant issues in the quality control process, leading to increased waste and potential customer dissatisfaction.
Focusing on reducing the defect rate through process optimization, quality checks, and improvements in training and materials can help reduce costs, improve customer satisfaction, and enhance the overall product reputation.

Melting_Time (hrs):
 melting times ensures an optimized heating process. This minimizes energy 
waste and ensures consistent product quality.

Cooling_Energy (kWh):
A symmetrical cooling energy distribution suggests efficient thermal management. 
This reduces energy costs and maintains product integrity."""

# Bar plot for Categorical columns
#Categorical columns are
"""
Shift
Furnace_ID
Furnace_Type
Batch_Type
Energy_Rating
Maintenance_Flag
Fuel_Type
"""

column_name = input("Enter column name:")

if column_name in data.columns:
    sns.barplot(data[column_name],color="ORANGE")
    plt.title(f"Barplot of {column_name}")
    plt.xlabel('Category')
    plt.ylabel('Values')
    plt.show()
else:
    print("Column not found")
    
# insights 
"""
Shift
The business operates primarily during the morning shift, so production efficiency, 
staffing, and energy consumption can be optimized for this time period.

Furnace_ID
 Furnace_6 appears to be the primary equipment in use. Focus can be placed on its 
 maintenance and optimization to ensure better performance and avoid downtime.

Furnace_Type 
Electric furnaces could represent the most energy-efficient or cost-effective 
choice for the company, allowing a focus on optimizing energy use in this type of furnace.

Batch_Type
The business is focused on producing borosilicate products, which may suggest a specialized
process. Efforts can be made to optimize the production of borosilicate batches.

Energy_Rating
Energy Rating "B" suggests good energy efficiency but there may be room for improvement
to move to an "A" rating. Optimizing energy consumption could lead to cost reductions.

Maintenance_Flag
The "Yes" maintenance flag suggests that maintenance is a significant concern. 
Efforts to reduce maintenance needs or improve scheduling could reduce downtime and operational costs.

Fuel_Type
The company relies on natural gas, which may be the most cost-effective or available option.
Monitoring fuel consumption and exploring alternative energy sources could provide cost savings.
"""
# Bivarient analysis
# Scatter plot

column_name1 = "Energy_Consumption (kWh)"
column_name2 = input("Enter column name2:")

if column_name1 in data.columns and column_name2 in data.columns:
    plt.figure(figsize=(10, 6))
    # plt.subplot(2, 2, 1)
    sns.scatterplot(x=column_name1, y=column_name2, data=data)
    plt.title(f'{column_name1} vs {column_name2}')
else:
    print("Column not found")
    
# insights 
"""
No Strong Linear Correlation: The scatter plots likely indicate a weak or 
no linear relationship between "Energy_Consumption" and 
most of the features. This suggests that predicting energy consumption based on these
features alone might be challenging.

Potential for Non-linear Relationships: While linear relationships are absent, 
there could be non-linear patterns or interactions between features that influence 
energy consumption.
"""

# Multivariance analysis
# Pairplot

sns.pairplot(data[['Energy_Consumption (kWh)', 'Furnace_Temperature (°C)', 'Annealing_Time (hrs)', 
                 'Downtime (hrs)', 'Ambient_Temperature (°C)', 'Recycled_Content (%)', 
                 'Glass_Thickness (mm)', 'Production_Target (tons)']])
plt.suptitle('Pair Plot for Energy Consumption Analysis', y=1.02)
plt.show()

# Insights
"""
Complex Relationships: The pair plot reveals that energy consumption is likely influenced
by a complex interplay of factors, with non-linear relationships and potential interactions
between features.

No Single Dominant Factor: No single feature appears to have a strong linear correlation
with energy consumption. This suggests that a comprehensive understanding of energy usage
requires considering multiple factors simultaneously.

Potential for Improvement: The presence of outliers and the potential for non-linear 
relationships and interactions indicates that there is room for improvement in energy
efficiency. """


# Heatmap

correlation_matrix = data[['Energy_Consumption (kWh)', 'Furnace_Temperature (°C)', 'Annealing_Time (hrs)', 
                          'Downtime (hrs)', 'Ambient_Temperature (°C)', 'Recycled_Content (%)', 
                          'Glass_Thickness (mm)', 'Production_Target (tons)', 'Production_Output (tons)', 
                          'Defects_Percentage (%)', 'Melting_Time (hrs)', 'Cooling_Energy (kWh)']].corr()

# Generate the heatmap
plt.figure(figsize=(12, 8))
sns.heatmap(correlation_matrix, annot=True, cmap='coolwarm', fmt='.2f', linewidths=0.5)
plt.title('Heatmap of Correlations between Variables')
plt.show()

# Insights

"""
Weak Correlations: Most of the correlation values are close to zero, indicating 
weak or no linear relationships between the variables.

Production Output vs. Downtime: A moderate negative correlation (-0.07) suggests that
increased production output tends to be associated with a decrease in downtime. 
This makes sense, as higher production generally requires more continuous operation.

Production Target vs. Production Output: A moderate positive correlation (0.00) indicates
that higher production targets are generally associated with higher production output,
which is expected.

Melting Time vs. Annealing Time: A moderate positive correlation (0.05) suggests that
longer melting times tend to be associated with longer annealing times. This could be
due to the sequential nature of these processes.
 
Ambient Temperature vs. Melting Time: A moderate positive correlation (0.01) suggests
that higher ambient temperatures might be associated with slightly longer melting times. 
This could be due to the need for additional energy to maintain the desired temperature within the furnace.

Business Insights:

Limited Direct Impact on Energy Consumption: The relatively low correlations between 
energy consumption and most other variables suggest that energy consumption is not
 strongly influenced by any single factor. This implies that a comprehensive approach
 is needed to understand and optimize energy usage"""
 
 
 # Time plot
 

column_name = input("Enter the column name to plot against Date: ")

if column_name in data.columns and "Date" in data.columns:
    plt.figure(figsize=(10, 6))
    
   
    plt.plot(data["Date"], data[column_name], label=column_name, color='blue')
    plt.title(f'Time Plot of {column_name} over Time')
    plt.xlabel('Date')
    plt.ylabel(column_name)
    
    # Rotate x-axis labels for better readability
    plt.xticks(rotation=45)
    plt.legend()
    
    plt.tight_layout()
    plt.show()
    
else:
    print("Column not found or 'Date' column is missing")
    

"""
Energy consumption:
The plot shows significant variability in energy consumption over time. 
There are periods with high consumption and periods with low consumption. 
This suggests that there are factors influencing energy usage that change over time.

Melting time exhibits significant variability over time. There are periods with 
longer melting times and periods with shorter melting times.

Production targets fluctuate significantly over time.
There might be seasonal patterns in production targets.

Almost all the columns are fluctuating significantly over time
"""
