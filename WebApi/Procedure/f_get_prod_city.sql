-- 查询某省市级统计产品数据
-- ddate  数据日期
-- iregionid  所属省份编号
-- iprodType  产品类型编号
-- icroptype  作物类型编号
-- idiseasetype  病害类型编号
-- return jsonb  返回带空间信息的数据
-- DROP FUNCTION f_get_prod_city(date,integer,integer,integer,integer);
CREATE OR REPLACE FUNCTION f_get_prod_city(IN ddate DATE,IN iregionid INT, IN iprodType INT,IN icroptype INT, IN idiseasetype INT) 
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
				  geom_city.cityid AS id,
					geom_city.cityname AS name,
					prod_forecast_city.prodvalue AS value,
					geom_city.geom
				FROM
					prod_forecast_city
				JOIN 
          geom_city ON geom_city.cityid = prod_forecast_city.cityid
				WHERE
					prod_forecast_city.prodtime =ddate
					AND prod_forecast_city.prodtype = iprodType
					AND prod_forecast_city.croptype = icropType
					AND prod_forecast_city.diseasetype = idiseaseType
					AND prod_forecast_city.provid = iregionID
			) ROW
		) features ;
    RETURN
		  jsonb_build_object(
			  'extent','2',
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
				  geom_city.cityid AS id,
					geom_city.cityname AS name,
					prod_realtime_city.prodvalue AS value,
					geom_city.geom
				FROM
					prod_realtime_city
				JOIN 
          geom_city ON geom_city.cityid = prod_realtime_city.cityid
				WHERE
					prod_realtime_city.prodtime =ddate
					AND prod_realtime_city.prodtype = iprodType
					AND prod_realtime_city.croptype = icropType
					AND prod_realtime_city.diseasetype = idiseaseType
					AND prod_realtime_city.provid = iregionID
			) ROW
		) features ;
    RETURN
		  jsonb_build_object(
			  'extent','2',
			  'unit',unit,
        'data',jsondata
			);
  END IF;
END;
$BODY$ LANGUAGE plpgsql;

