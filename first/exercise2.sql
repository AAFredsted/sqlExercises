/* person(id, name, gender, birthdate, deathdate, height)
movie(id, title, year, color, country, language, releaseDate, ...)
genre(genre, category)
movie genre(movieId, genre)
role(role)
involved(personId, movieId, role */

/* in the database, there are 46 movies in the French language for which the average
height of all the people involved is greater than 185 centimeters (ignoring people with
unregistered height). What is the number of movies in the Portuguese language for
which the average height of all people involved is greater than 175 centimeters? */


select count(*)
from (
select m.id
from movie m
join involved i on i.movieid = m.id
join person p on p.id = i.personid
    group by m.id
    having m.language = 'Portuguese' and sum(p.height)/count(p.height) > 175
) tmp;