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

Date: 2018-04-09 14:34:33
*/


-- ----------------------------
-- Table structure for dic_croptype
-- ----------------------------
DROP TABLE IF EXISTS "public"."dic_croptype";
CREATE TABLE "public"."dic_croptype" (
"id" int4 NOT NULL,
"name" varchar(255) COLLATE "default" NOT NULL
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "public"."dic_croptype" IS '作物类型字典表';
COMMENT ON COLUMN "public"."dic_croptype"."id" IS '编号';
COMMENT ON COLUMN "public"."dic_croptype"."name" IS '作物类型';

-- ----------------------------
-- Records of dic_croptype
-- ----------------------------
INSERT INTO "public"."dic_croptype" VALUES ('0', '小麦');
INSERT INTO "public"."dic_croptype" VALUES ('1', '玉米');
INSERT INTO "public"."dic_croptype" VALUES ('2', '水稻');
INSERT INTO "public"."dic_croptype" VALUES ('3', '棉花');
INSERT INTO "public"."dic_croptype" VALUES ('4', '大豆');

-- ----------------------------
-- Alter Sequences Owned By 
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table dic_croptype
-- ----------------------------
ALTER TABLE "public"."dic_croptype" ADD PRIMARY KEY ("id");
