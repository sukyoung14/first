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

# WHERE절

- WHERE Continent = 'Asia' AND Population >= 100000000;
- WHERE Continent = 'Europe' OR Continent = 'North America'
- WHERE Continent != 'Asia' <!--    //NOT -->
- ORDER BY LifeExpectancy DESC LIMIT 10
- WHERE LifeExpectancy BETWEEN 70 AND 80
- WHERE Name IN ('South Korea', 'Japan', 'China');
- WHERE Continent NOT IN ('Asia', 'Europe')
- WHERE Name LIKE '%United%'; <!-- %와 _는 성능에 영향을 줄 수 있음 -->
- WHERE Name LIKE '\_';
- WHERE IndepYear IS NULL
- WHERE IndepYear IS NOT NULL
- OFFSET : LIMIT 10 OFFSET 10; <!--2페이지: 11~20위 국가--> <!--  LIMIT 10, 10; 와 같음-->
- ORDER BY IndepYear IS NULL, IndepYear ASC <!-- NULL을 마지막에 배치 -->

# 집계함수

- COUNT(\*): 전체 행 개수
- COUNT(컬럼): NULL이 아닌 행만 개수
- COUNT(DISTINCT): 중복 제거 개수
- SELECT COUNT(\*) AS 총국가수 FROM country;

- SUM: 합계 : ROUND(SUM(SurfaceArea) / 1000000, 2) AS '총면적(백만km²)'
- AVG: 평균 : ROUND(AVG(LifeExpectancy), 1) AS 평균수명,
- MAX / MIN: 최댓값 / 최솟값
- COALESCE로 NULL 처리 : NULL을 0으로 처리하여 평균 계산
  - AVG(COALESCE(LifeExpectancy, 0)) AS 평균
- GROUP BY Continent
- HAVING SUM(Population) >= 500000000
- CASE

```CASE column_name
      WHEN value1 THEN result1
      WHEN value2 THEN result2
      ELSE default_result
    END
    CASE
        WHEN (GNP / Population * 1000000) >= 40000 THEN '선진국'
        WHEN (GNP / Population * 1000000) >= 12000 THEN '중진국'
        WHEN (GNP / Population * 1000000) >= 4000 THEN '개발도상국'
        ELSE '저개발국'
    END AS 경제수준
```

# Join

## INNER JOIN

```
  FROM city
  INNER JOIN country ON city.CountryCode = country.Code
```

- c1.ID < c2.ID 의미 : 자기 자신 제외
- (도시A, 도시B)와 (도시B, 도시A) 중복 제거

## 서브쿼리

- EXISTS : 서브쿼리 결과가 존재하면 TRUE (행의 존재 여부만 확인)

## INDEX

EXPLAIN SELECT \* FROM city WHERE NAME = 'Seoul'; -- EXPLAIN : 쿼리가 어떻게 실행되는지 보여줌
