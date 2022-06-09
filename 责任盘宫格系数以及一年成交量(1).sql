select distinct pan.resblock_name `责任/维护楼盘`,
				wq.areadrawname `楼盘商圈`, 
				nvl(gg.company25,'') `宫格`,
				case when pan.div_type_code = '110030001' then '责任盘'
					 when pan.div_type_code = '110030002' then '维护盘'
					 else '未知' end as `组对盘关系`,
				pan.hold_marketing_name `责任/维护大区`, 
				pan.hold_team_name `分行` ,
				pan.longitude `经度`,
				pan.latitude`纬度`,
				nvl(lp.buildingcount,'') `楼栋数`, 
				nvl(lp.counth,'') `户数`,
				nvl(wq.cnt,0) `一年市场成交套数`,
				nvl(wq.commission,0) `一年市场佣金量`, 
				nvl(wq.lj_cnt,0) `一年链家成交套数`, 
				nvl(wq.lj_comission,0) `一年链家佣金量`,
				nvl(avg_price,0) `链家成交均价`,
				nvl(avg_unit_price,0) `链家成交平均单价`,
				nvl(deal_cnt,0) `责任分行一年成交套数`,
				nvl(typing_cnt,0)/7 `责任分行月均开盘数`
from 

(select t1.hold_marketing_name
		,t1.hold_team_name
		,fw.resblock_name
 		,zrp.div_type_code
		,wz.longitude
		,wz.latitude
from
-----------------有效分行------------------------------------------------
	(select distinct hold_team_code, hold_team_name, hold_marketing_name
		from dw.dw_allinfo_housedel_da 
		where pt = '20181024000000' 
		and hold_region_name = '沪东事业部'
		and housedel_status = '有效') t1 

inner join 
-----------------责任/维护盘------------------------------------------------
	(select distinct entity_id, team_code, div_type_code
		from dw.dw_house_groupdiv_da 
		where pt = '20181024000000' 
		and div_type_code in ('110030001', '110030002')
		and is_valid = 1) zrp

on t1.hold_team_code = zrp.team_code 

inner join 

	(select distinct building_id, resblock_name, resblock_id
		from dw.dw_allinfo_house_house_da 
		where pt = '20181024000000') fw 
	on zrp.entity_id = fw.building_id 
	--------------------匹配楼盘位置--------------------------------
inner join 
(
select 
resblock_id,
resblock_name,
longitude,
latitude
from
dw.dw_house_resblock_da
where
pt = '20181024000000'
)wz
on wz.resblock_id = fw.resblock_id
) pan
-----------------市场一年体量和佣金量------------------------------------
left join 
	(select areadrawname,estatename, count(secondsaleid) cnt ,sum(price)*0.02/10000 commission,
		count(case when islink = '是' then 1 else null end) lj_cnt,
		sum(case when islink = '是' then price else 0 end)*0.02/10000 lj_comission
		from rpt.rpt_sh_secondsaleext_da 
		where pt = '20181024000000' 
		and checkflag = 1 
		and to_date(signdate) between '2017-10-01' and '2018-10-01' 
		group by estatename,areadrawname) wq 

on wq.estatename = pan.resblock_name

-----------------门店成交套数------------------------------------
left join 
	(select estate_name, deal_branchname, count(distinct orderid) deal_cnt
		from ods.ods_dooioodw_meacasedetail_da
		where pt = '20181024000000'
		and to_date(sign_date) between '2017-10-01' and '2018-10-01' 
		and trading_type = '二手'
		group by estate_name, deal_branchname) branch
on branch.estate_name = pan.resblock_name
	and branch.deal_branchname = pan.hold_team_name

left join
-----------------宫 格-----------------------------------
	(select distinct t1.estatename, t1.company25
	from
		(select estatename, company25, bakdate
		from ods.ods_dooioodw_dimfocalestatebak_da
		where pt = '20181024000000') t1

		inner JOIN

		(select estatename, max(bakdate) `max`
		from ods.ods_dooioodw_dimfocalestatebak_da
		where pt = '20181024000000'
		group by estatename) t0

	on t1.bakdate = t0.`max`
	and t1.estatename = t0.estatename) gg

on pan.resblock_name = gg.estatename

-----------------户数------------------------------------
left join
 
(select t1.estatename, t1.buildingcount, t1.counth
 from
  (select *
  from ods.ods_dooioodw_estatecomplete_da
  where pt = '20181024000000')t1
inner join
 (select estatename, max(rptdate) max
  from ods.ods_dooioodw_estatecomplete_da
  where pt = '20181024000000'
  group by estatename) t0
on t1.estatename = t0.estatename
and t1.rptdate = t0.max
) lp
on lp.estatename = pan.resblock_name

-----------------门店开盘------------------------------------
left join

(select resblock_name,typing_team_name,count(distinct housedel_id) typing_cnt
from dw.dw_allinfo_housedel_da 
	where pt = '20181024000000' 
	and typing_region_name = '沪东事业部'
	and to_date(typing_time) between '2018-04-01' and '2018-09-31'
	group by resblock_name, typing_team_name) typing

on typing.resblock_name = pan.resblock_name
	and typing.typing_team_name = pan.hold_team_name

-----------------楼盘平均单价------------------------------------
left join
(select estate_name, avg(order_price) avg_price, avg(order_price/floor_area) avg_unit_price
	from
	(select housedelcode, estate_name, order_price
	from ods.ods_dooioodw_meacasedetail_da
	where pt = '20181024000000'
	and trading_type = '二手'
	and to_date(sign_date) >= '2017-09-29') a0

	left join 

	(select housedel_id, floor_area
	from dw.dw_allinfo_housedel_da
	where pt = '20181024000000'
	) a1

	on a0.housedelcode = a1.housedel_id
group by estate_name) p1

on p1.estate_name = pan.resblock_name



----------------门店人数--------------
select
d.shop_name
,r.renshu
,d.longitude
,d.latitude
from
(
select 
shop_code
,shop_name
,longitude
,latitude
from
dw.dw_house_shop_da
where 
pt = '20181024000000'
)d
left join
(
select 
shop_code
,sale_agent_num
--,sale_agent_num+comp_agent_num+rent_agent_num `renshu`
from
olap.olap_sh_agent_cnt_shop_di
where
pt = '20181024000000'
)r