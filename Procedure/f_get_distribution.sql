-- 查询全国分布产品
-- ddate  数据日期
-- iprodType  产品类型编号
-- icroptype  作物类型编号
-- idiseasetype  病害类型编号
-- RETURN jsonb  返回带空间信息的分布数据
-- DROP FUNCTION f_get_distribution(date,integer,integer,integer);
CREATE OR REPLACE FUNCTION f_get_distribution(IN ddate DATE, IN iprodType INT,IN icroptype INT, IN idiseasetype INT) 
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
-- 预报产品
  IF ddate > CURRENT_DATE THEN
  	SELECT 
	    prod_forecast_distribution.jsonstring 
    INTO jsondata
	  FROM 
	    prod_forecast_distribution 
 	  WHERE 
	    prod_forecast_distribution.prodtime = ddate
	    AND prod_forecast_distribution.prodtype = iprodType
	    AND prod_forecast_distribution.croptype = icropType
	    AND prod_forecast_distribution.diseasetype = idiseaseType;	
    --  按接口规则组织jsonstring
	  RETURN
		  jsonb_build_object(
			  'extent','0',
			  'unit',unit,
        'data',jsondata
			);
-- 实时产品
	ELSE
  	SELECT 
	    prod_realtime_distribution.jsonstring 
    INTO jsondata
	  FROM 
	    prod_realtime_distribution 
 	  WHERE 
	    prod_realtime_distribution.prodtime = ddate
	    AND prod_realtime_distribution.prodtype = iprodType
	    AND prod_realtime_distribution.croptype = icropType
	    AND prod_realtime_distribution.diseasetype = idiseaseType;
    RETURN
		  jsonb_build_object(
			  'extent','0',
			  'unit',unit,
        'data',jsondata
			);
	END IF;
END;
$BODY$ LANGUAGE plpgsql;