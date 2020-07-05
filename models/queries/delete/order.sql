SIGNAL SQLSTATE '45000'
SET
  MESSAGE_TEXT = 'No se pueden eliminar órdenes';

SET
  autocommit = OFF;

START TRANSACTION;

SET
  @id := ?;

DELETE FROM
  `order_details`
WHERE
  order_id = @id;

DELETE FROM
  `order`
WHERE
  id = @id;

COMMIT;