create database kyobo_db default character set utf8mb4;
use kyobo_db;
create table bestseller(
id int auto_increment primary key,
book_rank int not null,
title varchar(255) not null,
created_at timestamp default current_timestamp);
insert into bestseller (book_rank, title) values (1, '마흔에 읽는 쇼펜하우어');
insert into bestseller (book_rank, title) values (2, '리틀 라이프 1');
insert into bestseller (book_rank, title) values (3, '돈의 심리학');
select * from bestseller;
insert into bestseller (book_rank, title) values
(4, '불편한 편의점'),
(5, '세이노의 가르침'),
(6, '역행자');
select * from bestseller;
alter table bestseller add book_value int default 0;
-- 1위부터 6위까지의 고유 번호(id)를 기준으로 각각 다른 가격을 일괄 매칭한다.
UPDATE bestseller 
SET book_value = CASE id
    WHEN 1 THEN 17000  -- id가 1번이면 17000원으로 변경
    WHEN 2 THEN 14800  -- id가 2번이면 14800원으로 변경
    WHEN 3 THEN 19800  -- id가 3번이면 19800원으로 변경
    WHEN 4 THEN 16000  -- id가 4번이면 16000원으로 변경
    WHEN 5 THEN 22000  -- id가 5번이면 22000원으로 변경
    WHEN 6 THEN 18000  -- id가 6번이면 18000원으로 변경
END
WHERE id IN (1, 2, 3, 4, 5, 6); -- 💡 대상 id를 명시하여 안전하고 빠르게 업데이트 수행
select * from bestseller;

# 문제
select title, book_value from bestseller;
select * from bestseller
where book_value >= 17000;
select * from bestseller
where title like '%라이프%'; 
select title, book_rank from bestseller
where book_rank <= 3 and book_value >= 15000;
select * from bestseller
where book_value <= 20000 order by book_value desc;