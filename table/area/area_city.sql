-- ----------------------------
-- Table structure for area_city
-- ----------------------------
DROP TABLE IF EXISTS "public"."area_city";
CREATE TABLE "public"."area_city" (
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
COMMENT ON TABLE "public"."area_city" IS '市级作物面积产品';
COMMENT ON COLUMN "public"."area_city"."id" IS '编号';
COMMENT ON COLUMN "public"."area_city"."code" IS '城市编号';
COMMENT ON COLUMN "public"."area_city"."type" IS '产品类型:0 预报产品 1 监测产品';
COMMENT ON COLUMN "public"."area_city"."crop_type" IS '作物类型';
COMMENT ON COLUMN "public"."area_city"."prod_date" IS '产品日期';
COMMENT ON COLUMN "public"."area_city"."value" IS '产品数值';
COMMENT ON COLUMN "public"."area_city"."rate" IS '同期变化率';


