-- 요구사항:
-- 1. HOUSE B/L (HBL_NO) 를 기준으로 각 B/L 별 컨테이너 수량(CNTR 개수) 을 집계
-- 2. 가장 많은 수량을 가진 B/L 1건을 조회
-- 3. 컨테이너 수량은 CNTR_NO 기준으로 COUNT
-- 4. 동일 수량 시 ETD 빠른 순으로 우선 선택
-- 5. 결과 컬럼: HBL_NO, CNTR_COUNT, ETD
-- 6. 정렬: CNTR_COUNT DESC, ETD ASC

-- 여기에 SQL 쿼리를 작성하세요
select fhm.HBL_NO, count(fhc.CNTR_NO) as CNTR_COUNT, fhm.ETD
from FMS_HBL_MST fhm
join FMS_HBL_CNTR fhc on fhm.HBL_NO = fhc.HBL_NO
group by fhm.HBL_NO
order by CNTR_COUNT DESC, fhm.ETD
limit 1;