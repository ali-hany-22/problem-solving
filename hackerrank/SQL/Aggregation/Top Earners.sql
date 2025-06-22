SELECT 
    salary * months AS max_total_earnings, 
    COUNT(*) 
FROM Employee
GROUP BY salary * months
ORDER BY max_total_earnings DESC
LIMIT 1;
