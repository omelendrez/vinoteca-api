SELECT
  s.id,
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
  s.status_id,
  if (s.status_id = 1, 'Activo', 'Inactivo') as 'status_name'
FROM
  `supplier` as s
  INNER JOIN `company` as c ON s.company_id = c.id
  INNER JOIN `user` as u1 ON s.created_by = u1.id
  LEFT OUTER JOIN `user` as u2 ON s.updated_by = u2.id;