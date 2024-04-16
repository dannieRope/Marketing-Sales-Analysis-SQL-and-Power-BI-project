
--Retreive first 10 records of the dataset
SELECT TOP 10 *
FROM ifood_df;


--Check the columns and their datatypes 
SELECT COLUMN_NAME, DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'ifood_df';

--check the total number of rows 
SELECT COUNT(*) AS row_count
FROM ifood_df;

--What is the total amount of revenue generated?
SELECT SUM(MntWines) + SUM(MntFruits) + SUM(MntMeatProducts) + SUM(MntFishProducts) + SUM(MntSweetProducts) + SUM(MntGoldProds) AS total_revenue
FROM ifood_df;

--What is the total number of purchases?
SELECT SUM(NumDealsPurchases) + SUM(NumWebPurchases) + SUM(NumCatalogPurchases) + SUM(NumStorePurchases) AS total_purchases
FROM ifood_df;

--total number of customers acquired
SELECT COUNT(*) AS customers
FROM ifood_df;


-- Which compaign is the most successful?
SELECT 
		SUM(acceptedCmp1) AS Campaign1,
		SUM(acceptedCmp2) AS Campaign2,
		SUM(acceptedCmp3) AS Campaign3,
		SUM(acceptedCmp4) AS Campaign4,
		SUM(acceptedCmp5) AS Campaign5,
		SUM(Response) AS LastestCampaign
FROM ifood_df;

-- Customers profile 
SELECT 
	   AVG(Recency) AS avg_recency,
	   MIN(Age) AS min_age,
	   MAX(Age) AS Max_age,
	   AVG(Age) AS avg_age,
	   ROUND(AVG(income),2) AS avg_income,
	   MAX(income) AS max_income,
	   MIN(income) AS min_income,
	   AVG(Recency) AS avg_recency
FROM ifood_df;

--Top selling products
SELECT SUM(MntWines) AS wines,
       SUM(MntFruits) AS Fruits,
	   SUM(MntFishProducts) AS Fish,
	   SUM(MntMeatProducts) AS Meat,
	   SUM(MntSweetProducts) AS Sweet,
	   SUM(MntGoldProds) AS Gold
FROM ifood_df;

--best  Performing Channels
SELECT SUM(NumDealsPurchases) AS Deal,
       SUM(NumWebPurchases) AS Web,
	   SUM(NumCatalogPurchases) AS Catalog,
	   SUM(NumStorePurchases) AS Store
FROM ifood_df;

--total acceptance by level of education 
SELECT SUM(education_Basic + education_2n_Cycle ) AS Under_graduate,
	   SUM(education_Graduation) AS Graduate,
	   SUM(education_Master + education_PhD ) AS Post_graduate	   
FROM ifood_df;


--Campaign acceptance by age group
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

--Campaign acceptance by Marital Status
SELECT SUM(marital_Married) AS Married,
       SUM(marital_Together) AS Together,
	   SUM(marital_Divorced) AS Divorced,
	   SUM(marital_Widow) AS Widow
FROM ifood_df;

--Campaign acceptance by Income_Group
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








