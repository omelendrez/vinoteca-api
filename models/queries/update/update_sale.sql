SET
  @sale_id = ?;

UPDATE
  `sale_details` sd
  INNER JOIN `product` p ON sd.product_id = p.id
SET
  sd.price = p.price
WHERE
  sale_id = @sale_id;

SET
  @total = (
    SELECT
      SUM(quantity * price)
    FROM
      `sale_details`
    WHERE
      sale_id = @sale_id
  );

UPDATE
  `sale`
SET
  amount = @total
WHERE
  id = @sale_id;