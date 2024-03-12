/* person(id, name, gender, birthdate, deathdate, height)
movie(id, title, year, color, country, language, releaseDate, ...)
genre(genre, category)
movie genre(movieId, genre)
role(role)
involved(personId, movieId, role */

/* Of all the movies produced in 2007, there are 325 that have entries registered in
involved for all roles defined in the roles relation. How many movies produced in
2004 have entries registered in involved for all roles defined in the roles relation?
Note: This is a relational division query that must work for any instance; Do not use
any ‘magic numbers’.  */



select count(*)
from (
    select m.id
    from movie m
    join involved i on i.movieId = m.id
    where m.year = 2004
    group by m.id
    having count(distinct role) = (
            select count(*) role
            from role
    )
) tmp;