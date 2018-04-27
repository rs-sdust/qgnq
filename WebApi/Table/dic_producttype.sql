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

Date: 2018-04-09 10:16:55
*/


-- ----------------------------
-- Table structure for dic_producttype
-- ----------------------------
DROP TABLE IF EXISTS "public"."dic_producttype";
CREATE TABLE "public"."dic_producttype" (
"id" int4 NOT NULL,
"name" varchar(255) COLLATE "default" NOT NULL
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "public"."dic_producttype" IS '产品类型字典表';
COMMENT ON COLUMN "public"."dic_producttype"."id" IS '编号';
COMMENT ON COLUMN "public"."dic_producttype"."name" IS '产品类型';

-- ----------------------------
-- Records of dic_producttype
-- ----------------------------
INSERT INTO "public"."dic_producttype" VALUES ('0', '产量预估');
INSERT INTO "public"."dic_producttype" VALUES ('1', '长势监测');
INSERT INTO "public"."dic_producttype" VALUES ('2', '作物面积');
INSERT INTO "public"."dic_producttype" VALUES ('3', '病虫害监测');
INSERT INTO "public"."dic_producttype" VALUES ('4', '土壤湿度');
INSERT INTO "public"."dic_producttype" VALUES ('5', '温度');
INSERT INTO "public"."dic_producttype" VALUES ('6', '降水');
INSERT INTO "public"."dic_producttype" VALUES ('7', '气象数据');

-- ----------------------------
-- Alter Sequences Owned By 
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table dic_producttype
-- ----------------------------
ALTER TABLE "public"."dic_producttype" ADD PRIMARY KEY ("id");
