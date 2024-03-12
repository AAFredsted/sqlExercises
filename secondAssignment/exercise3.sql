/*
continents(Continent)
countries(Code, Name, Region, ..., Population, ...)
countries_continents(CountryCode, Continent, Percentage)
cities(ID, Name, CountryCode, District, Population)
empires(CountryCode, Empire)
countries_languages(CountryCode, Language, IsOfficial, Percentage)
*/

/*
In the countries of North America that have more than 80 million inhabitants, there
are a total of 111,946,176 people who speak Spanish, according to the statistics in
the database. How many people who speak Spanish exist in the countries of Europe
that have more than 50 million inhabitants?
*/

SELECT ROUND(SUM(c.Population * (cl.Percentage/100.0))) AS Percentage_Spanish_NA
FROM countries as c
JOIN countries_languages 
    AS cl ON c.Code = cl.CountryCode
JOIN countries_continents 
    AS cc ON c.Code = cc.CountryCode
WHERE c.Population > 80000000
        AND cc.Continent = 'North America'
        AND cl.Language = 'Spanish';

SELECT ROUND(SUM(c.Population * (cl.Percentage/100.0))) AS Percentage_Spanish_EU
FROM countries as c
JOIN countries_languages 
    AS cl ON c.Code = cl.CountryCode
JOIN countries_continents 
    AS cc ON c.Code = cc.CountryCode
WHERE c.Population > 50000000
        AND cc.Continent = 'Europe'
        AND cl.Language = 'Spanish';