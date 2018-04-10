CREATE
OR REPLACE FUNCTION f_trend_getcitytrend (
	startDate DATE,
	iregionid INTEGER,
	iprodtype INTEGER,
	icroptype INTEGER,
	idiseasetype INTEGER,
	endday DATE
) RETURNS TABLE (prodvalue FLOAT(53)) AS $Body$
BEGIN

IF (
	SELECT
		MAX (prodtime)
	FROM
		prod_realtime_city
) >= endday  THEN
	RETURN QUERY SELECT
		prod_realtime_city.prodvalue
	FROM
		prod_realtime_city
	WHERE
		(
			prod_realtime_city.prodtime BETWEEN startDate
			AND endday
		)
	AND prod_realtime_city.cityid = iregionid
	AND prod_realtime_city.prodtype = iprodtype
	AND prod_realtime_city.croptype = icroptype
	AND prod_realtime_city.diseasetype = idiseasetype ;
	ELSE
		RETURN QUERY SELECT
			prod_realtime_city.prodvalue
		FROM
			prod_realtime_city
		WHERE
			(
				prod_realtime_city.prodtime BETWEEN startDate
				AND (SELECT MAX (prodtime) FROM prod_realtime_prov)
			)
		AND prod_realtime_city.cityid = iregionid
		AND prod_realtime_city.prodtype = iprodtype
		AND prod_realtime_city.croptype = icroptype
		AND prod_realtime_city.diseasetype = idiseasetype
		UNION
			SELECT
				prod_forecast_city.prodvalue
			FROM
				prod_forecast_city
			WHERE
				(
					prod_forecast_city.prodtime BETWEEN (SELECT MAX (prodtime) FROM prod_realtime_prov)
					AND endday
				)
			AND prod_forecast_city.cityid = iregionid
			AND prod_forecast_city.prodtype = iprodtype
			AND prod_forecast_city.croptype = icroptype
			AND prod_forecast_city.diseasetype = idiseasetype ;
			END
			IF ;
			END ; $Body$ LANGUAGE plpgsql;