SELECT 
    datname AS "Database Name",
    pg_catalog.pg_get_userbyid(datdba) AS "Owner",
    encoding AS "Encoding (Code)",
    pg_catalog.pg_encoding_to_char(encoding) AS "Encoding (Name)",
    datcollate AS "Collate",
    datctype AS "Ctype",
    datistemplate AS "Is Template",
    datallowconn AS "Allow Connections",
    datconnlimit AS "Connection Limit",
    datfrozenxid AS "Frozen XID",
    datminmxid AS "Min Multixact ID",
    oid AS "System Identifier (OID)"
FROM 
    pg_database
WHERE 
    datname = 'udb_pogireychik';