CREATE SCHEMA IF NOT EXISTS tpch_csv;

DROP TABLE IF EXISTS tpch_csv.lineitem;
DROP TABLE IF EXISTS tpch_csv.part;
DROP TABLE IF EXISTS tpch_csv.supplier;
DROP TABLE IF EXISTS tpch_csv.partsupp;
DROP TABLE IF EXISTS tpch_csv.nation;
DROP TABLE IF EXISTS tpch_csv.region;
DROP TABLE IF EXISTS tpch_csv.customer;
DROP TABLE IF EXISTS tpch_csv.orders;

CREATE EXTERNAL TABLE tpch_csv.lineitem (
  L_ORDERKEY INT,
  L_PARTKEY INT,
  L_SUPPKEY INT,
  L_LINENUMBER INT,
  L_QUANTITY DOUBLE,
  L_EXTENDEDPRICE DOUBLE,
  L_DISCOUNT DOUBLE,
  L_TAX DOUBLE,
  L_RETURNFLAG STRING,
  L_LINESTATUS STRING,
  L_SHIPDATE STRING,
  L_COMMITDATE STRING,
  L_RECEIPTDATE STRING,
  L_SHIPINSTRUCT STRING,
  L_SHIPMODE STRING,
  L_COMMENT STRING
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '|'
STORED AS TEXTFILE
LOCATION '/tpch/100/lineitem';

CREATE EXTERNAL TABLE tpch_csv.part (
  P_PARTKEY INT,
  P_NAME STRING,
  P_MFGR STRING,
  P_BRAND STRING,
  P_TYPE STRING,
  P_SIZE INT,
  P_CONTAINER STRING,
  P_RETAILPRICE DOUBLE,
  P_COMMENT STRING
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '|'
STORED AS TEXTFILE
LOCATION '/tpch/100/part';

CREATE EXTERNAL TABLE tpch_csv.supplier (
  S_SUPPKEY INT,
  S_NAME STRING,
  S_ADDRESS STRING,
  S_NATIONKEY INT,
  S_PHONE STRING,
  S_ACCTBAL DOUBLE,
  S_COMMENT STRING
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '|'
STORED AS TEXTFILE
LOCATION '/tpch/100/supplier';

CREATE EXTERNAL TABLE tpch_csv.partsupp (
  PS_PARTKEY INT,
  PS_SUPPKEY INT,
  PS_AVAILQTY INT,
  PS_SUPPLYCOST DOUBLE,
  PS_COMMENT STRING
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '|'
STORED AS TEXTFILE
LOCATION'/tpch/100/partsupp';

CREATE EXTERNAL TABLE tpch_csv.nation (
  N_NATIONKEY INT,
  N_NAME STRING,
  N_REGIONKEY INT,
  N_COMMENT STRING
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '|'
STORED AS TEXTFILE
LOCATION '/tpch/100/nation';

CREATE EXTERNAL TABLE tpch_csv.region (
  R_REGIONKEY INT,
  R_NAME STRING,
  R_COMMENT STRING)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '|'
STORED AS TEXTFILE
LOCATION '/tpch/100/region';

CREATE EXTERNAL TABLE tpch_csv.customer (
  C_CUSTKEY INT,
  C_NAME STRING,
  C_ADDRESS STRING,
  C_NATIONKEY INT,
  C_PHONE STRING,
  C_ACCTBAL DOUBLE,
  C_MKTSEGMENT STRING,
  C_COMMENT STRING
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '|'
STORED AS TEXTFILE
LOCATION '/tpch/100/customer';

CREATE EXTERNAL TABLE tpch_csv.orders (
  O_ORDERKEY INT,
  O_CUSTKEY INT,
  O_ORDERSTATUS STRING,
  O_TOTALPRICE DOUBLE,
  O_ORDERDATE STRING,
  O_ORDERPRIORITY STRING,
  O_CLERK STRING,
  O_SHIPPRIORITY INT,
  O_COMMENT STRING
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '|'
STORED AS TEXTFILE
LOCATION '/tpch/100/orders';

COMPUTE STATS tpch_csv.lineitem;
COMPUTE STATS tpch_csv.orders;
COMPUTE STATS tpch_csv.customer;
COMPUTE STATS tpch_csv.part;
COMPUTE STATS tpch_csv.partsupp;
COMPUTE STATS tpch_csv.supplier;
COMPUTE STATS tpch_csv.nation;
COMPUTE STATS tpch_csv.region;