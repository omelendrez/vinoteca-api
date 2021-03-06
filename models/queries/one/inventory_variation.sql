SELECT
  ir.id,
  ir.quantity,
  variation_type,
  comments,
  s.name as 'store_name',
  p.name as 'product_name',
  c.name as 'company_name',
  v.name as 'reason_name',
  u1.name as 'created_by_name',
  ir.created
FROM
  `inventory_variation` as ir
  INNER JOIN `store` as s ON ir.store_id = s.id
  INNER JOIN `product` as p ON ir.product_id = p.id
  INNER JOIN `company` as c ON ir.company_id = c.id
  INNER JOIN `inventory_variation_reason` as v ON ir.variation_reason_id = v.id
  INNER JOIN `user` as u1 ON ir.created_by = u1.id
WHERE
  ir.id = ?;