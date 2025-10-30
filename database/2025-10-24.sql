
USE sakila;

-- 대여료(`rental_rate`)가 4달러 이상인 영화의 제목과 대여료 조회
SELECT * FROM film WHERE rental_rate > 4;
-- 상영시간(`length`)이 120분 미만인 영화 조회
SELECT * FROM  film WHERE length < 120;
-- 등급(`rating`)이 ‘PG-13’인 영화 조회
SELECT * FROM  film WHERE rating = 'PG-13';

-- 등급이 ‘PG’이고 대여료가 3달러 이상인 영화
SELECT * FROM  film WHERE rating = 'PG' AND rental_rate >= 3;
-- 등급이 ‘G’ 또는 ‘PG’인 영화
SELECT * FROM  film WHERE rating = 'G' OR rating = 'PG';
-- 상영시간이 60분 미만이거나 180분 이상인 영화
SELECT * FROM  film WHERE length < 60 OR length >= 180;

-- 제목에 ‘LOVE’가 포함된 영화 조회
SELECT * FROM  film WHERE title like '%LOVE%';
-- 제목이 ‘THE’로 시작하는 영화 조회
SELECT * FROM  film WHERE title like 'THE%';
-- 배우 성(`last_name`)이 ‘SON’으로 끝나는 배우 조회 => actor table
SELECT * FROM  actor WHERE last_name like '%SON';

-- 등급이 ‘PG-13’인 영화 중에서 대여료가 2.99달러 이상 4.99달러 이하이고, 상영시간이 90분 이상인 영화

SELECT * FROM  film WHERE rating = 'PG-13' AND rental_rate BETWEEN 2.99 AND 4.99 AND  length > 90;

-- 전체 영화 개수
SELECT COUNT(*) FROM  film;
-- 등급(rating)이 'PG'인 영화 개수
SELECT COUNT(*) FROM  film WHERE rating = 'PG';
-- 서로 다른 등급(rating)의 개수
SELECT rating, COUNT(*) FROM  film GROUP BY rating;
-- 모든 영화의 대여료(rental_rate) 합계
SELECT SUM(rental_rate) FROM  film;
-- 모든 영화의 평균 대여료 (소수점 둘째 자리)
SELECT round(AVG(rental_rate),2) FROM  film;
-- 등급이 'R'인 영화의 평균 대여료
SELECT round(AVG(rental_rate),2) FROM  film WHERE rating = 'R';
-- 가장 비싼 대여료와 해당 영화 제목
SELECT title, rental_rate FROM  film ORDER BY rental_rate DESC LIMIT 1;
SELECT title, rental_rate FROM film WHERE rental_rate = (SELECT max(rental_rate) FROM film);
-- 가장 긴 상영 시간(length)과 해당 영화 제목
SELECT title, length FROM  film ORDER BY length DESC LIMIT 1;
SELECT title, length FROM film WHERE length = (SELECT max(length) FROM film);
-- 가장 짧은 상영 시간과 해당 영화 제목
SELECT title, length FROM  film ORDER BY length LIMIT 1;
SELECT title, length FROM film WHERE length = (SELECT min(length) FROM film);
-- film 테이블의 다음 통계를 한 번에 조회하세요 
-- 		전체 영화 수, 총 대여료 합계, 평균 대여료, 최고 대여료, 최저 대여료, 평균 상영 시간
SELECT count(*), sum(rental_rate), avg(rental_rate), max(rental_rate), min(rental_rate), avg(length) FROM film ;

-- 등급(rating)별로 다음 정보를 조회하세요:
-- - 등급, 영화 개수
-- - 영화 개수가 많은 순서로 정렬
SELECT rating, count(*) FROM film GROUP BY rating ORDER BY count(*) DESC ;
-- 등급(rating)별로 다음 정보를 조회하세요:
-- - 등급, 영화 개수, 평균 대여료 (소수점 둘째 자리), 최고 대여료, 최저 대여료
-- - 평균대여료 내림차순 정렬
SELECT rating, count(*), round(avg(rental_rate),2), max(rental_rate), min(rental_rate) FROM film GROUP BY rating ORDER BY count(*) DESC ;
-- 등급별 통계에서 영화가 100개 이상인 등급만 조회하세요:
-- - 등급, 영화 개수, 평균 대여료
SELECT rating, count(*), avg(rental_rate) FROM film GROUP BY rating HAVING count(*) >= 100 ;
-- 대여료가 2.99 이상인 영화만 집계하여, 등급별 통계를 조회하세요.
-- 단, 해당 등급의 영화가 50개 이상인 경우만 표시:
-- - 등급, 영화 개수, 평균 대여료
SELECT rating, count(*), round(avg(rental_rate),2) FROM film GROUP BY rating, rental_rate HAVING rental_rate >= 2.99 AND count(*) >= 50;

-- 배우(actor) 테이블에서 성(last_name)별 배우 수를 조회하세요:
-- - 성, 배우 수, 배우가 2명 이상인 성만 표시
-- - 배우 수 내림차순 정렬

SELECT last_name, count(*)  FROM actor GROUP BY last_name HAVING count(*) >=2 ORDER BY count(*) DESC ;






