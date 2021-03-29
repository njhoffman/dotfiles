  SELECT table_schema, table_name,
  (xpath('/row/cnt/text()', xml_count))[1]::text::int as row_count
  FROM (
    SELECT table_name, table_schema,
    query_to_xml(format('select count(*) as cnt from %I.%I', table_schema, table_name), false, true, '') AS xml_count
    FROM information_schema.tables
    WHERE table_schema = '$1'
    ORDER BY table_name
  ) t

