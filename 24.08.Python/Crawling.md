find('td')[idx] 는 <td class>의 개수를 세는것
th는 헤더 속성값들, tr은 row, td는 그 구성요소 , text는 <> 밖에 있는 검정글씨 (strip으로 처리),    
text가 없고 <> 안에서 찾아야 할 경우 -> row.find('td', class_='zentriert no-border-rechts').find('a')['title'].strip() 이런식으로
a 는 <a 어쩌고> 하이퍼링크이다.
