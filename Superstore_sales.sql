create database Superstore;
use Superstore;

create table Superstore_sales (Row_ID	int,
Order_ID  varchar(20),	Order_Date DATE, Sale_Year varchar(20),	Ship_Date  DATE,	
Ship_Mode varchar(30), Customer_ID varchar(30), Customer_Name varchar(50),
Segment	varchar(30), Country varchar(30), City varchar(30),
State varchar(30),	Postal_Code int, Region varchar(20),	
Product_ID varchar(50),	Category varchar(20),	Sub_Category varchar(30),
Product_Name varchar(100), Sales float, Quantity int, Discount float, Profit float);

select  * from superstore_sales limit 200;

select count(*) from superstore_sales;

-- Sales Performance
-- total revenue and profit
select sum(Sales) as Total_revenue, sum(Profit) as profit from superstore_sales;

-- total sales revenue over time

-- Yearly sales Growth
select Sale_Year , sum(Sales)as Total_Revenue from superstore_sales
group by Sale_Year
order by Sale_Year; -- maximum  sale occured in year 2017 => 731598.7828063965 
-- and notable growth in sales occurred in year 2015-16 and 2016-17

select Category, sum(Sales) as Total_Revenue from superstore_sales
group by Category
order by sum(Sales) desc 
limit 1 ;    -- maximum selling category => Technology  

-- Average sale per customer
select count(distinct Customer_ID) from superstore_sales; 
select Customer_ID, avg(Sales)  as avg_sale_custo from superstore_sales
group by Customer_ID;

-- Revenue and profit by region

select Region, sum(Sales), sum(Profit) from superstore_sales
group by Region;   -- Region with maximum sale and profit ==> West

-- Top 10 Prdoucts by sale
select Product_Name, sum(Sales) from superstore_sales
group by Product_Name
order by sum(sales) desc
limit 10;

-- Sales and Profit by Category & Sub-Category
select Category, Sub_Category, sum(Sales), sum(Profit) from superstore_sales
group by Category, Sub_Category;
-- loss making sub_categories ==> Bookcaes, tables, Office Supplies







