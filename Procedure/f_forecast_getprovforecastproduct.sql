CREATE OR REPLACE FUNCTION f_forecast_getprovforecastproduct(IN sdate varchar, IN iprodtype int4, IN icroptype int4, IN idiseasetype int4, IN iregionid int4) 
RETURNS TABLE (jsonstring jsonb)
AS $BODY$
BEGIN

	IF iregionid = - 1 THEN
		RETURN QUERY SELECT
			jsonb_build_object (
				'type',
				'FeatureCollection',
				'features',
				jsonb_agg (feature)
			)
		FROM
			(
				SELECT
					jsonb_build_object (
						'type','Feature',
						'id','provid',
						'geometry',ST_AsGeoJSON (geom) :: jsonb,
						'properties',to_jsonb (ROW) - 'geom'
					) AS feature
				FROM
					(
						SELECT
							geom_prov.provid,
							geom_prov.provname,
							prod_forecast_prov.prodvalue,
							geom_prov.geom
						FROM
							prod_forecast_prov
						JOIN geom_prov ON geom_prov.provid = prod_forecast_prov.provid
						WHERE
							prod_forecast_prov.prodtime = to_date(sDate, 'YYYY-MM-DD')
						AND prod_forecast_prov.prodtype = iprodType
						AND prod_forecast_prov.croptype = icropType
						AND prod_forecast_prov.diseasetype = idiseaseType
					) ROW
			) features ;
	ELSE
			RETURN QUERY SELECT
				jsonb_build_object (
					'type',
					'FeatureCollection',
					'features',
					jsonb_agg (feature)
				)
			FROM
				(
					SELECT
					jsonb_build_object (
						'type','Feature',
						'id','provid',
						'geometry',ST_AsGeoJSON (geom) :: jsonb,
						'properties',to_jsonb (ROW) - 'geom'
					) AS feature
					FROM
						(
							SELECT
							geom_prov.provid,
							geom_prov.provname,
							geom_prov.geom,
							prod_forecast_prov.prodvalue
							FROM
								prod_forecast_prov
						JOIN geom_prov ON geom_prov.provid = prod_forecast_prov.provid
							WHERE
								prod_forecast_prov.prodtime = to_date(sDate, 'YYYY-MM-DD')
							AND prod_forecast_prov.prodtype = iprodType
							AND prod_forecast_prov.croptype = icropType
							AND prod_forecast_prov.diseasetype = idiseaseType
							AND prod_forecast_prov.provid = iregionID
						) ROW
				) features ;
	END IF ;
END;
$BODY$ LANGUAGE plpgsql;
