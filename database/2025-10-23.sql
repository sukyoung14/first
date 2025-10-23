CREATE DATABASE temp
CHARACTER  set utf8mb4;		-- UTF-8 인코딩으로 데이터베이스 생성 (한글 깨짐 방지)
DROP DATABASE temp;
-- 모든 데이터베이스 목록 조회
SHOW DATABASES;
USE temp;

CREATE TABLE customer (
	id		INT				PRIMARY KEY AUTO_INCREMENT,
    name	VARCHAR(50)		NOT NULL,
    email	VARCHAR(100)	NOT NULL
);

CREATE TABLE orders (
	id				INT			PRIMARY KEY AUTO_INCREMENT,
    customer_id		INT			NOT NULL,
    FOREIGN KEY	(customer_id)	REFERENCES	customer(id)
);

 -- 테이블 구조 확인
 DESCRIBE customer;
 -- 테이블 삭제
 DROP TABLE customer;
  
  -- 테이블 수정
 ALTER TABLE customer
 ADD COLUMN phone varchar(50);
 
 ALTER TABLE customer
 MODIFY COLUMN phone VARCHAR(50) NOT NULL;
 
 ALTER TABLE customer
 CHANGE COLUMN phone phone_num VARCHAR(50) NOT NULL;

 DROP COLUMN  phone_num;
 
--  데이터만 삭제 (구조는 유지)
 TRUNCATE TABLE customer;
 USE temp;

DROP TABLE orders;
DROP TABLE customer;
CREATE TABLE customer (
	id		INT				PRIMARY KEY AUTO_INCREMENT,
	name	VARCHAR(50)		NOT NULL,
	email	VARCHAR(100)	NOT NULL
);

INSERT INTO customer (name, email)  VALUES
('kim', 'asdf@naver.com') ,
('lee', '1234@naver.com') ,
('hong', 'qwer@naver.com') ;
SELECT * FROM customer;
UPDATE customer	SET 
email = '1234@naver.com' ,
name = 'choi'
WHERE id = 2;
DELETE FROM customer  WHERE id = 1;

-- SELECT
SELECT name, email AS 이메일, id FROM customer; 
USE world;
SELECT * FROM country;
SELECT DISTINCT continent FROM country;