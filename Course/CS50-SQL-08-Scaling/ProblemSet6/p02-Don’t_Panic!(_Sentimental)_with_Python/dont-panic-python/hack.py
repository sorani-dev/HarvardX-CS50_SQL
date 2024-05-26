import hashlib
from cs50 import SQL

# print("Hacked!")

db = SQL("sqlite:///dont-panic.db")

str2hash = "hacked!"

result = hashlib.sha512(str2hash.encode()).hexdigest()
row = db.execute(
    """SELECT id, username, password
FROM users
WHERE username='admin';"""
)
db.execute(
    """
           UPDATE "users"
           SET "password" = :password
           WHERE username='admin'
           """,
    password=result,
)
row = db.execute(
    """SELECT id, username, password
FROM users
WHERE username='admin';"""
)
