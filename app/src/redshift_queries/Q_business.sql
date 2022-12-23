--top genres - cant transacciones y totalSales
DROP TABLE IF EXISTS dvdrental.dtlk_business.topgenre1;
CREATE TABLE dvdrental.dtlk_business.topgenre1 AS
SELECT T2.name AS Category, COUNT(DISTINCT(T1.rental_id)) AS CantidadTransacciones,SUM(T1.amount) AS TotalSales
FROM dvdrental.dtlk_staging.dvdrentalstage T1
INNER JOIN (SELECT * FROM dvdrental.dtlk_access.film_category FC INNER JOIN dvdrental.dtlk_access.category C ON C.category_id = FC.category_id) T2
ON T1.film_id = T2.film_id
GROUP BY T2.name;
--top genres - cant. usuarios
DROP TABLE IF EXISTS dvdrental.dtlk_business.topgenre2;
CREATE TABLE dvdrental.dtlk_business.topgenre2 AS
SELECT T2.name AS Category, COUNT(DISTINCT(T1.customer_id)) AS CantidadUsuarios
FROM dvdrental.dtlk_staging.dvdrentalstage T1
INNER JOIN (SELECT * FROM dvdrental.dtlk_access.film_category FC INNER JOIN dvdrental.dtlk_access.category C ON C.category_id = FC.category_id) T2
ON T1.film_id = T2.film_id
GROUP BY T2.name;
--top genres - by rental rate mean
DROP TABLE IF EXISTS dvdrental.dtlk_business.topgenre3;
CREATE TABLE dvdrental.dtlk_business.topgenre3 AS
SELECT T2.name AS Category, AVG(T2.rental_rate) as RentalRateMean
FROM dvdrental.dtlk_staging.dvdrentalstage T1
INNER JOIN (SELECT F.film_id,F.rental_rate,C.name FROM dvdrental.dtlk_access.film_category FC INNER JOIN dvdrental.dtlk_access.category C ON C.category_id = FC.category_id INNER JOIN dvdrental.dtlk_access.film F ON FC.film_id = F.film_id) T2
ON T1.film_id = T2.film_id
GROUP BY T2.name;
--top country - sales
DROP TABLE IF EXISTS dvdrental.dtlk_business.topcountry;
CREATE TABLE dvdrental.dtlk_business.topcountry AS
SELECT T2.country,SUM(T1.amount) AS TotalSales
FROM dvdrental.dtlk_staging.dvdrentalstage T1
INNER JOIN (SELECT C.customer_id,Co.country FROM dvdrental.dtlk_access.customer C INNER JOIN dvdrental.dtlk_access.address A ON C.address_id = A.address_id INNER JOIN dvdrental.dtlk_access.city Ci ON Ci.city_id = A.city_id INNER JOIN dvdrental.dtlk_access.country Co ON Co.country_id = Ci.country_id) T2
ON T1.customer_id = T2.customer_id
GROUP BY T2.country;
--top costumers - sales
DROP TABLE IF EXISTS dvdrental.dtlk_business.topcustomers;
CREATE TABLE dvdrental.dtlk_business.topcustomers AS                                     
SELECT T2.customer_id,SUM(T1.amount) AS TotalSales
FROM dvdrental.dtlk_staging.dvdrentalstage T1
INNER JOIN (SELECT C.customer_id,Co.country FROM dvdrental.dtlk_access.customer C INNER JOIN dvdrental.dtlk_access.address A ON C.address_id = A.address_id INNER JOIN dvdrental.dtlk_access.city Ci ON Ci.city_id = A.city_id INNER JOIN dvdrental.dtlk_access.country Co ON Co.country_id = Ci.country_id) T2
ON T1.customer_id = T2.customer_id
GROUP BY T2.customer_id;
