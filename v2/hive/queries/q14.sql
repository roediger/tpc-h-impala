set mapred.min.split.size=536870912;
set hive.exec.reducers.bytes.per.reducer=1040000000;

-- the query
insert overwrite table q14_promotion_effect
select 
  100.00 * sum(case
               when p_type like 'PROMO%'
               then l_extendedprice*(1-l_discount)
               else 0.0
               end
  ) / sum(l_extendedprice * (1 - l_discount)) as promo_revenue
from 
  part p join lineitem l 
  on 
    l.l_partkey = p.p_partkey and l.l_shipdate >= '1995-09-01' and l.l_shipdate < '1995-10-01';
