SELECT datname, pid, state, query, age(clock_timestamp(), query_start) AS age
  FROM pg_stat_activity
  WHERE state <> 'idle'
    AND query NOT LIKE '% FROM pg_stat_activity %'
  ORDER BY age;
