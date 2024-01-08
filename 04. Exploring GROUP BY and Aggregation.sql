## Question 1
-- Retrieve the total number of orders placed by each user. Display the user's name and the total number of orders they have placed. Sort the results in descending order based on the number of orders.
## Answer: 

SELECT 
	ui.name, 
	COUNT(o.order_id) AS total_orders
FROM user_info ui
LEFT JOIN orders o ON ui.ID = o.user_id
GROUP BY ui.name
ORDER BY total_orders DESC;




## Question 2
-- Find the average price of menu items for each restaurant. Display the restaurant name and the average menu item price. Sort the results in ascending order based on the restaurant name.
## Answer: 

SELECT 
	ri.name AS restaurant_name, 
	AVG(m.price) AS average_price 
FROM restaurant_info ri
LEFT JOIN menuitems m ON ri.restaurant_id = m.restaurant_id 
GROUP BY restaurant_name
ORDER BY restaurant_name ASC;




## Question 3
-- Identify the restaurant with the highest total sales (sum of order amounts). Display the restaurant name and the total sales amount.
## Answer: (USING PRICE)

SELECT 
	ri.name AS restaurant_name, 
	SUM(o.total_amount) AS total_sales

FROM restaurant_info ri
LEFT JOIN orders o ON ri.restaurant_id = o.restaurant_id
GROUP BY restaurant_name 
ORDER BY total_sales DESC LIMIT 1;


## (USING ORDER)
SELECT 
	ri.name AS restaurant_name,
	COUNT(o.order_id) AS total_sales
FROM orders o
LEFT JOIN restaurant_info ri USING(restaurant_id)
GROUP BY o.restaurant_id
ORDER BY total_sales DESC LIMIT 2; #LIMIT 1
#two restaurants have the same value 




## Question 4
-- Find the number of orders placed in each city. Display the city name and the number of orders. Sort the results in descending order based on the number of orders.
## Answer: 

SELECT 
	c.city_name AS city_name, 
	COUNT(o.order_id) AS total_orders

FROM orders o
LEFT JOIN restaurant_info ri ON o.restaurant_id = ri.restaurant_id 
JOIN city c ON ri.city_id = c.city_id 
GROUP BY city_name
ORDER BY total_orders DESC;








