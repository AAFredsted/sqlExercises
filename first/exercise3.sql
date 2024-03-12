/* person(id, name, gender, birthdate, deathdate, height)
movie(id, title, year, color, country, language, releaseDate, ...)
genre(genre, category)
movie genre(movieId, genre)
role(role)
involved(personId, movieId, role */


/* The movie genre relation does not have a primary key, which can lead to a movie
having more than one entry with the same genre. As a result, there are 14 movies
in movie genre that have the genre ‘Action’ assigned to them more than once. How
many movies in movie genre have the genre ‘Thriller’ assigned to them more than
once? */

select count(*)
from (
    select m.id
    from movie m
    join movie_genre g on g.movieid = m.id
    group by m.id, g.genre 
    having g.genre = 'Thriller' and count(g.genre) > 1
) tmp;