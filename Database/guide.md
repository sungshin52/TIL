## Workbench 활용 MySQL 접속 방법

1. MySQL Workbench 실행

2. 홈 화면 MySQL Connections 옆 + 버튼 누르기

3. Setup New Connection의 Connection Name 설정

4. Test Connection 버튼 누르기

5. Connect to MySQL Server 팝업창에 Password 입력 후 Save password 체크, OK 버튼 누르기

6. Successfully made the MySQL connection 팝업창이 뜨면 OK 누르고 넘어가기

7. Setup New Connection 창의 OK 누르기

8. 설정한 Connection Name을 가진 connection 생김

</br>

## 실습 데이터베이스에 대한 쿼리(Query)문 작성 및 쿼리문 실행 방법

1. 위에서 만든 testdatabase 더블 클릭

2. 좌측 Navigator에서 Data Import/Restore 선택

3. Import from Self-Contained File 에서 sample_db.sql 열기

4. Schemas에서 classicmodels 선택

5. Query editor 창 누르기

6. customers 에서 전부 불러오는 쿼리문 입력

    ```
    SELECT * FROM customers
    ```

7. 상단의 번개 모양 표시 (Query 실행 버튼) 누르기

8. customer table에서 불러온 내용 확인