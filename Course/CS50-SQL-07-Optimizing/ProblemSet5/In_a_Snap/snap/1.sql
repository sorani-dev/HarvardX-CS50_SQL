-- Find all usernames of users who have logged in since 2024-01-01.
SELECT
    username
FROM
    users
WHERE
    users.last_login_date >= '2024-01-01';