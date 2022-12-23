-- Quality for Inventory
SELECT COUNT(*) FROM dvdrental.dtlk_raw.inventory WHERE film_id IS NULL OR store_id IS NULL OR last_update IS NULL;

DROP TABLE IF EXISTS dvdrental.dtlk_quality.inventory;
CREATE TABLE dvdrental.dtlk_quality.inventory AS SELECT * FROM dvdrental.dtlk_raw.inventory WHERE film_id IS NOT NULL AND store_id IS NOT NULL AND last_update IS NOT NULL;