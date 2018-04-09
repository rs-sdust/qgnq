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

Date: 2018-04-09 14:34:26
*/


-- ----------------------------
-- Table structure for dic_catalog
-- ----------------------------
DROP TABLE IF EXISTS "public"."dic_catalog";
CREATE TABLE "public"."dic_catalog" (
"id" int4 NOT NULL,
"client" varchar(255) COLLATE "default" NOT NULL,
"catalog" varchar COLLATE "default" NOT NULL
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "public"."dic_catalog" IS '存储web和客户端界面的目录配置';
COMMENT ON COLUMN "public"."dic_catalog"."id" IS '编号';
COMMENT ON COLUMN "public"."dic_catalog"."client" IS '名称';
COMMENT ON COLUMN "public"."dic_catalog"."catalog" IS 'xml目录结构';

-- ----------------------------
-- Records of dic_catalog
-- ----------------------------
INSERT INTO "public"."dic_catalog" VALUES ('0', 'web', '<?xml version=''1.0'' encoding="utf-8" ?><catalog><first id = "0" name="产量预估"><second id = "0" name="小麦"/><second id = "1" name="玉米"/><second id = "2" name="水稻"/><second id = "3" name="棉花"/><second id = "4" name="大豆"/></first><first id = "1" name="长势监测"><second id = "0" name="小麦"/><second id = "1" name="玉米"/><second id = "2" name="水稻"/><second id = "3" name="棉花"/><second id = "4" name="大豆"/></first><first id = "2" name="作物面积"><second id = "0" name="小麦"/><second id = "1" name="玉米"/><second id = "2" name="水稻"/><second id = "3" name="棉花"/><second id = "4" name="大豆"/></first><first id = "3" name="病虫害监测"><second id = "0" name="小麦白粉病"/><second id = "1" name="小麦纹枯病"/><second id = "2" name="小麦蛀牙"/></first><first id = "4" name="土壤湿度"><second id = "0" name="土壤湿度"/></first><first id = "5" name="气象数据"><second id = "0" name="温度"/><second id = "1" name="降水"/></first></catalog>');

-- ----------------------------
-- Alter Sequences Owned By 
-- ----------------------------
