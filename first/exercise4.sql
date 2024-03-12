/* person(id, name, gender, birthdate, deathdate, height)
movie(id, title, year, color, country, language, releaseDate, ...)
genre(genre, category)
movie genre(movieId, genre)
role(role)
involved(personId, movieId, role */

/* According to the information in the database, 52 different people acted in movies
directed by ‘Ingmar Bergman’. How many different people acted in movies directed
by ‘Akira Kurosawa’ ? */

select count(distinct i.personId)
from involved i
where i.role = 'actor' and i.movieId in 
    (
        select distinct i.movieId
        from involved i
        join person p on p.id = i.personId
        where i.role = 'director' and p.name = 'Akira Kurosawa'
    )

