# SQL
sql practice

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
```mysql 
show global variables like 'local_infile'
```
off 인 경우
```mysql
mysql --local_infile=1 -u root -ppassword DB_name
```

```mysql
LOAD DATA LOCAL INFILE "/SQL/examples/CLERK.csv" INTO TABLE clerk
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 6 LINES
(ID, STAFF_NM, DEP_NM, GENDER, @BIRTH_DT, EMP_FLAG)
set BIRTH_DT = STR_TO_DATE(@datevar,'%Y-%m-%d');
```

![image](https://user-images.githubusercontent.com/68543150/129373105-c5316c22-65ba-48b6-9989-31614bf58855.png)

