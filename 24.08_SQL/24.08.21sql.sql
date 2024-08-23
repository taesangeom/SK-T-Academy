use sqldb;
select * from usertbl;
select * from buytbl;

#이름 김버수 
select * from usertbl where name ="김범수";
select * from usertbl where name ="조관우";
select * from usertbl where addr="서울";
select * from usertbl where birthYear = 1973;

select * from usertbl where mobile1 is null;

select userID, name, concat(mobile1,"-",mobile2) as phone_num from usertbl where mobile1=011;

select name, addr from usertbl where name like "김%";
select name, addr from usertbl where name like "_용%";
# in (항목1,항목2) 도 가능

select name, height from usertbl where height > (select height from usertbl where name="김경호");

select name, height from usertbl where height > (select max(height) from usertbl where addr="경남")

# ***** any: 서브쿼리 결과 중 하나라도 만족하면 / all : 서브쿼리의 결과가 모두 만족해야한다 