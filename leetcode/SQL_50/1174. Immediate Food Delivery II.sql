# Write your MySQL query statement below
With first_orders AS 
(SELECT *, ROW_NUMBER() OVER(PARTITION BY customer_id ORDER BY order_date) AS rnk FROM Delivery) 

SELECT ROUND(SUM(order_date = customer_pref_delivery_date)/COUNT(*)*100, 2) AS immediate_percentage FROM first_orders 
WHERE rnk = 1;
