--The BASIC SELECT STATEMENT

Select * from grocery_db.product_areas;

---LIMIT
Select
 * 
 
from 
 grocery_db.product_areas

limit
 3;
 
----ORDERBY
Select 

  *
  
from

  grocery_db.customer_details
  
order by
  distance_from_store,
  gender,
  credit_score;

---DISTINCT
Select
  distinct  
  gender
from 
  grocery_db.customer_details;
  
---AGGREGATION FUNCTIONS 
---GIVING COLUMNS AN ALIAS
SELECT 
  distance_from_store as distance_to_store,
  customer_id as customer_number
  
from 
  grocery_db.customer_details;

---CREATING NEW COLUMNS 
SELECT 
  distance_from_store as distance_to_store,
  customer_id as customer_number,
  i as new_col,
  distance_from_store * 1.6 as distance_from_store_km
from 
  grocery_db.customer_details;
  
---WHERE STATEMENT 
  
   
where 
  customer_id = 642;
---AGGREGATION FUNCTIONS 
Select 
  sum(sales_cost) as total_sales,
  avg(sales_cost) as avg_sales,
  min(sales_cost) as min_sales,
  max(sales_cost) as max_sales,
  count(*) as num_rows,
  count(distinct transaction_id) as num_transactions
  
from
  grocery_db.transactions;
  
---GROUP BY 
SELECT 
    transaction_date,
    sum(sales_cost) as total_sales,
    sum(num_items) as total_items,
    count (distinct transaction_id) as num_transactions 
  
from 
    grocery_db.transactions
  
group by 
    transaction_date;
    
---Group By Multiple Variables
SELECT 
    product_area_id,
    transaction_date,
    sum(sales_cost) as total_sales,
    sum(num_items) as total_items,
    count (distinct transaction_id) as num_transactions 
  
from 
    grocery_db.transactions
  
group by 
  product_area_id,  
  transaction_date
  
order by
  product_area_id,  
  transaction_date;
  
---THE HAVING CLAUSE
Select 
 product_area_id,
  sum(sales_cost) as total_sales
  
from 
 grocery_db.transactions
 
group by 
 product_area_id
 
having 
 sum(sales_cost) > 200000;
 
---WINDOW FUNCTION 
Select 
  *,
  sum(sales_cost) over (partition by transaction_id) as transaction_total_sales
  sales_cost/ sum(sales_cost) over (partition by transaction_id) as transaction_sales_percent
  
from 
  grocery_db.transactions;
  
---ROW NUMBER & RANK 
Select
  *
  row_number() over (partition by customer_id order by transaction_date, transaction_id) as transaction_number
  
from
   grocery_db.transactions;
 
---NTILE - for deciles/percentiles etc

Select
  customer_id,
  customer_loyalty_score,
  ntile(3) over (order by customer_loyalty_score desc) as loyalty_category,
  ntile(10)
