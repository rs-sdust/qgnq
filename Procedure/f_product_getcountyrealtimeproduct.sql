CREATE OR REPLACE FUNCTION f_Product_getcountyrealtimeproduct(IN sdate varchar, IN iprodtype int4, IN icroptype int4, IN idiseasetype int4, IN iregionid int4) 
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
							geom_county.counid,
							geom_county.counname,
							prod_realtime_county.prodvalue,
							geom_county.geom
						FROM
							prod_realtime_county
						JOIN geom_county ON geom_county.counid = prod_realtime_county.counid
						WHERE
							prod_realtime_county.prodtime = to_date(sDate, 'YYYY-MM-DD')
						AND prod_realtime_county.prodtype = iprodType
						AND prod_realtime_county.croptype = icropType
						AND prod_realtime_county.diseasetype = idiseaseType
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
							geom_county.counid,
							geom_county.counname,
							prod_realtime_county.prodvalue,
							geom_county.geom
							FROM
								prod_realtime_county
						JOIN geom_county ON geom_county.counid = prod_realtime_county.counid
							WHERE
								prod_realtime_county.prodtime = to_date(sDate, 'YYYY-MM-DD')
							AND prod_realtime_county.prodtype = iprodType
							AND prod_realtime_county.croptype = icropType
							AND prod_realtime_county.diseasetype = idiseaseType
							AND prod_realtime_county.cityid = iregionID
						) ROW
				) features ;
	END IF ;
END;
$BODY$ LANGUAGE plpgsql;
