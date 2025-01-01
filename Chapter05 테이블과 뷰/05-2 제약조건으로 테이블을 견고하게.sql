USE naver_db;

DROP TABLE IF EXISTS buy, member;

CREATE TABLE member 
( mem_id  CHAR(8) NOT NULL PRIMARY KEY, 
  mem_name    VARCHAR(10) NOT NULL, 
  height      TINYINT UNSIGNED NULL
);

DESCRIBE member;

DROP TABLE IF EXISTS member;
CREATE TABLE member 
( mem_id  CHAR(8) NOT NULL, 
  mem_name    VARCHAR(10) NOT NULL, 
  height      TINYINT UNSIGNED NULL,
  PRIMARY KEY (mem_id)
);

-- alter table에서 설정하는 기본키 제약 조건

DROP TABLE IF EXISTS member;
CREATE TABLE member 
( mem_id  CHAR(8) NOT NULL, 
  mem_name    VARCHAR(10) NOT NULL, 
  height      TINYINT UNSIGNED NULL
);

DESCRIBE member;

ALTER TABLE member
     ADD CONSTRAINT 
     PRIMARY KEY (mem_id);


# 외래 키 제약조건 

DROP TABLE IF EXISTS member;
CREATE TABLE member 
( mem_id  CHAR(8) NOT NULL, 
  mem_name    VARCHAR(10) NOT NULL, 
  height      TINYINT UNSIGNED NULL,
  CONSTRAINT PRIMARY KEY PK_member_mem_id (mem_id)
);

-- create tabled에서 설정하는 외래 키 제약조건 

DROP TABLE IF EXISTS buy, member;


CREATE TABLE member 
( mem_id  CHAR(8) NOT NULL PRIMARY KEY, 
  mem_name    VARCHAR(10) NOT NULL, 
  height      TINYINT UNSIGNED NULL
);
CREATE TABLE buy 
(  num         INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
   mem_id      CHAR(8) NOT NULL, 
   prod_name     CHAR(6) NOT NULL, 
   FOREIGN KEY(mem_id) REFERENCES member(mem_id)
);

desc member;
desc buy;

DROP TABLE IF EXISTS buy, member;
CREATE TABLE member 
( mem_id  CHAR(8) NOT NULL PRIMARY KEY, 
  mem_name    VARCHAR(10) NOT NULL, 
  height      TINYINT UNSIGNED NULL
);

CREATE TABLE buy 
(  num         INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
   user_id      CHAR(8) NOT NULL, 
   prod_name     CHAR(6) NOT NULL, 
   FOREIGN KEY(user_id) REFERENCES member(mem_id)
);

-- alter table에서 설정하는 외래 키 제약조건 

DROP TABLE IF EXISTS buy;
CREATE TABLE buy 
(  num         INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
   mem_id      CHAR(8) NOT NULL, 
   prod_name     CHAR(6) NOT NULL
);
desc buy;
ALTER TABLE buy
    ADD CONSTRAINT 
    FOREIGN KEY(mem_id) REFERENCES member(mem_id);

INSERT INTO member VALUES('BLK', '블랙핑크', 163);
INSERT INTO buy VALUES(NULL, 'BLK', '지갑');
INSERT INTO buy VALUES(NULL, 'BLK', '맥북');

select * from buy;
select * from member;
SELECT M.mem_id, M.mem_name, B.prod_name 
   FROM buy B
      INNER JOIN member M
      ON B.mem_id = M.mem_id;
      
UPDATE member SET mem_id = 'PINK' WHERE mem_id='BLK';

DELETE FROM member WHERE  mem_id='BLK';


-- cascade로 update , delete
DROP TABLE IF EXISTS buy;
CREATE TABLE buy 
(  num         INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
   mem_id      CHAR(8) NOT NULL, 
   prod_name     CHAR(6) NOT NULL
);
desc buy;
ALTER TABLE buy
    ADD CONSTRAINT 
    FOREIGN KEY(mem_id) REFERENCES member(mem_id)
    ON UPDATE CASCADE
    ON DELETE CASCADE;
    
INSERT INTO buy VALUES(NULL, 'BLK', '지갑');
INSERT INTO buy VALUES(NULL, 'BLK', '맥북');
select * from buy;
select * from member;
UPDATE member SET mem_id = 'PINK' WHERE mem_id='BLK';

SELECT M.mem_id, M.mem_name, B.prod_name 
   FROM buy B
      INNER JOIN member M
      ON B.mem_id = M.mem_id;

DELETE FROM member WHERE  mem_id='PINK';

SELECT * FROM buy;
SELECT * FROM member;

-- 고유 키 제약조건 
DROP TABLE IF EXISTS buy, member;
CREATE TABLE member 
( mem_id  CHAR(8) NOT NULL PRIMARY KEY, 
  mem_name    VARCHAR(10) NOT NULL, 
  height      TINYINT UNSIGNED NULL,
  email       CHAR(30)  NULL UNIQUE
);

INSERT INTO member VALUES('BLK', '블랙핑크', 163, 'pink@gmail.com');
INSERT INTO member VALUES('TWC', '트와이스', 167, NULL);
INSERT INTO member VALUES('APN', '에이핑크', 164, 'pink@gmail.com');
SELECT * FROM member;

-- 체크 제약조건
DROP TABLE IF EXISTS member;
CREATE TABLE member 
( mem_id  CHAR(8) NOT NULL PRIMARY KEY, 
  mem_name    VARCHAR(10) NOT NULL, 
  height      TINYINT UNSIGNED NULL CHECK (height >= 100),
  phone1      CHAR(3)  NULL
);

INSERT INTO member VALUES('BLK', '블랙핑크', 163, NULL);
INSERT INTO member VALUES('TWC', '트와이스', 99, NULL);

ALTER TABLE member
    ADD CONSTRAINT 
    CHECK  (phone1 IN ('02', '031', '032', '054', '055', '061' )) ;
desc member;

INSERT INTO member VALUES('TWC', '트와이스', 167, '02');
INSERT INTO member VALUES('OMY', '오마이걸', 167, '010');


-- 기본값 정의 
DROP TABLE IF EXISTS member;
CREATE TABLE member 
( mem_id  CHAR(8) NOT NULL PRIMARY KEY, 
  mem_name    VARCHAR(10) NOT NULL, 
  height      TINYINT UNSIGNED NULL DEFAULT 160,
  phone1      CHAR(3)  NULL
);

ALTER TABLE member
    ALTER COLUMN phone1 SET DEFAULT '02';

INSERT INTO member VALUES('RED', '레드벨벳', 161, '054');
INSERT INTO member VALUES('SPC', '우주소녀', default, default);
SELECT * FROM member;