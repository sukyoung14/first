# 2025-10-22

USE world;
SELECT \* FROM city;
SELECT \* FROM COUNTRY;

USE temp_db; <!-- -- DB 사용 -->

<!-- -- DDL ----------------------------->
<!---- 테이블 생성 -->

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
