SELECT user_id, name, mail
FROM Users
WHERE LOWER(mail) REGEXP '^[a-z][a-z0-9_.-]*@leetcode\\.com$';
