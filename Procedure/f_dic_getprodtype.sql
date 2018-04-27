CREATE OR REPLACE FUNCTION f_dic_getprodtype()
RETURNS TABLE (id int,name varchar)
AS $BODY$
BEGIN
    RETURN QUERY 
	SELECT * 
	FROM dic_prodtype; 
END;
$BODY$ LANGUAGE plpgsql;
