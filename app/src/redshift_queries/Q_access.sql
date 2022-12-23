-- Access for Category
DROP TABLE IF EXISTS dvdrental.dtlk_access.category;
CREATE TABLE dvdrental.dtlk_access.category AS SELECT category_id, name FROM dvdrental.dtlk_quality.category;
-- Access for Film_Category
DROP TABLE IF EXISTS dvdrental.dtlk_access.film_category;
CREATE TABLE dvdrental.dtlk_access.film_category AS SELECT film_id, category_id FROM dvdrental.dtlk_quality.film_category;
-- Access for Film
DROP TABLE IF EXISTS dvdrental.dtlk_access.film;
CREATE TABLE dvdrental.dtlk_access.film AS SELECT film_id, title, release_year, language_id, rental_rate FROM dvdrental.dtlk_quality.film;
-- Access for Language
DROP TABLE IF EXISTS dvdrental.dtlk_access.language;
CREATE TABLE dvdrental.dtlk_access.language AS SELECT language_id, name FROM dvdrental.dtlk_quality.language;
-- Access for Rental
DROP TABLE IF EXISTS dvdrental.dtlk_access.rental;
CREATE TABLE dvdrental.dtlk_access.rental AS SELECT rental_id, customer_id FROM dvdrental.dtlk_quality.rental;
-- Access for Payment
DROP TABLE IF EXISTS dvdrental.dtlk_access.payment;
CREATE TABLE dvdrental.dtlk_access.payment AS SELECT * FROM dvdrental.dtlk_quality.payment;
-- Access for Staff
DROP TABLE IF EXISTS dvdrental.dtlk_access.staff;
CREATE TABLE dvdrental.dtlk_access.staff AS SELECT staff_id, store_id, address_id FROM dvdrental.dtlk_quality.staff;
-- Access for Customer
DROP TABLE IF EXISTS dvdrental.dtlk_access.customer;
CREATE TABLE dvdrental.dtlk_access.customer AS SELECT customer_id, store_id, address_id FROM dvdrental.dtlk_quality.customer;
-- Access for Address
DROP TABLE IF EXISTS dvdrental.dtlk_access.address;
CREATE TABLE dvdrental.dtlk_access.address AS SELECT address_id, city_id FROM dvdrental.dtlk_quality.address;
-- Access for City
DROP TABLE IF EXISTS dvdrental.dtlk_access.city;
CREATE TABLE dvdrental.dtlk_access.city AS SELECT city_id, city, country_id FROM dvdrental.dtlk_quality.city;
-- Access for Country
DROP TABLE IF EXISTS dvdrental.dtlk_access.country;
CREATE TABLE dvdrental.dtlk_access.country AS SELECT country_id, country FROM dvdrental.dtlk_quality.country;
-- Access for Inventory
DROP TABLE IF EXISTS dvdrental.dtlk_access.inventory;
CREATE TABLE dvdrental.dtlk_access.inventory AS SELECT inventory_id, film_id, store_id FROM dvdrental.dtlk_quality.inventory;