USE netflix_db;

-- 1. Count the number of Movies vs TV Shows
SELECT 
	SUM(CASE WHEN n.type_ = 'TV Show' THEN 1 ELSE 0 END) AS TV_show,
    SUM(CASE WHEN n.type_ = 'Movie' THEN 1 ELSE 0 END) AS Movie
FROM netflix AS n;

SELECT 
	n.type_,
	COUNT(*) AS Total
FROM netflix AS n
GROUP BY n.type_; /*RIFERIMENTI NUMERICI NELLA SELECT*/

-- 2. Find the most common rating for movies and TV shows
WITH count_ratings AS (
	SELECT 
		n.type_, 
		n.rating,
		COUNT(*) AS count_rating
	FROM netflix AS n
	GROUP BY n.type_, n.rating
)

SELECT c.type_, c.rating
FROM count_ratings as c
WHERE c.count_rating = (
	SELECT MAX(c1.count_rating)
    FROM count_ratings AS c1
    WHERE c.type_ = c1.type_
);

-- 3. List all movies released in a specific year (e.g., 2020)
SELECT n.title
FROM netflix AS n
WHERE release_year = 2020;

-- 4. Percentile di durata dei film per rating (usando window function) => “Quanto è lungo questo film rispetto ai suoi simili?”
SELECT
	n.title,
    n.rating,
    CAST(SUBSTRING_INDEX(n.duration, ' ',1) AS UNSIGNED) AS duration,
    PERCENT_RANK() OVER (PARTITION BY n.rating ORDER BY CAST(SUBSTRING_INDEX(n.duration, ' ',1) AS UNSIGNED)) AS percentile
FROM netflix AS n
WHERE n.type_ = 'Movie'
ORDER BY n.rating, percentile DESC
LIMIT 20;

-- 5. Identify the longest movie
WITH longest_movie AS (
	SELECT
		n.show_id,
        n.title,
		CAST(SUBSTRING_INDEX(n.duration, ' ',1) AS UNSIGNED) AS duration
    FROM netflix AS n
    WHERE n.type_ = 'Movie'
)

SELECT 
	lm.show_id,
	lm.title,
	lm.duration
FROM longest_movie AS lm
WHERE lm.duration = (
	SELECT MAX(l.duration)
    FROM longest_movie AS l
);

-- 6. Find content added in the last 5 years
SELECT 
	n.title,
    n.date_added
FROM netflix AS n
WHERE DATE(STR_TO_DATE(n.date_added, '%M %d, %Y')) >= DATE_SUB(CURDATE(), INTERVAL 5 YEAR);

-- 7. Find all the movies/TV shows by director 'Rajiv Chilaka'!
SELECT
	n.title,
    n.director
FROM netflix AS n
WHERE n.director LIKE '%Rajiv Chilaka%';

-- 8. List all TV shows with more than 5 seasons
SELECT 
	n.title,
    n.type_,
    n.duration,
    CAST(SUBSTRING_INDEX(n.duration, ' ',1) AS UNSIGNED) AS seasons
FROM netflix AS n
WHERE CAST(SUBSTRING_INDEX(n.duration, ' ',1) AS UNSIGNED) >= 5 AND n.type_ = 'TV Show'
ORDER BY seasons;

-- 9. Cumulative count di contenuti per anno (running total)
SELECT
	n.release_year,
    COUNT(*) AS content_x_year,
    SUM(COUNT(*)) OVER (ORDER BY n.release_year) AS cumulative_count
FROM netflix AS n
GROUP BY n.release_year
ORDER BY n.release_year;
/*10.
Categorizza tutti i contenuti Netflix in base al testo della loro descrizione:

Etichetta come "Violent" i contenuti che contengono le parole chiave kill o violence.

Etichetta come "Romantic" i contenuti che contengono le parole chiave love o romance.

Tutti gli altri contenuti etichettali come "Other".

Restituisci per ciascuna categoria il numero totale di contenuti.
*/ 
SELECT 
    CASE
		WHEN n.description_ REGEXP 'kill|violence' THEN 'Violent'
        WHEN n.description_ REGEXP 'love|romantic' THEN 'Romantic'
		ELSE 'Other' END AS content_type,
	COUNT(*) AS total
FROM netflix AS n
GROUP BY content_type;

-- 11. List all movies that are documentaries
SELECT *
FROM netflix
WHERE type_='Movie' AND listed_in LIKE '%Documentaries%';

-- 12. Find all content without a director
SELECT *
FROM netflix
WHERE director IS NULL OR director='';

-- 13. Find how many movies actor 'Salman Khan' appeared in last 10 years!
SELECT
    SUM(CASE 
			WHEN n.cast_ LIKE '%Salman Khan%' 
            AND n.release_year >= YEAR(CURDATE()) - 10
			THEN 1 
            ELSE 0 
		END
	) AS total_movies
FROM netflix AS n;

-- 14. Raggruppamento per primo carattere del titolo (GROUPING SETS style)
SELECT 
	LEFT(n.title, 1) AS primo_char,
    COUNT(*) AS totale
FROM netflix AS n
GROUP BY primo_char
ORDER BY totale DESC;

-- 15. Contenuti con lunghezza del titolo sopra la media
SELECT 
    n.title,
    CHAR_LENGTH(n.title) AS title_length
FROM netflix AS n
WHERE CHAR_LENGTH(n.title) > (
    SELECT AVG(CHAR_LENGTH(title)) 
    FROM netflix
);
	
        