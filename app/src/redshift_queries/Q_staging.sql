-- Staging for DvdRental
DROP TABLE IF EXISTS dvdrental.dtlk_staging.dvdrentalstage;
CREATE TABLE dvdrental.dtlk_staging.dvdrentalstage AS 
SELECT R.rental_id,R.customer_id,I.inventory_id,I.film_id,I.store_id,P.amount,P.payment_date
FROM dvdrental.dtlk_access.rental R
LEFT JOIN dvdrental.dtlk_access.inventory I
ON R.inventory_id = I.inventory_id
LEFT JOIN dvdrental.dtlk_access.payment P
ON R.rental_id = P.rental_id