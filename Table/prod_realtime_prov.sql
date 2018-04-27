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

Date: 2018-04-09 14:36:17
*/


-- ----------------------------
-- Table structure for prod_realtime_prov
-- ----------------------------
DROP TABLE IF EXISTS "public"."prod_realtime_prov";
CREATE TABLE "public"."prod_realtime_prov" (
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
COMMENT ON TABLE "public"."prod_realtime_prov" IS '省级实时产品表';
COMMENT ON COLUMN "public"."prod_realtime_prov"."id" IS '编号';
COMMENT ON COLUMN "public"."prod_realtime_prov"."provid" IS '省份编号';
COMMENT ON COLUMN "public"."prod_realtime_prov"."prodtype" IS '产品类型';
COMMENT ON COLUMN "public"."prod_realtime_prov"."croptype" IS '作物类型';
COMMENT ON COLUMN "public"."prod_realtime_prov"."diseasetype" IS '病害类型编号';
COMMENT ON COLUMN "public"."prod_realtime_prov"."prodtime" IS '产品日期';
COMMENT ON COLUMN "public"."prod_realtime_prov"."prodvalue" IS '产品数值';

-- ----------------------------
-- Records of prod_realtime_prov
-- ----------------------------
INSERT INTO "public"."prod_realtime_prov" VALUES ('0', '0', '0', '0', '0', '2018-03-26', '0.25');
INSERT INTO "public"."prod_realtime_prov" VALUES ('1', '1', '0', '0', '0', '2018-03-26', '0.36');
INSERT INTO "public"."prod_realtime_prov" VALUES ('2', '2', '0', '0', '0', '2018-03-26', '0.22');
INSERT INTO "public"."prod_realtime_prov" VALUES ('3', '3', '0', '0', '0', '2018-03-26', '0.54');
INSERT INTO "public"."prod_realtime_prov" VALUES ('4', '4', '0', '0', '0', '2018-03-26', '0.49');
INSERT INTO "public"."prod_realtime_prov" VALUES ('5', '5', '0', '0', '0', '2018-03-26', '0.86');
INSERT INTO "public"."prod_realtime_prov" VALUES ('6', '6', '0', '0', '0', '2018-03-26', '0.38');
INSERT INTO "public"."prod_realtime_prov" VALUES ('7', '7', '0', '0', '0', '2018-03-26', '0.67');
INSERT INTO "public"."prod_realtime_prov" VALUES ('8', '8', '0', '0', '0', '2018-03-26', '0.83');
INSERT INTO "public"."prod_realtime_prov" VALUES ('9', '9', '0', '0', '0', '2018-03-26', '0.46');
INSERT INTO "public"."prod_realtime_prov" VALUES ('10', '10', '0', '0', '0', '2018-03-26', '0.72');
INSERT INTO "public"."prod_realtime_prov" VALUES ('11', '11', '0', '0', '0', '2018-03-26', '0.46');
INSERT INTO "public"."prod_realtime_prov" VALUES ('12', '12', '0', '0', '0', '2018-03-26', '0.86');
INSERT INTO "public"."prod_realtime_prov" VALUES ('13', '13', '0', '0', '0', '2018-03-26', '0.16');
INSERT INTO "public"."prod_realtime_prov" VALUES ('14', '14', '0', '0', '0', '2018-03-26', '0.37');
INSERT INTO "public"."prod_realtime_prov" VALUES ('15', '15', '0', '0', '0', '2018-03-26', '0.61');
INSERT INTO "public"."prod_realtime_prov" VALUES ('16', '16', '0', '0', '0', '2018-03-26', '0.76');
INSERT INTO "public"."prod_realtime_prov" VALUES ('17', '17', '0', '0', '0', '2018-03-26', '0.55');
INSERT INTO "public"."prod_realtime_prov" VALUES ('18', '18', '0', '0', '0', '2018-03-26', '0.24');
INSERT INTO "public"."prod_realtime_prov" VALUES ('19', '19', '0', '0', '0', '2018-03-26', '0.34');
INSERT INTO "public"."prod_realtime_prov" VALUES ('20', '20', '0', '0', '0', '2018-03-26', '0.49');
INSERT INTO "public"."prod_realtime_prov" VALUES ('21', '21', '0', '0', '0', '2018-03-26', '0.91');
INSERT INTO "public"."prod_realtime_prov" VALUES ('22', '22', '0', '0', '0', '2018-03-26', '0.35');
INSERT INTO "public"."prod_realtime_prov" VALUES ('23', '23', '0', '0', '0', '2018-03-26', '0.43');
INSERT INTO "public"."prod_realtime_prov" VALUES ('24', '24', '0', '0', '0', '2018-03-26', '0.72');
INSERT INTO "public"."prod_realtime_prov" VALUES ('25', '25', '0', '0', '0', '2018-03-26', '0.62');
INSERT INTO "public"."prod_realtime_prov" VALUES ('26', '26', '0', '0', '0', '2018-03-26', '0.15');
INSERT INTO "public"."prod_realtime_prov" VALUES ('27', '27', '0', '0', '0', '2018-03-26', '0.25');
INSERT INTO "public"."prod_realtime_prov" VALUES ('28', '28', '0', '0', '0', '2018-03-26', '0.35');
INSERT INTO "public"."prod_realtime_prov" VALUES ('29', '29', '0', '0', '0', '2018-03-26', '0.45');
INSERT INTO "public"."prod_realtime_prov" VALUES ('30', '30', '0', '0', '0', '2018-03-26', '0.55');
INSERT INTO "public"."prod_realtime_prov" VALUES ('31', '31', '0', '0', '0', '2018-03-26', '0.65');
INSERT INTO "public"."prod_realtime_prov" VALUES ('32', '32', '0', '0', '0', '2018-03-26', '0.85');
INSERT INTO "public"."prod_realtime_prov" VALUES ('33', '33', '0', '0', '0', '2018-03-26', '0.95');
INSERT INTO "public"."prod_realtime_prov" VALUES ('34', '34', '0', '0', '0', '2018-03-26', '0.55');

-- ----------------------------
-- Alter Sequences Owned By 
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table prod_realtime_prov
-- ----------------------------
ALTER TABLE "public"."prod_realtime_prov" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Foreign Key structure for table "public"."prod_realtime_prov"
-- ----------------------------
ALTER TABLE "public"."prod_realtime_prov" ADD FOREIGN KEY ("prodtype") REFERENCES "public"."dic_prodtype" ("id") ON DELETE RESTRICT ON UPDATE CASCADE;
ALTER TABLE "public"."prod_realtime_prov" ADD FOREIGN KEY ("diseasetype") REFERENCES "public"."dic_diseasetype" ("id") ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE "public"."prod_realtime_prov" ADD FOREIGN KEY ("croptype") REFERENCES "public"."dic_croptype" ("id") ON DELETE SET NULL ON UPDATE CASCADE;
