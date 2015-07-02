CREATE DATABASE tpch partitions 120;
 
CREATE TABLE part (
   p_partkey INTEGER NOT NULL,
   p_name VARCHAR(55) NOT NULL,
   p_mfgr CHAR(25) NOT NULL,
   p_brand CHAR(10) NOT NULL,
   p_type VARCHAR(25) NOT NULL,
   p_size INTEGER NOT NULL,
   p_container CHAR(10) NOT NULL,
   p_retailprice DECIMAL(12,2) NOT NULL,
   p_comment VARCHAR(23) NOT NULL,
   PRIMARY KEY (p_partkey),
   shard KEY (p_partkey)
);
 
CREATE reference TABLE region (
   r_regionkey INTEGER NOT NULL,
   r_name CHAR(25) NOT NULL,
   r_comment VARCHAR(152) NOT NULL,
   PRIMARY KEY (r_regionkey)
);
 
CREATE reference TABLE nation (
   n_nationkey INTEGER NOT NULL,
   n_name CHAR(25) NOT NULL,
   n_regionkey INTEGER NOT NULL,
   n_comment VARCHAR(152) NOT NULL,
   PRIMARY KEY (n_nationkey)
);
 
CREATE TABLE supplier (
   s_suppkey INTEGER NOT NULL,
   s_name CHAR(25) NOT NULL,
   s_address VARCHAR(40) NOT NULL,
   s_nationkey INTEGER NOT NULL,
   s_phone CHAR(15) NOT NULL,
   s_acctbal DECIMAL(12,2) NOT NULL,
   s_comment VARCHAR(101) NOT NULL,
   PRIMARY KEY (s_suppkey),
   shard KEY (s_suppkey)
);
 
CREATE TABLE partsupp (
   ps_partkey INTEGER NOT NULL,
   ps_suppkey INTEGER NOT NULL,
   ps_availqty INTEGER NOT NULL,
   ps_supplycost DECIMAL(12,2) NOT NULL,
   ps_comment VARCHAR(199) NOT NULL,
   PRIMARY KEY (ps_partkey,ps_suppkey),
   shard KEY (ps_partkey)
);
 
CREATE TABLE customer (
   c_custkey INTEGER NOT NULL,
   c_name VARCHAR(25) NOT NULL,
   c_address VARCHAR(40) NOT NULL,
   c_nationkey INTEGER NOT NULL,
   c_phone CHAR(15) NOT NULL,
   c_acctbal DECIMAL(12,2) NOT NULL,
   c_mktsegment CHAR(10) NOT NULL,
   c_comment VARCHAR(117) NOT NULL,
   PRIMARY KEY (c_custkey),
   shard KEY (c_custkey)
);
 
CREATE TABLE orders (
   o_orderkey INTEGER NOT NULL,
   o_custkey INTEGER NOT NULL,
   o_orderstatus CHAR(1) NOT NULL,
   o_totalprice DECIMAL(12,2) NOT NULL,
   o_orderdate DATE NOT NULL,
   o_orderpriority CHAR(15) NOT NULL,
   o_clerk CHAR(15) NOT NULL,
   o_shippriority INTEGER NOT NULL,
   o_comment VARCHAR(79) NOT NULL,
   PRIMARY KEY (o_orderkey),
   shard KEY (o_orderkey)
);
 
CREATE TABLE lineitem (
   l_orderkey INTEGER NOT NULL,
   l_partkey INTEGER NOT NULL,
   l_suppkey INTEGER NOT NULL,
   l_linenumber INTEGER NOT NULL,
   l_quantity DECIMAL(12,2) NOT NULL,
   l_extendedprice DECIMAL(12,2) NOT NULL,
   l_discount DECIMAL(12,2) NOT NULL,
   l_tax DECIMAL(12,2) NOT NULL,
   l_returnflag CHAR(1) NOT NULL,
   l_linestatus CHAR(1) NOT NULL,
   l_shipdate DATE NOT NULL,
   l_commitdate DATE NOT NULL,
   l_receiptdate DATE NOT NULL,
   l_shipinstruct CHAR(25) NOT NULL,
   l_shipmode CHAR(10) NOT NULL,
   l_comment VARCHAR(44) NOT NULL,
   PRIMARY KEY (l_orderkey,l_linenumber),
   shard KEY (l_orderkey)
);

CREATE INDEX n_regionkey ON nation (n_regionkey);
CREATE INDEX s_nationkey ON supplier (s_nationkey);
--create index ps_partkey on partsupp (ps_partkey);
CREATE INDEX ps_suppkey ON partsupp (ps_suppkey);
CREATE INDEX c_nationkey ON customer (c_nationkey);
CREATE INDEX o_custkey ON orders (o_custkey);
--create index l_orderkey on lineitem (l_orderkey);
CREATE INDEX l_partkey ON lineitem (l_partkey);
CREATE INDEX l_suppkey ON lineitem (l_suppkey);
--create index l_partkey_l_suppkey on lineitem (l_partkey,l_suppkey);
