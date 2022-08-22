--- WINDOW FUNCTIONS

---WINDOW FUNCTION 

Select 
  *,
  sum(sales_cost) over (partition by transaction_id) as transaction_total_sales,
  sales_cost/sum(sales_cost) over (partition by transaction_id) as transaction_sales_present
  
from 
  grocery_db.transactions;
  
---ROW NUMBER & RANK 
Select 
  *,
  row_number () over (partition by customer_id order by transaction_date, transaction_id) as transaction_number
  
from 
  grocery_db.transactions;
  
---
