--------------------------------
-- "public"."f_map_country"("ilevel" INT)
-- 根据ilevel返回对应的全国区划
-- ilevel 0-3
--------------------------------
CREATE OR REPLACE FUNCTION "public"."f_map_country"("ilevel" INT)
  RETURNS "pg_catalog"."jsonb" AS $BODY$

DECLARE
  jsondata jsonb;

BEGIN

IF ilevel = 0 THEN
	SELECT
		jsonb_build_object ( 'type', 'FeatureCollection', 'features', jsonb_agg ( feature ) ) 
	INTO jsondata
	FROM(
		SELECT 
			jsonb_build_object ( 'type', 'Feature', 'properties', to_jsonb(ROW)-'geom', 'geometry', ST_AsGeoJSON(geom,4)::jsonb) AS feature 
		FROM(
			SELECT
				geom_country_slim.code AS code,
				geom_country_slim.short_name AS name,
				geom_country_slim.geom
			FROM
				geom_country_slim
		)ROW	  
	)features;
ELSIF ilevel = 1 THEN
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
		)ROW	  
	)features;
END IF;
RETURN jsondata;
END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100