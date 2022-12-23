-- Quality for Rental
SELECT COUNT(*) FROM dvdrental.dtlk_raw.rental WHERE rental_date IS NULL OR inventory_id IS NULL OR customer_id IS NULL OR return_date IS NULL OR staff_id IS NULL OR last_update IS NULL;

DROP TABLE IF EXISTS dvdrental.dtlk_quality.rental;
CREATE TABLE dvdrental.dtlk_quality.rental AS SELECT * FROM dvdrental.dtlk_raw.rental WHERE rental_date IS NOT NULL AND inventory_id IS NOT NULL AND customer_id IS NOT NULL AND return_date IS NOT NULL AND staff_id IS NOT NULL AND last_update IS NOT NULL;