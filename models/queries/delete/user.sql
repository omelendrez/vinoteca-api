SIGNAL SQLSTATE '45000'
SET
  MESSAGE_TEXT = 'No se pueden eliminar usuarios';

DELETE FROM
  `user`
WHERE
  id = ?;