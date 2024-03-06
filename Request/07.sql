-- 7. Get the complete report of the Gross sales amount for the customer “Atliq Exclusive” for each month . This analysis helps to get an idea of low and high-performing months and take strategic decisions. The final report contains these columns: 
--     1. Month 
--     2. Year 
--     3. Gross sales Amount

-- Way 1
select 
		monthname(s.date) as Month,
        s.fiscal_year,
        sum(s.sold_quantity * g.gross_price) as Gross_Sales_Amount
from fact_sales_monthly s 
join dim_customer c on s.customer_code=c.customer_code
join fact_gross_price g on s.product_code=g.product_code

where c.customer="Atliq Exclusive"
group by Month,s.fiscal_year
order by s.fiscal_year

-- ============================================================================
-- Way 2
select 
		monthname(s.date) as Month,
        s.fiscal_year,
        sum(s.sold_quantity * g.gross_price) as Gross_Sales_Amount
from fact_sales_monthly s 
join dim_customer c on s.customer_code=c.customer_code
join fact_gross_price g on s.product_code=g.product_code
and s.fiscal_year=g.fiscal_year 
where c.customer="Atliq Exclusive"
group by Month,s.fiscal_year
order by s.fiscal_year;