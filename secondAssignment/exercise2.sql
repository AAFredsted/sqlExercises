SELECT COUNT(*) as NumCountries
FROM (
    SELECT COUNT(CountryCode)
    FROM countries_continents
    GROUP BY CountryCode
    HAVING  COUNT( DISTINCT Continent ) > 1
) AS subquery;

SELECT Count(cc.CountryCode)
FROM countries_continents as cc 
WHERE cc.Continent = 'Asia' AND cc.CountryCode IN (
    SELECT cc2.CountryCode 
    FROM countries_continents as cc2
    WHERE cc2.Continent <> 'Asia'
);
