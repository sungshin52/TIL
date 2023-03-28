"""
1. 아래 할 일 생성
content : 실습 제출
priority : 5
completed : False
deadline : 오늘 날짜(년-월-일)
"""
todo = Todo(content='실습 제출', priority=5, completed=False, deadline='2023-03-28')
todo.save()

"""
2. 아래 할 일 생성
content : 데일리 설문(오후) 제출
deadline : 오늘 날짜(년-월-일)
"""
todo = Todo(content='데일리 설문(오후) 제출', deadline='2023-03-28')
todo.save()

"""
3. 임의의 할 일 5개 생성
"""
todo = Todo(content='할 일 1', deadline='2023-03-28')
todo.save()

todo = Todo(content='할 일 2', deadline='2023-03-28')
todo.save()

todo = Todo(content='할 일 3', deadline='2023-03-28')
todo.save()

todo = Todo(content='할 일 4', deadline='2023-03-28')
todo.save()

todo = Todo(content='할 일 5', deadline='2023-03-28')
todo.save()

"""
4. pk 기준 오름차순으로 정렬한 모든 데이터 조회
"""

Todo.objects.all().order_by(pk)

"""
5. priority 기준 내림차순으로 정렬한 모든 데이터 조회
"""
Todo.objects.all().order_by('-priority')

"""
6. pk가 1인 단일 데이터의 아래 필드 조회
(pk, content, priority, deadline, created_at)
"""
Todo.objects.get(pk=1)