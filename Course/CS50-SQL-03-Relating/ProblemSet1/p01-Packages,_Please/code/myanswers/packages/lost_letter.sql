-- Clerk, my name’s Anneke. I live over at 900 Somerville Avenue. 
-- Not long ago, I sent out a special letter. 
-- It’s meant for my friend Varsha. 
-- She’s starting a new chapter of her life at 2 Finnegan Street, uptown. 
-- (That address, 
-- let me tell you: it was a bit tricky to get right the first time.) 
-- The letter is a congratulatory note—a cheery little paper hug 
-- from me to her, to celebrate this big move of hers. 
-- Can you check if it’s made its way to her yet?
-- By the problem:
-- What is to find is the end address.
-- We know the starting address: "900 Somerville Avenue" 
-- and the type of letter Anneke sent: "congratulatory letter".action
-- Using the table packages we can link the stating address -> poackages the packages -> ending address.
-- The starting address is in the first address table.
-- The type of letter is in the packages in the field "contents"
-- By joining address (start: id) -> packages [address start id -> address end id] -> address (end : id)
-- Get the starting and ending addresses plus the ending address type
-- Find address from: 900 Somerville Avenue 
SELECT addresses.id,
    addresses.address AS "from_address",
    addresses.type
FROM addresses
WHERE addresses.address = "900 Somerville Avenue"
ORDER BY address;
-- Find address to reciever: 2 Finnegan Street, uptown 
SELECT addresses.id,
    addresses.address AS "to_address",
    addresses.type
FROM addresses
WHERE addresses.address LIKE "2 F%gan Street"
ORDER BY address;
SELECT *
FROM packages
WHERE packages.contents = "Congratulatory letter"
ORDER BY packages.contents;

SELECT addresses.id,
    addresses.address AS "from_address",
    addresses.type, packages.*,
    a_to.*
FROM addresses
INNER JOIN packages ON packages.from_address_id = addresses.id
INNER JOIN addresses a_to ON a_to.id = packages.to_address_id
WHERE addresses.address = "900 Somerville Avenue"
AND packages.contents = 'Congratulatory letter'
;

SELECT addresses.id,
    addresses.address AS "from_address",
    addresses.type, packages.*,
    a_to.*, scans.*, drivers.name
FROM addresses
INNER JOIN packages ON packages.from_address_id = addresses.id
INNER JOIN addresses a_to ON a_to.id = packages.to_address_id
INNER JOIN scans ON scans.package_id = packages.id
INNER JOIN drivers on drivers.id = scans.driver_id
WHERE addresses.address = "900 Somerville Avenue"
AND packages.contents = 'Congratulatory letter'
AND scans.action = 'Drop'
;
SELECT addresses.address AS "from_address",
    a_to.address AS "to_address", a_to.type AS "To type", drivers.name
FROM addresses
INNER JOIN packages ON packages.from_address_id = addresses.id
INNER JOIN addresses a_to ON a_to.id = packages.to_address_id
INNER JOIN scans ON scans.package_id = packages.id
INNER JOIN drivers on drivers.id = scans.driver_id
WHERE addresses.address = "900 Somerville Avenue"
AND packages.contents = 'Congratulatory letter'
AND scans.action = 'Drop'
;

SELECT addresses.address AS "from_address",
    a_to.address AS "to_address", a_to.type AS "To type", drivers.name
FROM addresses
INNER JOIN packages ON packages.from_address_id = addresses.id
INNER JOIN addresses a_to ON a_to.id = packages.to_address_id
INNER JOIN scans ON scans.package_id = packages.id
INNER JOIN drivers on drivers.id = scans.driver_id
WHERE addresses.address = "900 Somerville Avenue"
AND packages.contents = 'Congratulatory letter'
AND scans.action = 'Pick'
;
