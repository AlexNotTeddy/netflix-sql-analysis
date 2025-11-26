USE netflix_db;
CREATE TABLE IF NOT EXISTS netflix
(
    show_id      VARCHAR(5),
    type_         VARCHAR(10),
    title        VARCHAR(250),
    director     VARCHAR(550),
    cast_        VARCHAR(1050),
    country      VARCHAR(550),
    date_added   VARCHAR(55),
    release_year INT,
    rating       VARCHAR(15),
    duration     VARCHAR(15),
    listed_in    VARCHAR(250),
    description_  VARCHAR(550)
);		
					   
LOAD DATA LOCAL INFILE 'C:/Users/ASUS/Documents/Polimi/Extra Skills/Data Scientist/Progetti/Netflix Data Analysis Using SQL/netflix_titles.csv'
INTO TABLE netflix
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(show_id, type_, title, director, cast_, country, date_added, release_year, rating, duration, listed_in, description_);

SELECT * FROM netflix;