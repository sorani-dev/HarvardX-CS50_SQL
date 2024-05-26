CREATE VIEW IF NOT EXISTS "available" AS
SELECT listings.id,
    listings.property_type,
    listings.host_name,
    availabilities.date
FROM "availabilities"
    INNER JOIN "listings" ON listings.id = availabilities.listing_id;
