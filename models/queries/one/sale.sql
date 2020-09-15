SET
  @id := ?;

SELECT
  o.id,
  o.number,
  o.date,
  o.amount,
  co.name as 'company_name',
  o.store_id,
  st.name as 'store_name',
  st.address as 'store_address',
  u1.name as 'created_by_name',
  u2.name as 'updated_by_name',
  (
    SELECT
      SUM(od.quantity * price)
    FROM
      `sale_details` AS od
    WHERE
      sale_id = o.id
  ) AS 'total_sale',
  o.created,
  o.updated,
  o.status_id,
  CASE
    WHEN o.status_id = 1 THEN 'Nueva'
    WHEN o.status_id = 2 THEN 'Confirmada'
  END AS 'status_name'
  /*,
   if (o.status_id = 1, 'Activo', 'Inactivo') as 'status_name'*/
FROM
  `sale` as o
  INNER JOIN `company` as co ON o.company_id = co.id
  INNER JOIN `store` as st ON o.store_id = st.id
  INNER JOIN `user` as u1 ON o.created_by = u1.id
  LEFT OUTER JOIN `user` as u2 ON o.updated_by = u2.id
WHERE
  o.id = @id;

SELECT
  od.id,
  od.product_id,
  pr.name as 'product_name',
  pr.description as 'product_description',
  od.quantity,
  od.price,
  od.price * od.quantity as 'total',
  u1.name as 'created_by_name',
  u2.name as 'updated_by_name',
  od.created,
  od.updated,
  if (od.status_id = 1, 'Activo', 'Inactivo') as 'status_name'
FROM
  `sale_details` as od
  INNER JOIN `product` as pr ON od.product_id = pr.id
  INNER JOIN `user` as u1 ON od.created_by = u1.id
  LEFT OUTER JOIN `user` as u2 ON od.updated_by = u2.id
WHERE
  od.sale_id = @id;