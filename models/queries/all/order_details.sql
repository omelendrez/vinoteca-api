SELECT
  o.id,
  o.order_id,
  o.product_id,
  p.name as 'product_name',
  o.store_id,
  s.name as 'store_name',
  o.qty_requested,
  o.qty_received,
  o.price,
  o.created,
  u1.name as 'created_by_name',
  o.updated,
  u2.name as 'updated_by_name',
  o.status_id
FROM
  `order_details` AS o
  INNER JOIN `product` AS p ON p.id = o.product_id
  INNER JOIN `store` AS s ON s.id = o.store_id
  INNER JOIN `user` as u1 ON u1.id = o.created_by
  LEFT OUTER JOIN `user` as u2 ON u2.id = o.updated_by