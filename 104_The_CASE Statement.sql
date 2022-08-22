---CONDITIONAL RULE USING CASE WHEN 

---CASE WHEN

Select 
  customer_id,
  customer_loyalty_score,
  case when customer_loyalty_score > 0.5 then 'High Loyal' else 'Low Loyal' end as high_loyal_flag 
from
  grocery_db.loyalty_scores;
  
---MULTIPLE CONDITIONS 
Select 
  customer_id,
  customer_loyalty_score,
  case 
  when customer_loyalty_score > 0.66 then 'High Loyal' 
  when customer_loyalty_score > 0.33 then 'Medium Loyal' 
  else 'Low Loyal' end as high_loyal_flag
from
  grocery_db.loyalty_scores;
  
---CASE WHEN + AGGREGATION

Select 
  customer_id,
  sum(case when product_area_id = 1 then sales_cost else 0 end) as non_food_sales,
  sum(case when product_area_id = 2 then sales_cost else 0 end) as vege_sales,
  sum(case when product_area_id = 3 then sales_cost else 0 end) as fruit_sales,
  sum(case when product_area_id = 4 then sales_cost else 0 end) as dairy_sales,
  sum(case when product_area_id = 5 then sales_cost else 0 end) as meat_sales
  
from 
  grocery_db.transactions
  
group by
  customer_id;
