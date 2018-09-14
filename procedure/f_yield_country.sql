-- 获取全国省、市、县级产量统计数据
-- f_yield_country(IN ilevel INT,IN icrop INT,IN ilimit INT,IN ioffset INT) 
-- ilevel 区划等级
-- icrop 作物类型编号
-- ilimit 
-- ioffset 
-- RETURN TABLE(date DATE,code VARCHAR,value NUMERIC(8,2),change INT)
-- date 日期
-- code 区划编码
-- value 产品值
-- change 变化率
-- DROP FUNCTION f_test();
CREATE OR REPLACE FUNCTION f_yield_country(IN ilevel INT,IN icrop INT,IN ilimit INT,IN ioffset INT) 
RETURNS TABLE(date DATE,code VARCHAR,value NUMERIC(8,2),change INT) AS $BODY$
DECLARE
  --监测产品最大日期
  max_date DATE;

BEGIN

IF ilevel = 1 THEN
  --获取省级监测产品最大日期
  SELECT MAX(yield_prov.prod_date) INTO max_date FROM yield_prov 
   WHERE yield_prov.type = 1 
     AND yield_prov.crop_type = icrop;
  --查询符合时间条件的省级产品（预报数据+监测的最新一期数据+历史年统计数据）
	RETURN QUERY SELECT yield_prov.prod_date,yield_prov.code,yield_prov.value,yield_prov.rate FROM yield_prov
	 WHERE (yield_prov.type=0 AND yield_prov.prod_date > CURRENT_DATE) 
      OR (yield_prov.type=1 AND yield_prov.prod_date = max_date) 
      OR (yield_prov.type=2)
ORDER BY yield_prov.prod_date DESC 
   LIMIT ilimit OFFSET ioffset ; 

ELSIF ilevel = 2 THEN
  --获取市级监测产品最大日期
	SELECT MAX(yield_city.prod_date) INTO max_date FROM yield_city 
   WHERE type = 1 
     AND yield_city.crop_type = icrop;
  --查询符合时间条件的市级产品（预报数据+监测的最新一期数据+历史年统计数据）
	RETURN QUERY 
  SELECT yield_city.prod_date,yield_city.code,yield_city.value,yield_city.rate FROM yield_city
	 WHERE (yield_city.type=0 AND yield_city.prod_date > CURRENT_DATE) 
      OR (yield_city.type=1 AND yield_city.prod_date = max_date) 
      OR (yield_city.type=2)
ORDER BY yield_city.prod_date DESC 
   LIMIT ilimit OFFSET ioffset ; 

ELSIF ilevel = 3 THEN
  --获取县级监测产品最大日期
	SELECT MAX(yield_county.prod_date) INTO max_date FROM yield_county 
   WHERE yield_county.type = 1 
     AND yield_county.crop_type = icrop;
  --查询符合时间条件的县级产品（预报数据+监测的最新一期数据+历史年统计数据）
	RETURN QUERY 
  SELECT yield_county.prod_date,yield_county.code,yield_county.value,yield_county.rate FROM yield_county
	 WHERE (yield_county.type=0 AND yield_county.prod_date > CURRENT_DATE) 
      OR (yield_county.type=1 AND yield_county.prod_date = max_date) 
      OR (yield_county.type=2)
ORDER BY yield_county.prod_date DESC 
   LIMIT ilimit OFFSET ioffset ; 

END IF;

END;
$BODY$ LANGUAGE plpgsql;
