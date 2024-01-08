## Question 1
-- Imagine you are tasked with retrieving a list of all restaurants and their menu items. Some restaurants may not have any menu items yet. Write an SQL query that performs a LEFT JOIN between the "Restaurant_info" and "MenuItems" tables to achieve this. Your query should include the restaurant name and the name of the menu items, if available.
## Answer: 

SELECT 
	ri.name AS restaurant_name,
	mi.name AS menu_items
	
FROM restaurant_info ri
LEFT JOIN menuitems mi USING(restaurant_id);




## Question 2 
-- Extend the previous query to include the restaurant's contact number and the availability status of each menu item. If a restaurant does not have any menu items, display "No Menu Items" in the menu item column.
## Answer: 

SELECT 
	ri.name AS restaurant_name,
	IF(mi.name = NULL, "No Menu Items", mi.name) AS menu_items,
	ri.contact_number,
	mi.availability
FROM restaurant_info ri
LEFT JOIN menuitems mi USING(restaurant_id);
