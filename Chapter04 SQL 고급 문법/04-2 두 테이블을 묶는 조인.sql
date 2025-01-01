# 조인
-- 일대다(one to many)관계는 보통 pk-fk관계

# 내부 조인
use market_db;

select * from buy
inner join member
on buy.mem_id = member.mem_id
where buy.mem_id = 'BLK';

select * from buy
inner join member
on buy.mem_id = member.mem_id;

select * from buy;
select * from member;

select buy.mem_id, mem_name, prod_name, addr, 
concat(phone1, '-', phone2) 'contact'
from buy 
inner join member
on buy.mem_id = member.mem_id;

select b.mem_id, m.mem_name, b.prod_name, m.addr, 
concat(m.phone1, '-', m.phone2) 'contact'
from buy b
inner join member m
on b.mem_id = m.mem_id;

select distinct m.mem_id, m.mem_name, m.addr
from buy b
inner join member m
on b.mem_id = m.mem_id
order by m.mem_id;

# 외부 조인 

select m.mem_id, m.mem_name, m.addr
from member m
left outer join buy b
on b.mem_id = m.mem_id
order by m.mem_id;

select m.mem_id, m.mem_name, m.addr
from member m
right outer join buy b
on b.mem_id = m.mem_id
order by m.mem_id;

select * from member;

select distinct m.mem_id, b.prod_name, m.mem_name, m.addr
from member m
left outer join buy b
on b.mem_id = m.mem_id
where b.prod_name is null
order by m.mem_id;
-- 회원가입하고 한 번도 구매한 적없는 회원 목록  

# 기타 조인
-- 상호조인 cross join  ~ cartesian product 
select * from buy cross join member;

select count(*) "data number"
from sakila.inventory
cross join world.city;

create table cross_table
select * from sakila.actor
cross join world.country;

select * from cross_table;

USE market_db;
CREATE TABLE emp_table (emp CHAR(4), manager CHAR(4), phone VARCHAR(8));

INSERT INTO emp_table VALUES('대표', NULL, '0000');
INSERT INTO emp_table VALUES('영업이사', '대표', '1111');
INSERT INTO emp_table VALUES('관리이사', '대표', '2222');
INSERT INTO emp_table VALUES('정보이사', '대표', '3333');
INSERT INTO emp_table VALUES('영업과장', '영업이사', '1111-1');
INSERT INTO emp_table VALUES('경리부장', '관리이사', '2222-1');
INSERT INTO emp_table VALUES('인사부장', '관리이사', '2222-2');
INSERT INTO emp_table VALUES('개발팀장', '정보이사', '3333-1');
INSERT INTO emp_table VALUES('개발주임', '정보이사', '3333-1-1');

select * from emp_table;

select a.emp "직원", b.emp "직속상관", b.phone "직속상관연락처"
from emp_table a
inner join emp_table b
on a.manager = b.emp
where a.emp = '개발팀장';




















