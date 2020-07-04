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
  LEFT OUTER JOIN `user` as u2 ON c.updated_by = u2.id
WHERE id = ?;