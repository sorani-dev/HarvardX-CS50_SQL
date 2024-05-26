-- Good day to you, deliverer of the mail. 
-- You might remember that not too long ago I made my way over from 
-- the town of Fiftyville. 
-- I gave a certain box into your reliable hands 
-- and asked you to keep things low. My associate has been expecting 
-- the package for a while now. And yet, it appears to have grown wings 
-- and flown away. Ha! Any chance you could help clarify this mystery? 
-- Afraid there’s no “From” address. 
-- It’s the kind of parcel that would add a bit more… quack 
-- to someone’s bath times, if you catch my drift.
SELECT *
FROM scans
WHERE scans.package_id IN (
        SELECT packages.id
        FROM packages
        WHERE packages.contents = "Rubber duck"
    )
and scans.action = 'Pick';
---
SELECT a.id AS "Address ID",
    a.address AS "To Address",
    a.type AS "Ending Address Type",
    p.contents,
    s.*
FROM addresses AS a -- Go to the package table by the address sid
    INNER JOIN packages p ON p.from_address_id = a.id -- Go to the end adress by its id
    INNER JOIN scans s ON s.package_id = p.id
WHERE p.contents = "Rubber duck"
ORDER BY s.timestamp DESC;
SELECT id
FROM packages
WHERE packages.contents = "Rubber duck";
SELECT *
FROM scans
WHERE scans.package_id IN (
        128,
        492,
        738,
        848,
        1108,
        1116,
        1378,
        1405,
        1486,
        1635,
        1734,
        2210,
        2218,
        2627,
        2681,
        2753,
        2930,
        2953,
        3060,
        3160,
        3164,
        3616,
        4033,
        4273,
        4809,
        4990,
        5001,
        5489,
        5509,
        5831,
        5902,
        5989,
        6075,
        6191,
        6278,
        6438,
        6486,
        7013,
        7180,
        7207,
        7553,
        7603,
        7722,
        7838,
        8002,
        8348,
        9297,
        9318,
        9497,
        9612
    )
ORDER by scans.timestamp,
    scans.address_id;
SELECT a.id AS "Address ID",
    a.address AS "To Address",
    a.type AS "Ending Address Type",
    p.contents,
    s.*
FROM addresses AS a -- Go to the package table by the address sid
    INNER JOIN packages p ON p.from_address_id = a.id -- Go to the end adress by its id
    INNER JOIN scans s ON s.package_id = p.id
WHERE p.contents = "Rubber duck"
    AND s.action = 'Drop'
ORDER BY s.timestamp DESC;
SELECT a.id AS "Address ID",
    a.address AS "To Address",
    a.type AS "Ending Address Type",
    p.contents,
    s.timestamp
FROM addresses AS a -- Go to the package table by the address sid
    INNER JOIN packages p ON p.from_address_id = a.id -- Go to the end adress by its id
    INNER JOIN scans s ON s.package_id = p.id
WHERE p.contents = "Rubber duck"
    AND s.action = 'Pick'
ORDER BY s.timestamp DESC;
