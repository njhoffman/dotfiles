SELECT
    TO_CHAR(lower(duration) AT TIME ZONE 'America/Chicago', 'mm/dd HH:MI') AS start,
    TO_CHAR(upper(duration) AT TIME ZONE 'America/Chicago', 'mm/dd HH:MI') AS end,
    street_1,
    city,
    customer_accounts.id,
    customer_accounts.first_name || ' ' || customer_accounts.last_name AS customer,
    TO_CHAR(appointments.created_at AT TIME ZONE 'America/Chicago', 'mm/dd HH:MI') created_at,
    provider_accounts.first_name AS provider_name,
    status
FROM spadash_api.appointments
LEFT JOIN spadash_api.customer_accounts ON customer_accounts.id = appointments.customer_id
LEFT JOIN spadash_api. provider_accounts ON provider_accounts.id = appointments.provider_id
WHERE lower(duration) > now() - interval '1 days'
ORDER BY lower(duration) ASC;
