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

Date: 2018-04-09 14:34:39
*/


-- ----------------------------
-- Table structure for dic_diseasetype
-- ----------------------------
DROP TABLE IF EXISTS "public"."dic_diseasetype";
CREATE TABLE "public"."dic_diseasetype" (
"id" int4 NOT NULL,
"name" varchar(255) COLLATE "default" NOT NULL
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "public"."dic_diseasetype" IS '病害类型字典表';
COMMENT ON COLUMN "public"."dic_diseasetype"."id" IS '编号';
COMMENT ON COLUMN "public"."dic_diseasetype"."name" IS '病害类型';

-- ----------------------------
-- Records of dic_diseasetype
-- ----------------------------
INSERT INTO "public"."dic_diseasetype" VALUES ('0', '小麦白粉病');
INSERT INTO "public"."dic_diseasetype" VALUES ('1', '小麦纹枯病');
INSERT INTO "public"."dic_diseasetype" VALUES ('2', '小麦蚜虫');

-- ----------------------------
-- Alter Sequences Owned By 
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table dic_diseasetype
-- ----------------------------
ALTER TABLE "public"."dic_diseasetype" ADD PRIMARY KEY ("id");
