-- Quality for Staff
SELECT COUNT(*) FROM dvdrental.dtlk_raw.staff WHERE first_name IS NULL OR last_name IS NULL OR store_id IS NULL OR last_update IS NULL OR active IS NULL OR email IS NULL;

DROP TABLE IF EXISTS dvdrental.dtlk_quality.staff;
CREATE TABLE dvdrental.dtlk_quality.staff AS SELECT * FROM dvdrental.dtlk_raw.staff WHERE first_name IS NOT NULL AND last_name IS NOT NULL AND last_update IS NOT NULL AND store_id IS NOT NULL AND active IS NOT NULL AND email IS NOT NULL;