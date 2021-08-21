# 12월 수신평균잔액이 11월보다 10% 증가 시 1, 아니면 0
SELECT *,
    CASE WHEN BALANCE_201312 >= BALANCE_201311*1.1
        THEN 1
        ELSE 0
    END AS OFFER_ACCEPT
FROM casa_201312;

# 위에 대한 반응률
SELECT 
    COUNT(CUST_ID) AS LEAD_CNT,
    SUM(CASE 
            WHEN BALANCE_201312 >= BALANCE_201311*1.1
                THEN 1
                ELSE 0
        END) AS OFFER_ACCEPT,
    CONCAT(ROUND((SUM(CASE 
            WHEN BALANCE_201312 >= BALANCE_201311*1.1
                THEN 1
                ELSE 0
        END)*100/COUNT(CUST_ID)),0), '%') AS RES_RATE
FROM casa_201312;

# R수익이 얼마나 증가하였는가
# 일년 평균이익 0.9%, 11월 대비 12월에 증가한 평균 잔액이 1년 동안 지속 가정
SELECT
    SUM(BALANCE_201311) AS VAL_1311,
    SUM(BALANCE_201312) AS VAL_1312,
    SUM(BALANCE_201312) - SUM(BALANCE_201311) AS INC_BAL,
    (SUM(BALANCE_201312) - SUM(BALANCE_201311)) * 0.009 AS REV
FROM casa_201312;

# LMS 비용 30원, 오퍼 비용 실버 2000, 골드 3000, 다이아 5000일 때 ROI(Return On Investment)
SELECT
    COUNT(CUST_ID) * 30 AS LMS_COST,
    SUM(CASE
            WHEN BALANCE_201311 * 1.1 <= BALANCE_201312 AND CUST_SEG = 'SILVER'
                THEN 2000
            WHEN BALANCE_201311 * 1.1 <= BALANCE_201312 AND CUST_SEG = 'GOLD'
                THEN 3000
            WHEN BALANCE_201311 * 1.1 <= BALANCE_201312 AND CUST_SEG = 'DIAMOND'
                THEN 5000
            ELSE 0
        END) AS OFFER_COST
FROM casa_201312;