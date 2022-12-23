-- Quality for Country
SELECT COUNT(*) FROM dvdrental.dtlk_raw.country WHERE country IS NULL OR last_update IS NULL;

DROP TABLE IF EXISTS dvdrental.dtlk_quality.country;
CREATE TABLE dvdrental.dtlk_quality.country AS SELECT * FROM dvdrental.dtlk_raw.country WHERE country IS NOT NULL AND last_update IS NOT NULL;