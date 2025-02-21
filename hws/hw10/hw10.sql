CREATE TABLE parents AS
  SELECT "abraham" AS parent, "barack" AS child UNION
  SELECT "abraham"          , "clinton"         UNION
  SELECT "delano"           , "herbert"         UNION
  SELECT "fillmore"         , "abraham"         UNION
  SELECT "fillmore"         , "delano"          UNION
  SELECT "fillmore"         , "grover"          UNION
  SELECT "eisenhower"       , "fillmore";

CREATE TABLE dogs AS
  SELECT "abraham" AS name, "long" AS fur, 26 AS height UNION
  SELECT "barack"         , "short"      , 52           UNION
  SELECT "clinton"        , "long"       , 47           UNION
  SELECT "delano"         , "long"       , 46           UNION
  SELECT "eisenhower"     , "short"      , 35           UNION
  SELECT "fillmore"       , "curly"      , 32           UNION
  SELECT "grover"         , "short"      , 28           UNION
  SELECT "herbert"        , "curly"      , 31;

CREATE TABLE sizes AS
  SELECT "toy" AS size, 24 AS min, 28 AS max UNION
  SELECT "mini"       , 28       , 35        UNION
  SELECT "medium"     , 35       , 45        UNION
  SELECT "standard"   , 45       , 60;


-- Q1
-- All dogs with parents ordered by decreasing height of their parent
CREATE TABLE by_parent_height AS
  SELECT  p.child from dogs d
  left join parents p on p.parent=d.name
  where p.child is not null
  order by d.height desc;


-- Q2
-- The size of each dog
CREATE TABLE size_of_dogs AS
  SELECT d.name ,s.size from dogs d
  cross join sizes s
  where d.height<=s.max and d.height>s.min 
  order by d.name;


-- Q3
-- Filling out this helper table is optional
CREATE TABLE siblings AS
  SELECT p1.child as elder, p2.child as younger from parents p1
  cross join parents p2
  where 
    p1.parent=p2.parent and 
    p1.child is not p2.child and
    p1.child <p2.child
  ;

-- Sentences about siblings that are the same size
CREATE TABLE sentences AS
  SELECT 
  "The two siblings, "||s.elder ||" and "|| s.younger||", have the same size: "||sod1.size
  from siblings s
  left join size_of_dogs sod1 on sod1.name=s.elder 
  left join size_of_dogs sod2 on sod2.name=s.younger
  where sod1.size=sod2.size
  ;



-- Q4
-- Height range for each fur type where all of the heights differ by no more than 30% from the average height
CREATE TABLE low_variance AS
  SELECT fur, max(height)- min(height)
  from dogs
  group by fur 
  having max(height)<= 1.3 * avg(height)
    and min(height)>=0.7 * avg(height);

