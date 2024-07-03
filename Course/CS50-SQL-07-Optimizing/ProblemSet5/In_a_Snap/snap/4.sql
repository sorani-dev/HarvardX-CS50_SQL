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
