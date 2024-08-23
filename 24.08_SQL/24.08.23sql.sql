select * from tstaff where depart="영업부" and gender="여";
select * from tcity where name like "%천%";
select name from tcity order by popu;


select * from tcar;
select * from tmaker;

select * from tcar c cross join tmaker m on c.maker = m.maker;
select * from tcar c cross join tmaker m where c.maker = m.maker;
select c.car, c.price,c.capacity, c.maker, m.factory from tcar c cross join tmaker m where c.maker = m.maker;

select * from tcar c left join tmaker m on c.maker = m.maker;

use sqldb;
select * from usertbl;
select distinct(userID) from usertbl;
select * from buytbl;
select U.userID,U.name,U.addr,B.prodName from buytbl B inner join usertbl U on B.userID = U.userID group by U.userID;

select userID from buytbl group by userID;
select userID, count(*) from buytbl group by userID;

select userID from buytbl where groupName="전자" group by userID;
select userID, count(*) from buytbl where groupName="전자" group by userID having count(*)>=2;

select a.userID, count(a.num)  from (select * from buytbl where groupName="전자") a group by a.userID;

#필드명,데이터베이스명 별칭에는 백틱을 추천한다.
