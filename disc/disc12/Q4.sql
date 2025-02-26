 CREATE TABLE original AS
    SELECT 1 AS n, "It's" AS word UNION
    SELECT 2, "The" UNION
    SELECT 3 , "End";
 
 CREATE TABLE code AS
    SELECT "Up" AS x, "Down" AS y UNION
    SELECT "Now", "Home" UNION
    SELECT "It's" , "What" UNION
    SELECT "See", "Do" UNION
    SELECT "Can", "See" UNION
    SELECT "End", "Now" UNION
    SELECT "What" , "You" UNION
    SELECT "The", "Happens" UNION
    SELECT "Love" , "Scheme" UNION
    SELECT "Not", "Mess" UNION
    SELECT "Happens", "Go";

-- Part A
SELECT c.y
from original o
left join code c on c.x=o.word
order by o.n;


-- Part B
SELECT cc.y
from original o
left join code c on c.x=o.word
left join code cc on cc.x=c.y
order by o.n;




