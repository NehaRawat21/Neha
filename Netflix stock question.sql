
----  QUERIES FROM THE NETFLIX STOCK DATABASE----- 
  
  
  -- Changing the data typ of dat column--- 
  update nftock 
  set S_date=str_to_date(S_date,"%d-%m-%Y");
  
  
 ----- get the first 10 rows of dataset-- 
select * from nftock
limit 10;



 ------- find the highest stock price recorded

select MAX(High_Price) as hightest_stock_price from nftock;




------- Find the lowest stock price recorded

select MIN(High_Price) as lowest_stock_price from dstock;

-------- Find the opening price on 21-08-2002-- 
select Open_Price from nftock
where S_date= '2002-08-21';


-------- Calculate the average volume of stock traded

select avg(volume) as avg_volume
from nftock;



------ Retrieve all records between 21-08-2002 and 31-05-2002 -- 
select open_price from dstock 
where date = '21-08-2002' and '31-05-2002';


-- On which date did Disney reach its highest closing price?
select S_date,close_price
from nftock
where close_price = (select max(close_price) from nftock);


-- What is the average closing price for Disney in 2002?

select avg(close_price) as avg_close_price
from nftock
where year(S_date) = 2003;



----- What was the average stock price for Disney for each month in 2000?--
 
SELECT distinct MONTH(S_date) AS month, AVG(close_price) AS avg_close_price
FROM nftock
WHERE YEAR(S_date) = 2002
GROUP BY MONTH(S_date)
ORDER BY month;


-- What was the lowest closing price for Disney stock in a 2000? 

select min(close_price) as lowest_close_price 
from nftock
where year( S_date) =2002;