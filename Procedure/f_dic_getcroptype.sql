CREATE OR REPLACE FUNCTION f_dic_getcroptype()
RETURNS TABLE (id int,name varchar) 
AS $BODY$
BEGIN
    RETURN QUERY 
	SELECT * 
	FROM dic_croptype; 
END;
$BODY$ LANGUAGE plpgsql;
