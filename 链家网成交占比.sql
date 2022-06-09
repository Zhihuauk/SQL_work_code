select 
ay.partname `大区`,
ay.deal_branchname `分行`,
ay.deal_empname `经纪人`,
ay.trading_type `类型`,
ay.order_real_time `实际转定时间`,
ky.first_del_source_name `一级委托来源`,
ky.second_del_source_name `二级委托来源`

from
(
select
	operationid,
	customer_no,
 	partname,
	deal_branchname,
	deal_empname,
	trading_type,
	order_real_time
from
	ods.ods_dooioodw_meacasedetail_da
where
	pt = '20190108000000'
	and to_date(order_real_time) between '2018-01-01' and '2018-12-31'
	and partname = '南汇大区'
)ay

left join

(
select	
	custdel_id,
	first_del_source_name,
	second_del_source_name
from
	dw.dw_allinfo_custdel_da
WHERE
  	pt = 20190108000000
)ky
on ay.customer_no = ky.custdel_id