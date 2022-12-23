-- Quality for Payment
SELECT COUNT(*) FROM dvdrental.dtlk_raw.payment WHERE customer_id IS NULL OR staff_id IS NULL OR rental_id IS NULL OR amount IS NULL OR payment_date IS NULL;

DROP TABLE IF EXISTS dvdrental.dtlk_quality.payment;
CREATE TABLE dvdrental.dtlk_quality.payment AS SELECT * FROM dvdrental.dtlk_raw.payment WHERE customer_id IS NOT NULL AND staff_id IS NOT NULL AND rental_id IS NOT NULL AND amount IS NOT NULL AND payment_date IS NOT NULL;