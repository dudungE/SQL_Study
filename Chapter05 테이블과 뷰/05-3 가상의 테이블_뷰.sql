# 뷰의 개념

-- 뷰의 기본 생성
USE market_db;
SELECT mem_id, mem_name, addr FROM member;

USE market_db;
CREATE VIEW v_member
AS SELECT mem_id, mem_name, addr FROM member;

SELECT * FROM v_member;

SELECT mem_name, addr FROM v_member
   WHERE addr IN ('서울', '경기');
   
   
-- 뷰의 작동 

-- 뷰를 사용하는 이유 
SELECT B.mem_id, M.mem_name, B.prod_name, M.addr, 
        CONCAT(M.phone1, M.phone2) '연락처' 
   FROM buy B
     INNER JOIN member M
     ON B.mem_id = M.mem_id;

CREATE VIEW v_memberbuy
AS
    SELECT B.mem_id, M.mem_name, B.prod_name, M.addr, 
            CONCAT(M.phone1, M.phone2) '연락처' 
       FROM buy B
         INNER JOIN member M
         ON B.mem_id = M.mem_id;

select * from v_memberbuy;
SELECT * FROM v_memberbuy WHERE mem_name = '블랙핑크';

# 뷰의 실제 작동
-- 뷰의 실제 생성, 수정, 삭제 
USE market_db;
CREATE VIEW v_viewtest1
AS
    SELECT B.mem_id 'Member ID', M.mem_name AS 'Member Name', 
            B.prod_name "Product Name", 
            CONCAT(M.phone1, M.phone2) AS "Office Phone" 
       FROM buy B
         INNER JOIN member M
         ON B.mem_id = M.mem_id;

select * from v_viewtest1;
SELECT `Member ID`, `Member Name` FROM v_viewtest1;
SELECT  DISTINCT `Member ID`, `Member Name` FROM v_viewtest1; -- 백틱을 사용

ALTER VIEW v_viewtest1
AS
    SELECT B.mem_id '회원 아이디', M.mem_name AS '회원 이름', 
            B.prod_name "제품 이름", 
            CONCAT(M.phone1, M.phone2) AS "연락처" 
       FROM buy B
         INNER JOIN member M
         ON B.mem_id = M.mem_id;
         
SELECT  DISTINCT `회원 아이디`, `회원 이름` FROM v_viewtest1;  -- 백틱을 사용

DROP VIEW v_viewtest1;	

-- 뷰의 정보 확인 
USE market_db;
CREATE OR REPLACE VIEW v_viewtest2
AS
    SELECT mem_id, mem_name, addr FROM member;

select * from v_viewtest2;
DESCRIBE v_viewtest2;

DESCRIBE member;	-- describe = desc 

SHOW CREATE VIEW v_viewtest2;

-- 뷰를 통한 데이터의 수정/삭제 
UPDATE v_member SET addr = '부산' WHERE mem_id='BLK' ;
select * from v_member;
desc member;
INSERT INTO v_member(mem_id, mem_name, addr) VALUES('BTS','방탄소년단','경기') ;

CREATE VIEW v_height167
AS
    SELECT * FROM member WHERE height >= 167 ;
    
SELECT * FROM v_height167 ;

DELETE FROM v_height167 WHERE height < 167;


-- 뷰를 통한 데이터의 입력 
INSERT INTO v_height167 VALUES('TRA','티아라', 6, '서울', NULL, NULL, 159, '2005-01-01') ;

SELECT * FROM v_height167;

/*167이상 데이터만 있는 뷰에서 159 입력하는것 방지하고자 with check option 활용 */
ALTER VIEW v_height167
AS
    SELECT * FROM member WHERE height >= 167
        WITH CHECK OPTION ;
        
INSERT INTO v_height167 VALUES('TOB','텔레토비', 4, '영국', NULL, NULL, 140, '1995-01-01') ;


/*복합뷰는 두 테이블 조인하여 만든 뷰로 읽기전용(어떠한 수정 불가) */
CREATE VIEW v_complex
AS
    SELECT B.mem_id, M.mem_name, B.prod_name, M.addr
        FROM buy B
            INNER JOIN member M
            ON B.mem_id = M.mem_id;

-- 뷰가 참조하는 테이블의 삭제 
DROP TABLE IF EXISTS buy, member;

SELECT * FROM v_height167;
/*참조 테이블 삭제시 뷰도 삭제됨 */
CHECK TABLE v_height167;

