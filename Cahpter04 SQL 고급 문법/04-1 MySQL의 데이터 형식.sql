-- 1. 데이터 형식
-- 정수형
use market_db;
create table hongong4 (
tinyint_col tinyint,	-- 128~127까지 가능
smallint_col smallint,	-- -32768~32767
int_col int,	-- -21억~+21억
bigint_col bigint);

insert into hongong4 values (127, 32767, 2147483647, 900000000000000000);
insert into hongong4 values (128, 32768, 2147483648, 9000000000000000000); -- error

desc member;

-- 문자형

create table big_table(
data1 char(256),
data2 varchar(16384) ); -- error

create database netflix_db;
use netflix_db;
create table movie(
movieid int,
movie_title varchar(30),
movie_director varchar(20),
movie_star varchar(20),movie
movie_script longtext,
movie_film longblob);

-- 실수형
-- 날짜형

-- 2. 변수의 사용
use market_db;
set @myVar1 = 5;
set @myVar2 = 4.25;

select @myVar1;
select @myVar1+@myVar2;

set @txt='가수 이름==>' ;
set @height=166;
select @txt, mem_name from member where height>@height;

set @count = 3;
select mem_name, height from member order by height limit @count; -- limit에 변수사용 불가

set @count = 3;
prepare mySQL from'select mem_name, height from member order by height limit ?';
execute mySQL using @count;
-- prepare로 쿼리만 준비해놓고 execute로 실행함 




-- 3. 데이터 형 변환 
-- 명시적 변환 cast, convert

select avg(price) as '평균 가격' from buy;
desc buy;
select * from buy;

select cast(avg(price) as signed) '평균 가격' from buy;
select convert(avg(price), signed) '평균 가격' from buy;
-- signed는 부호가 있는 정수 의미

select cast('2022$12$12' as date);
select cast('2022/12/12' as date);
select cast('2022%12%12' as date);
select cast('2022@12@12' as date);

select num, 
concat(cast(price as char), 'X', cast(amount as char), '=') '가격X수량', 
price*amount '구매액'
from buy;

select '100'+'200';
select 100+'200';
select concat('100', '200');
select concat('100', '200') + 300;



