use sqldb;
select * from usertbl;
select * from buytbl;

select distinct addr from usertbl order by addr desc;

use employees;

select * from employees limit 3;

use sqldb;
select * from buytbl;

create table buytbl2 (select * from buytbl);

select * from buytbl2;

create table buytbl3 (select userID,prodName from buytbl);

select * from buytbl;

select userID,amount from buytbl group by userID; # 각 항목 별 첫번째 데이터가 찍힌다
select userID,sum(amount) from buytbl group by userID;

select userID,sum(amount) from buytbl group by userID order by sum(amount) desc;

select userID, sum(price) from buytbl group by userID order by sum(price) desc;
select userID,avg(amount*price) from buytbl group by userID order by avg(amount*price) desc limit 3;

select * from usertbl;
select * from buytbl;

select name ,height from usertbl group by name order by height desc limit 1; # group by는 속성들을 각자 종속시키는 것 

#서브쿼리 사용
select name,height from usertbl where height=(select max(height) from usertbl); # where 조건에 서브쿼리 넣는다 

select name,height from usertbl where height=(select max(height) from usertbl) or height=(select min(height) from usertbl);

# null은 카운트 안함 

select count(1) from usertbl; #전체 레코드 수 구하는 법 , 상수 넣는게 count(*) 와 동일 -> 주의해서 써라alter
select count(userID) from usertbl; # pk등 특정 칼럼 선택 

select userID, sum(price*amount) from buytbl group by userID having sum(price*amount) > 1000 order by sum(price*amount) desc;









