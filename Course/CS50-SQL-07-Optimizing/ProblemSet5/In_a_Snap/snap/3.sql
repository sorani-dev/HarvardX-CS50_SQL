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