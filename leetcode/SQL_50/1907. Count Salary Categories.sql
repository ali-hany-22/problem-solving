# Write your MySQL query statement below
SELECT
    AllCategories.category,
    COALESCE(AccountCounts.count_val, 0) AS accounts_count
FROM (
    SELECT 'Low Salary' as category
    UNION ALL
    SELECT 'Average Salary'
    UNION ALL
    SELECT 'High Salary'
) AS AllCategories
LEFT JOIN (
    SELECT
        CASE
            WHEN income < 20000 THEN 'Low Salary'
            WHEN income >= 20000 AND income <= 50000 THEN 'Average Salary'
            ELSE 'High Salary'
        END AS category,
        COUNT(*) AS count_val
    FROM
        Accounts
    GROUP BY
        category
) AS AccountCounts ON AllCategories.category = AccountCounts.category;
