-- 获取某市，县级长势统计数据
-- f_growth_city(IN ilevel INT,IN icrop INT,IN ilimit INT,IN ioffset INT) 
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
-- DROP FUNCTION f_growth_prov();
CREATE OR REPLACE FUNCTION f_growth_city(IN ilevel INT,IN scity VARCHAR,IN icrop INT,IN ilimit INT,IN ioffset INT) 
RETURNS TABLE(date DATE,code VARCHAR,value NUMERIC(8,2),change INT) AS $BODY$
DECLARE

BEGIN

IF ilevel = 2 THEN

  --查询符合时间条件的市级监测产品（预报数据+监测的最新一期数据+历史年统计数据）
	RETURN QUERY 
  SELECT growth_city.prod_date,growth_city.code,growth_city.value,growth_city.rate FROM growth_city
	 WHERE (growth_city.code=scity AND growth_city.type=0 AND growth_city.prod_date > CURRENT_DATE) 
      OR (growth_city.code=scity AND growth_city.type=1) 
ORDER BY growth_city.prod_date DESC 
   LIMIT ilimit OFFSET ioffset ; 

ELSIF ilevel = 3 THEN

  --查询符合时间条件的县级监测产品（预报数据+监测的最新一期数据+历史年统计数据）
	RETURN QUERY 
  SELECT growth_county.prod_date,growth_county.code,growth_county.value,growth_county.rate FROM growth_county
	 WHERE (LEFT(growth_county.code,4)=LEFT(scity,4) AND growth_county.type=0 AND growth_county.prod_date > CURRENT_DATE) 
      OR (LEFT(growth_county.code,4)=LEFT(scity,4) AND growth_county.type=1) 
ORDER BY growth_county.prod_date DESC 
   LIMIT ilimit OFFSET ioffset ; 

END IF;

END;
$BODY$ LANGUAGE plpgsql;
