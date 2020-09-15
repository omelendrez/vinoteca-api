SET
  autocommit = OFF;

START TRANSACTION;

SET
  @id := ?;

DELETE FROM
  `sale_details`
WHERE
  sale_id = @id;

DELETE FROM
  `sale`
WHERE
  id = @id;

COMMIT;