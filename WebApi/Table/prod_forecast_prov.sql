/*
Navicat PGSQL Data Transfer

Source Server         : postgis
Source Server Version : 100100
Source Host           : 192.168.2.253:5432
Source Database       : postgis
Source Schema         : public

Target Server Type    : PGSQL
Target Server Version : 100100
File Encoding         : 65001

Date: 2018-04-09 14:35:52
*/


-- ----------------------------
-- Table structure for prod_forecast_prov
-- ----------------------------
DROP TABLE IF EXISTS "public"."prod_forecast_prov";
CREATE TABLE "public"."prod_forecast_prov" (
"id" int4 NOT NULL,
"provid" int4 NOT NULL,
"prodtype" int4 NOT NULL,
"croptype" int4 DEFAULT '-1'::integer,
"diseasetype" int4 DEFAULT '-1'::integer,
"prodtime" date NOT NULL,
"prodvalue" float8 DEFAULT 0 NOT NULL
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "public"."prod_forecast_prov" IS '省级预报产品';
COMMENT ON COLUMN "public"."prod_forecast_prov"."id" IS '编号';
COMMENT ON COLUMN "public"."prod_forecast_prov"."provid" IS '省份编号';
COMMENT ON COLUMN "public"."prod_forecast_prov"."prodtype" IS '产品类型';
COMMENT ON COLUMN "public"."prod_forecast_prov"."croptype" IS '作物类型';
COMMENT ON COLUMN "public"."prod_forecast_prov"."diseasetype" IS '病害类型编号';
COMMENT ON COLUMN "public"."prod_forecast_prov"."prodtime" IS '产品日期';
COMMENT ON COLUMN "public"."prod_forecast_prov"."prodvalue" IS '产品数值';

-- ----------------------------
-- Records of prod_forecast_prov
-- ----------------------------
INSERT INTO "public"."prod_forecast_prov" VALUES ('0', '0', '0', '0', '0', '2018-03-26', '0.365');
INSERT INTO "public"."prod_forecast_prov" VALUES ('1', '0', '0', '0', '0', '2018-03-27', '0.354');
INSERT INTO "public"."prod_forecast_prov" VALUES ('2', '0', '0', '0', '0', '2018-03-28', '0.459');
INSERT INTO "public"."prod_forecast_prov" VALUES ('3', '2', '0', '0', '0', '2018-03-26', '0.22');

-- ----------------------------
-- Alter Sequences Owned By 
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table prod_forecast_prov
-- ----------------------------
ALTER TABLE "public"."prod_forecast_prov" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Foreign Key structure for table "public"."prod_forecast_prov"
-- ----------------------------
ALTER TABLE "public"."prod_forecast_prov" ADD FOREIGN KEY ("croptype") REFERENCES "public"."dic_croptype" ("id") ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE "public"."prod_forecast_prov" ADD FOREIGN KEY ("diseasetype") REFERENCES "public"."dic_diseasetype" ("id") ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE "public"."prod_forecast_prov" ADD FOREIGN KEY ("prodtype") REFERENCES "public"."dic_prodtype" ("id") ON DELETE RESTRICT ON UPDATE CASCADE;
