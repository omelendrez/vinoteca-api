SELECT
  o.id,
  o.number,
  o.date,
  o.amount,
  co.name as 'company_name',
  o.supplier_id,
  su.name as 'supplier_name',
  u1.name as 'created_by_name',
  u2.name as 'updated_by_name',
  o.created,
  o.updated,
  (
    SELECT
      COUNT(*)
    FROM
      `order_details`
    WHERE
      order_id = o.id
  ) as 'items',
  CASE
    WHEN 1 THEN 'Nueva orden'
  END as 'status_name'
FROM
  `order` as o
  INNER JOIN `company` as co ON o.company_id = co.id
  INNER JOIN `supplier` as su ON o.supplier_id = su.id
  INNER JOIN `user` as u1 ON o.created_by = u1.id
  LEFT OUTER JOIN `user` as u2 ON o.updated_by = u2.id
ORDER BY
  o.id DESC;