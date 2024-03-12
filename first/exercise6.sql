/* person(id, name, gender, birthdate, deathdate, height)
movie(id, title, year, color, country, language, releaseDate, ...)
genre(genre, category)
movie genre(movieId, genre)
role(role)
involved(personId, movieId, role */

/* In the database, there are 92 cases where a specific actor and director have collabo-
rated in more than 10 movies. How many are the cases where a specific actor and
director collaborated in more than 15 movies? */


select count(*)
from (
    select distinct i1.personId
    from involved as i1
        join involved as i2 on i1.movieId = i2.movieId and i1.personId <> i2.personId
        where  i1.role = 'director' and i2.role = 'actor'
        group by i1.personId, i2.personId
        having count(i1.personId) > 15
) tmp;
