/* person(id, name, gender, birthdate, deathdate, height)
movie(id, title, year, color, country, language, releaseDate, ...)
genre(genre, category)
movie genre(movieId, genre)
role(role)
involved(personId, movieId, role */

/* The number of people who have played a role in movies of all genres in the category
‘Newsworthy’ is 156. How many people have played a role in movies of all genres in
the category ‘Popular’ ? */


select count(*)
from (
    select distinct i.personId
    from involved i
    join movie m on m.id = i.movieId
    join movie_genre mg on mg.movieId = m.id
    join genre g on g.genre = mg.genre
    where g.category = 'Popular'
    group by i.personId
    having count (distinct g.genre) = (select count(distinct gi.genre)
                                         from genre gi
                                         where gi.category = 'Popular')
    ) tmp;
