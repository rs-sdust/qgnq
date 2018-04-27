-- 查询全国省级统计产品数据
-- ddate  数据日期
-- iprodType  产品类型编号
-- icroptype  作物类型编号
-- idiseasetype  病害类型编号
-- return jsonb  只返回数据，无空间信息
-- DROP FUNCTION f_get_prod_prov(date,integer,integer,integer);
CREATE OR REPLACE FUNCTION f_get_prod_prov(IN ddate DATE, IN iprodType INT,IN icroptype INT, IN idiseasetype INT) 
RETURNS jsonb AS $BODY$
DECLARE
  unit VARCHAR;
  jsondata jsonb;
BEGIN
-- 查询指定产品类型的数据单位
SELECT 
  dic_prodtype.unit 
INTO unit
FROM 
  dic_prodtype
WHERE
  dic_prodtype.id=iprodType;
  --查询预报数据
  IF ddate > CURRENT_DATE THEN
		-- 预报产品数据组成的jsonstring
    SELECT
	    jsonb_agg(row_to_json(t))
    INTO jsondata
		FROM(
		  SELECT 
			  prod_forecast_prov.provid AS id,
			  prod_forecast_prov.prodvalue AS value
			FROM
			  prod_forecast_prov
			WHERE
			  prod_forecast_prov.prodtime = ddate
			  AND prod_forecast_prov.prodtype = iprodType
	      AND prod_forecast_prov.croptype = icropType
	      AND prod_forecast_prov.diseasetype = idiseaseType
		)t;
--  按接口规则组织jsonstring
	  RETURN
		  jsonb_build_object(
			  'extent','1',
			  'unit',unit,
        'data',jsondata
			);				  			
  --查询实时数据					  
  ELSE
		-- 产品数据组成的jsonstring
    SELECT
	    jsonb_agg(row_to_json(t))
    INTO jsondata
		FROM(
		  SELECT 
			  prod_realtime_prov.provid AS id,
			  prod_realtime_prov.prodvalue AS value
			FROM
			  prod_realtime_prov
			WHERE
			  prod_realtime_prov.prodtime = ddate
			  AND prod_realtime_prov.prodtype = iprodType
	      AND prod_realtime_prov.croptype = icropType
	      AND prod_realtime_prov.diseasetype = idiseaseType
		)t;
--  按接口规则组织jsonstring
	  RETURN
		  jsonb_build_object(
			  'extent','1',
			  'unit',unit,
        'data',jsondata
			);
  END IF;						
END;
$BODY$ LANGUAGE plpgsql;

