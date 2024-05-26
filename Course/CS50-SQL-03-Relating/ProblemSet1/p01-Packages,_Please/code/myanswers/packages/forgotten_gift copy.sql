-- Oh, excuse me, Clerk. I had sent a mystery gift, you see, 
-- to my wonderful granddaughter, off at 728 Maple Place. 
-- That was about two weeks ago. 
-- Now the delivery date has passed by seven whole days and 
-- I hear she still waits, her hands empty and heart filled with anticipation. 
-- I’m a bit worried wondering where my package has gone. 
-- I cannot for the life of me remember what’s inside, 
-- but I do know it’s filled to the brim with my love for her. 
-- Can we possibly track it down so it can fill her day with joy? 
-- I did send it from my home at 109 Tileston Street.
SELECT *
FROM addresses
WHERE addresses.address = '109 Tileston Street';

SELECT a.id, a.address AS "from", adr.address AS "to",  packages.*
FROM packages
    INNER JOIN addresses a ON a.id = packages.from_address_id
    INNER JOIN addresses adr ON adr.id = packages.to_address_id
WHERE a.address = '109 Tileston Street'
AND adr.address =  '728 Maple Place';

SELECT *
FROM addresses
WHERE addresses.address = '728 Maple Place';

SELECT a.address AS "from", adr.address AS "to",  packages.contents
FROM packages
    INNER JOIN addresses a ON a.id = packages.from_address_id
    INNER JOIN addresses adr ON adr.id = packages.to_address_id
WHERE a.address = '109 Tileston Street'
AND adr.address =  '728 Maple Place';
