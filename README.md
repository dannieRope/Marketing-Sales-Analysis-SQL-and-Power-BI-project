# Understanding the Performance of Our Recent Marketing Initiatives: Insights and Recommendation

# INTRODUCTION
 Our recent marketing campaigns have not been as effective as they were expected to be; As a marketing analyst, I have been tasked by the Chief Marketing Officer to
 analyse the marketing dataset provided to understand this problem and propose data-driven solutions. 

This project aims to evaluate the effectiveness of recent marketing campaigns by analyzing the [marketing data](https://www.kaggle.com/datasets/jackdaoud/marketing-data). Optimizing future marketing strategies and driving business growth require an understanding of the performance of these campaigns.
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

The [marketing dataset](https://www.kaggle.com/datasets/jackdaoud/marketing-data) is a CSV file downloaded from Kaggle. It contains 39 columns and 2205 rows. Below is an image of the columns and their descriptions. 

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

**1. What is the total amount of revenue generated?.**
 ```sql
SELECT SUM(MntWines) + SUM(MntFruits) + SUM(MntMeatProducts) + SUM(MntFishProducts) + SUM(MntSweetProducts) + SUM(MntGoldProds) AS total_revenue
FROM ifood_df;
```
![Screenshot 2024-04-15 214858](https://github.com/dannieRope/Marketing-Sales-Analysis-SQL-and-Power-BI-project/assets/132214828/efc47f25-8bb5-4a20-a3ee-479c3c94b649)


**2. What is the total number of purchases?** 

```SQL
SELECT SUM(NumDealsPurchases) + SUM(NumWebPurchases) + SUM(NumCatalogPurchases) + SUM(NumStorePurchases) AS total_purchases
FROM ifood_df;

```
![Screenshot 2024-04-15 215308](https://github.com/dannieRope/Marketing-Sales-Analysis-SQL-and-Power-BI-project/assets/132214828/a8765009-82b4-4899-a518-a897dfdbb91b)


**3. what is the total number of customers acquired?**

```SQL
SELECT COUNT(*) AS customers
FROM ifood_df;

```

![Screenshot 2024-04-15 215519](https://github.com/dannieRope/Marketing-Sales-Analysis-SQL-and-Power-BI-project/assets/132214828/434de35c-e0f6-438a-83b7-b7d559a692fb)


**4. Which compaign is the most successful?***

```sql
SELECT 
		SUM(acceptedCmp1) AS Campaign1,
		SUM(acceptedCmp2) AS Campaign2,
		SUM(acceptedCmp3) AS Campaign3,
		SUM(acceptedCmp4) AS Campaign4,
		SUM(acceptedCmp5) AS Campaign5,
		SUM(Response) AS LatestCampaign
FROM ifood_df;

```

![Screenshot 2024-04-15 215850](https://github.com/dannieRope/Marketing-Sales-Analysis-SQL-and-Power-BI-project/assets/132214828/13a794f4-22d7-45ec-ab0e-c5bd0dd46fac)


![Screenshot 2024-04-16 093929](https://github.com/dannieRope/Marketing-Sales-Analysis-SQL-and-Power-BI-project/assets/132214828/424c8af5-0439-413b-91f7-c6cd65509981)

*Latest Campaign is the most successfull with a total of 333 campaign acceptances followed by campaign 4. campaign 2 and 1 are the least successfull*


**5. What are the top selling products?**

```sql
SELECT SUM(MntWines) AS wines,
       SUM(MntFruits) AS Fruits,
	   SUM(MntFishProducts) AS Fish,
	   SUM(MntMeatProducts) AS Meat,
	   SUM(MntSweetProducts) AS Sweet,
	   SUM(MntGoldProds) AS Gold
FROM ifood_df;

```

![Screenshot 2024-04-15 220239](https://github.com/dannieRope/Marketing-Sales-Analysis-SQL-and-Power-BI-project/assets/132214828/a84de259-1a0f-480c-b471-10dc6f435a1d)


![Screenshot 2024-04-16 102829](https://github.com/dannieRope/Marketing-Sales-Analysis-SQL-and-Power-BI-project/assets/132214828/99625f0b-e94b-4fcf-b69d-bc3786db4fec)

*Wines and Meat products came out as the top performers in sales, generating $675,093 and $364,513, respectively. Fruits and Sweet generated the least sales.*



**5. which channel is the most prefered by customers?**

```sql
SELECT 
           SUM(NumWebPurchases) AS Web,
	   SUM(NumCatalogPurchases) AS Catalog,
	   SUM(NumStorePurchases) AS Store
FROM ifood_df;

```

![Screenshot 2024-04-16 160855](https://github.com/dannieRope/Marketing-Sales-Analysis-SQL-and-Power-BI-project/assets/132214828/a7ab40d5-f9db-4f87-9509-634094ff060c)



![Screenshot 2024-04-16 101547](https://github.com/dannieRope/Marketing-Sales-Analysis-SQL-and-Power-BI-project/assets/132214828/ae4c8eb7-bdff-4e11-8cf6-54c5b73e0076)

*12,841 purchases were made through Store making it the best performing channel followed by Web with 9,042 purchases. Catalog is the least performing sales channel with 5,833 purchases* 


**6. Total acceptance by level of education** 

```sql
SELECT SUM(education_Basic + education_2n_Cycle ) AS Under_graduate,
	   SUM(education_Graduation) AS Graduate,
	   SUM(education_Master + education_PhD ) AS Post_graduate	   
FROM ifood_df;

```
![Screenshot 2024-04-15 220930](https://github.com/dannieRope/Marketing-Sales-Analysis-SQL-and-Power-BI-project/assets/132214828/fe80447d-08bf-4029-96e9-cfd549313d95)


![Screenshot 2024-04-16 120006](https://github.com/dannieRope/Marketing-Sales-Analysis-SQL-and-Power-BI-project/assets/132214828/63c388de-0057-46e4-b2c8-0390a679b632)

*Graduate has higher proportion of campaign acceptance (50%) followed by Post Graduate  (38%)and then Under Graduate(11%).* 


**7. Campaign acceptance by age group**

```sql

SELECT 
	 CASE
        WHEN Age >= 18 AND Age <= 35 THEN 'Young Adulthood'
        WHEN Age >= 36 AND Age < 60 THEN 'Middle Adulthood'
        WHEN Age >= 60 THEN 'Old Age'
        ELSE 'Unknown'
    END AS Age_Group,
	SUM(AcceptedCmpOverall) AS Campaign_acceptance
FROM ifood_df
GROUP BY ( CASE
        WHEN Age >= 18 AND Age <= 35 THEN 'Young Adulthood'
        WHEN Age >= 36 AND Age < 60 THEN 'Middle Adulthood'
        WHEN Age >= 60 THEN 'Old Age'
        ELSE 'Unknown'
    END )
ORDER BY Campaign_acceptance DESC;

```
![Screenshot 2024-04-15 221132](https://github.com/dannieRope/Marketing-Sales-Analysis-SQL-and-Power-BI-project/assets/132214828/d01e42ee-d8c7-483a-9b7b-eaa119cd482a)


![Screenshot 2024-04-16 120241](https://github.com/dannieRope/Marketing-Sales-Analysis-SQL-and-Power-BI-project/assets/132214828/a456e43a-6d73-4fe8-8372-65bde1b188c4)

*Acceptance rates were highest among the Middle Adult and Old Age groups, at 57% and 30%, respectively, while the Young Adult group had the lowest acceptance rate at 12%*


**8. Campaign acceptance by Marital Status**

```sql
SELECT SUM(marital_Married) AS Married,
       SUM(marital_Together) AS Together,
       SUM(marital_Single) AS Single,
       SUM(marital_Divorced) AS Divorced,
       SUM(marital_Widow) AS Widow
FROM ifood_df;
```

![Screenshot 2024-04-16 160924](https://github.com/dannieRope/Marketing-Sales-Analysis-SQL-and-Power-BI-project/assets/132214828/28be720d-779e-4ff3-9448-14305f97d57a)


![Screenshot 2024-04-16 120654](https://github.com/dannieRope/Marketing-Sales-Analysis-SQL-and-Power-BI-project/assets/132214828/f4cec9dd-5981-4138-bb4b-36bd76ef6c53)



*Most of the customers who are married(854), accepted the campaigns followed by people who are not married but are together(568).  Widow is the group with the least acceptance.* 

**9. Campaign acceptance by Income_Group**

```sql
SELECT
    CASE
        WHEN Income <= 20000 THEN 'Low Income'
        WHEN Income > 20000 AND Income <= 80000 THEN 'Middle Income'
        WHEN Income > 80000 THEN 'High Income'
        ELSE 'Unknown'
    END AS Income_Group,
    SUM(AcceptedCmpOverall) AS Campaign_acceptance
FROM
    ifood_df
GROUP BY
    CASE
        WHEN Income <= 20000 THEN 'Low Income'
        WHEN Income > 20000 AND Income <= 80000 THEN 'Middle Income'
        WHEN Income > 80000 THEN 'High Income'
        ELSE 'Unknown'
    END
ORDER BY
   Campaign_acceptance DESC;
```

![Screenshot 2024-04-15 221603](https://github.com/dannieRope/Marketing-Sales-Analysis-SQL-and-Power-BI-project/assets/132214828/e967dee3-7753-4b16-b0fa-a09869ec6aaf)


![Screenshot 2024-04-16 120241](https://github.com/dannieRope/Marketing-Sales-Analysis-SQL-and-Power-BI-project/assets/132214828/1b05366e-280f-44cb-808f-9c7ff0a201fe)


*The Middle Income and High Income segments had the highest acceptance rates, with 59% and 39% respectively. Low Income group has the lowest.*


# INSIGHTS AND RECOMMENDATIONS

## INSIGHTS 

- In the span of two years, our organization has carried out 6 marketing initiatives, leading to the acquisition of 2,205 customers. These customers contributed $1,240,896 in sales revenue with a total of 32,828 purchases.

- Latest Campaign is the most successful campaign with 333 acceptances. The least successful campaign is Campaign 2 with only 30 acceptances.

- 12,841 purchases were made through Store making it the best performing channel followed by Web with 9,042 purchases. Catalog is the least performing sales channel with 5,833 purchases.

- Wines and Meat products came out as the top performers in sales, generating $675,093 and $364,513, respectively. Fruits and Sweet generated the least sales.

- Most of the customers who are married(854), accepted the campaigns followed by people who are not married but are together(568).  Widow is the group with the least acceptance.

- Acceptance rates were highest among the Middle Adult and Old Age groups, at 57% and 30%, respectively, while the Young Adult group had the lowest acceptance rate at 12%.

- The Middle Income and High Income segments had the highest acceptance rates, with 59% and 39% respectively. Low Income group has the lowest.

- Graduate has higher proportion of campaign acceptance (50%) followed by Post Graduate  (38%)and then Under Graduate(11%).


## RECOMMENDATIONS

- The latest campaign's success indicates that its methods and strategies are well-received by consumers. Examine the factors that made it successful and implement those same components in subsequent campaigns.

- Invest more in marketing on high-converting platforms like the Store and Web. Our reach, engagement, and conversion rates can all be increased by utilizing these preferred channels. Examine the Catalog channel to find possible areas for enhancement and optimization.

- Promote Wines and Meat products. Run a special marketing campaign to increase sales for these products. Also consider offering deals for low performing products such as fruits and sweets to enhance sales.

- Craft focused marketing strategies, promotions, or initiatives tailored to middle and high-income earners, individuals with high educational qualifications, as well as those who are married or cohabiting to yield better result.


# THE REPORT 
This report provides detailed analysis, findings, and insights based on the market data. It includes, visualizations, insights and recommendations. 

Find the report below. 

![Marketing data_page-0001](https://github.com/dannieRope/Marketing-Sales-Analysis-SQL-and-Power-BI-project/assets/132214828/3ce0de7a-b809-4df8-9d38-2d220aeeaef5)


Find the SQL script for the EDA [here](https://github.com/dannieRope/Marketing-Sales-Analysis-SQL-and-Power-BI-project/commit/e5173be249614dbec94f828862c75f7d6fe07bdf)


I hope you found this post useful and gained new insights. Please feel free to leave a comment if you have any questions or feedback. Thank you for your time and attention - here's to continuous learning!











