--------------------------------
-- "public"."f_map_county"( IN ilevel INT,IN sprov VARCHAR)
-- 根据ilevel 和 prov 返回对应的全县区划 
-- ilevel 3
-- scounty county code
--------------------------------
CREATE OR REPLACE FUNCTION "public"."f_map_county"( IN ilevel INT,IN scounty VARCHAR)
  RETURNS "pg_catalog"."jsonb" AS $BODY$

DECLARE
  jsondata jsonb;

BEGIN
IF ilevel = 3 THEN
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
			WHERE geom_county_slim.code = scounty
		)ROW	  
	)features;
END IF;
RETURN jsondata;
END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100