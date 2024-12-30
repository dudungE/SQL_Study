-- -------------------------

-- 03-3 데이터 변경을 위한 SQL문
use market_db;
create table hongong1 (toy_id INT, toy_name CHAR(4), age INT);
show tables;
insert into hongong1 values (1, '우디', 25);
insert into hongong1 (toy_id, toy_name) values (1, '버즈');

select * from hongong1;

insert into hongong1 (toy_name, age, toy_id ) values ('제시', 20, 3);



create table hongong2 (
toy_id INT AUTO_INCREMENT PRIMARY KEY,
toy_name CHAR(4),
age int);

insert into hongong2 values (null, '보핌', 25);
insert into hongong2 values (null, '슬링키', 22);
insert into hongong2 values (null, '렉스', 21);
insert into hongong2 values (5, 'jjh', 21);
insert into hongong2 values (null, '1', 21);
insert into hongong2 values (null, '2', 21);
select * from hongong2;

select last_insert_id();
alter table hongong2 auto_increment=100;
insert into hongong2 values (null, '재남', 35);

create table hongong3 (
toy_id int auto_increment primary key,
toy_name char(4),
age int);
alter table hongong3 auto_increment=1000;
set @@auto_increment_increment=3;

insert into hongong3 values (null, '토마스', 20);
insert into hongong3 values (null, '제임스', 23);
insert into hongong3 values (null, '고든', 25);

select * from hongong3;

select count(*) from world.city;
desc world.city;
select * from world.city limit 10;
create table city_popul (
city_name char(35), population int);

insert into city_popul
select name, population from world.city;

select * from city_popul;


-- update 
use market_db;

select * from city_popul where city_name='Seoul';

update city_popul
set city_name = '서울'
where city_name = 'Seoul';

select * from city_popul where city_name='서울';

update city_popul
set city_name = '뉴욕', population=0
where city_name = 'New York';

select * from city_popul where city_name = '뉴욕';

update city_popul set city_name='서울';
-- 실행 시 모든 칼럼의 도시 이름이 서울로 변환됨(보통 update문에서 where 써서 조건을 걸어줘야함)


update city_popul
	set population=population/10000;
-- 모든 행 변경됨  
    
select city_name '도시이름', population "인구" from city_popul;

-- DELETE
delete from city_popul
where city_name like 'New%';

delete from city_popul
where city_name like 'New%'
limit 5;


select * from city_popul where city_name like '서%';


-- 대용량 테이블의 삭제(delete, drop, truncate)
select count(*) from world.city, sakila.country;
create table big_table1 (select * from world.city, sakila.country);
create table big_table2 (select * from world.city, sakila.country);
create table big_table3 (select * from world.city, sakila.country);
select count(*) from big_table1;

delete from big_table1;
drop table big_table2;	-- 테이블 자체 삭제
truncate table big_table3; -- 테이블 구조는 남아있음
