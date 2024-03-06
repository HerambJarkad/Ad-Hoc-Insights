-- 2. What is the percentage of unique product increase in 2021 vs. 2020? The final output contains these fields, 
-- unique_products_2020 
-- unique_products_2021 
-- percentage_change

WITH FY20 AS (
    SELECT COUNT(DISTINCT product_code) AS t1 
    FROM fact_sales_monthly 
    WHERE fiscal_year = 2020
),
FY21 AS (
    SELECT COUNT(DISTINCT product_code) AS t2 
    FROM fact_sales_monthly 
    WHERE fiscal_year = 2021
)
SELECT FY20.t1 as unique_products_2020,
 FY21.t2 as  unique_products_2021, 
 ROUND((t2-t1) * 100.0 /t1, 2) AS percentage_change
FROM FY20, FY21;
