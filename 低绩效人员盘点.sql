select
a1.region_name `事业部`,
a1.marketing_name`大区`,
a1.shop_name`门店`,
a1.user_name`姓名`,
a1.user_code`工号`,
yj.title_degree`职级`,
yj.firsthand_order_comm_actual`一手业绩`,
yj.firsthand_order_cnt`一手单量`,
yj.secondhand_order_comm_actual`一手业绩`,
yj.secondhand_order_cnt`二手单量`,
yj.rent_order_comm_actual`租赁业绩`,
yj.rent_order_cnt`租赁单量`,
gzl.dknum`带看量`,
gzl.keynum`钥匙量`,
gzl.generalentrustnum`一般委托`,
gzl.inquiryfollownum`客源跟进`,
gzl.validpropertynumrent`房源跟进`

from
(
select
user_code,
user_name,
status,
region_code,
region_name,
marketing_code,
marketing_name,
shop_code,
shop_name
from
dim.dim_sh_public_agent_info
where
status = 1
and region_name = '沪东事业部'
)a1

left join

(
select
bu_id,
part_id,
area_id,
store_code,
team_code,
user_code,
title_degree,
sum(firsthand_order_comm_actual) firsthand_order_comm_actual,
count(firsthand_order_cnt) firsthand_order_cnt,
sum(secondhand_order_comm_actual) secondhand_order_comm_actual,
count(secondhand_order_cnt) secondhand_order_cnt,
sum(rent_order_comm_actual) rent_order_comm_actual,
count(rent_order_cnt) rent_order_cnt
from
olap.olap_sh_comm_order_da
where 
pt = '20181011'
and order_date between '2018-07-11' and '2018-10-11'
and bu_id = '36204'
group by
bu_id,
part_id,
area_id,
store_code,
team_code,
user_code,
title_degree
)yj

on a1.user_code = yj.user_code

left join  
(
select
case when length(empid)=5 then concat('220', empid) 
	 when length(empid)=6 then concat('22', empid)
	 end as empid,
count(dknum) dknum,
count(keynum) keynum,
count(generalentrustnum) generalentrustnum,
count(inquiryfollownum)inquiryfollownum,
count(validpropertynumrent) validpropertynumrent
from
ods.ods_dooioodw_factworkdayemp_da
where 
pt = '20181011000000' 
-- group by empid
)gzl

on a1.user_code=gzl.empid


