SELECT
  p.name,
  p.minimum,
  p.quantity
FROM
  `product` as p
WHERE
  p.quantity <= p.minimum
  AND p.minimum > 0;