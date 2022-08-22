---TEMP TABLE AND CTE FOR MULTIPLE QUERIES
select * from grocery_db.transactions where customer_id = 1;

---TEMPORARY TABLES
create temp table cust_transactions as (
select 
  customer_id,
  transaction_id,
  sum(sales_cost) as total_sales
  
from 
  grocery_db.transactions 
  
group by 
  customer_id,
  transaction_id
 
);

drop table cust_transactions;

select  * from cust_transactions;
Select 
  customer_id,
  sum(total_sales) as avg_transaction_sales
  
from 
  cust_transactions 
  
group by
  customer_id;
  
