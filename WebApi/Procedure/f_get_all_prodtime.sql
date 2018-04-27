--时间初始化，获取指定产品类型的有数据日期列表
-- DROP FUNCTION f_get_all_prodtime();
CREATE OR REPLACE FUNCTION f_get_all_prodtime(IN iprodtype int4, IN icroptype int4, IN idiseasetype int4) 
RETURNS TABLE(date DATE) AS $BODY$
BEGIN
-- 查询实时产品的数据日期
RETURN QUERY SELECT DISTINCT
  prod_realtime_prov.prodtime
FROM
  prod_realtime_prov
WHERE
  prod_realtime_prov.prodtype=iprodtype
	AND prod_realtime_prov.croptype=icroptype
	AND prod_realtime_prov.diseasetype=idiseasetype
UNION
-- 查询预报产品的数据日期
  SELECT DISTINCT
	  prod_forecast_prov.prodtime
	FROM
	  prod_forecast_prov
	WHERE
	  prod_forecast_prov.prodtype=iprodtype
	  AND prod_forecast_prov.croptype=icroptype
	  AND prod_forecast_prov.diseasetype=idiseasetype
		AND prod_forecast_prov.prodtime > CURRENT_DATE;
END	  
$BODY$ LANGUAGE plpgsql;
