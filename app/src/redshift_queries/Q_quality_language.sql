-- Quality for Language
SELECT COUNT(*) FROM dvdrental.dtlk_raw.language WHERE name IS NULL OR last_update IS NULL;

DROP TABLE IF EXISTS dvdrental.dtlk_quality.language;
CREATE TABLE dvdrental.dtlk_quality.language AS SELECT * FROM dvdrental.dtlk_raw.language WHERE name IS NOT NULL AND last_update IS NOT NULL;