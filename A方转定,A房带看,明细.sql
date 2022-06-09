--- A房转定占比

select zrp.region_name `责任事业部`
      ,zrp.marketing_name `责任大区`
  	 ,zrp.shop_name `责任门店`
      ,count(ay.housedelcode) `转定房源套数`
,count(case when nvl(ls.house_rank_name,substr(fy.grade,1,1))='A' then  1 else null end ) `转定A房套数`
  	 ,round(count(case when nvl(ls.house_rank_name,substr(fy.grade,1,1))='A' then  1 else null end )
			/count(ay.housedelcode),2) `本月A房转定占比`

  -------------选择转定案源
  from 
  (
    select distinct housedelcode
             ,deal_branchname
             ,estate_name
             ,status
             ,order_date
			 ,order_price
    FROM ods.ods_dooioodw_meacasedetail_da
    WHERE pt='20181014000000'  
      and trading_type='二手' 
      and casecompany='德佑'
	  and order_price >= 100
      and to_date(order_date) between '2018-07-01' and '2018-09-30'
  )ay
  
------------------匹配责任盘
  left join 
  (
    select distinct housedel_id
            ,region_name 
            ,marketing_name 
            ,shop_name 
    from olap.olap_house_duty_info_da
    where pt='20181014'
	and region_name like '沪东%'
  ) zrp on ay.housedelcode=zrp.housedel_id

  --------------------匹配A&聚焦房
  left join
  ( 
    select distinct housedel_id
            ,grade
			,price
    from dw.dw_allinfo_housedel_da
    where pt='20181014000000'
	and stat_function_code in (110006002,110006003)
  )fy on ay.housedelcode=fy.housedel_id

  --------------------历史等级
  left join
  (
    select dk.create_time
  ,a.from_date
  ,a.end_date
  ,a.house_rank_name 
  ,dk.housedel_id
  from 
( select * from 
 (
  select 
broker_region_name
  ,broker_marketing_name
  ,broker_shop_name
  ,id
  ,broker_name 
  ,broker_uid
  ,housedel_id
   ,create_time
   ,row_number() over (partition by housedel_id  order by create_time desc) px
  from dw.dw_evt_showing_detail_all_info_branch_da 
  WHERE pt='20181014000000'                           ---------- 常规 PT
  and biz_type = 200200000001  -- 买卖房源
   
 
)dk0
where dk0.px='1')dk
left join 
 (
      select housedel_id
          ,house_rank_name
          ,from_date
          ,end_date
          ,type
      from dim.dim_house_SCD_di -- iseedeadpeople
    )a on dk.housedel_id=a.housedel_id
  where to_date(dk.create_time) between to_date(a.from_date) and to_date(a.end_date)
  )ls on ls.housedel_id=ay.housedelcode
  
group by zrp.region_name, zrp.marketing_name,zrp.shop_name


--- A房带看详情
金杨 转定明细
大区- 成交分行 - 房源等级 - 楼盘 - 成交价格 - 成效时间- 面积
select
cj.partname `成交大区`
,cj.deal_branchname`成交分行`
,fy.hold_area_name`维护大区`
,fy.hold_team_name`维护分行`
,cj.estate_name`楼盘名`
,fy.grade`房源等级`
,cj.contract_price`合同价格`
,cj.order_price`转定价格`
,cj.order_real_time`实际转定时间`
,fy.floor_area`建筑面积`
,fy.inside_area`套内面积`
from
(
select
hourse_source_no
,partname
,deal_branchname
,estate_name
,online_sign_date
,contract_price
,order_price
,order_real_time
from
ods.ods_dooioodw_meacasedetail_da
where
pt = '20181120000000'
and partname = '金杨大区'
and to_date(order_real_time) between '2018-11-01' and '2018-11-20'
and trading_type = '买卖'
)cj

left join

(
select
hold_area_name
,hold_team_name
,housedel_id
,grade
,floor_area
,inside_area
from 
dw.dw_allinfo_housedel_da
where
pt = '20181120000000'
)fy
on cj.hourse_source_no = fy.housedel_id


--- 金杨维护房源的被外区卖掉


select
cj.partname `成交大区`
,cj.deal_branchname`成交分行`
,fy.hold_area_name`维护大区`
,fy.hold_team_name`维护分行`
,cj.estate_name`楼盘名`
,fy.grade`房源等级`
,cj.contract_price`合同价格`
,cj.order_price`转定价格`
,cj.order_real_time`实际转定时间`
,fy.floor_area`建筑面积`
-- ,fy.inside_area`套内面积`
,cj.trading_type `交易类型`
from
(
select
hourse_source_no
,partname
,deal_branchname
,estate_name
,online_sign_date
,contract_price
,order_price
,order_real_time
,trading_type
from
ods.ods_dooioodw_meacasedetail_da
where
pt = '20181120000000'
-- and partname = '金杨大区'
and to_date(order_real_time) between '2018-11-01' and '2018-11-20'
and trading_type in ('二手','一手')
)cj

left join

(
select
hold_marketing_name
,hold_area_name
,hold_team_name
,housedel_id
,grade
,floor_area
,inside_area
from 
dw.dw_allinfo_housedel_da
where
pt = '20181120000000'
AND hold_marketing_name = '金杨大区'
)fy
on fy.housedel_id = cj.hourse_source_no 
-- and fy.partname = cj.hold_marketing_name
order BY `实际转定时间`


---- 南汇个等级房源带看
select
fy.hold_region_name `事业部`
,fy.hold_marketing_name`维护大区`
,fy.hold_team_name`店组`
,fy.resblock_name`楼盘名`
,fy.housedel_id`房源编码`
,fy.grade`房源等级`
,dk.del_type`委托类型`
,nvl(count(dk.showing_id),0)`带看次数`
from
(
select
hold_region_name
,hold_marketing_name
,hold_team_name
,resblock_name
,housedel_id
,grade
,is_vr
,floor_area
from 
dw.dw_allinfo_housedel_da
where
pt = '20181120000000'
and hold_marketing_name = '南汇大区'
and del_type = '买卖'
and  housedel_status_code = 120011001
)fy

left join

(
select
resblock_name
,housedel_id
,del_type
,showing_id
from
dw.dw_allinfo_evt_showing_da
where 
pt = '20181120000000'
 and holder_marketing_name = '南汇大区'
and to_date(showing_create_time) BETWEEN '20018-11-01' AND '2018-11-20'
AND del_type = '买卖'
and is_valid = 1
)dk
on dk.housedel_id = fy.housedel_id
GROUP BY
fy.hold_region_name
,fy.hold_marketing_name
,fy.hold_team_name
,fy.resblock_name
,fy.housedel_id
,fy.grade
,dk.del_type