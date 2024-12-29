--  select ~ from ~where
select * from member;
select * from member where mem_name= '블랙핑크';

select * from member where mem_number = 4;

select mem_id, mem_name from member where height <= 162;

select mem_number, height, mem_name 
from member 
where height >= 165 and mem_number > 6;

select mem_number, height, mem_name 
from member 
where height >= 165 or mem_number > 6;

select *
from member
where height>=163 and height<=165;

select *
from member
where height between 163 and 165;

select *
from member 
where addr='경기' or addr='전남' or addr='경남'; 

select *
from member 
where addr in('경기', '전남', '경남');







