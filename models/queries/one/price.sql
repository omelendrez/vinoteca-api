SELECT
  p.id,
  p.product_id,
  pr.name as 'product_name',
  p.supplier_id,
  su.name as 'supplier_name',
  p.price,
  u1.name as 'created_by_name',
  u2.name as 'updated_by_name',
  p.created,
  p.updated
FROM
  `price` as p
  INNER JOIN `product` as pr ON p.product_id = pr.id
  INNER JOIN `supplier` as su ON p.supplier_id = su.id
  INNER JOIN `user` as u1 ON p.created_by = u1.id
  LEFT OUTER JOIN `user` as u2 ON p.updated_by = u2.id
WHERE
  p.id = ?;