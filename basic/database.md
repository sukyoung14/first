# 2025-10-22

USE world;
SELECT \* FROM city;
SELECT \* FROM COUNTRY;

USE temp_db; <!-- -- DB 사용 -->

<!-- -- DDL ----------------------------->
<!---- 테이블 생성 -->
<!-- PK : PRIMARY KEY  자동생성 : AUTO_INCREMENT FK : FOREIGN KEY -->

CREATE TABLE student (
id INT PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(50) NOT NULL
);
DROP TABLE student; <!-- -- 테이블 삭제 -->

<!-- -- DML ----------------------------->
<!-- -- 데이터 추가, 생성, create -->

INSERT INTO student (name) VALUES ('kim');

<!-- -- 데이터 읽기, 조회, read -->

SELECT \* FROM student;

<!-- -- 데이터 수정, update -->

UPDATE student SET name = 'home' WHERE id=1;

<!-- -- 데이터 삭제 -->

DELETE FROM student WHERE id=1;

CREATE DATABASE temp <!-- DATABASE 생성 -->
CHARACTER set utf8mb4; <!-- 		 UTF-8 인코딩으로 데이터베이스 생성 (한글 깨짐 방지) -->
DROP DATABASE temp; <!-- DATABASE 삭제 -->
SHOW DATABASES; <!-- 모든 데이터베이스 목록 조회 -->

<!-- FK : FOREIGN KEY -->

CREATE TABLE orders (
id INT PRIMARY KEY AUTO_INCREMENT,
customer_id INT NOT NULL,
FOREIGN KEY (customer_id) REFERENCES customer(id)
);

### 외래키와 참조 동작 (ON DELETE, ON UPDATE)

- CASCADE - 부모 삭제 시 자식도 자동 삭제 : 고객 삭제 → 주문도 삭제
- SET NULL - 부모 삭제 시 자식의 FK를 NULL로 설정 : 고객 삭제 → 주문의 customer_id = NULL
- RESTRICT - 자식이 있으면 부모 삭제 불가 (기본값) : 주문이 있으면 고객 삭제 불가
  <!-- -- 테이블 구조 확인 -->

  DESCRIBE customer;
  -- 테이블 삭제
  DROP TABLE customer;

  <!-- -- 테이블 수정 -->

  ALTER TABLE customer
  ADD COLUMN phone varchar(50);

ALTER TABLE customer
MODIFY COLUMN phone VARCHAR(50) NOT NULL;

ALTER TABLE customer
CHANGE COLUMN phone phone_num VARCHAR(50) NOT NULL;

DROP COLUMN phone_num;

-- 데이터만 삭제 (구조는 유지)
TRUNCATE TABLE customer;

<!-- 중복제거 -->

SELECT DISTINCT continent FROM country;

<!-- -- 트랜잭션 시작 -->

START TRANSACTION;
UPDATE customers SET active = FALSE WHERE customer_id = 1;
SELECT \* FROM customers WHERE customer_id = 1;
-- 만족하면 확정, 아니면 취소
COMMIT; -- 확정
-- ROLLBACK; -- 취소
