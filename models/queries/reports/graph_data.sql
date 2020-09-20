SET
  @company_id = ?;

SET
  @period_format = '%Y%m';

SET
  @period_name_format = '%m/%Y';

DELETE FROM
  graph_data
WHERE
  company_id = @company_id;

INSERT INTO
  graph_data (period, period_name, company_id)
SELECT
  DISTINCT DATE_FORMAT(date, @period_format),
  DATE_FORMAT(date, @period_name_format),
  @company_id
FROM
  `order`;

INSERT INTO
  graph_data (period, period_name, company_id)
SELECT
  DISTINCT DATE_FORMAT(date, @period_format),
  DATE_FORMAT(date, @period_name_format),
  @company_id
FROM
  `sale`
WHERE
  DATE_FORMAT(date, @period_format) NOT IN (
    SELECT
      period
    FROM
      graph_data
    WHERE
      company_id = @company_id
  );

UPDATE
  graph_data gd
SET
  purchases =(
    SELECT
      SUM(od.qty_received * od.price)
    FROM
      `order` o
      INNER JOIN `order_details` od ON o.id = od.order_id
    WHERE
      gd.period = DATE_FORMAT(o.date, @period_format)
      AND o.company_id = @company_id
    GROUP BY
      DATE_FORMAT(o.date, @period_format)
  )
WHERE
  gd.company_id = @company_id;

UPDATE
  graph_data gd
SET
  sales =(
    SELECT
      SUM(sd.quantity * sd.price)
    FROM
      `sale` s
      INNER JOIN `sale_details` sd ON s.id = sd.sale_id
    WHERE
      gd.period = DATE_FORMAT(s.date, @period_format)
      AND s.company_id = @company_id
    GROUP BY
      DATE_FORMAT(s.date, @period_format)
  )
WHERE
  gd.company_id = @company_id;

UPDATE
  graph_data
SET
  purchases = 0
WHERE
  ISNULL(purchases)
  AND company_id = @company_id;

UPDATE
  graph_data
SET
  sales = 0
WHERE
  ISNULL(sales)
  AND company_id = @company_id;

SELECT
  period,
  period_name,
  purchases,
  sales
FROM
  (
    SELECT
      *
    FROM
      `graph_data`
    WHERE
      company_id = @company_id
    ORDER BY
      period DESC
    LIMIT
      12
  ) qd
ORDER BY
  period;