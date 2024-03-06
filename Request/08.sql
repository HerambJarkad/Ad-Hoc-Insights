-- 8. In which quarter of 2020, got the maximum total_sold_quantity? The final output contains these fields sorted by the total_sold_quantity, 
--     1. Quarter 
--     2. total_sold_quantity

-- Way 1
select 
CASE 
when Month(date_add(date,interval 4 month)) in(1,2,3) 
	then "Q1"
when Month(date_add(date,interval 4 month)) in(4,5,6) 
	then "Q2"
when Month(date_add(date,interval 4 month)) in(7,8,9) 
	then "Q3"
when Month(date_add(date,interval 4 month)) in(10,11,12) 
	then "Q4"
End as Quarter,
sum(sold_quantity) as total_sold_qty
from fact_sales_monthly
where fiscal_year=2020
group by Quarter
limit 1000000000000000000
-- ==============================================================================
-- Way 2 
select 
quarter((date_add(date,interval 4 month))) As Quarter,
sum(sold_quantity) as total_sold_qty
from fact_sales_monthly
where fiscal_year=2020
group by Quarter
limit 1000000000000000000