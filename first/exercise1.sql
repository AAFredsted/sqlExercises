/* person(id, name, gender, birthdate, deathdate, height)
movie(id, title, year, color, country, language, releaseDate, ...)
genre(genre, category)
movie genre(movieId, genre)
role(role)
involved(personId, movieId, role */

/* The person relation contains 284 entries with a registered death date after ‘2010-02-
01’. How many entries do not have a registered death date? */

select count(*)
from (
select id
from person
where deathdate is null
) tmp;