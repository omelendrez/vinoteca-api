SIGNAL SQLSTATE '45000'
SET
  MESSAGE_TEXT = 'No se pueden eliminar perfiles de usuario';

DELETE FROM
  `profile`
WHERE
  id = ?;