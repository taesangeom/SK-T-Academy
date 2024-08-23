
# `` 이 백틱은 db명이나 필드명,컬럼명에 공백 있을 때만 사용한다 !! 중요 아니면 에러임  하나의 덩어리로 인식시켜줌
#drop database if exists sqldb; -- 만약 기존에 sqldb가 있다면 우선 삭제!!
create database sqldb;
use sqldb;
create table usertbl( 
	userID char(8) NOT NULL PRIMARY KEY, -- id컬럼 :PK
	name varchar(10) NOT NULL,           -- 이름
    birthYear int not null,              -- 출생년도
    addr char(2) not null,               -- 지역(경기, 서울)
    mobile1 char(3),                     -- 휴대폰 앞자리
    mobile2 char(8),                     -- 휴대폰 뒤에..
    height smallint,                     -- 키
    mDate DATE                           -- 회원 가입일..
);

create table buytbl (
	num int auto_increment not null primary key, -- 순번
    userID char(8) not null, -- 아이디 FK : 밑에 어디와 연결하는지 세팅..
    prodName char(6) not null,  -- 상풍명
    groupName char(4),          -- 분류
    price int not null,         -- 가격
    amount smallint not null,   -- 
    foreign key( userID ) references usertbl(userID)
);

INSERT INTO usertbl VALUES('LSG', '이승기', 1987, '서울', '011', '1111111', 182, '2008-8-8');
INSERT INTO usertbl VALUES('KBS', '김범수', 1979, '경남', '011', '2222222', 173, '2012-4-4');
INSERT INTO usertbl VALUES('KKH', '김경호', 1971, '전남', '019', '3333333', 177, '2007-7-7');
INSERT INTO usertbl VALUES('JYP', '조용필', 1950, '경기', '011', '4444444', 166, '2009-4-4');
INSERT INTO usertbl VALUES('SSK', '성시경', 1979, '서울', NULL  , NULL      , 186, '2013-12-12');
INSERT INTO usertbl VALUES('LJB', '임재범', 1963, '서울', '016', '6666666', 182, '2009-9-9');
INSERT INTO usertbl VALUES('YJS', '윤종신', 1969, '경남', NULL  , NULL      , 170, '2005-5-5');
INSERT INTO usertbl VALUES('EJW', '은지원', 1972, '경북', '011', '8888888', 174, '2014-3-3');
INSERT INTO usertbl VALUES('JKW', '조관우', 1965, '경기', '018', '9999999', 172, '2010-10-10');
INSERT INTO usertbl VALUES('BBK', '바비킴', 1973, '서울', '010', '0000000', 176, '2013-5-5');
INSERT INTO buytbl VALUES(NULL, 'KBS', '운동화', NULL   , 30,   2);
INSERT INTO buytbl VALUES(NULL, 'KBS', '노트북', '전자', 1000, 1);
INSERT INTO buytbl VALUES(NULL, 'JYP', '모니터', '전자', 200,  1);
INSERT INTO buytbl VALUES(NULL, 'BBK', '모니터', '전자', 200,  5);
INSERT INTO buytbl VALUES(NULL, 'KBS', '청바지', '의류', 50,   3);
INSERT INTO buytbl VALUES(NULL, 'BBK', '메모리', '전자', 80,  10);
INSERT INTO buytbl VALUES(NULL, 'SSK', '책'    , '서적', 15,   5);
INSERT INTO buytbl VALUES(NULL, 'EJW', '책'    , '서적', 15,   2);
INSERT INTO buytbl VALUES(NULL, 'EJW', '청바지', '의류', 50,   1);
INSERT INTO buytbl VALUES(NULL, 'BBK', '운동화', NULL   , 30,   2);
INSERT INTO buytbl VALUES(NULL, 'EJW', '책'    , '서적', 15,   1);
INSERT INTO buytbl VALUES(NULL, 'BBK', '운동화', NULL   , 30,   2);







DELIMITER //   #함수인가
create procedure myproc()
begin

# 쿼리  
end //
DELIMITER ;

call myproc();

select * from membertbl;
insert into membertbl values (12,"손","smsmsmsm@gmail.com");

DELIMITER //
create trigger tri_del
	after delete  -- delete가 실행되고 나서 (관찰이벤트 정의)
    on membertbl  -- trigger를 부착할 대상 (관찰 대상 테이블 세팅)
    for each row -- 각 줄마다 적용할래요
begin -- trigger가 땡겨지면 할 일에 대한 정의 ! delmembertbl에 탈퇴정보 기록
	insert into delmembertbl  value(
    old.memberID,    # 여기서 old 는 membertbl 을 말한다 
    old.memberName,
    old.MemberAddress,
    curdate()
    );
end //
DELIMITER ;
    
    
