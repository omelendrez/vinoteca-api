SET
  autocommit = OFF;

START TRANSACTION;

/* Assing received values to variables */
SET
  @store_id = ?,
  @product_id = ?,
  @quantity = ?,
  @variation_type = ?,
  @variation_reason_id = ?,
  @comments = ?,
  @company_id = ?,
  @user_id = ?,
  @now = NOW();

/* Add new variation to inventory_variation table */
INSERT INTO
  `inventory_variation` (
    store_id,
    product_id,
    quantity,
    variation_type,
    variation_reason_id,
    comments,
    company_id,
    created_by,
    created
  )
VALUES
  (
    @store_id,
    @product_id,
    @quantity,
    @variation_type,
    @variation_reason_id,
    @comments,
    @company_id,
    @user_id,
    @now
  );

/* Get id of last inserted record */
SET
  @id = LAST_INSERT_ID();

/* Insert record if not in inventory */
INSERT INTO
  `inventory` (
    store_id,
    product_id,
    company_id,
    created,
    created_by
  )
SELECT
  @store_id,
  @product_id,
  @company_id,
  @now,
  @user_id
WHERE
  NOT EXISTS (
    SELECT
      *
    FROM
      `inventory`
    WHERE
      store_id = @store_id
      AND product_id = @product_id
  );

/* Update product quantity in inventory for current store */
UPDATE
  `inventory`
SET
  quantity = quantity + @variation_type * @quantity,
  created = @now,
  created_by = @user_id
WHERE
  store_id = @store_id
  AND product_id = @product_id;

/* Update product quantity */
UPDATE
  `product`
SET
  quantity = quantity + @variation_type * @quantity
WHERE
  id = @product_id;

SELECT
  @id as 'id';

COMMIT;