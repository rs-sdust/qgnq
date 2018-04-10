CREATE OR REPLACE FUNCTION f_product_getrealtimedistribution(IN ddate date, IN iprodtype int4, IN icroptype int4, IN idiseasetype int4) 
RETURNS TABLE (jsonstring json)
AS $BODY$
BEGIN
	RETURN QUERY
	SELECT prod_realtime_distribution.jsonstring 
	FROM prod_realtime_distribution 
 	WHERE prodtime = ddate
	AND prod_realtime_distribution.prodtype = iprodType
	AND prod_realtime_distribution.croptype = icropType
	AND prod_realtime_distribution.diseasetype = idiseaseType;
END;
$BODY$ LANGUAGE plpgsql;