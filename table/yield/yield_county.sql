-- ----------------------------
-- Table structure for yield_county
-- ----------------------------
DROP TABLE IF EXISTS "public"."yield_county";
CREATE TABLE "public"."yield_county" (
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
COMMENT ON TABLE "public"."yield_county" IS '县级产量产品';
COMMENT ON COLUMN "public"."yield_county"."id" IS '编号';
COMMENT ON COLUMN "public"."yield_county"."code" IS '区县编号';
COMMENT ON COLUMN "public"."yield_county"."type" IS '产品类型:0 预报产品 1 监测产品';
COMMENT ON COLUMN "public"."yield_county"."crop_type" IS '作物类型';
COMMENT ON COLUMN "public"."yield_county"."prod_date" IS '产品日期';
COMMENT ON COLUMN "public"."yield_county"."value" IS '产品数值';
COMMENT ON COLUMN "public"."yield_county"."rate" IS '同期变化率';



