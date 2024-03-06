-- 4. Follow-up: Which segment had the most increase in unique products in 2021 vs 2020? The final output contains these fields
--     1. segment 
--     2. product_count_2020 
--     3. product_count_2021 
--     4. difference

with cte1 as(select s.product_code, s.fiscal_year,p.segment 
from fact_sales_monthly s 
join dim_product p  on s.product_code=p.product_code
limit 10000000),

cte2 as(select segment,count(distinct(product_code)) as product_count_2020
from cte1 where fiscal_year=2020
group by segment),

cte3 as(select segment,count(distinct(product_code)) as product_count_2021
from cte1 where fiscal_year=2021
group by segment)

select t1.segment ,
		t1.product_count_2020,
        t2.product_count_2021,
        (product_count_2021-product_count_2020) as difference
from cte2 t1 join cte3 t2 on t1.segment=t2.segment;
