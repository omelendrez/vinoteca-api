SELECT
  i.id,
  i.quantity,
  i.store_id,
  s.name as 'store_name',
  p.price,
  i.product_id,
  p.name as 'product_name',
  c.name as 'company_name',
  u1.name as 'created_by_name',
  i.created
FROM
  `inventory` as i
  INNER JOIN `store` as s ON i.store_id = s.id
  INNER JOIN `product` as p ON i.product_id = p.id
  INNER JOIN `company` as c ON i.company_id = c.id
  INNER JOIN `user` as u1 ON i.created_by = u1.id;