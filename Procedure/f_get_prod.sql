-- 查询产品数据
-- iextent  数据级别 0：全国空间分布 1：省级 2：市级 3：县级
-- iregionid  区划编号 
-- ddate  数据日期
-- iprodType  产品类型编号
-- icroptype  作物类型编号
-- idiseasetype  病害类型编号
-- RETURN jsonb  返回接口定义的json数据
DROP FUNCTION f_get_prod(date,integer,integer,integer,integer,integer);
CREATE OR REPLACE FUNCTION f_get_prod(IN ddate DATE,IN iextent INT, IN iregionid INT, IN iprodType INT,IN icroptype INT, IN idiseasetype INT) 
RETURNS jsonb AS $BODY$
DECLARE
  unit VARCHAR;
  jsondata jsonb;
BEGIN
-- 查询指定产品类型的数据单位
SELECT 
  dic_prodtype.unit 
INTO unit
FROM 
  dic_prodtype
WHERE
  dic_prodtype.id=iprodType;
IF iextent=0 THEN
--国家级（分布数据）
  RETURN f_get_distribution (ddate,iprodType,icroptype,idiseasetype);
--省级（统计数据）
ELSEIF iextent=1 THEN
  RETURN f_get_prod_prov(ddate,iprodType,icroptype,idiseasetype); 
--市级
ELSEIF iextent=2 THEN
  RETURN f_get_prod_city(ddate,iregionid,iprodType,icroptype,idiseasetype); 
--县级
ELSEIF iextent=3 THEN
  RETURN f_get_prod_county(ddate,iregionid,iprodType,icroptype,idiseasetype); 
END IF;
END;
$BODY$ LANGUAGE plpgsql;