-- Quality for Actor
SELECT COUNT(*) FROM dvdrental.dtlk_raw.actor WHERE first_name IS NULL OR last_name IS NULL OR last_update IS NULL;

DROP TABLE IF EXISTS dvdrental.dtlk_quality.actor;
CREATE TABLE dvdrental.dtlk_quality.actor AS SELECT * FROM dvdrental.dtlk_raw.actor WHERE first_name IS NOT NULL AND last_name IS NOT NULL AND last_update IS NOT NULL;