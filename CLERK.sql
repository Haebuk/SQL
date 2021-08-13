# ID 추출
SELECT ID FROM CLERK;

# 사번, 이름 출력
SELECT ID, STAFF_NM FROM clerk;

# 사번, 이름, 생년월일 출력
SELECT ID, STAFF_NM, BIRTH_DT FROM clerk;

# 모든 열 가져오기
SELECT * FROM clerk;

# 이름을 기준으로 오름차순 정렬하여 이름 및 부서명 출력(열 이름으로)
SELECT staff_nm, dep_nm FROM clerk ORDER BY staff_nm;

# 이름을 기준으로 오름차순 정렬하여 이름 및 부서명 출력(열 위치로로)
SELECT staff_nm, dep_nm FROM clerk ORDER BY 1;

# 부서명을 기준으로 오름차순 정렬하여 이름 및 부서명 출력(열 이름으로)
SELECT staff_nm, dep_nm FROM clerk ORDER BY dep_nm;

# 부서명을 기준으로 오름차순 정렬하여 이름 및 부서명 출력(열 위치로)
SELECT staff_nm, dep_nm FROM clerk ORDER BY 2;

# 부서명을 기준으로 오름차순 정렬 후, 이름으로 오름차순 정렬하여 이름 및 부서명 출력 (열 이름으로)
SELECT staff_nm, dep_nm FROM clerk ORDER BY dep_nm, staff_nm;

# 부서명을 기준으로 오름차순 정렬 후, 이름으로 오름차순 정렬하여 이름 및 부서명 출력 (열 위치치로)
SELECT staff_nm, dep_nm FROM clerk ORDER BY 2, 1;

# 재직 구분, 성별, 이름, 부서명을 기준으로 오름차순 정렬 후 재직구분, 성별, 이름, 부서명 출력(열 이름으로)
SELECT emp_flag, gender, staff_nm, dep_nm FROM clerk ORDER BY emp_flag, gender, staff_nm, dep_nm;

# 재직 구분, 성별, 이름, 부서명을 기준으로 오름차순 정렬 후 재직구분, 성별, 이름, 부서명 출력(열 위치로)
SELECT emp_flag, gender, staff_nm, dep_nm FROM clerk ORDER BY 1, 2, 3, 4;

# 열 이름 지정 방식은 SELECT 목록에 선택되지 않은 열로 정렬 가능
# 열 위치 지정 방식은 SELECT 목록에 선택되지 않은 열로 정렬 불가