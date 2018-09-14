-- ----------------------------
-- Table structure for growth_prov
-- ----------------------------
DROP TABLE IF EXISTS "public"."growth_prov";
CREATE TABLE "public"."growth_prov" (
"id" SERIAL NOT NULL,
"code" VARCHAR(6) NOT NULL,
"type" INT NOT NULL,
"crop_type" INT NOT NULL,
"prod_date" DATE NOT NULL,
"value" NUMERIC(8,2) DEFAULT -1 NOT NULL,
"rate" INT DEFAULT -1 NOT NULL
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "public"."growth_prov" IS '省级作物长势产品';
COMMENT ON COLUMN "public"."growth_prov"."id" IS '编号';
COMMENT ON COLUMN "public"."growth_prov"."code" IS '省份编号';
COMMENT ON COLUMN "public"."growth_prov"."type" IS '产品类型:0 预报产品 1 监测产品';
COMMENT ON COLUMN "public"."growth_prov"."crop_type" IS '作物类型';
COMMENT ON COLUMN "public"."growth_prov"."prod_date" IS '产品日期';
COMMENT ON COLUMN "public"."growth_prov"."value" IS '产品数值';
COMMENT ON COLUMN "public"."growth_prov"."rate" IS '同期变化率';
