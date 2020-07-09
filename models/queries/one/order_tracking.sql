SELECT
  ot.id,
  date_format(ot.date, '%Y-%m-%d') as 'date',
  ot.status_id,
  u1.name as 'created_by_name',
  ot.created
FROM
  `order_tracking` as ot
  INNER JOIN `user` as u1 ON ot.created_by = u1.id
WHERE
  ot.id = ?;