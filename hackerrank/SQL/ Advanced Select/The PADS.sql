WITH NameResults AS (
    SELECT 1 AS part, CONCAT(Name, '(', SUBSTRING(Occupation, 1, 1), ')') AS output, Name AS sort1, 0 AS sort2, '' AS sort3
    FROM OCCUPATIONS
),
CountResults AS (
    SELECT 2 AS part, CONCAT('There are a total of ', COUNT(*), ' ', LOWER(Occupation), 's.') AS output, '' AS sort1, COUNT(*) AS sort2, Occupation AS sort3
    FROM OCCUPATIONS
    GROUP BY Occupation
)
SELECT output
FROM (
    SELECT * FROM NameResults
    UNION ALL
    SELECT * FROM CountResults
) combined
ORDER BY part, sort1, sort2, sort3;
