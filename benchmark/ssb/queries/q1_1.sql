-- Copied from: https://clickhouse.com/docs/en/getting-started/example-datasets/star-schema
SELECT
    sum(LO_EXTENDEDPRICE * LO_DISCOUNT) AS REVENUE
FROM
    lineorder,
    date
WHERE
    LO_ORDERDATE = D_DATEKEY
    AND D_YEAR = 1993
    AND LO_DISCOUNT BETWEEN 1 AND 3
    AND LO_QUANTITY < 25;
