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
/*
 SELECT a.address AS "From Address",
 to_a.address AS "To Address", to_a.type AS "Ending Address Type", p.contents, s.id, d.name
 FROM addresses AS a -- Go to the package table by the address sid
 INNER JOIN packages p ON p.from_address_id = a.id -- Go to the end adress by its id
 INNER JOIN addresses to_a ON to_a.id = p.to_address_id --  Start address in addresses
 INNER JOIN scans s ON s.package_id = p.id
 INNER JOIN drivers d ON d.id = s.driver_id
 WHERE a.address = "900 Somerville Avenue" -- Letter type (packages.content)
 AND p.contents = "Congratulatory letter";
 */
-- Find address from: 900 Somerville Avenue 
SELECT addresses.id,
    addresses.address AS "from_address",
    addresses.type,
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

-- SELECT *
-- FROM addresses
-- WHERE addresses.id IN (432, 554);

SELECT addresses.id, addresses.address AS "from", addresses.type
FROM addresses
WHERE addresses.id = (
    SELECT packages.from_address_id
FROM packages
WHERE packages.contents = "Congratulatory letter"
);
SELECT addresses.id, addresses.address AS "to", addresses.type
FROM addresses
WHERE addresses.id = (
    SELECT packages.to_address_id
FROM packages
WHERE packages.contents = "Congratulatory letter"
)
;

SELECT addresses.type AS "Type of from address", a.type AS "Type of ending address", packages.contents AS "Contents of package"
FROM addresses
INNER JOIN packages ON packages.from_address_id = addresses.id
INNER JOIN addresses a ON a.id = packages.to_address_id
WHERE packages.contents = "Congratulatory letter"
;

-- SELECT addresses.id, addresses.address AS "from", addresses.type
-- FROM addresses
-- WHERE addresses.id IN (
--     SELECT packages.from_address_id
-- FROM packages
-- WHERE packages.to_address_id IN (
--     SELECT addresses.id, addresses.address AS "from", addresses.type
-- FROM addresses
-- );
-- );

 SELECT  addresses.type, packages.contents
FROM packages
INNER JOIN addresses ON addresses.id = packages.to_address_id
WHERE
packages.from_address_id = (
    SELECT addresses.id
FROM addresses
WHERE addresses.address LIKE "900 Somerville Avenue"
)
AND packages.to_address_id = (
    SELECT addresses.id
FROM addresses
WHERE addresses.address  LIKE "2 F%gan Street"
)
;
SELECT a_to.type, packages.contents
FROM packages
INNER JOIN addresses ON addresses.id = packages.from_address_id
INNER JOIN addresses a_to ON a_to.id = packages.to_address_id
WHERE packages.contents = "Congratulatory letter";

-- OK
SELECT addresses.*, packages.to_address_id, addresses.type, packages.contents, scans.action, drivers.*
FROM packages
INNER JOIN addresses ON addresses.id = packages.to_address_id
INNER JOIN scans ON scans.address_id = addresses.id
INNER JOIN drivers ON drivers.id = scans.driver_id
WHERE
packages.from_address_id = (
    SELECT addresses.id
FROM addresses
WHERE addresses.address LIKE "900 Somerville Avenue"
)
AND packages.to_address_id = (
    SELECT addresses.id
FROM addresses
WHERE addresses.address  LIKE "2 F%gan Street"
)
AND scans.action = 'Pick'
;
-- End OK
