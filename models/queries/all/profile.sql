SELECT
  p.id,
  p.code,
  p.name,
  u1.name as 'created_by_name',
  u2.name as 'updated_by_name',
  p.created,
  p.updated,
  p.status_id,
  if (p.status_id = 1, 'Activo', 'Inactivo') as 'status_name'
FROM
  `profile` as p
  INNER JOIN `user` as u1 ON p.created_by = u1.id
  LEFT OUTER JOIN `user` as u2 ON p.updated_by = u2.id;