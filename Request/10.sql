-- 8. Get the Top 3 products in each division that have a high total_sold_quantity in the fiscal_year 2021? The final output contains these fields, 
--     1. division 
--     2. product_code
--     3. product 
--     4. total_sold_quantity 
--     5. rank_order


with cte1 as(select 
		p.division,
        s.product_code,
        p.product,
        sum(sold_quantity) as Total_sold_quantity
from fact_sales_monthly s 
join dim_product p on s.product_code=p.product_code
where s.fiscal_year=2021
group by p.product,s.product_code,p.division
order by Total_sold_quantity desc),
cte2 as (select 
		division,
        product_code,product,
        Total_sold_quantity,
        dense_rank() over(partition by division order by Total_sold_quantity desc) as rank_order
from cte1)
select * from cte2
where rank_order<=3