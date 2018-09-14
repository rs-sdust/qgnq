-- ----------------------------
-- Table structure for yield_prov_geom
-- ----------------------------
DROP TABLE IF EXISTS "public"."yield_prov_geom";
CREATE TABLE "public"."yield_prov_geom" (
"id" SERIAL NOT NULL,
"code" VARCHAR(6) NOT NULL,
"type" INT NOT NULL,
"crop_type" INT NOT NULL,
"prod_date" DATE NOT NULL,
"geo_json" JSON NOT NULL
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "public"."yield_prov_geom" IS '省级产量空间分布产品';
COMMENT ON COLUMN "public"."yield_prov_geom"."id" IS '编号';
COMMENT ON COLUMN "public"."yield_prov_geom"."code" IS '省份编号';
COMMENT ON COLUMN "public"."yield_prov_geom"."type" IS '产品类型：0 预报 1 监测';
COMMENT ON COLUMN "public"."yield_prov_geom"."crop_type" IS '作物类型';
COMMENT ON COLUMN "public"."yield_prov_geom"."prod_date" IS '产品日期';
COMMENT ON COLUMN "public"."yield_prov_geom"."geo_json" IS 'geojson str 4326';
