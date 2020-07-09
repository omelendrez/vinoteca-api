SIGNAL SQLSTATE '45000'
SET
  MESSAGE_TEXT = 'No se pueden actualizar perfiles de usuario';

UPDATE
  `profile`
SET
  { fields }
WHERE
  id = ?;