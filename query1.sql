select * from member;

select member_name, member_addr from member;

select * from member where member_name = '아이유';

select from


-- 인덱스 생성
CREATE INDEX idx_member_name ON member(member_name); 

create view member_view as select * from member;
select * from member_view;

-- 스토어드 프로시저
select * from member where member_name = '나훈아';
select * from product where product_name = '삼각김밥';

DELIMITER //
CREATE procedure myProc()
begin
	select * from member where member_name = '나훈아';
	select * from product where product_name = '삼각김밥';
end // DELIMITER;

CALL myProc();

