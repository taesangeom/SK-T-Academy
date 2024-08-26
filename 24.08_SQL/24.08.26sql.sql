select * from aisles;
select * from order_products__prior;
select * from orders;
select eval_set,count(*) from orders group by eval_set;
select * from products;

# Q1) 전체 주문 건수 확인해보기
# Q2) 구매자의 수를 확인을 해보세요!! --> 왜 1번과 결과가 다를까?
select count(distinct(user_id)) from orders;
# Q3) 상품이름별로 몇 건의 주문이 있었는지 체크!!!!
select o.product_id, p.product_name, count(o.product_id) from order_products__prior o left join products p on o.product_id=p.product_id
group by o.product_id;
select * from order_products__prior o left join products p on o.product_id=p.product_id;

# Q4) 카트에 제일 먼저 1번으로 담는 상품10개 대해서, 
#     --> 출력 : 상품번호, 상품이름, 몇 번 1번으로 담겼는지 정보!!!
select op.product_id, p.product_name, count(op.product_id) as `cnt` from order_products__prior op left join products p on op.product_id=p.product_id where op.add_to_cart_order=1 
group by op.product_id order by `cnt` desc limit 10;

select  product_id,sum(case when add_to_cart_order =1 then 1 else 0 end) as `cnt` from order_products__prior
group by product_id order by `cnt` desc limit 10;

select A.*,p.product_name from (select  product_id,sum(case when add_to_cart_order =1 then 1 else 0 end) as `cnt` from order_products__prior
group by product_id order by `cnt` desc limit 10) A left join products p on A.product_id=p.product_id order by A.`cnt` desc;

#동일한 결과야도 조인 할때 무겁지 않게 하는 것이 속도에서 중요. 전체 셋 모은다음 하는 것 보다 선택적으로 줄인걸 조인하자.

# Q5) 시간대 별로 주문 건수 테이블 작성 
#     --> 출력 : 시간 순서대로 나열 하면서, 그 시간대 주문이 몇 건인지 출력
select order_hour_of_day, count(order_id) from orders group by order_hour_of_day order by order_hour_of_day;

# Q6) 첫 구매 후에 다음 구매까지 걸리는 평균 일수는 얼마인가?
select avg(days_since_prior_order) from orders where order_number=2;
# Q7) 1번 주문할 때 평균 몇 '종류'의 상품을 같이 주문하는가?
#     --> 참고) 전체 수량이 아니라 종류에 대한 부분임!!
select * from orders;
select * from order_products__prior;
select * from products;
select order_id, count(distinct product_id) as `type` from order_products__prior group by order_id;
select avg(a.`type`) from (select order_id, count(distinct product_id) as `type` from order_products__prior group by order_id) a;
#아니면 이방법도 있움
select count(product_id)/count(distinct order_id) from order_products__prior;

# Q8) 지금 시점에서 고객 1명당 평균 몇 번 주문을 했는가?
# 전체 주문 건수 / 유니크한 고객 수
select count(order_id)/count( distinct user_id) from orders;

# Q9) 상품별로 재구매율을 구해보세요
#     --> 상품아이디, 재구매율
select product_id,reordered from order_products__prior;
select product_id, sum(case when reordered >=1 then 1 else 0 end) / count(product_id) as `reorder_rate` 
from order_products__prior group by product_id;
select product_id, avg(reordered) as `avg` from order_products__prior group by product_id;
# Q10) 9번의 테이블에서 재구매율이 높은 순서대로 순위를 부여해보세요.
#     --> 출력 : 상품아이디, 재구매율, 랭킹
select A.*, row_number() over (order by A.`avg` desc) as `rank` from (select product_id, avg(reordered) as `avg` from order_products__prior group by product_id)A;
# Q10) 9번의 재구매율이 높은 상품이 무엇인지 이름까지 같이 출력해주세요.
#     --> 출력 : 상품아이디, 상품이름, 재구매율, 주문건수
select * from order_products__prior;

select p.product_name, AA.* , BB.`cnt`
from ((select product_id, avg(reordered) as `avg` from order_products__prior group by product_id ) A 
left join products p on A.product_id = p.product_id) AA
left join (select product_id,count(product_id) as `cnt` from order_products__prior group by product_id) BB 
on AA.product_id = BB.product_id;

select product_id,count(product_id) as `cnt` from order_products__prior group by product_id;

select *
from (select product_id, avg(reordered) as `avg` from order_products__prior group by product_id ) A 
left join products p on A.product_id = p.product_id;

#다른 테이블에 주문건수 정보가 있을때는? 