# Write your MySQL query statement below
(
  SELECT name AS results
  FROM (
    SELECT u.name, COUNT(*) AS rating_count
    FROM MovieRating mr
    JOIN Users u ON mr.user_id = u.user_id
    GROUP BY u.name
  ) AS user_counts
  ORDER BY rating_count DESC, name
  LIMIT 1
)
UNION ALL
(
  SELECT title AS results
  FROM (
    SELECT m.title, AVG(mr.rating) AS avg_rating
    FROM MovieRating mr
    JOIN Movies m ON mr.movie_id = m.movie_id
    WHERE mr.created_at BETWEEN '2020-02-01' AND '2020-02-29'
    GROUP BY m.title
  ) AS movie_avgs
  ORDER BY avg_rating DESC, title
  LIMIT 1
);
