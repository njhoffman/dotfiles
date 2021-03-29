SELECT
  COUNT(*),
  SUM(discounted_convenience_fee_cost_usd + discounted_services_cost_usd),
  SUM(provider_payment_usd) AS provider_payout
FROM spadash_api.appointment_invoices
WHERE appointment_id IN (
  SELECT id FROM spadash_api.appointments
    WHERE lower(duration) >= '2020-06-01 00:00:00'
      AND lower(duration) <= '2020-06-30 23:59:59-05'
      AND status = 'completed'
  )
