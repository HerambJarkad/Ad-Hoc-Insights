-- 1. Provide the list of markets in which customer "Atliq Exclusive" operates its business in the APAC region.

-- SELECT * FROM gdb023.dim_customer;
select distinct(market) 
from dim_customer 
where customer="Atliq Exclusive" and region="APAC"
order by market;