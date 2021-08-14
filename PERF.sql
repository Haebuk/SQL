# 생년월일 오름차순 정렬, 아이디, 생년월일, 방문횟수 출력
SELECT cust_id, cust_birth, visit_cnt FROM perf ORDER BY cust_birth;

# 방문횟수별 구입금액의 분포
SELECT visit_cnt, sales_amt FROM perf ORDER BY visit_cnt DESC;