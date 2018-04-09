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

Date: 2018-04-09 14:36:05
*/


-- ----------------------------
-- Table structure for prod_realtime_county
-- ----------------------------
DROP TABLE IF EXISTS "public"."prod_realtime_county";
CREATE TABLE "public"."prod_realtime_county" (
"id" int4 NOT NULL,
"cityid" int4 NOT NULL,
"counid" int4 NOT NULL,
"prodtype" int4 DEFAULT '-1'::integer,
"croptype" int4 DEFAULT '-1'::integer,
"diseasetype" int4 NOT NULL,
"prodtime" date NOT NULL,
"prodvalue" float8 DEFAULT 0 NOT NULL
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "public"."prod_realtime_county" IS '县级实时产品表';
COMMENT ON COLUMN "public"."prod_realtime_county"."id" IS '编号';
COMMENT ON COLUMN "public"."prod_realtime_county"."cityid" IS '地市编号';
COMMENT ON COLUMN "public"."prod_realtime_county"."counid" IS '区县编号';
COMMENT ON COLUMN "public"."prod_realtime_county"."prodtype" IS '产品类型';
COMMENT ON COLUMN "public"."prod_realtime_county"."croptype" IS '作物类型';
COMMENT ON COLUMN "public"."prod_realtime_county"."diseasetype" IS '病害类型编号';
COMMENT ON COLUMN "public"."prod_realtime_county"."prodtime" IS '产品日期';
COMMENT ON COLUMN "public"."prod_realtime_county"."prodvalue" IS '产品数值';

-- ----------------------------
-- Records of prod_realtime_county
-- ----------------------------
INSERT INTO "public"."prod_realtime_county" VALUES ('0', '0', '6', '0', '0', '0', '2018-03-26', '0.3241');
INSERT INTO "public"."prod_realtime_county" VALUES ('1', '0', '1', '0', '0', '0', '2018-03-26', '25436');
INSERT INTO "public"."prod_realtime_county" VALUES ('2', '0', '2', '0', '0', '0', '2018-03-26', '254');

-- ----------------------------
-- Alter Sequences Owned By 
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table prod_realtime_county
-- ----------------------------
ALTER TABLE "public"."prod_realtime_county" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Foreign Key structure for table "public"."prod_realtime_county"
-- ----------------------------
ALTER TABLE "public"."prod_realtime_county" ADD FOREIGN KEY ("prodtype") REFERENCES "public"."dic_prodtype" ("id") ON DELETE RESTRICT ON UPDATE CASCADE;
ALTER TABLE "public"."prod_realtime_county" ADD FOREIGN KEY ("diseasetype") REFERENCES "public"."dic_diseasetype" ("id") ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE "public"."prod_realtime_county" ADD FOREIGN KEY ("croptype") REFERENCES "public"."dic_croptype" ("id") ON DELETE SET NULL ON UPDATE CASCADE;
