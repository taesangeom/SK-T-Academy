# 정리!!!!!
## DFS / BFS 모두 가능한 문제
==> 본인이 편한 스타일로 선택해서 하시면 됨!!!!!

## DFS 사용이 가능하다!!! ==> Stack!!!! --> 재귀함수를 써도 됨!!!
1) 정의대로 탐색 기본으로 구현: append(), pop()
2) 기능 중심으로 재귀함수로 구현이 가능함!!!

## BFS 사용이 가능하다!! ==> queue ==> deque
==> 거리, 출발점에 순서 중요할 떄
: 출발점에서 뭔가 점진적으로 진행을 해야하는 경우들의 상황!!!
==> 최단거리 문제로 일반화 : 다익스트라 알고리즘!!!!!
(거리가 1로 일정하거나 하는 간단한 경우 : BFS로 처리가 가능!!)
==> 속도 이슈 : deque : append(), popleft()
주의!!!) 절대로 재귀함수를 사용하시면 안 됨!!!!!!!!

기본적인 탐색에 대해서 정확히 알 면
중간 킬러 문항들을 많이 해쳐나갈 수 있음!!
단, 안다고 해결은 안 됨!!!
==> 주어진 상황에 유연하게 대처/ 구현을 할 수 있어야 함!!!!!!!!
# 최단거리  
다익스트라: 결국 구조는 다 비슷하다 . -> distance INF 처리, 그외 가중치 담긴 graph 등, heapq, while 등 구조는 동일하다 .  
##  복잡한 구조에 따른 세팅 자체가 메인이다. 알고리즘 자체는 메인이 아니다


# 최단거리 문제 : 꼭 최단 거리만 아니라, 요금. 다른 대상일 수 있음!!
              그 중에서 제일 최소값에 대한 것을 찾는 것!!!!
               정렬이랑은 조금은 다름!!!
# 다익스트라알고리즘 : BFS --> 응용한 방식
                  : 기본 알고리즘 코드 방식
                     ==> 할 일에 대해서 큐!!! ( == BFS와 유사 방식!! )
                        우선순위 큐!!!!!!!!! ( 지금 결과상 제일 우선순위!!)
                                                 [ 지금 중에서 제일 최소길이]
                    ==> 기본 코드 방식 유사 BFS
                          - 시작점에 대해서 처리(할 일에 등록, 한 일 처리)
                         - 하나씩 할 일을 꺼내는거!!!  
                          heapq :
                          - 할 일이 있으면, 여기서 더 한단계 가서..
                            비용을 계산해서 , 지금까지 비용보다 더 절감되면
                            ==> 더 거기서 가서 해봐 : 할 일에 추가!!!!  
                            

# 코테의 TIP  
코테 문제들을 공부/학습
가장 기본적인 기능/ 문법에 대해서는 자유롭게 하실 수 있어야 함!!
잡다한 메서드/ 기능 어느 정도는 머리에 있어야 함!!!! → 검색을 할 수 있어서임!!!
수업시간에 했던 기본 유형: 연습문제level0 ⇒ 모두 기본적으로 필요한 사항!!!==> 안 보고 연습하면서, 반복& 숙달( 모든 수강생 분들!!! ) 
코테 유형 : 구현( 모든 수강생분들!!!)


코테를 할 때 : 지금 수업까지 내용은 주로 잘 나오는 내용들만 
최단거리 다른 알고리즘들
자료구조 : 링크드리스트, 이진트리 ,,,,--> 여러 유형&내용
DP
잡다한 유형들
⇒ 기본적으로 많이/ 자주 나오는 대표적인 주제들부터 하시고, 점진적으로 학습을 확대시는것을 추천을 함!!!!

공부하는 방법 
다른 사람이나, 수업 내용이나 ⇒ 본인 논리구조로 이해를 먼저!!!!! + 문제 분석!!
본인 논리구조에 대한 코드 연결!!!!
반복&숙달 ⇒ 코테준비를 한다면 열심히!!!
다른 사람들의 더 좋은 풀이가 무엇인지 체크!!!!!!! ⇒ 코드에 대한 크로스체크!!!!
늘상 꾸준히!!!!!!!!!!!!


                
                          
# ++
