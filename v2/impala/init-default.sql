DROP TABLE IF EXISTS default.lineitem;
DROP TABLE IF EXISTS default.part;
DROP TABLE IF EXISTS default.supplier;
DROP TABLE IF EXISTS default.partsupp;
DROP TABLE IF EXISTS default.nation;
DROP TABLE IF EXISTS default.region;
DROP TABLE IF EXISTS default.customer;
DROP TABLE IF EXISTS default.orders;

CREATE EXTERNAL TABLE default.lineitem (
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

CREATE EXTERNAL TABLE default.part (
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

CREATE EXTERNAL TABLE default.supplier (
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

CREATE EXTERNAL TABLE default.partsupp (
	PS_PARTKEY INT, 
	PS_SUPPKEY INT, 
	PS_AVAILQTY INT, 
	PS_SUPPLYCOST DOUBLE, 
	PS_COMMENT STRING
) 
ROW FORMAT DELIMITED FIELDS TERMINATED BY '|' 
STORED AS TEXTFILE 
LOCATION'/tpch/100/partsupp';

CREATE EXTERNAL TABLE default.nation (
	N_NATIONKEY INT, 
	N_NAME STRING, 
	N_REGIONKEY INT, 
	N_COMMENT STRING
) 
ROW FORMAT DELIMITED FIELDS TERMINATED BY '|' 
STORED AS TEXTFILE 
LOCATION '/tpch/100/nation';

CREATE EXTERNAL TABLE default.region (
	R_REGIONKEY INT, 
	R_NAME STRING, 
	R_COMMENT STRING) 
ROW FORMAT DELIMITED FIELDS TERMINATED BY '|' 
STORED AS TEXTFILE 
LOCATION '/tpch/100/region';

CREATE EXTERNAL TABLE default.customer (
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

CREATE EXTERNAL TABLE default.orders (
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

COMPUTE STATS default.lineitem;
COMPUTE STATS default.orders;
COMPUTE STATS default.customer;
COMPUTE STATS default.part;
COMPUTE STATS default.partsupp;
COMPUTE STATS default.supplier;
COMPUTE STATS default.nation;
COMPUTE STATS default.region;