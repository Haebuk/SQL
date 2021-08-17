# SQL
- [SQL](#sql)
  - [table 생성 예제](#table-생성-예제)
  - [xlsx 파일을 db에 넣기](#xlsx-파일을-db에-넣기)
- [6. 텍스트 마이닝을 활용한 데이터 조건 주기](#6-텍스트-마이닝을-활용한-데이터-조건-주기)
  - [LIKE 연산자를 활용한 필터링](#like-연산자를-활용한-필터링)
  - [필드 결합하기](#필드-결합하기)
  - [공백 제거하기](#공백-제거하기)

## table 생성 예제
- CLERK 테이블

![image](https://user-images.githubusercontent.com/68543150/129370563-63553ebc-d526-4f28-a3fa-d7694b713c7e.png)
```mysql
CREATE TABLE CLERK (
ID INT NOT NULL PRIMARY KEY,
STAFF_NM VARCHAR(20),
DEP_NM VARCHAR(30),
GENDER VARCHAR(1),
BIRTH_DT DATE,
EMP_FLAG VARCHAR(1)
);
```


## xlsx 파일을 db에 넣기
- 먼저 csv 파일로 변경

```mysql 
show global variables like 'local_infile;
```
off 인 경우
```mysql
set global local_infile=true;

mysql --local_infile=1 -u root -ppassword DB_name;
```

```mysql
LOAD DATA LOCAL INFILE "/SQL/examples/CLERK.csv" INTO TABLE clerk
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 6 LINES
(ID, STAFF_NM, DEP_NM, GENDER, @BIRTH_DT, EMP_FLAG)
set BIRTH_DT = STR_TO_DATE(@BIRTH_DT,'%Y-%m-%d');
```

![image](https://user-images.githubusercontent.com/68543150/129373105-c5316c22-65ba-48b6-9989-31614bf58855.png)

# 6. 텍스트 마이닝을 활용한 데이터 조건 주기

## LIKE 연산자를 활용한 필터링
- 뒤에 나오는 문자들을 모를 때
```mysql
SELECT 열 이름 FROM 테이블명 WHERE 열 이름 LIKE '찾고 싶은 문자%';
```
- 앞에 나오는 문자들을 모를 때
```mysql
SELECT 열 이름 FROM 테이블명 WHERE 열 이름 LIKE '%찾고 싶은 문자';
```
- 앞뒤에 나오는 문자들을 모를 때
```mysql
SELECT 열 이름 FROM 테이블명 WHERE 열 이름 LIKE '%찾고 싶은 문자%';
```
- 뒤에 나오는 문자를 모를 때 (마지막 글자가 생각나지 않는 경우)
```mysql
SELECT 열 이름 FROM 테이블명 WHERE 열 이름 LIKE '찾고 싶은 문자_';
```
- 앞에 나오는 문자를 모를 때
```mysql
SELECT 열 이름 FROM 테이블명 WHERE 열 이름 LIKE '_찾고 싶은 문자';
```
- 시작과 끝 문자만 아는 경우
```mysql
SELECT 열 이름 FROM 테이블명 WHERE 열 이름 LIKE '첫 글자%마지막 글자';
```
- 특정 단어를 원하지 않는 경우
```mysql
SELECT 열 이름 FROM 테이블명 WHERE 열 이름 NOT LIKE '%원하지 않는 문자%';
```
## 필드 결합하기

- 여러 열을 하나로 결합
```mysql
SELECT CONCAT(열 이름1, 열 이름 2) FROM 테이블명;
```
- 문자 삽입하기
```mysql
SELECT CONCAT(CONCAT(열 이름1, '삽입하고 싶은 문자열'), 열 이름 2) FROM 테이블명;
```
## 공백 제거하기

- 오른쪽 공백 제거하기
```mysql
SELECT 열 이름1, RTRIM(열 이름2) FROM 테이블명;
```
- 왼쪽 공백 제거하기
```mysql
SELECT 열 이름1, LTRIM(열 이름2) FROM 테이블명;
```
- 모든 공백 제거하기
```mysql
SELECT 열 이름1, TRIM(열 이름2) FROM 테이블명;
```