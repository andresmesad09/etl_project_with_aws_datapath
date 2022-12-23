-- Quality for Category
SELECT COUNT(*) FROM dvdrental.dtlk_raw.category WHERE name IS NULL OR last_update IS NULL;

DROP TABLE IF EXISTS dvdrental.dtlk_quality.category;
CREATE TABLE dvdrental.dtlk_quality.category AS SELECT * FROM dvdrental.dtlk_raw.category WHERE name IS NOT NULL AND last_update IS NOT NULL;


