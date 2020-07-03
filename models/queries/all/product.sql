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
  p.updated
FROM `product` as p
  INNER JOIN `category` as ca ON p.category_id = ca.id
  INNER JOIN `company` as c ON p.company_id = c.id
  INNER JOIN `user` as u1 ON p.created_by = u1.id
  LEFT OUTER JOIN `user` as u2 ON p.updated_by = u2.id;