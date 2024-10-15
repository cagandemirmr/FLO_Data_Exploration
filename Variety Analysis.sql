select * from CUSTOMERS -- To see in General.

select distinct  min(len(Master_ID)) MINIMUM_LENGTH,max(len(Master_ID)) MAXIMUM_LEVGTH 
from CUSTOMERS group by Master_ID --TO OBSERVE MINIMUM AND MAXIMUM CHARACTER OF MASTER ID

select distinct Order_channel from CUSTOMERS --Order Channel 

select distinct Last_order_channel from CUSTOMERS

select min(Last_order_date) MIN_LAST_DATE, max(Last_order_date) MAX_LAST_DATE from CUSTOMERS

select min(First_order_date) MIN_FIRST_DATE, max(First_order_date) MAX_FIST_DATE from CUSTOMERS

select min(Last_order_date_online) MIN_LAST_OR_ONLINE_DATE, max(Last_order_date_online) MAX_LAST_OR_ONLINE_DATE from CUSTOMERS

select min(Last_order_date_offline) MIN_LAST_OR_OFFLINE_DATE, max(Last_order_date_offline) MAX_LAST_OR_OFFLINE_DATE from CUSTOMERS

select min(Order_num_total_ever_offline),max(Order_num_total_ever_offline) from CUSTOMERS --MIN,MAX order amount by OFFLINE

select min(Order_num_total_ever_online),max(Order_num_total_ever_online) from CUSTOMERS --MIN,MAX order amount by ONLINE 

select min(Customer_value_total_ever_offline),max(Customer_value_total_ever_offline) from CUSTOMERS --MIN,MAX values by OFFLINE

select min(Customer_value_total_ever_online),max(Customer_value_total_ever_online) from CUSTOMERS  --MIN,MAX values by ONLINE

select distinct Interested_in_categories_12 from CUSTOMERS

select distinct Store_type from CUSTOMERS








