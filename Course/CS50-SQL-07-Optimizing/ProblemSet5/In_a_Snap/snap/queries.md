# In a Snap

## 1.sql

```sql
-- Find all usernames of users who have logged in since 2024-01-01.
EXPLAIN QUERY PLAN
SELECT username
FROM users
WHERE users.last_login_date >= '2024-01-01';
```

|selectid|order|from|detail|
|--------|--------|--------|--------|
|0|0|0|SEARCH TABLE users USING INDEX search_users_by_last_login (last_login_date&gt;?)|

```sql
-- Find all usernames of users who have logged in since 2024-01-01.
SELECT
    username
FROM
    users
WHERE
    users.last_login_date >= '2024-01-01';
```

## 2.sql

```sql
EXPLAIN QUERY PLAN
SELECT
    "expires_timestamp"
FROM
    "messages"
WHERE
    id = 151;
```

```text
QUERY PLAN
`--SEARCH messages USING INTEGER PRIMARY KEY (rowid=?)
```

```sql
-- Find when the message with ID 151 expires. You may use the message’s ID directly in your query.
SELECT
    "expires_timestamp"
FROM
    "messages"
WHERE
    id = 151;
```

|  expires_timestamp  |
|---------------------|
| 2021-10-04 13:20:12 |

## 3.sql

```sql
-- Find the user IDs of the top 3 users to whom creativewisdom377 sends messages most frequently. Order the user IDs by the number of messages creativewisdom377 has sent to those users, most to least.
EXPLAIN QUERY PLAN
SELECT
    messages.to_user_id
FROM
    messages
WHERE
    messages.from_user_id = (
        SELECT
            id
        FROM
            users
        WHERE
            username = 'creativewisdom377'
        LIMIT
            1
    )
GROUP BY
    messages.to_user_id
ORDER BY
    COUNT(messages.to_user_id) DESC
LIMIT
    3
;
```

```text
QUERY PLAN
|--SEARCH messages USING INDEX search_messages_by_from_user_id (from_user_id=?)
|--SCALAR SUBQUERY 1
|  `--SEARCH users USING COVERING INDEX sqlite_autoindex_users_1 (username=?)
|--USE TEMP B-TREE FOR GROUP BY
`--USE TEMP B-TREE FOR ORDER BY
```

```sql
-- Find the user IDs of the top 3 users to whom creativewisdom377 sends messages most frequently. Order the user IDs by the number of messages creativewisdom377 has sent to those users, most to least.
SELECT
    messages.to_user_id
FROM
    messages
WHERE
    messages.from_user_id = (
        SELECT
            id
        FROM
            users
        WHERE
            username = 'creativewisdom377'
        LIMIT
            1
    )
GROUP BY
    messages.to_user_id
ORDER BY
    COUNT(messages.to_user_id) DESC
LIMIT
    3
;
```

```text
| to_user_id |
|------------|
| 744        |
| 4          |
| 1104       |
```

## 4.sql

```sql
EXPLAIN QUERY PLAN
SELECT
        "users"."username"
FROM
        "users"
        INNER JOIN "messages" ON "users"."id" = "messages"."to_user_id"
GROUP BY
        "to_user_id"
ORDER BY
        COUNT("to_user_id") DESC,
        "users"."username" ASC
LIMIT
        1;

```

```text
QUERY PLAN
|--SCAN messages USING COVERING INDEX search_messages_by_to_user_id
|--SEARCH users USING INTEGER PRIMARY KEY (rowid=?)
`--USE TEMP B-TREE FOR ORDER BY

```

```sql
SELECT
        "users"."username"
FROM
        "users"
        INNER JOIN "messages" ON "users"."id" = "messages"."to_user_id"
GROUP BY
        "to_user_id"
ORDER BY
        COUNT("to_user_id") DESC,
        "users"."username" ASC
LIMIT
        1;

```

|       username       |
|----------------------|
| charminghappiness484 |

## 5.sql

```sql
-- Given two usernames, lovelytrust487 and exceptionalinspiration482, find the user IDs of their mutual friends. A mutual friend is a user that both lovelytrust487 and exceptionalinspiration482 count among their friends.
EXPLAIN QUERY PLAN
SELECT "friend_id"
FROM "friends"
WHERE "friends"."user_id" = (
SELECT "id" FROM "users"
WHERE "username" = 'lovelytrust487'
)
INTERSECT
SELECT "friend_id"
FROM "friends"
WHERE "friends"."user_id" = (
SELECT "id" FROM "users"
WHERE "username" = 'exceptionalinspiration482'
)
;
```

```text
QUERY PLAN
`--COMPOUND QUERY
   |--LEFT-MOST SUBQUERY
   |  |--SEARCH friends USING COVERING INDEX sqlite_autoindex_friends_1 (user_id=?)
   |  `--SCALAR SUBQUERY 1
   |     `--SEARCH users USING COVERING INDEX sqlite_autoindex_users_1 (username=?)
   `--INTERSECT USING TEMP B-TREE
      |--SEARCH friends USING COVERING INDEX sqlite_autoindex_friends_1 (user_id=?)
      `--SCALAR SUBQUERY 3
         `--SEARCH users USING COVERING INDEX sqlite_autoindex_users_1 (username=?)
```

```sql
-- Given two usernames, lovelytrust487 and exceptionalinspiration482, find the user IDs of their mutual friends. A mutual friend is a user that both lovelytrust487 and exceptionalinspiration482 count among their friends.
SELECT "friend_id"
FROM "friends"
WHERE "friends"."user_id" = (
SELECT "id" FROM "users"
WHERE "username" = 'lovelytrust487'
)
INTERSECT
SELECT "friend_id"
FROM "friends"
WHERE "friends"."user_id" = (
SELECT "id" FROM "users"
WHERE "username" = 'exceptionalinspiration482'
)
;
```

| friend_id |
|-----------|
| 1603      |
| 2142      |
| 2438      |
