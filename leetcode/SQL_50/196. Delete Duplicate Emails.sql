# Write your MySQL query statement below
DELETE FROM Person
WHERE id NOT IN (
    SELECT id FROM (
        SELECT MIN(id) as id
        FROM Person
        GROUP BY email
    ) as temp
);
