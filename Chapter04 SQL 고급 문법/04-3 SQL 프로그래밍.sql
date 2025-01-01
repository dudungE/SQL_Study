# if 문
-- if문의 기본 형식
drop procedure if exists ifProc1;

DELIMITER $$
CREATE PROCEDURE ifProc1()
BEGIN
   IF 100 = 100 THEN  
      SELECT '100은 100과 같습니다.';
   END IF;
END $$
DELIMITER ;
CALL ifProc1();


drop procedure if exists ifProc2;
DELIMITER $$
CREATE PROCEDURE ifProc2()
BEGIN
	DECLARE myNum INT;
    SET myNum = 200;
    IF myNum = 100 THEN
		SELECT '100입니다.';
	ELSE 
		SELECT '100이 아닙니다.';
	END IF;
END $$
DELIMITER ;
CALL ifProc2();

DROP PROCEDURE IF EXISTS ifProc3; 
DELIMITER $$
CREATE PROCEDURE ifProc3()
BEGIN
    DECLARE debutDate DATE; -- 데뷰일
    DECLARE curDate DATE; -- 오늘
    DECLARE days INT; -- 활동한 일수

    SELECT debut_date INTO debutDate -- debut_date 결과를 hireDATE에 대입
       FROM market_db.member
       WHERE mem_id = 'APN';

    SET curDATE = CURRENT_DATE(); -- 현재 날짜
    SET days =  DATEDIFF(curDATE, debutDate); -- 날짜의 차이, 일 단위

    IF (days/365) >= 5 THEN -- 5년이 지났다면
          SELECT CONCAT('데뷔한지 ', days, '일이나 지났습니다. 핑순이들 축하합니다!');
    ELSE
          SELECT '데뷔한지 ' + days + '일밖에 안되었네요. 핑순이들 화이팅~' ;
    END IF;
END $$
DELIMITER ;
CALL ifProc3();

select  current_date(), datediff('2021-12-31', '2000-1-1');

drop procedure if exists caseproc;
delimiter $$
create procedure caseproc()
begin
	declare point int;
    declare credit char(1);
    set point = 77;
    
    case
    when point >= 90 then
		set credit = 'A';
	when point >= 80 then
		set credit = 'B';
	when point >= 70 then
		set credit = 'C';
	when point >= 60 then
		set credit = 'd';
	ELSE
		set credit = 'F';
	end case;
    select concat('취득점수=>', point), concat('학점=>', credit);
end $$
delimiter ;
call caseproc();

select mem_id, sum(price*amount) "총 구매액"
from buy group by mem_id;
    

select mem_id, sum(price*amount)
from buy group by mem_id
order by sum(price*amount) desc;

select b.mem_id, m.mem_name, sum(price*amount)
from buy b 
inner join member m
on b.mem_id = m.mem_id
group by b.mem_id
order by sum(price*amount) desc;

select b.mem_id, m.mem_name, sum(price*amount)
from buy b 
right outer join member m
on b.mem_id = m.mem_id
group by m.mem_id;


SELECT M.mem_id, M.mem_name, SUM(price*amount) "총구매액",
        CASE  
           WHEN (SUM(price*amount)  >= 1500) THEN '최우수고객'
           WHEN (SUM(price*amount)  >= 1000) THEN '우수고객'
           WHEN (SUM(price*amount) >= 1 ) THEN '일반고객'
           ELSE '유령고객'
        END "회원등급"
   FROM buy B
         RIGHT OUTER JOIN member M
         ON B.mem_id = M.mem_id
   GROUP BY M.mem_id
   ORDER BY SUM(price*amount) DESC ;
   

-- while 문 
DROP PROCEDURE IF EXISTS whileProc; 
DELIMITER $$
CREATE PROCEDURE whileProc()
BEGIN
    DECLARE i INT; -- 정수 i 선언
    DECLARE hap INT; -- 누적 값 정수 hap 
    SET i = 1;
    SET hap = 0;

    WHILE (i <= 100) DO
        SET hap = hap + i;  
        SET i = i + 1;      -- i += 1
    END WHILE;

    SELECT '1부터 100까지의 합 ==>', hap;   
END $$
DELIMITER ;
CALL whileProc();



DROP PROCEDURE IF EXISTS whileProc2; 
DELIMITER $$
CREATE PROCEDURE whileProc2()
BEGIN
    DECLARE i INT; -- 1에서 100까지 증가할 변수
    DECLARE hap INT; -- 더한 값을 누적할 변수
    SET i = 1;
    SET hap = 0;

    myWhile: 
    WHILE (i <= 100) DO  -- While문에 label을 지정
       IF (i%4 = 0) THEN
         SET i = i + 1;     
         ITERATE myWhile; -- 지정한 label문으로 가서 계속 진행
       END IF;
       SET hap = hap + i; 
       IF (hap > 1000) THEN 
         LEAVE myWhile; -- 지정한 label문을 떠남. 즉, While 종료.
       END IF;
       SET i = i + 1;
    END WHILE;

    SELECT '1부터 100까지의 합(4의 배수 제외), 1000 넘으면 종료 ==>', hap, i; 
END $$
DELIMITER ;
CALL whileProc2();

-- 동적 sql

use market_db;
PREPARE myQuery FROM 'SELECT * FROM member WHERE mem_id = "BLK"';
EXECUTE myQuery;
DEALLOCATE PREPARE myQuery;


DROP TABLE IF EXISTS gate_table;
CREATE TABLE gate_table (id INT AUTO_INCREMENT PRIMARY KEY, entry_time DATETIME);

SET @curDate = CURRENT_TIMESTAMP(); -- 현재 날짜와 시간

PREPARE myQuery FROM 'INSERT INTO gate_table VALUES(NULL, ?)';
EXECUTE myQuery USING @curDate;
DEALLOCATE PREPARE myQuery;

SELECT * FROM gate_table;

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
