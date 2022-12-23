-- Quality for Film_Category
SELECT COUNT(*) FROM dvdrental.dtlk_raw.film_category WHERE last_update IS NULL;

DROP TABLE IF EXISTS dvdrental.dtlk_quality.film_category;
CREATE TABLE dvdrental.dtlk_quality.film_category AS SELECT * FROM dvdrental.dtlk_raw.film_category WHERE last_update IS NOT NULL;
