# Data Cleaning Script
# This file contains functions for cleaning and preprocessing HR attrition data

import pandas as pd
import numpy as np
from datetime import datetime

def load_data(filepath):
    """
    Load data from CSV file
    """
    try:
        df = pd.read_csv(filepath)
        print(f"Data loaded successfully. Shape: {df.shape}")
        return df
    except FileNotFoundError:
        print(f"File not found: {filepath}")
        return None

def clean_data(df):
    """
    Perform data cleaning operations
    """
    # Remove duplicate rows
    df = df.drop_duplicates()
    
    # Handle missing values
    df = df.dropna()
    
    # Remove unnecessary whitespace
    df = df.applymap(lambda x: x.strip() if isinstance(x, str) else x)
    
    return df

def handle_outliers(df, columns, threshold=3):
    """
    Handle outliers using Z-score method
    """
    from scipy import stats
    
    for col in columns:
        z_scores = np.abs(stats.zscore(df[col]))
        df = df[z_scores < threshold]
    
    return df

def save_cleaned_data(df, filepath):
    """
    Save cleaned data to CSV file
    """
    df.to_csv(filepath, index=False)
    print(f"Cleaned data saved to: {filepath}")

if __name__ == "__main__":
    # Example usage
    # df = load_data('raw_data.csv')
    # df = clean_data(df)
    # save_cleaned_data(df, 'cleaned_data.csv')
    pass
