-- 3. Provide a report with all the unique product counts for each segment and sort them in descending order of product counts. The final output contains 2 fields, 
--     1. segment 
--     2. product_count

-- Way 1 
select 
distinct(segment),
count(product) over(partition by segment) as product_count 
from dim_product
order by product_count desc;

-- ================================================================================

-- way 2
SELECT segment, COUNT(DISTINCT(product_code)) AS product_count FROM dim_product
GROUP BY segment
ORDER BY product_count DESC ;
