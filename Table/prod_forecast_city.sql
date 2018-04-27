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

Date: 2018-04-09 14:35:33
*/


-- ----------------------------
-- Table structure for prod_forecast_city
-- ----------------------------
DROP TABLE IF EXISTS "public"."prod_forecast_city";
CREATE TABLE "public"."prod_forecast_city" (
"id" int4 NOT NULL,
"provid" int4 NOT NULL,
"cityid" int4 NOT NULL,
"prodtype" int4 NOT NULL,
"croptype" int4 DEFAULT '-1'::integer,
"diseasetype" int4 DEFAULT '-1'::integer,
"prodtime" date NOT NULL,
"prodvalue" float8 DEFAULT 0 NOT NULL
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "public"."prod_forecast_city" IS '地市级预报产品表';
COMMENT ON COLUMN "public"."prod_forecast_city"."id" IS '编号';
COMMENT ON COLUMN "public"."prod_forecast_city"."provid" IS '省份编号（外键）';
COMMENT ON COLUMN "public"."prod_forecast_city"."cityid" IS '地市编号';
COMMENT ON COLUMN "public"."prod_forecast_city"."prodtype" IS '产品类型编号';
COMMENT ON COLUMN "public"."prod_forecast_city"."croptype" IS '作物类型编号';
COMMENT ON COLUMN "public"."prod_forecast_city"."diseasetype" IS '病害类型编号';
COMMENT ON COLUMN "public"."prod_forecast_city"."prodtime" IS '产品日期';
COMMENT ON COLUMN "public"."prod_forecast_city"."prodvalue" IS '产品数值';

-- ----------------------------
-- Records of prod_forecast_city
-- ----------------------------
INSERT INTO "public"."prod_forecast_city" VALUES ('0', '6', '0', '0', '0', '0', '2018-03-26', '254');
INSERT INTO "public"."prod_forecast_city" VALUES ('1', '6', '1', '0', '0', '0', '2018-03-26', '0.22');
INSERT INTO "public"."prod_forecast_city" VALUES ('2', '6', '2', '0', '0', '0', '2018-03-26', '0.68');
INSERT INTO "public"."prod_forecast_city" VALUES ('3', '6', '3', '0', '0', '0', '2018-03-26', '0.32');

-- ----------------------------
-- Alter Sequences Owned By 
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table prod_forecast_city
-- ----------------------------
ALTER TABLE "public"."prod_forecast_city" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Foreign Key structure for table "public"."prod_forecast_city"
-- ----------------------------
ALTER TABLE "public"."prod_forecast_city" ADD FOREIGN KEY ("croptype") REFERENCES "public"."dic_croptype" ("id") ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE "public"."prod_forecast_city" ADD FOREIGN KEY ("prodtype") REFERENCES "public"."dic_prodtype" ("id") ON DELETE RESTRICT ON UPDATE CASCADE;
ALTER TABLE "public"."prod_forecast_city" ADD FOREIGN KEY ("diseasetype") REFERENCES "public"."dic_diseasetype" ("id") ON DELETE SET NULL ON UPDATE CASCADE;
