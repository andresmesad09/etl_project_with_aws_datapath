-- Quality for Film_Actor
SELECT COUNT(*) FROM dvdrental.dtlk_raw.film_actor WHERE last_update IS NULL;

DROP TABLE IF EXISTS dvdrental.dtlk_quality.film_actor;
CREATE TABLE dvdrental.dtlk_quality.film_actor AS SELECT * FROM dvdrental.dtlk_raw.film_actor WHERE last_update IS NOT NULL;