-- AVAILABLE

CREATE VIEW available AS
SELECT
    L.id,
    L.property_type,
    L.host_name,
    A.date
FROM listings AS L
JOIN availabilities AS A ON A.listing_id = L.id
WHERE A.available = 'TRUE'
ORDER BY L.id, A.date;


-- FREQUENT REVIEWED


CREATE VIEW "frequently_reviewed" AS
SELECT
    L.id,
    L.property_type,
    L.host_name,
    L.accommodates,
    COUNT(R.id) AS reviews
FROM listings L
JOIN reviews R ON R.listing_id = L.id
GROUP BY
    L.id,
    L.property_type,
    L.host_name,
    L.accommodates

HAVING COUNT(R.id) >= 0
ORDER BY COUNT(R.id) DESC, L.property_type DESC, L.host_name DESC;


-- JUNE VANCATION 

CREATE VIEW "june_vacancies" AS
    SELECT listings.id, listings.property_type,
    listings.host_name, listings.accommodates, SUM(reviews.listing_id)
    FROM listings
    LEFT JOIN reviews ON reviews.listing_id = listings.id
    GROUP BY reviews.listing_id


-- ONE BEDROOM 

  CREATE VIEW "one_bedrooms" AS
    SELECT "id", "property_type", "host_name", "accommodates"
    FROM "listings"
    WHERE "bedrooms" = 1


  
  -- NO DESC

CREATE VIEW "no_descriptions" AS
    SELECT "id", "property_type", "host_name", "accommodates", "bedrooms"
    FROM "listings"


-- 
