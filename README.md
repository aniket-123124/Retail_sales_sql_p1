# Retail Sales Analysis SQL Project

## Project Overview

**Project Title**: Retail Sales Analysis  
**Level**: Beginner  
**Database**: `p1_retail_db`

This project is designed to demonstrate SQL skills and techniques typically used by data analysts to explore, clean, and analyze retail sales data. The project involves setting up a retail sales database, performing exploratory data analysis (EDA), and answering specific business questions through SQL queries. This project is ideal for those who are starting their journey in data analysis and want to build a solid foundation in SQL.

## Objectives

1. **Set up a retail sales database**: Create and populate a retail sales database with the provided sales data.
2. **Data Cleaning**: Identify and remove any records with missing or null values.
3. **Exploratory Data Analysis (EDA)**: Perform basic exploratory data analysis to understand the dataset.
4. **Business Analysis**: Use SQL to answer specific business questions and derive insights from the sales data.

## Project Structure

### 1. Database Setup

- **Database Creation**: The project starts by creating a database named `p1_retail_db`.
- **Table Creation**: A table named `retail_sales` is created to store the sales data. The table structure includes columns for transaction ID, sale date, sale time, customer ID, gender, age, product category, quantity sold, price per unit, cost of goods sold (COGS), and total sale amount.

```sql
CREATE DATABASE p1_retail_db;

CREATE TABLE retail_sales
(
    transactions_id INT PRIMARY KEY,
    sale_date DATE,	
    sale_time TIME,
    customer_id INT,	
    gender VARCHAR(10),
    age INT,
    category VARCHAR(35),
    quantity INT,
    price_per_unit FLOAT,	
    cogs FLOAT,
    total_sale FLOAT
);
```

### 2. Data Exploration & Cleaning

- **Record Count**: Determine the total number of records in the dataset.
- **Customer Count**: Find out how many unique customers are in the dataset.
- **Category Count**: Identify all unique product categories in the dataset.
- **Null Value Check**: Check for any null values in the dataset and delete records with missing data.

```sql
SELECT COUNT(*) FROM retail_sales;
SELECT COUNT(DISTINCT customer_id) FROM retail_sales;
SELECT DISTINCT category FROM retail_sales;

SELECT * FROM retail_sales
WHERE 
    sale_date IS NULL OR sale_time IS NULL OR customer_id IS NULL OR 
    gender IS NULL OR age IS NULL OR category IS NULL OR 
    quantity IS NULL OR price_per_unit IS NULL OR cogs IS NULL;

DELETE FROM retail_sales
WHERE 
    sale_date IS NULL OR sale_time IS NULL OR customer_id IS NULL OR 
    gender IS NULL OR age IS NULL OR category IS NULL OR 
    quantity IS NULL OR price_per_unit IS NULL OR cogs IS NULL;
```

### 3. Data Analysis & Findings

The following SQL queries were developed to answer specific business questions:

-- sql Retail sales analysis-p2


create database retail_project2;

use retail_project2;

create table retail_sale(
ï»¿transactions_id int primary key,
	sale_date text,
    sale_time text,
customer_id int,
    gender varchar(5),	
    age int,
	category varchar(50),	
    quantiy int,
    price_per_unit  float,
	cogs  float,	
    total_sale int
    );

select * from retail_sale;
# data cleaning
select count(*) from retail_sale;
SELECT 
    *
FROM
    retail_sale
WHERE
    ï»¿transactions_id IS NULL;

SELECT 
    *
FROM
    retail_sale
WHERE
    ï»¿transactions_id IS NULL
        OR sale_date IS NULL
        OR sale_time IS NULL
        OR customer_id IS NULL
        OR gender IS NULL
        OR age IS NULL
        OR category IS NULL
        OR quantiy IS NULL
        OR price_per_unit IS NULL
        OR cogs IS NULL
        OR total_sale IS NULL;

SELECT 
    *
FROM
    retail_sale
WHERE
    quantiy IS NULL;

-- Data Exploration

#how many sales do we have
SELECT 
    COUNT(*) AS total_sales
FROM
    retail_sale;

-- how many  unique customer do we have;
SELECT 
    COUNT(DISTINCT customer_id) AS customer_count
FROM
    retail_sales;

#how many categories do we have?
SELECT 
    COUNT(DISTINCT category) AS category_count
FROM
    retail_sales;

# DATA analyze AND BUSINESS KEY PROBLEMS AND ANSWERSF

1. # WRITE A SQL QUERY TO RETERIVE ALL COLUMNS FOR SALES MADE ON '2022-11-05'
SELECT 
    *
FROM
    RETAIL_SALE
WHERE
    SALE_DATE = '2022-11-05';

2. #WRITE A QUERY WHERE SALES IS IN CLOTHING CATEGORY AND THE QUANTITY IS MORE THAN 10 AND IN MONTH OF NOV 20222
SELECT 
    *
FROM
    RETAIL_SALE
WHERE
    CATEGORY = 'CLOTHING' AND QUANTIY >= 4
        AND MONTH(SALE_DATE) = 11
        AND YEAR(SALE_DATE) = 2022;


#32:00
3. -- write a sql query to calculate the total sales for each category
SELECT 
    *
FROM
    retail_sale;
SELECT 
    category,
    SUM(total_sale) AS total_salesff,
    COUNT(*) AS tota_quantity
FROM
    retail_sale
GROUP BY category;

4. #write a sql query to find the avg age of each customer who purchased from beauty cat
SELECT 
    ROUND(AVG(age)) AS avg_age
FROM
    retail_sale
WHERE
    category = 'beauty';

5. #WRITE A QUERY TO FIND ALL THE CUSTOMERS TO FIND ALL TRANSACTIONS WHICH IS GRETAER THAN 1000
SELECT 
    *
FROM
    RETAIL_SALE
WHERE
    TOTAL_SALE > 1000;

6. -- WRITE A QUERY TO FIND OUT TOTAL NO OF TRANSACTION MADE BY EACH GENDER IN EACH CAT

SELECT 
    COUNT(*) AS TOAL_TRANSACTION, GENDER, CATEGORY
FROM
    RETAIL_SALE
GROUP BY GENDER , CATEGORY;

7. -- WRITE A QUERY TO FIND OUT AVG SALE FOR EACH MONTH AND BEST SELLING MONTH IN EACH YEAR
SELECT 
    *
FROM
    RETAIL_SALE;
SELECT 
    MONTH(SALE_DATE) AS MONTHLY_AVG_SALE, AVG(TOTAL_SALE)
FROM
    RETAIL_SALE
GROUP BY MONTHLY_AVG_SALE;

8. -- write a sql query to find top 5 customers based on highest total sales
SELECT 
    customer_id, SUM(total_sale) AS total_sales
FROM
    retail_sale
GROUP BY customer_id
ORDER BY total_sales DESC
LIMIT 5; 

9. -- write a sql quwry to find the number of unique customer who purchased items from each category
SELECT 
    category,
    COUNT(DISTINCT customer_id) count_of_unique_customer
FROM
    retail_sale
GROUP BY category;

10. #write a query to find the no. of orders as according to hour time or shift
with hourly_sale
 as(
 select *, 
	case 
		when extract(hour from sale_time)<12 then 'morning'
		when extract(hour from sale_time) between 12 and 17 then 'afternoon'
		else 'night'
	end as shift
from retail_sale
)
select 
	count(*) as total_orders,
    shift 
    from hourly_sale
    group by shift
    
    
--     end of project



## Findings

- **Customer Demographics**: The dataset includes customers from various age groups, with sales distributed across different categories such as Clothing and Beauty.
- **High-Value Transactions**: Several transactions had a total sale amount greater than 1000, indicating premium purchases.
- **Sales Trends**: Monthly analysis shows variations in sales, helping identify peak seasons.
- **Customer Insights**: The analysis identifies the top-spending customers and the most popular product categories.

## Reports

- **Sales Summary**: A detailed report summarizing total sales, customer demographics, and category performance.
- **Trend Analysis**: Insights into sales trends across different months and shifts.
- **Customer Insights**: Reports on top customers and unique customer counts per category.

## Conclusion

This project serves as a comprehensive introduction to SQL for data analysts, covering database setup, data cleaning, exploratory data analysis, and business-driven SQL queries. The findings from this project can help drive business decisions by understanding sales patterns, customer behavior, and product performance.

 

Thank you for your support, and I look forward to connecting with you!
