SET
  autocommit = OFF;

START TRANSACTION;

/* Assing received values to variables */
SET
  @sale_id = ?,
  @user_id = ?;

/* Load other needed values to variables*/
SET
  @status_id = 2,
  @updated = NOW(),
  @company_id = (
    SELECT
      company_id
    from
      `sale`
    WHERE
      id = @sale_id
    LIMIT
      1
  ), @sale_number = (
    SELECT
      number
    from
      `sale`
    WHERE
      id = @sale_id
    LIMIT
      1
  ), @sale_date = (
    SELECT
      date
    from
      `sale`
    WHERE
      id = @sale_id
    LIMIT
      1
  );

/* Decrease product stock */
UPDATE
  `inventory` AS i
  INNER JOIN `sale_details` AS od ON i.product_id = od.product_id
SET
  i.quantity = i.quantity - od.quantity
WHERE
  od.sale_id = @sale_id;

/* Incresase products stock */
UPDATE
  `product` AS p
  INNER JOIN `sale_details` AS od ON p.id = od.product_id
SET
  p.quantity = p.quantity - od.quantity,
  last_sale_date = @sale_date,
  last_sale_price = od.price,
  p.updated = @updated,
  p.updated_by = @user_id
WHERE
  od.sale_id = @sale_id;

/* Update sale status */
UPDATE
  `sale`
SET
  status_id = @status_id
WHERE
  id = @sale_id;

COMMIT;