--------------------------------
-- "public"."f_map_prov"( IN ilevel INT,IN sprov VARCHAR)
-- 根据ilevel 和 prov 返回对应的全省区划 
-- ilevel 1-3
-- sprov prov code
--------------------------------
CREATE OR REPLACE FUNCTION "public"."f_map_prov"( IN ilevel INT,IN sprov VARCHAR)
  RETURNS "pg_catalog"."jsonb" AS $BODY$

DECLARE
  jsondata jsonb;

BEGIN

IF ilevel = 1 THEN
	SELECT
		jsonb_build_object ( 'type', 'FeatureCollection', 'features', jsonb_agg ( feature ) ) 
	INTO jsondata
	FROM(
		SELECT 
			jsonb_build_object ( 'type', 'Feature', 'properties', to_jsonb(ROW)-'geom', 'geometry', ST_AsGeoJSON(geom,4)::jsonb) AS feature 
		FROM(
			SELECT
				geom_prov_slim.code AS code,
				geom_prov_slim.short_name AS name,
				geom_prov_slim.geom
			FROM
				geom_prov_slim
			WHERE geom_prov_slim.code = sprov
		)ROW	  
	)features;
ELSIF ilevel = 2 THEN
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
				
			WHERE LEFT(geom_city_slim.code,2) = LEFT(sprov,2)
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
			WHERE LEFT(geom_county_slim.code,2) = LEFT(sprov,2)
		)ROW	  
	)features;
END IF;
RETURN jsondata;
END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100