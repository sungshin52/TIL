## 개발 환경 설정 가이드라인

1. 폴더 생성 후 Git bash here

2. Django 프로젝트 생성 전 루틴

    ```bash
    # 1. 가상환경(venv) 생성
    $python -m venv venv

    # 2. 가상환경 활성화
    $source venv/Scripts/activate

    # 3. django 설치
    $pip install django==3.2.18

    # 4. 의존성 파일 생성
    $pip freeze > requirements.txt
    ```

3. Django 프로젝트 생성

    ```bash
    $django-admin startproject firstpjt .
    ```

4. Django 서버 실행

    ```bash
    # manage.py와 동일한 경로에서 명령어 진행
    $python manage.py runserver
    ```

5. http://127.0.0.1:8000/ 접속 후 확인

6. VSCode에서 실행할 경우

    * `ctrl` + `shift` + `p` 누르고 interpreter 검색

    * `venv` 누르고 new terminal 생성

7. .gitignore 작성

    * gitignore.io에 Django, Windows, macOS, VisualStudioCode, Python 검색

    * 내용 복사 후 .gitignore 파일에 붙여넣기

8. git init 실행

</br>
---
</br>

## 앱 생성 & 등록 가이드라인

1. 앱 생성하기

    ```bash
    $python manage.py startapp articles
    ```

    * 앱의 이름은 '복수형'으로 지정하는 것을 권장

2. 앱 등록하기

    ```python
    # settings.py

    INSTALLED_APPS = [
        'articles',
        'django.contrib.admin',
        'django.contrib.auth',
        'django.contrib.contenttypes',
        'django.contrib.sessions',
        'django.contrib.messages',
        'django.contrib.staticfiles'
    ]
    ```

    * 반드시 앱 생성 후 등록해야 함

    * 등록 후 생성은 불가

3. urls.py 수정

    ```python
    from django.contrib import admin
    from django.urls import path
    from articles import views

    urlpatterns = [
        path('admin/', admin.site.urls),
        path('articles/', views.index),     # https://128.0.0.1:8000/articles/ 로 요청 왔을 때
                                            # views 모듈의 index 뷰 함수 호출한다는 뜻
    ]
    ```

4. views.py 수정

    ```python
    # 특정 기능을 수행하는 view 함수들을 작성
    # 모든 view 함수는 첫번째 인자로 요청 객체를 필수적으로 받는다.
    def index(request):
        return render(request, 'articles/index.html')
    ```

    * 특정 경로에 있는 template과 request 객체를 결합해 응답 객체 반환하는 index 뷰 함수 정의

5. articles 앱 폴더 내 templates 폴더 작성

6. templates 폴더 내 템플릿 페이지 작성

</br>

## 모델 관리 가이드라인

1. 모델 마이그레이션

    * 앱 내 models.py에 모델 작성

        ```python
        # todos/models.py
        from django.db import models

        # Create your models here.
        class Todo(models.Model):
            content = models.CharField(max_length = 80)
            completed = models.BooleanField(default = False)
            priority = models.IntegerField(default = 3)
            created_at = models.DateTimeField(auto_now_add = True)
            deadline = models.DateTimeField(null = True)
        ```

    * 마이그레이션 수행

        ```bash
        $python manage.py makemigrations
        $python manage.py migrate
        ```

2. 모델 필드 추가

    * 1 과 같은 과정 수행

    * 기존 테이블이 존재하기 때문에 필드 추가시 필드의 기본 값 설정 필요

3. 관리자 계정 생성

    ```bash
    $python manage.py createsuperuser
    ```

    * username, e-mail (선택사항), password 입력하여 admin 계정 생성

4. 관리자 페이지 모델 등록

    * App 폴더 내부에 있는 admin.py에 모델 클래스 등록

    ```python
    from django.contrib import admin
    from .models import Todo
    # Register your models here.

    admin.site.register(Todo)
    ```

5. 관리자 페이지 접속

    * http://127.0.0.1:8000/admin/ 접속

    * 3의 username, password로 로그인

    * db.sqlite3의 `auth_user`에 계정 등록되었는지 확인

    * 모델 테스트 (삽입, 수정, 삭제 등)

6. 데이터베이스 파일 `db.sqlite3` 접근

    * `db.sqlite3` 파일 접속하여 5의 모델 테스트가 반영되었는지 확인

</br>

## ORM 사용

1. 외부 라이브러리 설치

    ```bash
    $pip install ipython
    $pip install django-extensions
    ```

2. `settings.py`의 `INSTALLED_APPS`에 추가

    ```python
    #settings.py

    INSTALLED_APPS = [
        'articles',
        'django_extensions',
    ...,
    ]
    ```

3. `pip freeze > requirements.txt` 수행

4. `shell plus` 진입하기

    ```bash
    $python manage.py shell_plus
    ```