CREATE
OR REPLACE FUNCTION f_trend_getprovtrend (
	startdate DATE,
	iregionid INTEGER,
	iprodtype INTEGER,
	icroptype INTEGER,
	idiseasetype INTEGER,
	enddate DATE
) RETURNS TABLE (prodvalue FLOAT(53)) AS $Body$
BEGIN
IF (
	SELECT
		MAX (prodtime)
	FROM
		prod_realtime_prov
) >= enddate THEN
	RETURN QUERY SELECT
		prod_realtime_prov.prodvalue
	FROM
		prod_realtime_prov
	WHERE
		(
			prod_realtime_prov.prodtime BETWEEN startdate
			AND enddate
		)
	AND prod_realtime_prov.provid = iregionid
	AND prod_realtime_prov.prodtype = iprodtype
	AND prod_realtime_prov.croptype = icroptype
	AND prod_realtime_prov.diseasetype = idiseasetype ;
	ELSE
		RETURN QUERY SELECT
			prod_realtime_prov.prodvalue
		FROM
			prod_realtime_prov
		WHERE
			(
				prod_realtime_prov.prodtime BETWEEN startdate
				AND (SELECT MAX (prodtime) FROM prod_realtime_prov)
			)
		AND prod_realtime_prov.provid = iregionid
		AND prod_realtime_prov.prodtype = iprodtype
		AND prod_realtime_prov.croptype = icroptype
		AND prod_realtime_prov.diseasetype = idiseasetype
		UNION
			SELECT
				prod_forecast_prov.prodvalue
			FROM
				prod_forecast_prov
			WHERE
				(
					prod_forecast_prov.prodtime BETWEEN (SELECT MAX (prodtime) FROM prod_realtime_prov)
					AND enddate
				)
			AND prod_forecast_prov.provid = iregionid
			AND prod_forecast_prov.prodtype = iprodtype
			AND prod_forecast_prov.croptype = icroptype
			AND prod_forecast_prov.diseasetype = idiseasetype ;
			END
			IF ;
			END ; $Body$ LANGUAGE plpgsql;