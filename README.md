# road-accident-analysis
Road accident data analysis using Python, MySQL, and Power BI to identify casualty trends, risk factors, and actionable safety insights.

## Overview
This project analyzes road accident data to identify patterns, trends, and risk factors. The goal is to convert raw data into meaningful insights that can support road safety decisions.

## Problem Statement
Large datasets containing accident records are difficult to analyze directly. This project aims to process and analyze such data efficiently using database and visualization tools to extract useful insights.

## Dataset
Due to large file size, the dataset is hosted externally.

Dataset Link:  
https://shorturl.at/meIy2

The dataset includes:
- Date of accident  
- Casualties (fatal, serious, slight)  
- Vehicle type  
- Road type  
- Light conditions  
- Location  

## Tools and Technologies
- Python (Jupyter Notebook)
- MySQL
- Microsoft Power BI

## Workflow
1. Loaded large CSV dataset using Python in Jupyter Notebook  
2. Imported data into MySQL database for structured analysis  
3. Performed data cleaning (handling null values, duplicates, date formatting)  
4. Used SQL queries for aggregation and KPI calculation  
5. Built interactive dashboard in Power BI  

## Data Cleaning
- Removed duplicate records  
- Handled missing values  
- Standardized column names  
- Converted date fields into proper format  
- Validated data consistency  

## Key Performance Indicators (KPIs)
- Total accidents  
- Total casualties  
- Fatal, serious, and slight casualties  
- Monthly accident trends  
- Vehicle type contribution  
- Road condition analysis  

## Dashboard Features
- KPI cards for summary metrics  
- Bar charts for category comparison  
- Line charts for trend analysis  
- Filters and slicers for interactive exploration  

## Key Insights
- Accident frequency varies across different time periods  
- Certain vehicle types contribute more to accidents  
- Road and visibility conditions impact accident occurrence  

## Recommendations
- Improve monitoring in high-risk areas and time periods  
- Increase awareness of road safety measures  
- Focus on accident-prone conditions and locations  

## Limitations
- Dataset is static and not real-time  
- External factors such as weather or traffic density are not included  
- Analysis is limited to available data  

## Future Improvements
- Add real-time data integration  
- Include weather and traffic data  
- Apply predictive analysis for accident forecasting  

## Project Structure
- /notebook → Jupyter Notebook (Python code)
- /sql → SQL queries
- /dashboard → Power BI file
- README.md

## Author
Ankit Singh
