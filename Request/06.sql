-- 6. Generate a report which contains the top 5 customers who received an average high pre_invoice_discount_pct for the fiscal year 2021 and in the Indian market. The final output contains these fields, 
--     1. customer_code 
--     2. customer 
--     3. average_discount_percentage

with cte1 as (SELECT * FROM gdb023.fact_pre_invoice_deductions
where pre_invoice_discount_pct > 
(SELECT avg(pre_invoice_discount_pct)FROM fact_pre_invoice_deductions where fiscal_year=2021)
and fiscal_year=2021)

select t1.customer_code,t2.customer,t1.pre_invoice_discount_pct from cte1 t1 
join dim_customer t2 on t1.customer_code=t2.customer_code 
where t2.market="india"
order by pre_invoice_discount_pct desc
limit 5;