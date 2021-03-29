  SELECT oid, table_schema, table_name, row_estimate
  , pg_size_pretty(index_bytes) AS INDEX
  , pg_size_pretty(toast_bytes) AS toast
  , pg_size_pretty(table_bytes) AS TABLE
  , pg_size_pretty(total_bytes) AS total
  FROM (
    SELECT *, total_bytes-index_bytes-COALESCE(toast_bytes,0) AS table_bytes FROM (
      SELECT c.oid, nspname AS table_schema, relname AS table_name
      , c.reltuples AS row_estimate
      , pg_total_relation_size(c.oid) AS total_bytes
      , pg_indexes_size(c.oid) AS index_bytes
      , pg_total_relation_size(reltoastrelid) AS toast_bytes
      FROM pg_class c
      LEFT JOIN pg_namespace n ON n.oid = c.relnamespace
      WHERE relkind = 'r' AND nspname = '$1'
      ORDER BY total_bytes DESC
    ) a
  ) a
