# 성별을 나타내는 GENDER 별칭, 남자면 1, 여자면 2
SELECT RESIDENCE_ID, SUBSTR(RESIDENCE_ID, 7, 1) AS GENDER
FROM cust_info;

# 이름을 KIM, JIHOON과 같은 형식으로 표기
SELECT CONCAT(CONCAT(TRIM(LAST_NM), ', '), TRIM(FIRST_NM))
FROM cust_info;

# 고객의 1년간 수익을 소수점 둘째 자리에서 반올림, 별칭은 NEW_ANNL_PERF
SELECT RESIDENCE_ID, ROUND(ANNL_PERF, 1) AS NEW_ANNL_PERF
FROM cust_info;