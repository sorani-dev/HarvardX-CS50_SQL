CREATE VIEW IF NOT EXISTS frequently_reviewed AS
SELECT listings.id,
    listings.property_type,
    listings.host_name,
    COUNT(reviews.id) AS reviews
FROM reviews
    INNER JOIN listings ON listings.id = reviews.listing_id
GROUP BY listings.id
ORDER BY reviews DESC,
    property_type,
    host_name
LIMIT 100;
