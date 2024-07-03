-- Find the username of the most popular user, defined as the user who has had the most messages sent to them. If two or more users have had the same number of messages sent to them, return the username that is first alphabetically.
EXPLAIN QUERY PLAN
SELECT "users"."username" FROM "users" WHERE "users"."id" = (
    SELECT "to_user_id"
     FROM "messages" GROUP BY "to_user_id" HAVING COUNT("to_user_id") = (
        SELECT COUNT("to_user_id") AS "count" FROM "messages"
    "messages" GROUP BY "to_user_id" ORDER BY COUNT("to_user_id") DESC LIMIT 1
));

SELECT "users"."username" FROM "users" WHERE "users"."id" = (
    SELECT "to_user_id"
     FROM "messages" GROUP BY "to_user_id" HAVING COUNT("to_user_id") = (
        SELECT COUNT("to_user_id") AS "count" FROM "messages"
    "messages" GROUP BY "to_user_id" ORDER BY COUNT("to_user_id") DESC LIMIT 1
));

----
EXPLAIN QUERY PLAN

SELECT "users"."username" FROM "users" WHERE "users"."id" = (
    SELECT "to_user_id"
     FROM "messages"
    "messages" GROUP BY "to_user_id" ORDER BY COUNT("to_user_id") DESC LIMIT 1
);

SELECT "users"."username" FROM "users" WHERE "users"."id" = (
    SELECT "to_user_id"
     FROM "messages"
    "messages" GROUP BY "to_user_id" ORDER BY COUNT("to_user_id") DESC LIMIT 1
);


----

EXPLAIN QUERY PLAN
SELECT "users"."username" FROM "users" INNER JOIN "messages" ON "users"."id" = "messages"."from_user_id" GROUP BY "to_user_id" ORDER BY COUNT("from_user_id") DESC , "users"."username" ASC LIMIT 1
;

SELECT "users"."username" FROM "users" INNER JOIN "messages" ON "users"."id" = "messages"."to_user_id" GROUP BY "to_user_id" ORDER BY COUNT("to_user_id") DESC, "users"."username" ASC LIMIT 1
;

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
