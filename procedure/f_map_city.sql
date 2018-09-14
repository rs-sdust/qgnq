--------------------------------
-- "public"."f_map_city"( IN ilevel INT,IN sprov VARCHAR)
-- 根据ilevel 和 prov 返回对应的全市区划 
-- ilevel 2-3
-- scity city code
--------------------------------
CREATE OR REPLACE FUNCTION "public"."f_map_city"( IN ilevel INT,IN scity VARCHAR)
  RETURNS "pg_catalog"."jsonb" AS $BODY$

DECLARE
  jsondata jsonb;

BEGIN

IF ilevel = 2 THEN
	SELECT
		jsonb_build_object ( 'type', 'FeatureCollection', 'features', jsonb_agg ( feature ) ) 
	INTO jsondata
	FROM(
		SELECT 
			jsonb_build_object ( 'type', 'Feature', 'properties', to_jsonb(ROW)-'geom', 'geometry', ST_AsGeoJSON(geom,4)::jsonb) AS feature 
		FROM(
			SELECT
				geom_city_slim.code AS code,
				geom_city_slim.short_name AS name,
				geom_city_slim.geom
			FROM
				geom_city_slim
				
			WHERE geom_city_slim.code = scity
		)ROW	  
	)features;
ELSIF ilevel = 3 THEN
	SELECT
		jsonb_build_object ( 'type', 'FeatureCollection', 'features', jsonb_agg ( feature ) ) 
	INTO jsondata
	FROM(
		SELECT 
			jsonb_build_object ( 'type', 'Feature', 'properties', to_jsonb(ROW)-'geom', 'geometry', ST_AsGeoJSON(geom,4)::jsonb) AS feature 
		FROM(
			SELECT
				geom_county_slim.code AS code,
				geom_county_slim.short_name AS name,
				geom_county_slim.geom
			FROM
				geom_county_slim
			WHERE LEFT(geom_county_slim.code,4) = LEFT(scity,4)
		)ROW	  
	)features;
END IF;
RETURN jsondata;
END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100