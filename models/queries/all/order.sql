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
  o.status_id,
  CASE
    WHEN o.status_id = 1 THEN 'Creada'
    WHEN o.status_id = 2 THEN 'Enviada'
    WHEN o.status_id = 3 THEN 'Recibida'
    WHEN o.status_id = 4 THEN 'Cancelada'
  END AS 'status_name',
  (
    SELECT
      COUNT(*)
    FROM
      `order_details`
    WHERE
      order_id = o.id
  ) AS 'items'
FROM
  `order` as o
  INNER JOIN `company` as co ON o.company_id = co.id
  INNER JOIN `supplier` as su ON o.supplier_id = su.id
  INNER JOIN `user` as u1 ON o.created_by = u1.id
  LEFT OUTER JOIN `user` as u2 ON o.updated_by = u2.id
ORDER BY
  o.id DESC;