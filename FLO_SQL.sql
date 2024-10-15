
-- CHECHKING CUSTOMER AMOUNT
select count(distinct Master_ID) TOTALCUSTOMERS from CUSTOMERS 


--TOTAL AMOUNT OF SALES
select sum(Order_num_total_ever_offline+Order_num_total_ever_online) TOTAL_AMOUNT_OF_SALES,sum(Customer_value_total_ever_offline+Customer_value_total_ever_online) REVENUE
from CUSTOMERS

--Average Revenue
select (sum(Customer_value_total_ever_offline+ Customer_value_total_ever_online)/ sum(Order_num_total_ever_offline+Order_num_total_ever_online) )AVG_REVENUE 
from CUSTOMERS

--Average Revenue base on last order channel

select Last_order_channel, (sum(Customer_value_total_ever_offline+Customer_value_total_ever_online)/ sum(Order_num_total_ever_offline+Order_num_total_ever_online)) AVG_REVENUE 
from CUSTOMERS group by Last_order_channel

--TOTAL REVENUE Based on STORY TYPE

select  Store_type,sum(Customer_value_total_ever_offline+Customer_value_total_ever_online) TOTAL_REVENUE 
from CUSTOMERS group by Store_type

--AMOUNT OF SALES BY FIRST ORDER DATE
select year(First_order_date) YEAR_,sum(Customer_value_total_ever_offline+Customer_value_total_ever_online) TOTAL_AMOUNT_OF_SALES
from CUSTOMERS group by year(First_order_date) order by 2 desc




--AVERAGE REVENUE BY Last_order CHANNEL
select Last_order_channel, sum(Customer_value_total_ever_offline+Customer_value_total_ever_online)/sum(Order_num_total_ever_offline+Order_num_total_ever_online) PRODUCTIVITY
from CUSTOMERS 
group by Last_order_channel


--LAST 12 MONTHS

select Interested_in_categories_12,count(*) Frequency
from CUSTOMERS
group by Interested_in_categories_12
order by 2 desc


--Most selected Store Type
select top 1 Store_type,count(*) Store_count 
from CUSTOMERS group by Store_type
order by 2 desc


-- Most Selected Category and TOTAL REVENUE by last order date
SELECT DISTINCT 
    C.Last_order_channel,
    (SELECT TOP 1 Interested_in_categories_12 
     FROM CUSTOMERS 
     WHERE Last_order_channel = C.Last_order_channel 
     GROUP BY Interested_in_categories_12
     ORDER BY SUM(Order_num_total_ever_offline + Order_num_total_ever_online) DESC) AS Top_category,
    (SELECT TOP 1 SUM(Order_num_total_ever_offline + Order_num_total_ever_online) 
     FROM CUSTOMERS 
     WHERE Last_order_channel = C.Last_order_channel 
     GROUP BY Interested_in_categories_12
     ORDER BY SUM(Order_num_total_ever_offline + Order_num_total_ever_online) DESC) AS Total_order
FROM CUSTOMERS C



--Top 1 in Most sales
select top 1  Master_ID,sum(Customer_value_total_ever_offline+Customer_value_total_ever_online) TOTAL_SALES
from CUSTOMERS group by Master_ID
order by sum(Customer_value_total_ever_offline+Customer_value_total_ever_online) desc


--DAY FREQUENCY,AVERAGE REEVNUE IN SALES

select D.Master_ID,D.TOTAL_REVENUE/D.FREQUENCY AVERAGE_REVENUE_BY_FREQ, D.TOTAL_REVENUE / round(DATEDIFF(day,First_order_date,Last_order_date) ,1) REVENUE_BY_DAY from (select top 1 Master_ID,First_order_date,Last_order_date,sum(Customer_value_total_ever_offline+Customer_value_total_ever_online) TOTAL_REVENUE,
sum(Order_num_total_ever_offline+Order_num_total_ever_online) FREQUENCY  from CUSTOMERS group by Master_ID,First_order_date,Last_order_date
order by TOTAL_REVENUE desc) D







--TOP 100 Customer by TOTAL REVENUE

select D.Master_ID,D.First_order_date,D.Last_order_date,D.REVENUE/D.FREQUENCY AVG_REVENUE,DATEDIFF(day,D.First_order_date,D.Last_order_date) DATE_DIF,round(D.REVENUE/ DATEDIFF(day,D.First_order_date,D.Last_order_date),1) DATE_BY_REVENUE 
from (select top 100 Master_ID,First_order_date,Last_order_date,
sum(Order_num_total_ever_offline+Order_num_total_ever_online) FREQUENCY,sum(Customer_value_total_ever_offline+Customer_value_total_ever_online) 
REVENUE from CUSTOMERS group by Master_ID,First_order_date,Last_order_date order by REVENUE desc) D


--Customer who make most buy by last order channel

select distinct Last_order_channel,
(select top 1 Master_ID from CUSTOMERS where Last_order_channel=C.Last_order_channel
group by Master_ID
order by sum(Customer_value_total_ever_offline+Customer_value_total_ever_online)  desc) CUSTOMER, (select top 1 sum(Customer_value_total_ever_offline+Customer_value_total_ever_offline ) 
from CUSTOMERS  where Last_order_channel=C.Last_order_channel group by Master_ID order by sum(Customer_value_total_ever_offline+Customer_value_total_ever_offline ) desc) REVENUE  from CUSTOMERS C




--Last sales Customer ID
select Master_ID,Last_order_date from CUSTOMERS 
group by Master_ID,Last_order_date
having Last_order_date = (select max(Last_order_date) from CUSTOMERS)





