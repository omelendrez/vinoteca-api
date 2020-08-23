SELECT
  p.id,
  p.price,
  p.supplier_id,
  su.name as 'supplier_name',
  p.created
FROM
  `price` as p
  INNER JOIN `supplier` as su ON p.supplier_id = su.id
WHERE
  '@search' = ''
  OR p.product_id = '@search'
ORDER BY
  p.id DESC;