create database eda_01;
use eda_01;
select * from dataset2;

# Q1) Division Name의 종류별로 평점의 평균!!!!!! + 평점 내림차순으로 정렬..
select `Division Name` as `Divison Name`,avg(rating) from dataset2 group by 1 order by avg(rating) desc;

# Q.2) Department Name의 종류별로 평점의 평균!!!! + 평점 내림차순으로 정렬..
select `Department Name` as `Department Name`,avg(rating) from dataset2 group by 1 order by avg(rating) desc;
# Q.3) Department Name의 값이 Trend인 항목에 대해서,,, 3점 이하의 평점
select * from dataset2 where `Department Name`="Trend" and Rating <=3;
# Q.4) 3번의 데이터를 나이대별로 처리!!! 10대, 20~~ case when
select Age,`Department Name`,Rating, 
	case
		when Age like "1%" then "10대"
        when Age like "2%" then "20대"
        when Age like "3%" then "30대"
        when Age like "4%" then "40대"
        when Age like "5%" then "50대"
        when Age like "6%" then "60대"
        else "기타"
	end as "세대"
from dataset2 where `Department Name`="Trend" and Rating <=3;

# Q5) Trend 항목에 대한 리뷰 평점에 대해서 나이대별로 몇 건인지 확인!!!
select (floor(Age/10)*10) as `se`,sum(Rating) from dataset2 where `Department Name`="Trend" group by `se`;
# Q6) Trend 항목에 대한 리뷰 중에서 50대들의 3점 이하의 리뷰들을 출력( 10개만)

# Q7) (Deparment and ClothID)의 항목을 기준으로 평점을 계산을 해서..
#     --> 출력 부분은 Deparment, clothID, 평점의 평균

select `Department Name`,`Clothing ID`, avg(rating ) `AVG_RATE`
			from dataset2
            group by `Department Name`,`Clothing ID`;

# Q8) 랭킹을 하기는 하는데, Department별로 랭킹을 독립적으로 부여를 하고자 함!!
#     랭킹의 산정 기준은 7번에서 했던 평점의 평균-->내림차순,,,
#     --> 출력 : Deparment, clothid, 평점의평균, 랭킹!!!!!!


select *, rank() over(partition by `Department Name`
						order by `AVG_RATE` desc) as `RNK` from (
                        select `Department Name`,`Clothing ID`, avg(rating ) `AVG_RATE`
			from dataset2
            group by `Department Name`,`Clothing ID`
            )A;

# Q9) 8번 문제에서 너무 많은 항목들이 있어서...
#     Department 별로 평점 평균 순위가 Top 10만 출력!!!!!
select * from (select *, rank() over(partition by `Department Name`
						order by `AVG_RATE` desc) as `RNK`
			from (
                        select `Department Name`,`Clothing ID`, avg(rating ) `AVG_RATE`
			from dataset2
            group by `Department Name`,`Clothing ID`
            )A)B where RNK<=10
				order by `Department Name`;


# Q10) Department & 연령대를 기준으로 그룹을 만들어서,, 평점의 평균
#     ---> 출력 : Deparment, 연령대, 평점평균
 create view aa as (select `Department name`,age,floor(age/10)*10 as `AgeBand`,
avg(rating) as `AVG_RATE` from dataset2 group by 1,3);

# Q11) 연령대별로 생성한 평점평균에 대한 점수를 기준으로 랭킹을 부여!!!!!
select * ,rank() over(partition by `AgeBand` order by `AVG_RATE` desc) as `RNK`
from aa;

# Q12) 리뷰중에서 size 관련된 언급이 있는 리뷰인지 아닌지 체크용 필드 생성.
#      -> 리뷰 필드에 size라는 단어가 있으면 1, 없으면 0으로 출력!!!
#      -> 출력 : 리뷰, size언급유무
select * from dataset2;
select `Review Text`, 
	case
		when `Review Text` like "%size%" then 1
        else 0
	end as `is_size`
from dataset2;

# Q13) 전체 리뷰 데이터 수하고, size가 언급된 리뷰데이터 수 하고 출력!!!!

# Q14) 리뷰 중에서 size언급된 리뷰수, large언급된 리뷰수, 
#                loose언급된 리뷰수, small언급된 리뷰수,
#                tight언급된 리뷰수, 전체 리뷰수
select  
	sum(case when `Review Text` like "%size%" then 1 else 0 end) as `is_size`,
	sum(case when `Review Text` like "%large%" then 1 else 0 end) as `is_large`,
    sum(case when `Review Text` like "%loose%" then 1 else 0 end) as `is_loose`,
    sum(case when `Review Text` like "%small%" then 1 else 0 end) as `is_small`,
    sum(case when `Review Text` like "%tight%" then 1 else 0 end) as `is_tight`,
    count(`Review Text`) as `total_review` from dataset2;


# Q15) 14번의 해당한는 항목들을 Department 별로 보자!!!!!!

select `Department Name`,
	sum(case when `Review Text` like "%size%" then 1 else 0 end) as `is_size`,
	sum(case when `Review Text` like "%large%" then 1 else 0 end) as `is_large`,
    sum(case when `Review Text` like "%loose%" then 1 else 0 end) as `is_loose`,
    sum(case when `Review Text` like "%small%" then 1 else 0 end) as `is_small`,
    sum(case when `Review Text` like "%tight%" then 1 else 0 end) as `is_tight`,
    count(`Review Text`) as `total_review` from dataset2 group by `Department Name`;
    
    -- 결론 : 문제를 꼭 맞추겠다 의도는 아니고,,
--       이런 문제들을 해결하기 위한 쿼리문들이 배운것들을 어떻게 활용!!!
--       1) 내가 필요한 정보들을 모으자!!!! --> 어디있는지 체크!!
--       2) 단계별로 진행을 하면서 참조 하는 from (~~~)A,
--          참조를 최소화 하기 위해서는 내가 만든 별칭을 사용해서 작성하는 것이 아니라
--          내가 만든 수식 그 자체로 활용해서 쿼리는 작성해야 함!!!!!!
--       3) 카운팅에 대한 부분!!!!!!! + 조건 맞춤별 카운팅!!!!
--           m1) 필터링을 한 테이블에서 카운팅!!!
--           m2) case when + sum 조건별 카운팅!!!
--       4)*** 기존의 필드의 값을 가지고 원하는 필드를 재 생성하는 과정***
--            : 수식, case- when
