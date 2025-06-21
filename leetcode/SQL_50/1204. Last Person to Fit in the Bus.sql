# Write your MySQL query statement below
WITH Boarded AS (
  SELECT 
    person_name,
    weight,
    SUM(weight) OVER (ORDER BY turn) AS total_weight
  FROM Queue
)
SELECT person_name
FROM Boarded
WHERE total_weight <= 1000
ORDER BY total_weight DESC
LIMIT 1;
