/*
continents(Continent)
countries(Code, Name, Region, ..., Population, ...)
countries_continents(CountryCode, Continent, Percentage)
cities(ID, Name, CountryCode, District, Population)
empires(CountryCode, Empire)
countries_languages(CountryCode, Language, IsOfficial, Percentage)
*/

/*
According to the database, two languages are spoken in all countries of ‘Benelux’.
How many languages are spoken in all countries of ‘Danish Empire’ ?
Note: This is a division query; points will only be awarded if division is attempted.
*/

SELECT COUNT(*) as Languages_Benelux
FROM (
    SELECT cl.Language
    FROM countries_languages as cl
    JOIN empires as e
        ON e.CountryCode = cl.CountryCode
    WHERE e.Empire = 'Benelux'
    GROUP BY cl.Language
    Having COUNT(cl.CountryCode) = (
        SELECT COUNT( DISTINCT e2.CountryCode )
        FROM empires as e2
        WHERE e2.Empire = 'Benelux'
    )
) as Subquery;



SELECT COUNT(*) as Langauges_Danish_Empire
FROM (
    SELECT cl.Language
    FROM countries_languages as cl
    JOIN empires as e
        ON e.CountryCode = cl.CountryCode
    WHERE e.Empire = 'Danish Empire'
    GROUP BY cl.Language
    Having COUNT(cl.CountryCode) = (
        SELECT COUNT( DISTINCT e2.CountryCode )
        FROM empires as e2
        WHERE e2.Empire = 'Danish Empire'
    )
) as Subquery;
