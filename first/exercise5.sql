/* person(id, name, gender, birthdate, deathdate, height)
movie(id, title, year, color, country, language, releaseDate, ...)
genre(genre, category)
movie genre(movieId, genre)
role(role)
involved(personId, movieId, role */

/* Of all the movies produced in 2001, there are 10 that have only one actor involved in
them. How many movies produced in 2005 have only two actors involved in them? */

select count(*)
from(    
    select count( m.id)
    from movie m
    join involved i on i.movieId = m.id
    where m.year = 2005 and i.role = 'actor'
    group by m.id
    having count(i.role) = 2
    ) as tmp;

