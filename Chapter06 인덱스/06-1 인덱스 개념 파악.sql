USE market_db;
CREATE TABLE table1  (
    col1  INT  PRIMARY KEY,
    col2  INT,
    col3  INT
);
SHOW INDEX FROM table1;

CREATE TABLE table2  (
    col1  INT  PRIMARY KEY,
    col2  INT  UNIQUE,
    col3  INT  UNIQUE
);
SHOW INDEX FROM table2;

USE market_db;
DROP TABLE IF EXISTS buy, member;
CREATE TABLE member 
( mem_id      CHAR(8) , 
  mem_name    VARCHAR(10),
  mem_number  INT ,  
  addr        CHAR(2)  
 );

INSERT INTO member VALUES('TWC', '트와이스', 9, '서울');
INSERT INTO member VALUES('BLK', '블랙핑크', 4, '경남');
INSERT INTO member VALUES('WMN', '여자친구', 6, '경기');
INSERT INTO member VALUES('OMY', '오마이걸', 7, '서울');
SELECT * FROM member;

desc member;

ALTER TABLE member
     ADD CONSTRAINT 
     PRIMARY KEY (mem_id);
SELECT * FROM member;
-- 기본키 설정 후 클러스터형 인덱스 형성되 자동정렬됨 

ALTER TABLE member DROP PRIMARY KEY ; -- 기본 키 제거
ALTER TABLE member 
    ADD CONSTRAINT 
    PRIMARY KEY(mem_name);
SELECT * FROM member;
-- 한글 기준으로 정렬됨 

INSERT INTO member VALUES('GRL', '소녀시대', 8, '서울');
SELECT * FROM member;

-- 보조 인덱스

USE market_db;
DROP TABLE IF EXISTS member;
CREATE TABLE member 
( mem_id      CHAR(8) , 
  mem_name    VARCHAR(10),
  mem_number  INT ,  
  addr        CHAR(2)  
 );

INSERT INTO member VALUES('TWC', '트와이스', 9, '서울');
INSERT INTO member VALUES('BLK', '블랙핑크', 4, '경남');
INSERT INTO member VALUES('WMN', '여자친구', 6, '경기');
INSERT INTO member VALUES('OMY', '오마이걸', 7, '서울');
SELECT * FROM member;

ALTER TABLE member
     ADD CONSTRAINT 
     UNIQUE (mem_id);
desc member;
SELECT * FROM member;
-- 보조인덱스 사용해도 데이터 내용이나 순서 바뀌지 않음 

ALTER TABLE member
     ADD CONSTRAINT 
     UNIQUE (mem_name);
SELECT * FROM member;

INSERT INTO member VALUES('GRL', '소녀시대', 8, '서울');
SELECT * FROM member;