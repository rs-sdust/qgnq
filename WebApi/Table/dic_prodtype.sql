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

Date: 2018-04-09 14:34:44
*/


-- ----------------------------
-- Table structure for dic_prodtype
-- ----------------------------
DROP TABLE IF EXISTS "public"."dic_prodtype";
CREATE TABLE "public"."dic_prodtype" (
"id" int4 NOT NULL,
"name" varchar(255) COLLATE "default" NOT NULL
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "public"."dic_prodtype" IS '产品类型字典表';
COMMENT ON COLUMN "public"."dic_prodtype"."id" IS '编号';
COMMENT ON COLUMN "public"."dic_prodtype"."name" IS '产品类型';

-- ----------------------------
-- Records of dic_prodtype
-- ----------------------------
INSERT INTO "public"."dic_prodtype" VALUES ('0', '产量预估');
INSERT INTO "public"."dic_prodtype" VALUES ('1', '长势监测');
INSERT INTO "public"."dic_prodtype" VALUES ('2', '作物面积');
INSERT INTO "public"."dic_prodtype" VALUES ('3', '病虫害监测');
INSERT INTO "public"."dic_prodtype" VALUES ('4', '土壤湿度');
INSERT INTO "public"."dic_prodtype" VALUES ('5', '温度');
INSERT INTO "public"."dic_prodtype" VALUES ('6', '降水');
INSERT INTO "public"."dic_prodtype" VALUES ('7', '气象数据');

-- ----------------------------
-- Alter Sequences Owned By 
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table dic_prodtype
-- ----------------------------
ALTER TABLE "public"."dic_prodtype" ADD PRIMARY KEY ("id");
