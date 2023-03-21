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