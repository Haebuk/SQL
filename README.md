# SQL
- [SQL](#sql)
  - [table 생성 예제](#table-생성-예제)
  - [xlsx 파일을 db에 넣기](#xlsx-파일을-db에-넣기)
- [6. 텍스트 마이닝을 활용한 데이터 조건 주기](#6-텍스트-마이닝을-활용한-데이터-조건-주기)
  - [LIKE 연산자를 활용한 필터링](#like-연산자를-활용한-필터링)
  - [필드 결합하기](#필드-결합하기)
  - [공백 제거하기](#공백-제거하기)
- [7. 기초 함수](#7-기초-함수)
  - [문자 함수](#문자-함수)
  - [숫자 함수](#숫자-함수)
  - [날짜 함수](#날짜-함수)
- [8.함수 활용하기](#8함수-활용하기)
  - [숫자 데이터 요약](#숫자-데이터-요약)
  - [CASE WHEN 문장](#case-when-문장)
- [9. 데이터의 그룹화, 필터링](#9-데이터의-그룹화-필터링)
  - [데이터의 그룹화](#데이터의-그룹화)
  - [그룹화된 데이터의 필터링](#그룹화된-데이터의-필터링)
- [10.테이블 합치기](#10테이블-합치기)
  - [내부 조인](#내부-조인)
  - [외부 조인](#외부-조인)
- [행 합치기](#행-합치기)
  - [UNION 연산자](#union-연산자)

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

# 7. 기초 함수
## 문자 함수
|함수|설명|
|---|---|
`LOWER`|모든 문자를 소문자로 변환
`UPPER`|모든 문자를 대문자로 변환
`LENGTH`| 문자의 길이
`SUBSTR`| 문자 값중 원하는 길이만큼 나타냄
`RTRIM`| 문자열 오른쪽 공백 자름
`LTRIM`| 문자열 왼쪽 공백 자름
`TRIM`| 문자열의 왼쪽, 오른쪽 공백 잘라냄
`REPLACE`| 특정 문자열을 다른 문자열로 대체
`COALESCE`| 조건에 따라 여러 가지 값으로 치환
`INTCAP`| 첫 글자는 대문자, 나머지는 소문자로 변환

## 숫자 함수
|함수|설명|
|---|---|
`ROUND`| 소수점의 자릿수를 지정하여 반올림
`TRUNC`| 해당 소수점 자리에서 잘라냄
`MOD(M,N)`| M을 N으로 나눈 나머지 나타냄
`ABS`| 절대값 변환
`SIGN`| 숫자가 양수면 1, 음수면 -1, 0이면 0 나타냄
`SQRT`| 제곱근
`COS`| 지정 각도의 COS값
`SIN`| 지정 각도의 SIN값
`PI`| 지정 각도의 PI값
`TAN`| 지정 각도의 TAN값

## 날짜 함수
|함수|설명|
|---|---|
`ADD_MONTHS`| 지정한 날짜에 개월 수를 더한 값 출력
`SYSDATE`| 현재 시스템의 날짜 데이터 반환
`LAST_DAY`| 해당 월의 마지막 날짜 반환
`MONTH_BETWEEN`| 지정된 월 간의 월 수 반환(한 달 이내 OR 맞아 떨어지지 않으면 소수점 표시)

# 8.함수 활용하기
## 숫자 데이터 요약
|함수|설명|
|---|---|
`COUNT`|행의 수
`SUM`|행의 합계
`AVG`|행의 평균
`MAX`|행의 최댓값
`MIN`|행의 최솟값
`STDENV`|행의 표준편차
`VARIANCE`|행의 분산

## CASE WHEN 문장
```mysql
SELECT 열 이름1,
       CASE WHEN [조건1] THEN [결과값1]
            WHEN [조건2] THEN [결과값2]
            ELSE [결과값3] END AS 새로운 열 이름
```

# 9. 데이터의 그룹화, 필터링
## 데이터의 그룹화
- 열 이름으로 그룹화
```mysql
SELECT 그룹화할 열 이름 1, 그룹화할 열 이름2, 집계 함수
FROM 테이블 명
WHERE 조건절
GROUP BY 열 이름1, 열 이름2;
```
- 열 위치로 그룹화
```mysql
SELECT 그룹화할 열 이름1, 그룹화할 열 이름2, 집계 함수
FROM 테이블 명
WHERE 조건절
GROUP BY 1, 2;
```

## 그룹화된 데이터의 필터링
- 그룹화 데이터 필터링
```mysql
SELECT 그룹화할 열 이름1, 집계 함수
FROM 테이블명
WHERE 조건절
GROUP BY 열 이름1
HAVING 집계 함수 조건;
```

# 10.테이블 합치기
## 내부 조인
- FROM/WHERE를 사용
```mysql
SELECT 테이블명1.열 이름1, 테이블명2.열 이름2
FROM 테이블명1, 테이블명2
WHERE 테이블명1.KEY = 테이블명2.KEY
```
- FROM/WHERE와 별칭을 사용
```mysql
SELECT 별칭1.열 이름1, 별칭2.열 이름2
FROM 테이블명1 AS 별칭1, 테이블명2 AS 별칭2
WHERE 테이블명1.KEY = 테이블명2.KEY
```
- INNER JOIN을 사용
```mysql
SELECT 테이블명1.열 이름1, 테이블명2.열 이름2
FROM 테이블명1 INNER JOIN 테이블명2
ON 테이블명1.KEY = 테이블명2.KEY
```
- INNER JOIN과 별칭을 사용
```mysql
SELECT 별칭1.열 이름1, 별칭2.열 이름2
FROM 테이블명1 AS 별칭1 INNER JOIN 테이블명2 AS 별칭2
ON 별칭1.KEY = 별칭2.KEY
```
## 외부 조인
- LEFT OUTER JOIN 
```mysql
SELECT 별칭1.열 이름1, 별칭2.열 이름2
FROM 테이블명 (AS) 별칭 1 LEFT (OUTER) JOIN 테이블명2 (AS) 별칭2
ON 별칭1.KEY = 별칭2.KEY;
```
- RIGHT OUTER JOIN
```mysql
SELECT 별칭1.열 이름1, 별칭2.열 이름2
FROM 테이블명1 (AS) 별칭1 RIGHT (OUTER) JOINT 테이블명2 (AS) 별칭2
ON 별칭1.KEY = 별칭2.KEY;
```
- FULL OUTER JOIN
```mysql
SELECT 별칭1.열 이름1, 별칭2.열 이름2
FROM 테이블명1 (AS) 별칭1 FULL (OUTER) JOIN 테이블명2 (AS) 별칭2
ON 별칭1.KEY = 별칭2.KEY;
```

# 행 합치기
## UNION 연산자
- UNION 연산자 사용
```mysql
SELECT 열 이름1, 열 이름2 FROM 테이블명1 WHERE 조건절
UNION
SELECT 열 이름1, 열 이름2 FROM 테이블명2 WHERE 조건절
ORDER BY 1;
```
