CREATE OR REPLACE FUNCTION f_forecast_getforecastdistribution(IN ddate date, IN iprodtype int4, IN icroptype int4, IN idiseasetype int4) 
RETURNS TABLE (jsonstring json)
AS $BODY$
BEGIN
	RETURN QUERY
	SELECT prod_forecast_distribution.jsonstring 
	FROM prod_forecast_distribution 
	WHERE 
-- 			prodtime = to_date(sDate, 'YYYY-MM-DD')
	prodtime = ddate
	AND prod_forecast_distribution.prodtype = iprodType
	AND prod_forecast_distribution.croptype = icropType
	AND prod_forecast_distribution.diseasetype = idiseaseType;
END;
$BODY$ LANGUAGE plpgsql;