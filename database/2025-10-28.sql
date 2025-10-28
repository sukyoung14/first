USE temp;
CREATE TABLE accounts (
	id		INT		PRIMARY KEY 	AUTO_INCREMENT,
	name	varchar(10),
    balance	INT
);

INSERT INTO accounts (name, balance)
VALUES ('kim', 100000) ;
INSERT INTO accounts (name, balance)
VALUES ('lee', 200000) ;



START TRANSACTION;
UPDATE accounts SET balance = balance + 10000 WHERE id=1;
UPDATE accounts SET balance = balance - 10000 WHERE id=2;
COMMIT;
ROLLBACK;

START TRANSACTION;
INSERT INTO accounts (name, balance) VALUES ('hong', 0) ;
SAVEPOINT sp1;
INSERT INTO accounts (name, balance) VALUES ('choi', 1000000) ;
SAVEPOINT sp2;
ROLLBACK TO SAVEPOINT sp1;
COMMIT;

INSERT INTO accounts (name, balance) VALUES ('choi', 0) ;

SELECT * FROM accounts;

select @@autocommit; 	-- 1 (활성화)
SET autocommit = 0;    -- 자동 커밋 비활성화
SET autocommit = 1;    -- 자동 커밋 활성화

-- -------------------------------------------------------------------------------------------------------------------------------
USE sakila;
DESCRIBE film;
DESCRIBE film_category;
SHOW CREATE TABLE film;


SELECT
    c.first_name,
    c.last_name,
    COUNT(r.rental_id) AS rental_count,
    SUM(p.amount) AS total_amount_spent -- 고객이 지출한 총 금액
FROM
    customer c
JOIN
    rental r ON c.customer_id = r.customer_id
JOIN
    payment p ON r.rental_id = p.rental_id -- rental_id를 통해 payment 테이블 조인
WHERE
    r.rental_date >= '2005-06-01' AND r.rental_date < '2005-07-01'
GROUP BY
    c.customer_id, c.first_name, c.last_name
HAVING
    COUNT(r.rental_id) >= 10
ORDER BY
    total_amount_spent DESC, rental_count DESC;