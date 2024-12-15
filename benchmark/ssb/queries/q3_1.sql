-- Copied from: https://clickhouse.com/docs/en/getting-started/example-datasets/star-schema
SELECT
    C_NATION,
    S_NATION,
    D_YEAR,
    sum(LO_REVENUE) AS REVENUE
FROM
    customer,
    lineorder,
    supplier,
    date
WHERE
    LO_CUSTKEY = C_CUSTKEY
    AND LO_SUPPKEY = S_SUPPKEY
    AND LO_ORDERDATE = D_DATEKEY
    AND C_REGION = 'ASIA' AND S_REGION = 'ASIA'
    AND D_YEAR >= 1992 AND D_YEAR <= 1997
GROUP BY
    C_NATION,
    S_NATION,
    D_YEAR
ORDER BY
    D_YEAR ASC,
    REVENUE DESC;
