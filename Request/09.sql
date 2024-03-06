-- 9. Which channel helped to bring more gross sales in the fiscal year 2021 and the percentage of contribution? The final output contains these fields, 
--     1. channel 
--     2. gross_sales_mln 
--     3. percentage


with cte1 as(
select 
		c.channel,
        Round(sum(s.sold_quantity* g.gross_price)/1000000,2) as gross_sales_mln
from fact_sales_monthly s 
join fact_gross_price g on s.product_code=g.product_code and s.fiscal_year=g.fiscal_year
join dim_customer c on s.customer_code=c.customer_code
where s.fiscal_year=2021
Group by c.channel)

select 
		channel,
        gross_sales_mln,
        concat(round(gross_sales_mln*100/(select sum(gross_sales_mln) from cte1),2),"%") as percentage
from cte1
order by percentage desc    