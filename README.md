# Understanding the Performance of Our Recent Marketing Initiatives: Insights and Recommendation

# INTRODUCTION
 Our recent marketing campaigns have not been as effective as they were expected to be; As a marketing analyst, I have been tasked by the Chief Marketing Officer to
 analyse the marketing dataset provided to understand this problem and propose data-driven solutions. 

This project aims to evaluate the effectiveness of recent marketing campaigns by analyzing marketing data. Optimizing future marketing strategies and driving business growth require an understanding of the performance of these campaigns.
In this analysis, various aspects of marketing data are examined, including segmentation of customers, campaign performance, channel effectiveness, and demographic trends.

By examining these key areas, I aim to uncover actionable insights that will inform data-driven decision-making and guide strategic marketing initiatives. 

## OBJECTIVES

Using a combination of descriptive statistics, data visualization, and advanced analytics techniques, this analysis seeks to answer critical questions such as:

- *Which marketing campaigns have been the most successful, and what factors contribute to their effectiveness?*

- *How do different customer segments respond to marketing campaigns, and what strategies can be tailored to meet their specific needs?*

- *Which sales channels perform best in terms of customer acquisition and conversion rates, and how can these channels be optimized for greater efficiency?*

- *What demographic trends and preferences can be identified among our customer base, and how can this information be leveraged to enhance targeting and personalization efforts?*

By addressing these questions and providing actionable recommendations, this analysis aims to empower the marketing team with valuable insights to drive marketing strategy optimization, improve campaign performance, and thereby achieve business objectives.

## THE DATA

The marketing dataset is a CSV file downloaded from Kaggle. It contains 39 columns and 2205 rows. Below is an image of the columns and their descriptions. 

![dictionary](https://github.com/dannieRope/Marketing-Sales-Analysis-SQL-and-Power-BI-project/assets/132214828/664053fd-1563-405d-bf5c-643d0f4c7609)

## TOOLS
I use Microsoft SQL Server Management Studio as my primary data tool for the processes of data cleaning, analysis, and visualization in PowerBI.

# EDA (Explanatory Data Analyis)

## Checking values in column for accuracy and consistency

After importing the dataset into Microsoft SQL Server Management Studio, the next step is confirming the integrity of the imported data. It is necessary to verify if there are the same number of columns and rows as before the import. Also, inspect whether the columns have the right data types.

**Observe the data by retrieving first 10 records of the dataset**
```sql
        
SELECT TOP 10 *
FROM ifood_df;

```

![TOP 10](https://github.com/dannieRope/Marketing-Sales-Analysis-SQL-and-Power-BI-project/assets/132214828/58d42594-7d75-4adb-b472-1df40fda6fcf)


**Check Column names and Datatypes**

```sql
SELECT COLUMN_NAME,DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'Superstoresales';

```
![Screenshot 2024-04-15 111104](https://github.com/dannieRope/Marketing-Sales-Analysis-SQL-and-Power-BI-project/assets/132214828/32261401-1949-4518-99c0-f2af231e656e)


This revealed that all columns are up to 39 and have the right data types as one before import. 

**Check the number or rows imported**

 ```sql
SELECT COUNT(*) AS row_count
FROM ifood_df;
```

![Screenshot 2024-04-15 111700](https://github.com/dannieRope/Marketing-Sales-Analysis-SQL-and-Power-BI-project/assets/132214828/13a146f3-80a6-4906-94c9-3d5c8e5d6d24)


Returns 2205 rows, which is the same as before import. 

## Analysis


