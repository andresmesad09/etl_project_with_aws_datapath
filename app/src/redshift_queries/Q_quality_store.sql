-- Quality for Store
SELECT COUNT(*) FROM dvdrental.dtlk_raw.store WHERE manager_staff_id IS NULL OR address_id IS NULL OR last_update IS NULL;

DROP TABLE IF EXISTS dvdrental.dtlk_quality.store;
CREATE TABLE dvdrental.dtlk_quality.store AS SELECT * FROM dvdrental.dtlk_raw.store WHERE manager_staff_id IS NOT NULL AND address_id IS NOT NULL AND last_update IS NOT NULL;