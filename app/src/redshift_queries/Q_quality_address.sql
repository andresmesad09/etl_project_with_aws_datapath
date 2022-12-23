-- Quality for Address
SELECT COUNT(*) FROM dvdrental.dtlk_raw.address WHERE address IS NULL OR district IS NULL OR city_id IS NULL OR postal_code IS NULL OR phone IS NULL OR last_update IS NULL;

DROP TABLE IF EXISTS dvdrental.dtlk_quality.address;
CREATE TABLE dvdrental.dtlk_quality.address AS SELECT * FROM dvdrental.dtlk_raw.address WHERE address IS NOT NULL AND district IS NOT NULL AND city_id IS NOT NULL AND postal_code IS NOT NULL AND phone IS NOT NULL AND last_update IS NOT NULL;