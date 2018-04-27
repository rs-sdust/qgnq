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

Date: 2018-04-09 14:35:59
*/


-- ----------------------------
-- Table structure for prod_realtime_city
-- ----------------------------
DROP TABLE IF EXISTS "public"."prod_realtime_city";
CREATE TABLE "public"."prod_realtime_city" (
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
COMMENT ON TABLE "public"."prod_realtime_city" IS '市级实时产品表';
COMMENT ON COLUMN "public"."prod_realtime_city"."id" IS '编号';
COMMENT ON COLUMN "public"."prod_realtime_city"."provid" IS '省份编号（外键）';
COMMENT ON COLUMN "public"."prod_realtime_city"."cityid" IS '地市编号';
COMMENT ON COLUMN "public"."prod_realtime_city"."prodtype" IS '产品类型';
COMMENT ON COLUMN "public"."prod_realtime_city"."croptype" IS '作物类型';
COMMENT ON COLUMN "public"."prod_realtime_city"."diseasetype" IS '病害类型编号';
COMMENT ON COLUMN "public"."prod_realtime_city"."prodtime" IS '产品日期';
COMMENT ON COLUMN "public"."prod_realtime_city"."prodvalue" IS '产品数值';

-- ----------------------------
-- Records of prod_realtime_city
-- ----------------------------
INSERT INTO "public"."prod_realtime_city" VALUES ('0', '6', '0', '0', '0', '0', '2018-03-26', '0.3522');
INSERT INTO "public"."prod_realtime_city" VALUES ('1', '6', '1', '0', '0', '0', '2018-03-26', '45');
INSERT INTO "public"."prod_realtime_city" VALUES ('2', '6', '3', '0', '0', '0', '2018-03-26', '54');

-- ----------------------------
-- Alter Sequences Owned By 
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table prod_realtime_city
-- ----------------------------
ALTER TABLE "public"."prod_realtime_city" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Foreign Key structure for table "public"."prod_realtime_city"
-- ----------------------------
ALTER TABLE "public"."prod_realtime_city" ADD FOREIGN KEY ("croptype") REFERENCES "public"."dic_croptype" ("id") ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE "public"."prod_realtime_city" ADD FOREIGN KEY ("diseasetype") REFERENCES "public"."dic_diseasetype" ("id") ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE "public"."prod_realtime_city" ADD FOREIGN KEY ("prodtype") REFERENCES "public"."dic_prodtype" ("id") ON DELETE RESTRICT ON UPDATE CASCADE;
