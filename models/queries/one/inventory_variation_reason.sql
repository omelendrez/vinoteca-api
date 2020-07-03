SELECT ir.id,
  ir.code,
  ir.name,
  c.name as 'company_name',
  u1.name as 'created_by_name',
  u2.name as 'updated_by_name',
  ir.created,
  ir.updated
FROM `inventory_variation_reason` as ir
  INNER JOIN `company` as c ON ir.company_id = c.id
  INNER JOIN `user` as u1 ON ir.created_by = u1.id
  LEFT OUTER JOIN `user` as u2 ON ir.updated_by = u2.id
WHERE id = ?;