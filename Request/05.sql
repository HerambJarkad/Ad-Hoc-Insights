-- 5. Get the products that have the highest and lowest manufacturing costs. The final output should contain these fields, 
--     1. product_code 
--     2. product 
--     3. manufacturing_cost

select 
p.product_code,p.product,m.manufacturing_cost 
from dim_product p 
join fact_manufacturing_cost m 
on p.product_code=m.product_code
where manufacturing_cost in(
SELECT max(manufacturing_cost)as max FROM fact_manufacturing_cost
UNION
SELECT min(manufacturing_cost)as min FROM fact_manufacturing_cost)
order by manufacturing_cost desc;