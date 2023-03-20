# 개발 환경 설정 가이드라인

1. 폴더 생성 후 Git bash here

2. Django 프로젝트 생성 전 루틴

    ```bash
    # 1. 가상환경(venv) 생성
    $ python -m venv venv

    # 2. 가상환경 활성화
    $ source venv/Scripts/activate

    # 3. django 설치
    $ pip install django==3.2.18

    # 4. 의존성 파일 생성
    $ pip freeze > requirements.txt
    ```

3. Django 프로젝트 생성

    ```bash
    $ django-admin startproject firstpjt .
    ```

4. Django 서버 실행

    ```bash
    # manage.py와 동일한 경로에서 명령어 진행
    $ python manage.py runserver
    ```

5. http://127.0.0.1:8000/ 접속 후 확인

6. VSCode에서 실행할 경우

    * `ctrl` + `shift` + `p` 누르고 interpreter 검색

    * `venv` 누르고 new terminal 생성

7. .gitignore 작성

    * gitignore.io에 Django, Windows, macOS, VisualStudioCode, Python 검색

    * 내용 복사 후 .gitignore 파일에 붙여넣기

8. git init 실행