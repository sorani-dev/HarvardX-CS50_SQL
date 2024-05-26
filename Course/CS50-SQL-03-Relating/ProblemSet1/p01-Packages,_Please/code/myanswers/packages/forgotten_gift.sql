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
SELECT p.contents, s.timestamp, a.address AS "From address", to_a.address AS "To Address", s.action, d.name
FROM addresses AS a
INNER JOIN packages p ON p.from_address_id = a.id
INNER JOIN scans s ON s.package_id = p.id
INNER JOIN drivers d ON d.id = s.driver_id
INNER JOIN addresses to_a ON to_a.id = p.to_address_id
WHERE a.address = "109 Tileston Street"
AND to_a.address = "728 Maple Place"
;

SELECT a.id AS "From address ID", a.address AS "From address", to_a.id AS "To address ID",  to_a.address AS "To Address", s.action, s.timestamp, d.name
FROM addresses AS a
INNER JOIN packages p ON p.from_address_id = a.id
INNER JOIN scans s ON s.package_id = p.id
INNER JOIN drivers d ON d.id = s.driver_id
INNER JOIN addresses to_a ON to_a.id = p.to_address_id
WHERE a.address = "109 Tileston Street"
AND to_a.address = "728 Maple Place"

;

SELECT scans.*, strftime("%Y-%m-%d", scans.timestamp)
FROM scans
WHERE scans.address_id  = 4983
AND strftime("%Y-%m-%d", scans.timestamp) > (SELECT strftime("%Y-%m-%d", scans.timestamp)
FROM scans
WHERE scans.address_id  = 9873)
;
