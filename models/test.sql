SELECT u.id,
  u.name,
  u.email,
  c.name as 'company_name',
  p.name as 'profile_name',
  u.created,
  u.updated,
  u1.name as 'created_by_name',
  u2.name as 'updated_by_name',
  if (u.status_id = 1, 'Activo', 'Inactivo') as 'status_name'
FROM `user` as u
  INNER JOIN `company` as c ON u.company_id = c.id
  INNER JOIN `profile` as p ON u.profile_id = p.id
  INNER JOIN `user` as u1 ON u.created_by = u1.id
  LEFT OUTER JOIN `user` as u2 ON u.updated_by = u2.id;
SELECT c.id,
  c.name,
  c.code,
  co.name as 'company_name',
  u1.name as 'created_by_name',
  u2.name as 'updated_by_name',
  c.created,
  c.updated,
  if (c.status_id = 1, 'Activo', 'Inactivo') as 'status_name'
FROM `category` as c
  INNER JOIN `company` as co ON c.company_id = co.id
  INNER JOIN `user` as u1 ON c.created_by = u1.id
  LEFT OUTER JOIN `user` as u2 ON c.updated_by = u2.id;
SELECT c.id,
  c.name,
  c.contact,
  c.address,
  c.email,
  c.created,
  c.updated,
  u1.name as 'created_by_name',
  u2.name as 'updated_by_name',
  if (c.status_id = 1, 'Activo', 'Inactivo') as 'status_name'
FROM `company` as c
  INNER JOIN `user` as u1 ON c.created_by = u1.id
  LEFT OUTER JOIN `user` as u2 ON c.updated_by = u2.id;
SELECT i.id,
  i.quantity,
  s.name as 'store_name',
  p.name as 'product_name',
  c.name as 'company_name',
  u1.name as 'created_by_name',
  u2.name as 'updated_by_name',
  i.created,
  i.updated
FROM `inventory` as i
  INNER JOIN `store` as s ON i.store_id = s.id
  INNER JOIN `product` as p ON i.product_id = i.id
  INNER JOIN `company` as c ON i.company_id = c.id
  INNER JOIN `user` as u1 ON i.created_by = u1.id
  LEFT OUTER JOIN `user` as u2 ON i.updated_by = u2.id;
SELECT ir.id,
  ir.quantity,
  variation_type,
  comments,
  s.name as 'store_name',
  p.name as 'product_name',
  c.name as 'company_name',
  v.name as 'reason_name',
  u1.name as 'created_by_name',
  u2.name as 'updated_by_name',
  ir.created,
  ir.updated
FROM `inventory_variation` as ir
  INNER JOIN `store` as s ON ir.store_id = s.id
  INNER JOIN `product` as p ON ir.product_id = p.id
  INNER JOIN `company` as c ON ir.company_id = c.id
  INNER JOIN `inventory_variation_reason` as v ON ir.variation_reason_id = v.id
  INNER JOIN `user` as u1 ON ir.created_by = u1.id
  LEFT OUTER JOIN `user` as u2 ON ir.updated_by = u2.id;
SELECT ir.id,
  ir.code,
  ir.name,
  c.name as 'company_name',
  u1.name as 'created_by_name',
  u2.name as 'updated_by_name',
  ir.created,
  ir.updated,
  if (ir.status_id = 1, 'Activo', 'Inactivo') as 'status_name'
FROM `inventory_variation_reason` as ir
  INNER JOIN `company` as c ON ir.company_id = c.id
  INNER JOIN `user` as u1 ON ir.created_by = u1.id
  LEFT OUTER JOIN `user` as u2 ON ir.updated_by = u2.id;
SELECT p.id,
  p.code,
  p.barcode,
  p.name,
  p.minimum,
  p.quantity,
  p.last_purchase_date,
  p.last_purchase_price,
  p.last_sale_date,
  p.last_sale_price,
  p.price,
  ca.name as 'category_name',
  c.name as 'company_name',
  u1.name as 'created_by_name',
  u2.name as 'updated_by_name',
  p.created,
  p.updated,
  if (p.status_id = 1, 'Activo', 'Inactivo') as 'status_name'
FROM `product` as p
  INNER JOIN `category` as ca ON p.category_id = ca.id
  INNER JOIN `company` as c ON p.company_id = c.id
  INNER JOIN `user` as u1 ON p.created_by = u1.id
  LEFT OUTER JOIN `user` as u2 ON p.updated_by = u2.id;
SELECT p.id,
  p.code,
  p.name,
  u1.name as 'created_by_name',
  u2.name as 'updated_by_name',
  p.created,
  p.updated
FROM `profile` as p
  INNER JOIN `user` as u1 ON p.created_by = u1.id
  LEFT OUTER JOIN `user` as u2 ON p.updated_by = u2.id;
SELECT s.id,
  s.name,
  s.contact,
  s.address,
  s.phone,
  s.email,
  c.name as 'company_name',
  u1.name as 'created_by_name',
  u2.name as 'updated_by_name',
  s.created,
  s.updated,
  if (s.status_id = 1, 'Activo', 'Inactivo') as 'status_name'
FROM `store` as s
  INNER JOIN `company` as c ON s.company_id = c.id
  INNER JOIN `user` as u1 ON s.created_by = u1.id
  LEFT OUTER JOIN `user` as u2 ON s.updated_by = u2.id;
SELECT s.id,
  s.name,
  s.contact,
  s.address,
  s.phone,
  s.email,
  c.name as 'company_name',
  u1.name as 'created_by_name',
  u2.name as 'updated_by_name',
  s.created,
  s.updated,
  if (s.status_id = 1, 'Activo', 'Inactivo') as 'status_name'
FROM `supplier` as s
  INNER JOIN `company` as c ON s.company_id = c.id
  INNER JOIN `user` as u1 ON s.created_by = u1.id
  LEFT OUTER JOIN `user` as u2 ON s.updated_by = u2.id;