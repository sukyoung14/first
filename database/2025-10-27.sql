USE temp;


SELECT * FROM  titanic;

-- -------------------------------------------------------------------------------------------------------------------------------
USE world;

SELECT * FROM countrylanguage;
SELECT * FROM city WHERE CountryCode='KOR';
SELECT * FROM country	WHERE Code='KOR';

SELECT 
	ci.Name	AS 도시명, 
    co.Name AS 나라이름,
    co.Continent AS 대륙,
    ci.Population AS 도시인구,
    co.Population AS 국가인구,
    ci.Population / co.Population AS 도시인구비율
FROM city ci INNER JOIN country co
ON ci.CountryCode = co.Code
WHERE co.Name = 'South Korea'
;

SELECT 
	co.Name,
    COUNT(*)
FROM city ci INNER JOIN country co 
ON ci.countryCode = co.Code
GROUP BY co.Name
ORDER BY COUNT(*) DESC
;

SELECT 
	co.Continent,
    COUNT(*),
    AVG(ci.Population)
FROM city ci INNER JOIN country co
ON ci.countryCode = co.Code
GROUP BY co.Continent
;
SELECT 
	count(DISTINCT co.Code) AS '전체국가수_join',
    (SELECT COUNT(*) FROM country) AS '전체국가수_country'
FROM city ci INNER JOIN country co
ON ci.countryCode = co.Code
;
SELECT
*
FROM Country co LEFT JOIN city ci
ON co.Code = ci.CountryCode
ORDER BY co.Population
;
SELECT 
	*
FROM Country co INNER JOIN city ci ON co.Code = ci.countryCode
				INNER JOIN countrylanguage cl ON ci.CountryCode = cl.CountryCode
;

SELECT * FROM city;
SELECT 
	c1.name, c2.name
FROM  city c1 INNER JOIN city c2 on c1.CountryCode = c2.CountryCode AND c1.id < c2.id
;
-- -------------------------------------------------------------------------------------------------------------------------------
USE sakila;

-- 영화(`film`)와 언어(`language`) 테이블을 조인하여 다음을 조회하세요:
-- - 영화 제목 (`film.title`), 언어 이름 (`language.name`)
SELECT * FROM film;
SELECT * FROM language;
SELECT 
	f.title, 
    l.name
FROM film f INNER JOIN language l
ON f.language_id= l.language_id 
;

-- 영화와 카테고리를 조인하여 다음을 조회하세요:
-- - 영화 제목, 카테고리 이름, 대여료
SELECT * FROM film;
SELECT * FROM category;
SELECT 
	f.title, 
    c.name,
    f.rental_rate
FROM film f INNER JOIN film_category fc ON f.film_id = fc.film_id
			INNER JOIN category c ON fc.category_id = c.category_id
order by f.film_id
;
-- 모든 고객(`customer`)과 그들의 대여 내역(`rental`)을 조회하세요.
-- - 고객 이름 (first_name, last_name), 대여 ID (rental_id), 대여 날짜 (rental_date)
SELECT * FROM customer;
SELECT * FROM rental;
SELECT 
	c.first_name,
    c.last_name,
    r.rental_id,
    r.rental_date
FROM customer c LEFT JOIN rental r
ON c.customer_id = r.customer_id
;

-- 고객별 대여 횟수를 조회하세요. (대여 횟수 0인 고객도 포함)
-- - 고객 이름, 대여 횟수, 대여 횟수가 많은 순서
SELECT 
	c.customer_id,
	c.first_name,
    c.last_name,
    COUNT(*) AS rental_count
FROM customer c LEFT JOIN rental r
ON c.customer_id = r.customer_id
GROUP BY c.customer_id
ORDER BY rental_count desc
;

-- 같은 상영 시간(`length`)을 가진 영화 쌍을 찾으세요.
-- - 영화1 제목, 영화2 제목, 상영 시간, 상위 10개

SELECT * FROM film;
SELECT 
	f1.title,
    f2.title,
    f1.length
FROM film f1 INNER JOIN film f2
ON f1.length = f2.length AND f1.film_id < f2.film_id
ORDER BY f1.length DESC
LIMIT 10
;
-- -------------------------------------------------------------------------------------------------------------------------------
-- 서브쿼리
USE world;
SELECT Population FROM city where name = 'Seoul';		-- 서울인구
SELECT * FROM city 
WHERE Population > (SELECT Population FROM city where name = 'Seoul');  	-- 서울인구보다 많은 도시
SELECT 
	name, Population
FROM country
WHERE Population > (SELECT AVG(Population) FROM country)
ORDER BY Population DESC;
SELECT code FROM country WHERE Continent = 'Asia';
SELECT name, CountryCode, Population FROM city WHERE countryCode IN (SELECT code FROM country WHERE Continent = 'Asia');
SELECT DISTINCT CountryCode FROM city;
SELECT * FROM country WHERE code NOT IN (SELECT DISTINCT CountryCode FROM city);
SELECT *
FROM (
	SELECT Continent, COUNT(*) co_count
    FROM country 
    GROUP BY Continent
) as continent_table
where co_count > 40
;
-- -------------------------------------------------------------------------------------------------------------------------------
USE sakila;
-- 평균 대여료(`rental_rate`)보다 비싼 영화를 조회하세요.
-- - 영화 제목, 대여료. 대여료 내림차순 정렬
-- - 상위 10개
SELECT 
	title,
	rental_rate
FROM film 
WHERE rental_rate > ( SELECT AVG(rental_rate) FROM film) 
ORDER BY rental_rate DESC
LIMIT 10
;
-- 'Action' 카테고리에 속한 영화를 조회하세요.
-- - 영화 제목
SELECT  title, c.name
FROM film f INNER JOIN film_category fc ON f.film_id = fc.film_id 
			INNER JOIN category c ON fc.category_id = c.category_id
WHERE c.name = 'Action'
;
-- 대여 기록이 있는 고객만 조회하세요.
-- - 고객 이름 (first_name, last_name), 이메일
SELECT c.first_name, c.last_name, c.email
FROM rental r INNER JOIN customer c ON r.customer_id = c.customer_id
group by r.customer_id;

SELECT * FROM customer 
WHERE 
EXISTS ( SELECT * FROM rental WHERE customer.customer_id = rental.customer_id);

-- 고객별 대여 횟수를 구한 뒤, 대여 횟수가 30회 이상인 고객만 조회하세요.
-- - 고객 이름, 대여 횟수, 대여 횟수 내림차순
SELECT customer_id, COUNT(*) cnt FROM rental  GROUP BY customer_id having cnt >= 30;
SELECT 
	first_name,
    last_name
FROM customer 
WHERE  customer_id IN (SELECT customer_id FROM rental  GROUP BY customer_id having count(*) >= 30);

SELECT 
	c.first_name,
    c.last_name,
    c2.cnt
FROM customer c inner join (SELECT customer_id, COUNT(*) cnt FROM rental  GROUP BY customer_id having count(*) >= 30) as c2 
	on c.customer_id = c2.customer_id;

SELECT
	c_name, c_id, c_count
FROM
(
	SELECT
		c.last_name AS c_name,
		c.customer_id AS c_id,
		COUNT(*) AS c_count
	FROM customer c INNER JOIN rental r
	ON c.customer_id = r.customer_id
	GROUP BY c.customer_id
) AS customer_rental
WHERE c_count >= 30;
-- -------------------------------------------------------------------------------------------------------------------------------
-- index
USE world;
SHOW INDEX FROM city;
DESCRIBE city;
CREATE INDEX idx_city_name ON city(Name);
EXPLAIN SELECT * FROM city WHERE NAME = 'Seoul';			-- EXPLAIN : 쿼리가 어떻게 실행되는지 보여줌
DROP INDEX idx_city_name ON city;
-- -------------------------------------------------------------------------------------------------------------------------------
-- View 
