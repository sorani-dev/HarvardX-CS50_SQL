-- count the number of unique episode titles.
SELECT count(title)
FROM (
        SELECT DISTINCT title
        FROM episodes
    );
