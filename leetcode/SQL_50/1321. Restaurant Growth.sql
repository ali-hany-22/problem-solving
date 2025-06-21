# Write your MySQL query statement below
WITH DailyTotal AS (
  SELECT 
    visited_on,
    SUM(amount) AS amount
  FROM Customer
  GROUP BY visited_on
),
MovingAvg AS (
  SELECT
    visited_on,
    SUM(amount) OVER (
      ORDER BY visited_on
      ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
    ) AS amount,
    ROUND(AVG(amount) OVER (
      ORDER BY visited_on
      ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
    ), 2) AS average_amount
  FROM DailyTotal
)
SELECT *
FROM MovingAvg
WHERE visited_on >= (
  SELECT MIN(visited_on) + INTERVAL 6 DAY
  FROM Customer
)
ORDER BY visited_on;
