-- 인덱스 생성/제거 문법
USE market_db;
SELECT * FROM member;

SHOW INDEX FROM member;

SHOW TABLE STATUS LIKE 'member';

CREATE INDEX idx_member_addr 
   ON member (addr);

SHOW INDEX FROM member;

SHOW TABLE STATUS LIKE 'member';

ANALYZE TABLE member;
SHOW TABLE STATUS LIKE 'member';

CREATE UNIQUE INDEX idx_member_mem_number
    ON member (mem_number); -- 오류 발생

CREATE UNIQUE INDEX idx_member_mem_name
    ON member (mem_name);

SHOW INDEX FROM member;

INSERT INTO member 
VALUES('MOO', '마마무', 2, '태국', '001', '12341234', 155, '2020.10.10');

-- 인덱스 활용 실습 
ANALYZE TABLE member;  -- 지금까지 만든 인덱스를 모두 적용
SHOW INDEX FROM member;


SELECT * FROM member;

SELECT mem_id, mem_name, addr FROM member;

SELECT mem_id, mem_name, addr 
    FROM member 
    WHERE mem_name = '에이핑크';
    
    
CREATE INDEX idx_member_mem_number
    ON member (mem_number);
SHOW INDEX FROM member;    
ANALYZE TABLE member; -- 인덱스 적용

SELECT mem_name, mem_number 
    FROM member 
    WHERE mem_number >= 7; 
    
SELECT mem_name, mem_number 
    FROM member 
    WHERE mem_number >= 1; 
    
SELECT mem_name, mem_number 
    FROM member 
    WHERE mem_number*2 >= 14;     
    
SELECT mem_name, mem_number 
    FROM member 
    WHERE mem_number >= 14/2;   
    
SHOW INDEX FROM member;

DROP INDEX idx_member_mem_name ON member;
DROP INDEX idx_member_addr ON member;
DROP INDEX idx_member_mem_number ON member;

ALTER TABLE member 
    DROP PRIMARY KEY;


SELECT table_name, constraint_name
    FROM information_schema.referential_constraints
    WHERE constraint_schema = 'market_db';
-- information_schema.referential_constraints에는 외래 키 정보 들어가있음

ALTER TABLE buy 
    DROP FOREIGN KEY buy_ibfk_1;
ALTER TABLE member 
    DROP PRIMARY KEY;
-- 외래키 제거 후 기본키 제거 가능해짐 
    
SELECT mem_id, mem_name, mem_number, addr 
    FROM member 
    WHERE mem_name = '에이핑크';