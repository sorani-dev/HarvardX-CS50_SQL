-- - **Alter** the password of the website’s administrative account, `admin`, to instead be “oops!”.
UPDATE "users"
SET "password" = '982c0381c279d139fd221fce974916e7'
WHERE "username" = 'admin';
-- - **Erase** any logs of your activity recorded by the database.
DELETE FROM "user_logs"
WHERE "new_password" = '982c0381c279d139fd221fce974916e7'
    AND "old_username" = 'admin'
    AND "type" = 'update';
-- - **Add** false data to throw others off your trail. In particular, make it only appear as if the `admin` account has had its password changed to `emily33`’s password. Indeed, this “update” should appear to be the only trace left behind.
INSERT INTO "user_logs" (
        "type",
        "old_username",
        "new_username",
        "old_password",
        "new_password"
    )
VALUES (
        'update',
        'admin',
        'admin',
        (
            SELECT users.password
            FROM users
            WHERE username = 'admin'
        ),
        (
            SELECT users.password
            FROM users
            WHERE username = 'emily33'
        )
    );
