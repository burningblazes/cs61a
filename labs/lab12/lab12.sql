CREATE TABLE finals AS
  SELECT "RSF" AS hall, "61A" as course UNION
  SELECT "Wheeler"    , "61A"           UNION
  SELECT "Pimentel"   , "61A"           UNION
  SELECT "Li Ka Shing", "61A"           UNION
  SELECT "Stanley"    , "61A"           UNION
  SELECT "RSF"        , "61B"           UNION
  SELECT "Wheeler"    , "61B"           UNION
  SELECT "Morgan"     , "61B"           UNION
  SELECT "Wheeler"    , "61C"           UNION
  SELECT "Pimentel"   , "61C"           UNION
  SELECT "Soda 310"   , "61C"           UNION
  SELECT "Soda 306"   , "10"            UNION
  SELECT "RSF"        , "70";

CREATE TABLE sizes AS
  SELECT "RSF" AS room, 900 as seats    UNION
  SELECT "Wheeler"    , 700             UNION
  SELECT "Pimentel"   , 500             UNION
  SELECT "Li Ka Shing", 300             UNION
  SELECT "Stanley"    , 300             UNION
  SELECT "Morgan"     , 100             UNION
  SELECT "Soda 306"   , 80              UNION
  SELECT "Soda 310"   , 40              UNION
  SELECT "Soda 320"   , 30;


-- Q1
CREATE TABLE sharing AS
  SELECT a.course, COUNT(DISTINCT a.hall) AS shared
    FROM finals AS a, finals AS b
    WHERE a.course is not b.course and a.hall=b.hall
    GROUP BY a.course;


-- Q2
CREATE TABLE pairs AS
  SELECT s1.room||" and "||s2.room||" together have "|| (s1.seats+s2.seats)||" seats"
  from sizes s1
  cross join sizes s2
  where s1.room<s2.room
    and s1.seats+s2.seats>=1000
  order by s1.seats+s2.seats desc
  ;


-- Q3
CREATE TABLE big AS
  SELECT course
  from finals f
  left join sizes s on s.room=f.hall
  group by course
  having sum(seats)>=1000
  ;



CREATE TABLE remaining AS
  SELECT course, sum(seats)-max(seats) as remaining
  from finals f
  left join sizes s on s.room=f.hall
  group by course
  ;

