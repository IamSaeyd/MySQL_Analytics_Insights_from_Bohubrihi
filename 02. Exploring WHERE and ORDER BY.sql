## Question 1
-- Retrieve a list of user information with their name and date of registration who uses android phones. First look at the structure of the user_info table in database and then write your query. 
## Answer: 

SELECT
	name,
	registration_date
FROM user_info
WHERE operating_system="Android";




## Question 2
-- Edit your query above to find out users who have registered on or after 14th of july and sort the list of users in ascending order.
## Answer: 

SELECT 
	name,
	registration_date
FROM user_info
WHERE operating_system= "Android" AND registration_date >= "2023-07-14"
ORDER BY registration_date ASC;
