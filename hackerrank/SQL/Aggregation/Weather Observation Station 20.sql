SELECT ROUND(LAT_N, 4)
FROM (
    SELECT LAT_N, 
           ROW_NUMBER() OVER (ORDER BY LAT_N) AS row_num,
           COUNT(*) OVER () AS total_rows
    FROM STATION
) AS ordered
WHERE row_num = FLOOR((total_rows + 1) / 2);
