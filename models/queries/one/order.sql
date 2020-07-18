SET
  @id := ?;

SELECT
  o.id,
  o.number,
  o.date,
  o.amount,
  co.name as 'company_name',
  o.supplier_id,
  su.name as 'supplier_name',
  su.email as 'email_address',
  u1.name as 'created_by_name',
  u2.name as 'updated_by_name',
  o.created,
  o.updated,
  o.status_id,
  CASE
    WHEN o.status_id = 1 THEN 'Nueva'
    WHEN o.status_id = 2 THEN 'Enviada'
    WHEN o.status_id = 3 THEN 'Recibida'
    WHEN o.status_id = 4 THEN 'Cancelada'
  END AS 'status_name'
  /*,
   if (o.status_id = 1, 'Activo', 'Inactivo') as 'status_name'*/
FROM
  `order` as o
  INNER JOIN `company` as co ON o.company_id = co.id
  INNER JOIN `supplier` as su ON o.supplier_id = su.id
  INNER JOIN `user` as u1 ON o.created_by = u1.id
  LEFT OUTER JOIN `user` as u2 ON o.updated_by = u2.id
WHERE
  o.id = @id;

SELECT
  od.id,
  od.store_id,
  st.name as 'store_name',
  st.address as 'store_address',
  od.product_id,
  pr.name as 'product_name',
  pr.description as 'description',
  od.qty_requested,
  od.qty_received,
  od.price,
  od.price * od.qty_received as 'total',
  u1.name as 'created_by_name',
  u2.name as 'updated_by_name',
  od.created,
  od.updated,
  if (od.status_id = 1, 'Activo', 'Inactivo') as 'status_name'
FROM
  `order_details` as od
  INNER JOIN `store` as st ON od.store_id = st.id
  INNER JOIN `product` as pr ON od.product_id = pr.id
  INNER JOIN `user` as u1 ON od.created_by = u1.id
  LEFT OUTER JOIN `user` as u2 ON od.updated_by = u2.id
WHERE
  od.order_id = @id;

SELECT
  ot.id,
  date_format(ot.date, '%Y-%m-%d') as 'date',
  ot.status_id,
  u1.name as 'created_by_name',
  ot.created
FROM
  `order_tracking` as ot
  INNER JOIN `user` as u1 ON ot.created_by = u1.id
WHERE
  ot.order_id = @id;