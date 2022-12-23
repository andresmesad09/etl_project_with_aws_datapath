-- Quality for City
SELECT COUNT(*) FROM dvdrental.dtlk_raw.city WHERE city IS NULL OR country_id IS NULL OR last_update IS NULL;

DROP TABLE IF EXISTS dvdrental.dtlk_quality.city;
CREATE TABLE dvdrental.dtlk_quality.city AS SELECT * FROM dvdrental.dtlk_raw.city WHERE city IS NOT NULL AND country_id IS NOT NULL AND last_update IS NOT NULL;