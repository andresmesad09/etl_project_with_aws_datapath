-- Quality for Film
SELECT COUNT(*) FROM dvdrental.dtlk_raw.film WHERE title IS NULL OR description IS NULL OR rating IS NULL OR language_id IS NULL;

DROP TABLE IF EXISTS dvdrental.dtlk_quality.film;
CREATE TABLE dvdrental.dtlk_quality.film AS SELECT * FROM dvdrental.dtlk_raw.film WHERE title IS NOT NULL AND description IS NOT NULL AND rating IS NOT NULL AND language_id IS NOT NULL;