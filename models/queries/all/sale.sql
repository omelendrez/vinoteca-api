SELECT
  o.id,
  o.number,
  o.date,
  o.amount,
  co.name as 'company_name',
  o.store_id,
  st.name as 'store_name',
  u1.name as 'created_by_name',
  u2.name as 'updated_by_name',
  o.created,
  o.updated,
  o.status_id,
  CASE
    WHEN o.status_id = 1 THEN 'Nueva'
    WHEN o.status_id = 2 THEN 'Confirmada'
  END AS 'status_name',
  (
    SELECT
      COUNT(*)
    FROM
      `sale_details`
    WHERE
      sale_id = o.id
  ) AS 'items'
FROM
  `sale` as o
  INNER JOIN `company` as co ON o.company_id = co.id
  INNER JOIN `store` as st ON o.store_id = st.id
  INNER JOIN `user` as u1 ON o.created_by = u1.id
  LEFT OUTER JOIN `user` as u2 ON o.updated_by = u2.id
ORDER BY
  o.id DESC;