SET
  autocommit = OFF;

START TRANSACTION;

/* Assing received values to variables */
SET
  @order_id = ?,
  @date_received = ?,
  @store_id = ?,
  @user_id = ?;

/* Load other needed values to variables*/
SET
  @status_id = 3,
  @updated = NOW(),
  @order_number = (
    SELECT
      number
    from
      `order`
    WHERE
      id = @order_id
    LIMIT
      1
  ), @order_date = (
    SELECT
      date
    from
      `order`
    WHERE
      id = @order_id
    LIMIT
      1
  );

/* Add new productos t0 inventory */
INSERT INTO
  `inventory` (
    product_id,
    store_id,
    company_id,
    created_by,
    created
  )
SELECT
  product_id,
  @store_id,
  @company_id,
  @user_id,
  @updated
FROM
  `order_details`
WHERE
  order_id = @order_id
  AND id NOT IN (
    SELECT
      od.id
    FROM
      `inventory` i
      INNER JOIN `order_details` od ON i.product_id = od.product_id
      AND i.store_id = @store_id
    WHERE
      od.order_id = @order_id
  );

/* Increase product stock */
UPDATE
  `inventory` AS i
  INNER JOIN `order_details` ON invertory.product_id = od.product_id
SET
  quantity = quantity + od.qty_received,
  i.updated = @updated,
  i.updated_by = @user_id
WHERE
  od.order_id = @order_id;

/* Incresase products stock */
UPDATE
  `product` AS p
  INNER JOIN `order_details` ON product.id = od.product_id
SET
  quantity = quantity + od.qty_received,
  last_purchase_order = @order_number,
  last_purchase_date = @order_date,
  last_purchase_price = od.price,
  p.updated = @updated,
  p.updated_by = @user_id
WHERE
  od.order_id = @order_id;

/* Update order status */
UPDATE
  `order`
SET
  status_id = @status_id
WHERE
  id = @order_id;

/* Add tracking */
INSERT INTO
  `order_tracking` (order_id, date, status_id, created, created_by)
VALUES
  (
    @order_id,
    @date_received,
    @status_id,
    @updated,
    @user_id
  );

COMMIT;