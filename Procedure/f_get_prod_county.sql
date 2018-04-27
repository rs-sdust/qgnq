-- 查询某市的县级统计产品数据
-- ddate  数据日期
-- iregionid  所属地市编号
-- iprodType  产品类型编号
-- icroptype  作物类型编号
-- idiseasetype  病害类型编号
-- return jsonb  返回带空间信息的数据
-- DROP FUNCTION f_get_prod_county(date,integer,integer,integer,integer);
CREATE OR REPLACE FUNCTION f_get_prod_county(IN ddate DATE,IN iregionid INT, IN iprodType INT,IN icroptype INT, IN idiseasetype INT) 
RETURNS jsonb AS $BODY$
DECLARE
  unit VARCHAR;
  jsondata jsonb;
BEGIN
  --查询指定产品类型的数据单位
	SELECT 
		dic_prodtype.unit 
	INTO unit
	FROM 
		dic_prodtype
	WHERE
		dic_prodtype.id=iprodType;
  --查询预报数据
  IF ddate > CURRENT_DATE THEN
    SELECT
		  jsonb_build_object (
			  'type','FeatureCollection',
				'features',jsonb_agg (feature)
			)
    INTO jsondata
		FROM(
		  SELECT
			  jsonb_build_object (
				  'type','Feature',
					'geometry',ST_AsGeoJSON (geom) :: jsonb,
					'properties',to_jsonb (ROW) - 'geom'
				) AS feature
			FROM(
			  SELECT
				  geom_county.counid AS id,
					geom_county.counname AS name,
					prod_forecast_county.prodvalue AS value,
					geom_county.geom
				FROM
					prod_forecast_county
				JOIN 
          geom_county ON geom_county.counid = prod_forecast_county.counid
				WHERE
					prod_forecast_county.prodtime =ddate
					AND prod_forecast_county.prodtype = iprodType
					AND prod_forecast_county.croptype = icropType
					AND prod_forecast_county.diseasetype = idiseaseType
					AND prod_forecast_county.cityid = iregionID
			) ROW
		) features ;
    RETURN
		  jsonb_build_object(
			  'extent','3',
			  'unit',unit,
        'data',jsondata
			);
  --查询实时数据	
  ELSE
    SELECT
		  jsonb_build_object (
			  'type','FeatureCollection',
				'features',jsonb_agg (feature)
			)
    INTO jsondata
		FROM(
		  SELECT
			  jsonb_build_object (
				  'type','Feature',
					'geometry',ST_AsGeoJSON (geom) :: jsonb,
					'properties',to_jsonb (ROW) - 'geom'
				) AS feature
			FROM(
			  SELECT
				  geom_county.counid AS id,
					geom_county.counname AS name,
					prod_realtime_county.prodvalue AS value,
					geom_county.geom
				FROM
					prod_realtime_county
				JOIN 
          geom_county ON geom_county.counid = prod_realtime_county.counid
				WHERE
					prod_realtime_county.prodtime =ddate
					AND prod_realtime_county.prodtype = iprodType
					AND prod_realtime_county.croptype = icropType
					AND prod_realtime_county.diseasetype = idiseaseType
					AND prod_realtime_county.cityid = iregionID
			) ROW
		) features ;
    RETURN
		  jsonb_build_object(
			  'extent','3',
			  'unit',unit,
        'data',jsondata
			);
  END IF;
END;
$BODY$ LANGUAGE plpgsql;

