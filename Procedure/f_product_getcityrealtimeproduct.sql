CREATE OR REPLACE FUNCTION f_product_getcityrealtimeproduct(IN sdate varchar, IN iprodtype int4, IN icroptype int4, IN idiseasetype int4, IN iregionid int4) 
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
							geom_city.cityid,
							geom_city.cityname,
							prod_realtime_city.prodvalue,
							geom_city.geom
						FROM
							prod_realtime_city
						JOIN geom_city ON geom_city.cityid = prod_realtime_city.cityid
						WHERE
							prod_realtime_city.prodtime = to_date(sDate, 'YYYY-MM-DD')
						AND prod_realtime_city.prodtype = iprodType
						AND prod_realtime_city.croptype = icropType
						AND prod_realtime_city.diseasetype = idiseaseType
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
							geom_city.cityid,
							geom_city.cityname,
							prod_realtime_city.prodvalue,
							geom_city.geom
							FROM
								prod_realtime_city
						JOIN geom_city ON geom_city.cityid = prod_realtime_city.cityid
							WHERE
								prod_realtime_city.prodtime = to_date(sDate, 'YYYY-MM-DD')
							AND prod_realtime_city.prodtype = iprodType
							AND prod_realtime_city.croptype = icropType
							AND prod_realtime_city.diseasetype = idiseaseType
							AND prod_realtime_city.provid = iregionID
						) ROW
				) features ;
	END IF ;
END;
$BODY$ LANGUAGE plpgsql;
