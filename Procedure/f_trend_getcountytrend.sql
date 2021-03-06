CREATE
OR REPLACE FUNCTION f_trend_getcountytrend (
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
		prod_realtime_county
) >= enddate THEN
	RETURN QUERY SELECT
		prod_realtime_county.prodvalue
	FROM
		prod_realtime_county
	WHERE
		(
			prod_realtime_county.prodtime BETWEEN startdate
			AND enddate
		)
	AND prod_realtime_county.counid = iregionid
	AND prod_realtime_county.prodtype = iprodtype
	AND prod_realtime_county.croptype = icroptype
	AND prod_realtime_county.diseasetype = idiseasetype ;
	ELSE
		RETURN QUERY SELECT
			prod_realtime_county.prodvalue
		FROM
			prod_realtime_county
		WHERE
			(
				prod_realtime_county.prodtime BETWEEN startdate
				AND (SELECT MAX (prodtime) FROM prod_realtime_prov)
			)
		AND prod_realtime_county.counid = iregionid
		AND prod_realtime_county.prodtype = iprodtype
		AND prod_realtime_county.croptype = icroptype
		AND prod_realtime_county.diseasetype = idiseasetype
		UNION
			SELECT
				prod_forecast_county.prodvalue
			FROM
				prod_forecast_county
			WHERE
				(
					prod_forecast_county.prodtime BETWEEN (SELECT MAX (prodtime) FROM prod_realtime_prov)
					AND enddate
				)
			AND prod_forecast_county.counid = iregionid
			AND prod_forecast_county.prodtype = iprodtype
			AND prod_forecast_county.croptype = icroptype
			AND prod_forecast_county.diseasetype = idiseasetype ;
			END
			IF ;
			END ; $Body$ LANGUAGE plpgsql;