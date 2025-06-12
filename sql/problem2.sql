-- 요구사항:
-- 1. ETD 기간: 2025년 5월 1일 ~ 2025년 5월 11일
-- 2. POL(출발항) + 컨테이너 타입(CNTR_TYPE) 별로 집계
-- 3. 컨테이너 수량(CNTR 개수) 및 총 중량 합계(CNTR_WGT) 조회
-- 4. 결과 컬럼: POL_CD, CNTR_TYPE, CNTR_COUNT, TOTAL_WGT
-- 5. 정렬: POL_CD, CNTR_TYPE

-- 여기에 SQL 쿼리를 작성하세요
select fhm.POL_CD, fhc.CNTR_TYPE, COUNT(*) as CNTR_COUNT, SUM(CNTR_WGT) as TOTAL_WGT
from FMS_HBL_CNTR fhc
join FMS_HBL_MST fhm on fhc.HBL_NO = fhm.HBL_NO
where fhm.ETD between "20250501" and "20250511"
group by fhm.POL_CD, fhc.CNTR_TYPE
order by fhm.POL_CD, fhc.CNTR_TYPE;