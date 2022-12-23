-- Quality for Customer
SELECT COUNT(*) FROM dvdrental.dtlk_raw.customer WHERE store_id IS NULL OR first_name IS NULL OR last_name IS NULL OR email IS NULL OR address_id IS NULL OR activebool IS NULL OR create_date IS NULL OR last_update IS NULL OR active IS NULL;

DROP TABLE IF EXISTS dvdrental.dtlk_quality.customer;
CREATE TABLE dvdrental.dtlk_quality.customer AS SELECT * FROM dvdrental.dtlk_raw.customer WHERE store_id IS NOT NULL AND first_name IS NOT NULL AND last_name IS NOT NULL AND email IS NOT NULL AND address_id IS NOT NULL AND activebool IS NOT NULL AND create_date IS NOT NULL AND last_update IS NOT NULL AND active IS NOT NULL;