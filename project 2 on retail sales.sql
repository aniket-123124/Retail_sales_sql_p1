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

# WRITE A SQL QUERY TO RETERIVE ALL COLUMNS FOR SALES MADE ON '2022-11-05'
SELECT 
    *
FROM
    RETAIL_SALE
WHERE
    SALE_DATE = '2022-11-05';

#WRITE A QUERY WHERE SALES IS IN CLOTHING CATEGORY AND THE QUANTITY IS MORE THAN 10 AND IN MONTH OF NOV 20222
SELECT 
    *
FROM
    RETAIL_SALE
WHERE
    CATEGORY = 'CLOTHING' AND QUANTIY >= 4
        AND MONTH(SALE_DATE) = 11
        AND YEAR(SALE_DATE) = 2022;


#32:00
-- write a sql query to calculate the total sales for each category
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

#write a sql query to find the avg age of each customer who purchased from beauty cat
SELECT 
    ROUND(AVG(age)) AS avg_age
FROM
    retail_sale
WHERE
    category = 'beauty';

#WRITE A QUERY TO FIND ALL THE CUSTOMERS TO FIND ALL TRANSACTIONS WHICH IS GRETAER THAN 1000
SELECT 
    *
FROM
    RETAIL_SALE
WHERE
    TOTAL_SALE > 1000;

-- WRITE A QUERY TO FIND OUT TOTAL NO OF TRANSACTION MADE BY EACH GENDER IN EACH CAT

SELECT 
    COUNT(*) AS TOAL_TRANSACTION, GENDER, CATEGORY
FROM
    RETAIL_SALE
GROUP BY GENDER , CATEGORY;

-- WRITE A QUERY TO FIND OUT AVG SALE FOR EACH MONTH AND BEST SELLING MONTH IN EACH YEAR
SELECT 
    *
FROM
    RETAIL_SALE;
SELECT 
    MONTH(SALE_DATE) AS MONTHLY_AVG_SALE, AVG(TOTAL_SALE)
FROM
    RETAIL_SALE
GROUP BY MONTHLY_AVG_SALE;

-- write a sql query to find top 5 customers based on highest total sales
SELECT 
    customer_id, SUM(total_sale) AS total_sales
FROM
    retail_sale
GROUP BY customer_id
ORDER BY total_sales DESC
LIMIT 5; 

-- write a sql quwry to find the number of unique customer who purchased items from each category
SELECT 
    category,
    COUNT(DISTINCT customer_id) count_of_unique_customer
FROM
    retail_sale
GROUP BY category;

#write a query to find the no. of orders as according to hour time or shift
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
