-- 获取某市，县级面积统计数据
-- f_area_city(IN ilevel INT,IN icrop INT,IN ilimit INT,IN ioffset INT) 
-- ilevel 区划等级
-- scity 城市代码
-- icrop 作物类型编号
-- ilimit 
-- ioffset 
-- RETURN TABLE(date DATE,code VARCHAR,value NUMERIC(8,2),change INT)
-- date 日期
-- code 区划编码
-- value 产品值
-- change 变化率
-- DROP FUNCTION f_area_prov();
CREATE OR REPLACE FUNCTION f_area_city(IN ilevel INT,IN scity VARCHAR,IN icrop INT,IN ilimit INT,IN ioffset INT) 
RETURNS TABLE(date DATE,code VARCHAR,value NUMERIC(8,2),change INT) AS $BODY$
DECLARE
  --监测产品最大日期
  max_date DATE;

BEGIN

IF ilevel = 2 THEN
  --获取市级监测产品最大日期
	SELECT MAX(area_city.prod_date) INTO max_date FROM area_city 
   WHERE area_city.code = scity
     AND area_city.type = 1 
     AND area_city.crop_type = icrop;
  --查询符合时间条件的县级监测产品（预报数据+监测的最新一期数据+历史年统计数据）
	RETURN QUERY 
  SELECT area_city.prod_date,area_city.code,area_city.value,area_city.rate FROM area_city
	 WHERE (area_city.code=scity AND area_city.type=0 AND area_city.prod_date > CURRENT_DATE) 
      OR (area_city.code=scity AND area_city.type=1 AND area_city.prod_date = max_date) 
      OR (area_city.code=scity AND area_city.type=2)
ORDER BY area_city.prod_date DESC 
   LIMIT ilimit OFFSET ioffset ; 

ELSIF ilevel = 3 THEN
  --获取县级监测产品最大日期
	SELECT MAX(area_county.prod_date) INTO max_date FROM area_county 
   WHERE LEFT(area_county.code,4)=LEFT(scity,4)
     AND area_county.type = 1 
     AND area_county.crop_type = icrop;
  --查询符合时间条件的县级监测产品（预报数据+监测的最新一期数据+历史年统计数据）
	RETURN QUERY 
  SELECT area_county.prod_date,area_county.code,area_county.value,area_county.rate FROM area_county
	 WHERE (LEFT(area_county.code,4)=LEFT(scity,4) AND area_county.type=0 AND area_county.prod_date > CURRENT_DATE) 
      OR (LEFT(area_county.code,4)=LEFT(scity,4) AND area_county.type=1 AND area_county.prod_date = max_date) 
      OR (LEFT(area_county.code,4)=LEFT(scity,4) AND area_county.type=2)
ORDER BY area_county.prod_date DESC 
   LIMIT ilimit OFFSET ioffset ; 

END IF;

END;
$BODY$ LANGUAGE plpgsql;
