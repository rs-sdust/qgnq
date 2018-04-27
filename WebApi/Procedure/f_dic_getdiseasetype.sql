CREATE OR REPLACE FUNCTION f_dic_getdiseasetype()
RETURNS TABLE (id int,name varchar)
AS $BODY$
BEGIN
    RETURN QUERY 
	SELECT * 
	FROM dic_diseasetype; 
END;
$BODY$ LANGUAGE plpgsql;
