CREATE TABLE pizzas AS
  SELECT "Artichoke" AS name, 12 AS open, 15 AS close UNION
  SELECT "La Val's"         , 11        , 22          UNION
  SELECT "Sliver"           , 11        , 20          UNION
  SELECT "Cheeseboard"      , 16        , 23          UNION
  SELECT "Emilia's"         , 13        , 18;

CREATE TABLE meals AS
  SELECT "breakfast" AS meal, 11 AS time UNION
  SELECT "lunch"            , 13         UNION
  SELECT "dinner"           , 19         UNION
  SELECT "snack"            , 22;


--Q1
CREATE TABLE opening as
    select name from pizzas
    where open <13
    order by name desc;


--Q2
CREATE TABLE study as
    select name, max(0,14-open) as duration from pizzas
    order by max(0,14-open);


--Q3
-- Pizza places that are open for late-night-snack time and when they close
CREATE TABLE late as
  SELECT p.name || " closes at " || p.close AS status
  FROM pizzas p
  WHERE p.close>=(select time from meals where meal="snack");


--Q4
-- Two meals at the same place
CREATE TABLE double as
  SELECT a.meal AS first, b.meal AS second, name
  FROM meals AS a, meals AS b, pizzas
  WHERE b.time-a.time>6 
    and open<=a.time and a.time<=close
    and close>=b.time and open<=b.time;