SELECT
  od.id,
  od.store_id,
  st.name as 'store_name',
  od.product_id,
  pr.name as 'product_name',
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
  od.id = ?;