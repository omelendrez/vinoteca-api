SELECT
  c.id,
  c.name,
  c.code,
  co.name as 'company_name',
  u1.name as 'created_by_name',
  u2.name as 'updated_by_name',
  c.created,
  c.updated,
  if (c.status_id = 1, 'Activo', 'Inactivo') as 'status_name'
FROM
  `category` as c
  INNER JOIN `company` as co ON c.company_id = co.id
  INNER JOIN `user` as u1 ON c.created_by = u1.id
  LEFT OUTER JOIN `user` as u2 ON c.updated_by = u2.id
WHERE
  c.id = ?;