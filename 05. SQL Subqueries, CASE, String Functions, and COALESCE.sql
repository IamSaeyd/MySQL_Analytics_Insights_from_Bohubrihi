## Question 1 
-- Write an SQL query to find the names of restaurants that have at least one menu item with a price greater than $10.
## Answer: 

SELECT 
	DISTINCT ri.name AS restaurant_name
FROM restaurant_info ri
JOIN menuitems m USING(restaurant_id)
WHERE m.price > 10;




## Question 2 
-- Write an SQL query to retrieve the user names and their corresponding orders where the order total is greater than the average order total for all users.
## Answer: 

SELECT 
	ui.name,
	COUNT(o.order_id) AS total_order
FROM orders o
JOIN user_info ui ON ui.id=o.user_id
GROUP BY user_id 
HAVING total_order > (
SELECT 
		SUM(count) / COUNT(user_id) AS average_order
	FROM (
		SELECT 
			user_id,
			COUNT(order_id) AS count
		FROM orders
		GROUP BY user_id
	     ) AS AO
					) 
ORDER BY total_order DESC;




## Question 3 
-- Write an SQL query to list the names of users whose last names start with 'S' or ends with ‘e’.
## Answer: 

SELECT 
	name
FROM (
		SELECT 
			name,
			SUBSTRING(name, LOCATE(" ", name)+1) AS last_name
		FROM user_info
	 ) AS LN
WHERE last_name LIKE "S%" OR last_name LIKE "%e";




## Question 4
-- Write an SQL query to find the total order amounts for each restaurant. If a restaurant has no orders, display the restaurant name and a total amount of 0. Use the COALESCE function to handle null values.
## Answer: 

SELECT 
        ri.name AS restaurant_name,
        COALESCE( COUNT(o.order_id), 0) AS total_order
FROM orders o
JOIN restaurant_info ri USING(restaurant_id)
GROUP BY restaurant_id
ORDER BY total_order DESC;




## Question 5
-- Write a query to find out how many orders were placed using cash or credit.
## Answer: (Only Payment Status Completed)

SELECT 
		p.name AS payment_type,
        COUNT(t.transaction_id) AS total
FROM payment_transactions t
JOIN payment_type p USING(pay_type_id)
WHERE status_id=1 #Status_Completed
GROUP BY p.name;

## (All Status)
SELECT 
	p.name AS payment_type, 
	COUNT(t.transaction_id) AS total

FROM payment_transactions t
JOIN payment_type p USING(pay_type_id)
GROUP BY p.name;
