-- ----------------------------
-- Table structure for growth_country_geom
-- ----------------------------
DROP TABLE IF EXISTS "public"."growth_country_geom";
CREATE TABLE "public"."growth_country_geom" (
"id" SERIAL NOT NULL,
"type" INT NOT NULL,
"crop_type" INT NOT NULL,
"prod_date" DATE NOT NULL,
"geo_json" JSON NOT NULL
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "public"."growth_country_geom" IS '全国作物长势空间分布产品';
COMMENT ON COLUMN "public"."growth_country_geom"."id" IS '编号';
COMMENT ON COLUMN "public"."growth_country_geom"."type" IS '产品类型：0 预报 1 监测';
COMMENT ON COLUMN "public"."growth_country_geom"."crop_type" IS '作物类型';
COMMENT ON COLUMN "public"."growth_country_geom"."prod_date" IS '产品日期';
COMMENT ON COLUMN "public"."growth_country_geom"."geo_json" IS 'geojson str 4326';
