--地图初始化，获取省级geojson
--RETURN jsonb  只有空间信息，无产品数据 
CREATE OR REPLACE FUNCTION f_init_map() 
RETURNS jsonb AS $BODY$
DECLARE
  jsondata jsonb;
-- realMaxDate DATE;
-- geoJson jsonb;
BEGIN
-- 直接返回全国省级数据的geojson
SELECT
  jsonb_build_object ( 'type', 'FeatureCollection', 'features', jsonb_agg ( feature ) ) 
INTO jsondata
FROM(
  SELECT 
	  jsonb_build_object ( 'type', 'Feature', 'properties', to_jsonb(ROW)-'geom', 'geometry', ST_AsGeoJSON(geom)::jsonb) AS feature 
	FROM(
	  SELECT
		  geom_prov.provid AS id,
			geom_prov.provname AS name,
			geom_prov.geom
		FROM
		  geom_prov
	)ROW	  
)features;
RETURN jsondata;
--取实时省级产品的最新日期
-- SELECT MAX(prod_realtime_prov.prodtime) FROM prod_realtime_prov INTO realMaxDate;
--构建带小麦产量数据的省级geojson
-- SELECT
--  jsonb_build_object ( 'type', 'FeatureCollection', 'features', jsonb_agg ( feature ) ) 
-- FROM
--  (
--    SELECT
-- 	  jsonb_build_object ( 'type', 'Feature', 'id', 'id', 'geometry', ST_AsGeoJSON ( geom ) :: jsonb, 'properties', to_jsonb ( ROW ) - 'geom' ) AS feature 
-- 	 FROM
-- 	  (
-- 			SELECT
-- 				geom_prov.provid AS ID,
-- 				geom_prov.provname AS NAME,
-- 				prod_realtime_prov.prodvalue AS VALUE,
-- 				geom_prov.geom 
-- 			FROM
-- 				prod_realtime_prov
-- 				JOIN geom_prov ON geom_prov.provid = prod_realtime_prov.provid 
-- 			WHERE
-- 				prod_realtime_prov.prodtime = realMaxDate 
-- 				AND prod_realtime_prov.prodtype = 0 
-- 				AND prod_realtime_prov.croptype = 0 
-- 				AND prod_realtime_prov.diseasetype = - 1 
-- 		) ROW 
--  ) features INTO geoJson;
-- --构建接口定义的json返回值
-- RETURN 
--  				jsonb_build_object(
-- 				'extent','0',
-- 				'date',to_char(realMaxDate,'yyyy-mm-dd'),
-- 				'unit','万吨',
-- 				'data',geojson	
-- 				);
END;
$BODY$ LANGUAGE plpgsql;
