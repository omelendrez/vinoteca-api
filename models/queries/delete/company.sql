SIGNAL SQLSTATE '45000'
SET
  MESSAGE_TEXT = 'No se pueden eliminar empresas';

DELETE FROM
  `company`
WHERE
  id = ?;