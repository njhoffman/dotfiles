SELECT
  round(CAST(total_time AS numeric), 4) AS total,
  round(CAST((total_time/calls) AS numeric), 4) AS avg,
  calls,
  left(query, 50)
FROM pg_stat_statements
ORDER BY 1 DESC
LIMIT 100
# userid, dbid, queryid, query, calls, total_time, min_time, max_time, mean_time, stddev_time, rows,
# [shared|local]_blks_[hit|read|dirtied|written] temp_blks_[read|written] blk_[read_write]_time
