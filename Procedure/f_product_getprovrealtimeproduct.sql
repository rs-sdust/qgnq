CREATE OR REPLACE FUNCTION f_Product_getprovrealtimeproduct(IN ddate date, IN iprodtype int4, IN icroptype int4, IN idiseasetype int4, IN iregionid int4) 
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
							prod_realtime_prov.prodvalue,
							geom_prov.geom
						FROM
							prod_realtime_prov
						JOIN geom_prov ON geom_prov.provid = prod_realtime_prov.provid
						WHERE
-- 							prod_realtime_prov.prodtime = to_date(sDate, 'YYYY-MM-DD')
								prod_realtime_prov.prodtime = ddate
						AND prod_realtime_prov.prodtype = iprodType
						AND prod_realtime_prov.croptype = icropType
						AND prod_realtime_prov.diseasetype = idiseaseType
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
							prod_realtime_prov.prodvalue
							FROM
								prod_realtime_prov
						JOIN geom_prov ON geom_prov.provid = prod_realtime_prov.provid
							WHERE
-- 								prod_realtime_prov.prodtime = to_date(sDate, 'YYYY-MM-DD')
									prod_realtime_prov.prodtime = ddate
							AND prod_realtime_prov.prodtype = iprodType
							AND prod_realtime_prov.croptype = icropType
							AND prod_realtime_prov.diseasetype = idiseaseType
							AND prod_realtime_prov.provid = iregionID
						) ROW
				) features ;
	END IF ;
END;
$BODY$ LANGUAGE plpgsql;
