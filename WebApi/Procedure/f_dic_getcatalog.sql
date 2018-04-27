CREATE OR REPLACE FUNCTION f_dic_getcatalog (sClient VARCHAR) 
RETURNS TABLE (CATALOG VARCHAR) 
AS $BODY$
BEGIN
	RETURN QUERY SELECT
		dic_catalog. CATALOG
	FROM
		dic_catalog
	WHERE
		client = sClient ;
END ; 
$BODY$ LANGUAGE plpgsql;
