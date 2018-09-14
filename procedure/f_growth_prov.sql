-- 获取某省,市、县级长势统计数据
-- f_growth_prov(IN ilevel INT,IN icrop INT,IN ilimit INT,IN ioffset INT) 
-- ilevel 区划等级
-- sprov 省份代码
-- icrop 作物类型编号
-- ilimit 
-- ioffset 
-- RETURN TABLE(date DATE,code VARCHAR,value NUMERIC(8,2),change INT)
-- date 日期
-- code 区划编码
-- value 产品值
-- change 变化率
-- DROP FUNCTION f_growth_prov();
CREATE OR REPLACE FUNCTION f_growth_prov(IN ilevel INT,IN sprov VARCHAR,IN icrop INT,IN ilimit INT,IN ioffset INT) 
RETURNS TABLE(date DATE,code VARCHAR,value NUMERIC(8,2),change INT) AS $BODY$
DECLARE

BEGIN

IF ilevel = 1 THEN

  --查询符合时间条件的省级产品（预报数据+监测数据）
	RETURN QUERY 
  SELECT growth_prov.prod_date,growth_prov.code,growth_prov.value,growth_prov.rate FROM growth_prov
	 WHERE (growth_prov.code=sprov AND growth_prov.type=0 AND growth_prov.prod_date > CURRENT_DATE) 
      OR (growth_prov.code=sprov AND growth_prov.type=1) 
ORDER BY growth_prov.prod_date DESC 
   LIMIT ilimit OFFSET ioffset ; 

ELSIF ilevel = 2 THEN

  --查询符合时间条件的市级产品（预报数据+监测数据）
	RETURN QUERY 
  SELECT growth_city.prod_date,growth_city.code,growth_city.value,growth_city.rate FROM growth_city
	 WHERE (LEFT(growth_city.code,2)=LEFT(sprov,2) AND growth_city.type=0 AND growth_city.prod_date > CURRENT_DATE) 
      OR (LEFT(growth_city.code,2)=LEFT(sprov,2) AND growth_city.type=1) 
ORDER BY growth_city.prod_date DESC 
   LIMIT ilimit OFFSET ioffset ; 

ELSIF ilevel = 3 THEN

  --查询符合时间条件的县级产品（预报数据+监测数据）
	RETURN QUERY 
  SELECT growth_county.prod_date,growth_county.code,growth_county.value,growth_county.rate FROM growth_county
	 WHERE (LEFT(growth_county.code,2)=LEFT(sprov,2) AND growth_county.type=0 AND growth_county.prod_date > CURRENT_DATE) 
      OR (LEFT(growth_county.code,2)=LEFT(sprov,2) AND growth_county.type=1 ) 
ORDER BY growth_county.prod_date DESC 
   LIMIT ilimit OFFSET ioffset ; 

END IF;

END;
$BODY$ LANGUAGE plpgsql;
