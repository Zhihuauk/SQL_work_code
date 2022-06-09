select ay.estate_name `成交楼盘`
		,sq.areadrawname `成交商圈`
		,ay.customer_no `成交客ID`
		,t1.hold_region_name `成交事业部`
		,t1.hold_marketing_name `成交大区`
		,t1.hold_shop_name `成交门店`
		,t1.hold_ucid `成交人`
		,t2.custdel_id `重客ID`
		,t2.hold_marketing_name `重客大区`
		,t2.hold_shop_name `重客门店`
		,t4.UCID `客户UCID`
		,t4.housedel_id `房源ID`
		,t4.PV 
		,t5.price `总价格`
		,t5.unit_price `单价`
		,t5.hold_region_name `浏览房源事业部`
		,t5.hold_marketing_name `浏览房源大区`
		,t6.areadrawname `浏览房源商圈`
		,t5.resblock_name `浏览房源楼盘`

from
--====成交客=====--
(select estate_name
		,customer_no
		,order_price
from ods.ods_dooioodw_meacasedetail_da
where pt=20181211000000
and trading_type = '二手'
and partname = '世纪公园大区'
and to_date(sign_date) between '2018-11-01' and '2018-11-30'
) ay

--====成交商圈====--

left join

(select distinct estatename
		,areadrawname
		,partname
	from ods.ods_dooioodw_mapareadrawestate_da
	where pt=20181211000000
	) sq
on ay.estate_name=sq.estatename

inner join
--====维护方=====--
(select 
	hold_region_name
	,hold_marketing_name
	,hold_team_name
	,hold_shop_name
	,hold_ucid
	,custdel_id
	,telephone1_md5
	,cust_ucid
	,first_del_source_name			--来源渠道
	,typing_time
from dw.dw_allinfo_custdel_da
where pt=20181211000000
and hold_marketing_name != '世纪公园大区'
and hold_region_name like '沪%'
and del_type = '买卖'
and status_desc = '成交'
) t1
on ay.customer_no=t1.custdel_id

inner join

--====重客=====--
(select hold_region_name
	,hold_marketing_name
	,hold_shop_name
	,hold_team_name
	,hold_ucid
	,custdel_id
	,telephone1_md5
	,first_del_source_name			--来源渠道
	,typing_time
from dw.dw_allinfo_custdel_da
where pt=20181211000000
and hold_marketing_name='世纪公园大区'
and del_type = '买卖'
and status_desc != '成交'
) t2

on t1.telephone1_md5=t2.telephone1_md5

left join
--=====浏览=======--
(select UCID
		,housedel_id
		,count(1) PV
from rpt.rpt_log_dig_sh_all_info_page			-- 房源PV
where pt between 20180601000000 and 20181130000000
and pid_type = 'C'
and business_city_code='310000'
and evt_id=6
and item_status=1 
and uicode in ('ershou/detail','m_pages_ershoufangDetail','ershoufang_view')
and housedel_id is not null
and housedel_id <> '-911'
group by UCID,housedel_id
) t4

on t1.cust_ucid=t4.UCID

left join
--======房源======--
(select hold_region_name
		,hold_marketing_name
		,housedel_id
		,resblock_name
		,price/10000 price
 		,price/floor_area/10000 unit_price
from dw.dw_allinfo_housedel_da
where pt=20181211000000
and hold_region_name like '沪%'
and del_type = '买卖'
) t5

on t4.housedel_id=t5.housedel_id

--======商圈======--

left join
(select distinct estatename
		,resblockid
		,areadrawname
		,partname
	from ods.ods_dooioodw_mapareadrawestate_da
	where pt=20181211000000
) t6

on t5.resblock_name=t6.estatename

where abs(datediff(t1.typing_time,t2.typing_time)) <= 180