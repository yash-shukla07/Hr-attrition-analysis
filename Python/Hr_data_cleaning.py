
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
from sqlalchemy import create_engine
 
# DATA LOADING
Data=pd.read_csv(r"C:\Users\shukl_wmeshqg\OneDrive\Desktop\HR_DATA.csv")
print(Data)
 
# DATA INSPECTION
print("SHAPE OF DATA:")
print(Data.shape)
 
print("\nDATA DESCRIBE:")
print(Data.describe())
 
print("\nDATA INFO:")
print(Data.info())
 
print("\nNULL VALUE COUNT:")
print(Data.isnull().sum())
 
print("\nDATATYPES:")
print(Data.dtypes)
 
print("\nFIRST 5 ROWS:")
print(Data.head())
 
print("\nLAST 5 ROWS:")
print(Data.tail())
 
print("\nUNIQUE VALUES IN EACH COLUMN:")
print(Data.nunique())
 
# COLUMN CORRECTION
Data.columns=(Data.columns.str.lower().str.strip().str.replace(" ","_"))
print("\nCLEANED COLUMN NAMES:")
print(Data.columns)
 
# DUPLICATES
print("\nDUPLICATE COUNT:")
print(Data.duplicated().sum())
 
# DROPING USELESS COLUMNS
Data=Data.drop(columns=["standardhours","employeecount","over18"])
print("\nCOLUMNS AFTER DROPPING USELESS ONES:")
print(Data.columns)
 
# CHECKING UNIQUE VALUES IN CATEGORICAL COLUMNS
print("\nUNIQUE VALUES IN ATTRITION:")
print(Data["attrition"].unique())
 
print("\nUNIQUE VALUES IN DEPARTMENT:")
print(Data["department"].unique())
 
print("\nUNIQUE VALUES IN JOBROLE:")
print(Data["jobrole"].unique())
 
print("\nUNIQUE VALUES IN OVERTIME:")
print(Data["overtime"].unique())
 
print("\nUNIQUE VALUES IN MARITALSTATUS:")
print(Data["maritalstatus"].unique())
 
print("\nUNIQUE VALUES IN BUSINESSTRAVEL:")
print(Data["businesstravel"].unique())
 
# VALUE COUNTS OF IMPORTANT COLUMNS
print("\nDEPARTMENT VALUE COUNTS:")
print(Data["department"].value_counts())
 
print("\nJOBROLE VALUE COUNTS:")
print(Data["jobrole"].value_counts())
 
print("\nGENDER VALUE COUNTS:")
print(Data["gender"].value_counts())
 
print("\nMARITAL STATUS VALUE COUNTS:")
print(Data["maritalstatus"].value_counts())
 
print("\nOVERTIME VALUE COUNTS:")
print(Data["overtime"].value_counts())
 
# CHECKING MIN MAX OF NUMERIC COLUMNS
print("\nAGE MIN:", Data["age"].min(), "| MAX:", Data["age"].max())
print("MONTHLYINCOME MIN:", Data["monthlyincome"].min(), "| MAX:", Data["monthlyincome"].max())
print("YEARSATCOMPANY MIN:", Data["yearsatcompany"].min(), "| MAX:", Data["yearsatcompany"].max())
print("JOBSATISFACTION MIN:", Data["jobsatisfaction"].min(), "| MAX:", Data["jobsatisfaction"].max())
print("WORLIFEBALANCE MIN:", Data["worklifebalance"].min(), "| MAX:", Data["worklifebalance"].max())
 
# NEW COLUMN CREATION
Data["age_group"] = pd.cut(
    Data["age"],
    bins=[0, 30, 40, 100],
    labels=["Young Employees", "Mid-Age Employees", "Senior Employees"]
)
print("\nAGE GROUP VALUE COUNTS:")
print(Data["age_group"].value_counts())
 
# ATTRITION PERCENTAGE
print("\nATTRITION VALUE COUNTS:")
print(Data['attrition'].value_counts())
total=Data["attrition"].count()
stayed=1233
left=237
 
stayed_percentage=round(stayed/total*100,2)
left_percentage=round(left/total*100,2)
 
print('STAYED PERCENTAGE:',stayed_percentage)
print('LEFT PERCENTAGE:',left_percentage)
 
# BASIC VISUALIZATIONS
 
# PLOT 1: Attrition Count
Data["attrition"].value_counts().plot(kind="bar",color=["green","red"])
plt.title("Attrition Count")
plt.xlabel("Attrition")
plt.ylabel("Count")
plt.xticks(rotation=0)
plt.tight_layout()
plt.show()
 
# PLOT 2: Age Distribution
Data["age"].plot(kind="hist",bins=20,color="steelblue",edgecolor="black")
plt.title("Age Distribution of Employees")
plt.xlabel("Age")
plt.ylabel("Count")
plt.tight_layout()
plt.show()
 
# PLOT 3: Department Count
Data["department"].value_counts().plot(kind="bar",color=["steelblue","orange","green"])
plt.title("Employee Count by Department")
plt.xlabel("Department")
plt.ylabel("Count")
plt.xticks(rotation=0)
plt.tight_layout()
plt.show()
 
# PLOT 4: Monthly Income Distribution
Data["monthlyincome"].plot(kind="hist",bins=25,color="orange",edgecolor="black")
plt.title("Monthly Income Distribution")
plt.xlabel("Monthly Income")
plt.ylabel("Count")
plt.tight_layout()
plt.show()
 
# PLOT 5: Gender Count
Data["gender"].value_counts().plot(kind="bar",color=["steelblue","pink"])
plt.title("Employee Count by Gender")
plt.xlabel("Gender")
plt.ylabel("Count")
plt.xticks(rotation=0)
plt.tight_layout()
plt.show()
 
# PLOT 6: Age Group Count
Data["age_group"].value_counts().plot(kind="bar",color=["red","orange","green"])
plt.title("Employee Count by Age Group")
plt.xlabel("Age Group")
plt.ylabel("Count")
plt.xticks(rotation=0)
plt.tight_layout()
plt.show()
 
# DATA EXPORT
Data.columns=(Data.columns.str.lower().str.strip().str.replace(" ","_"))
engine=create_engine("mysql+pymysql://root:2006@localhost/hr_db")
Data.to_sql(name="hr_attrition",index=False,con=engine,if_exists="replace")
 
print("cleaned HR attrition data is successfully exported to mysql")
 