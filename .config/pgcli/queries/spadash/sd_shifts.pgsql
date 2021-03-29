SELECT
    id,
    provider_id,
    begin_location,
    lower(duration) at time zone 'America/Chicago' AS start,
    upper(duration) at time zone 'America/Chicago' AS end
FROM spadash_api.shifts
WHERE shift_status = 'pending' AND lower(duration) > now()
ORDER BY provider_id, duration ASC;
