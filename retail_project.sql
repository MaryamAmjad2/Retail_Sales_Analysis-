SELECT * FROM retail LIMIT 10;
-- Change Datatype
alter table retail
modify sale_date Date,
modify sale_time Time,
modify total_sale float,
modify price_per_unit float;

alter table retail
add primary key(ï»¿transactions_id);

-- Renaming column 
alter table retail
CHANGE ï»¿transactions_id transaction_id INT NOT NULL;


-- Check Nulls

select * from retail
where sale_date is NUll 
or sale_time is NUll 
or customer_id is null
or gender is null
or age is null
or category is null
or quantiy is null
or price_per_unit is null
or cogs is null
or total_sale is null;


-- EDA
select * from retail
where sale_date='2022-10-24';

select count(*) from retail
where sale_date like '2022-10%';

select distinct category  
from retail;

select * from retail
where  category = 'clothing'and quantiy > 2 and sale_date like '2022-11-%';