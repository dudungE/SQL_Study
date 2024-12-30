--  select ~ from ~where
select * from member;
select * from buy;
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

-- like
select *
from member
where mem_name like '우%';

select *
from member
where mem_name like '__핑크';

-- subquery
select height 
from member
where mem_name = '에이핑크';

select *
from member 
where height>164;

select * from member
where height >= (select height from member where mem_name = '에이핑크');

-- order by
select * from member
order by debut_date desc;

select * from member
where height >= 164
order by height desc;

select * from member
where height >= 164
order by height desc, debut_date desc;

-- limit
select * from member limit 3;

select mem_name, height from member
order by height desc
limit 3, 2;   -- 3번 인덱스부터 2개 데이터 출력 (인덱스는 0부터 시작)

select addr from member;
select addr from member order by addr;
select distinct addr from member;


-- group by
select * from buy order by mem_id;  -- order by와 비교 

select mem_id, sum(amount) from buy group by mem_id;

select mem_id "회원 아이디", sum(amount) "총 구매 개수"  -- 별칭에 작은따옴표 사용 가능하나 insert 등에서 문자입력시 사용하므로 별칭에는 큰따옴표 권장
from buy group by mem_id;

select mem_id "회원 아이디", sum(price*amount) "총 구매 금액" 
from buy group by mem_id;

select avg(amount) "평균 구매 개수" from buy;

select mem_id, avg(amount) "평균 구매 개수"
from buy group by mem_id;

select count(*) from member;
select count(phone1) "연락처 있는 회원" from member;

-- 1000원 구매 이상 고객 select
select mem_id "아이디", sum(price*amount) "총 구매 금액"
from buy group by mem_id
having sum(price*amount) > 1000;

select mem_id "아이디", sum(price*amount) "총 구매 금액"
from buy group by mem_id
having sum(price*amount) > 1000
order by sum(price*amount) desc;






















