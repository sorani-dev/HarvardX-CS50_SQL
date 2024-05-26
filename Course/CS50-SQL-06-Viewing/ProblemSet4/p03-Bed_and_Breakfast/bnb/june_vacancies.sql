CREATE VIEW IF NOT EXISTS june_vacancies AS
SELECT "id",
    "property_type",
    "host_name",
    COUNT("listing_id")
FROM (
        SELECT "listings"."id",
            "property_type",
            "host_name",
            "listing_id"
        FROM "listings"
            INNER JOIN "availabilities" ON "availabilities"."listing_id" = "listings".id
        WHERE strftime("%Y-%m", "availabilities".date) == '2023-06'
            AND "availabilities"."available" = 'TRUE'
    )
GROUP BY "id";
