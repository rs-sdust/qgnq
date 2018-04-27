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

Date: 2018-04-09 14:35:45
*/


-- ----------------------------
-- Table structure for prod_forecast_distribution
-- ----------------------------
DROP TABLE IF EXISTS "public"."prod_forecast_distribution";
CREATE TABLE "public"."prod_forecast_distribution" (
"id" int4 NOT NULL,
"prodtype" int4 NOT NULL,
"croptype" int4 DEFAULT '-1'::integer,
"diseasetype" int4 DEFAULT '-1'::integer,
"prodtime" date NOT NULL,
"jsonstring" json NOT NULL
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "public"."prod_forecast_distribution" IS '预报空间分布产品';
COMMENT ON COLUMN "public"."prod_forecast_distribution"."id" IS '编号';
COMMENT ON COLUMN "public"."prod_forecast_distribution"."prodtype" IS '产品类型';
COMMENT ON COLUMN "public"."prod_forecast_distribution"."croptype" IS '作物类型';
COMMENT ON COLUMN "public"."prod_forecast_distribution"."diseasetype" IS '病害类型';
COMMENT ON COLUMN "public"."prod_forecast_distribution"."prodtime" IS '产品日期';
COMMENT ON COLUMN "public"."prod_forecast_distribution"."jsonstring" IS 'geojson格式的预报分布产品';

-- ----------------------------
-- Records of prod_forecast_distribution
-- ----------------------------

-- ----------------------------
-- Alter Sequences Owned By 
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table prod_forecast_distribution
-- ----------------------------
ALTER TABLE "public"."prod_forecast_distribution" ADD PRIMARY KEY ("id");
