-- *** The Lost Letter ***
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
SELECT a.address AS "From Address",
    to_a.address AS "To Address",
    to_a.type AS "Ending Address Type"
FROM addresses AS a -- Go to the package table by the address sid
    INNER JOIN packages p ON p.from_address_id = a.id -- Go to the end adress by its id
    INNER JOIN addresses to_a ON to_a.id = p.to_address_id --  Start address in addresses
WHERE a.address = "900 Somerville Avenue" -- Letter type (packages.content)
    AND p.contents = "Congratulatory letter";
-- *** The Devious Delivery ***
SELECT a.address AS "from", adr.address AS "to", adr.type,  packages.contents
FROM packages
    INNER JOIN addresses a ON a.id = packages.from_address_id
    INNER JOIN addresses adr ON adr.id = packages.to_address_id
WHERE a.address = '109 Tileston Street'
AND adr.address =  '728 Maple Place';


-- *** The Forgotten Gift ***
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
