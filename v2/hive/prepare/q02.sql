DROP TABLE IF EXISTS part;
DROP TABLE IF EXISTS supplier;
DROP TABLE IF EXISTS partsupp;
DROP TABLE IF EXISTS nation;
DROP TABLE IF EXISTS region;
DROP TABLE IF EXISTS q2_minimum_cost_supplier;
DROP TABLE IF EXISTS q2_minimum_cost_supplier_tmp1;
DROP TABLE IF EXISTS q2_minimum_cost_supplier_tmp2;

-- create the tables and load the data
create external table part (P_PARTKEY INT, P_NAME STRING, P_MFGR STRING, P_BRAND STRING, P_TYPE STRING, P_SIZE INT, P_CONTAINER STRING, P_RETAILPRICE DOUBLE, P_COMMENT STRING) ROW FORMAT DELIMITED FIELDS TERMINATED BY '|' STORED AS TEXTFILE LOCATION '/tpch/1/part';
create external table supplier (S_SUPPKEY INT, S_NAME STRING, S_ADDRESS STRING, S_NATIONKEY INT, S_PHONE STRING, S_ACCTBAL DOUBLE, S_COMMENT STRING) ROW FORMAT DELIMITED FIELDS TERMINATED BY '|' STORED AS TEXTFILE LOCATION '/tpch/1/supplier';
create external table partsupp (PS_PARTKEY INT, PS_SUPPKEY INT, PS_AVAILQTY INT, PS_SUPPLYCOST DOUBLE, PS_COMMENT STRING) ROW FORMAT DELIMITED FIELDS TERMINATED BY '|' STORED AS TEXTFILE LOCATION'/tpch/1/partsupp';
create external table nation (N_NATIONKEY INT, N_NAME STRING, N_REGIONKEY INT, N_COMMENT STRING) ROW FORMAT DELIMITED FIELDS TERMINATED BY '|' STORED AS TEXTFILE LOCATION '/tpch/1/nation';
create external table region (R_REGIONKEY INT, R_NAME STRING, R_COMMENT STRING) ROW FORMAT DELIMITED FIELDS TERMINATED BY '|' STORED AS TEXTFILE LOCATION '/tpch/1/region';

-- create result tables
create table q2_minimum_cost_supplier_tmp1 (s_acctbal double, s_name string, n_name string, p_partkey int, ps_supplycost double, p_mfgr string, s_address string, s_phone string, s_comment string);
create table q2_minimum_cost_supplier_tmp2 (p_partkey int, ps_min_supplycost double);
create table q2_minimum_cost_supplier (s_acctbal double, s_name string, n_name string, p_partkey int, p_mfgr string, s_address string, s_phone string, s_comment string);
