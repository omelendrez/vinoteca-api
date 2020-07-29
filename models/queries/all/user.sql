SELECT
  u.id,
  u.name,
  u.email,
  u.company_id,
  c.name as 'company_name',
  u.profile_id,
  p.name as 'profile_name',
  u.created,
  u.updated,
  u1.name as 'created_by_name',
  u2.name as 'updated_by_name',
  u.status_id,
  if (u.status_id = 1, 'Activo', 'Inactivo') as 'status_name'
FROM
  `user` as u
  INNER JOIN `company` as c ON u.company_id = c.id
  INNER JOIN `profile` as p ON u.profile_id = p.id
  INNER JOIN `user` as u1 ON u.created_by = u1.id
  LEFT OUTER JOIN `user` as u2 ON u.updated_by = u2.id;