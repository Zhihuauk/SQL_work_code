select weihu.resblock_name `楼盘 `
	,weihu.marketing_name `维护店大区`
	,weihu.circlename `维护盘商圈`
	,weihu.team_name `维护店`
	,zeren.team_name `责任店`
from
(select
a5.circlename  ,
a2.region_name  ,
a2.marketing_name ,
a2.shop_name  ,
a2.team_name  ,
a4.resblock_name,
a4.resblock_id
from 
(
select team_code ,
entity_id 
from dw.dw_house_groupdiv_da
where pt='20180613000000' -- 最新的分区
and is_valid='1' -- 有效
and div_type_code='110030002' -- 维护盘
and city_code='310000' -- 上海市 
) a1
join 
(
select distinct 
region_name,
marketing_name,
shop_code,
shop_name ,
team_code ,
team_name,
shop_leader_name
from dw.dw_uc_agent_all_info_branch_da  -- 分行表
where pt='20180613000000'
and corp_code='SH8888'
and region_name='沪东事业部'
) a2 
on a1.team_code=a2.team_code
join 
(
select
building_id,
building_name,
resblock_id
from dw.dw_house_building_da
where pt='20180613000000'
and city_code='310000'
and is_valid=1
)a3
on a1.entity_id =a3.building_id
join 
(
select resblock_id,
  resblock_name
  from dw.dw_house_resblock_da
  where pt='20180613000000'
and city_code='310000'
and is_valid=1
)a4
on a3.resblock_id=a4.resblock_id
left join 
(
select buildingid,circlename
  from ods.ods_dooioodw_dimmapareadrawunit_da
  where pt='20180613000000'
)a5
on a1.entity_id=a5.buildingid
group by a5.circlename  ,
a2.region_name  ,
a2.marketing_name ,
a2.shop_name  ,
a2.team_name  ,
a4.resblock_name,
a4.resblock_id) weihu

left join 

(select
a5.circlename  ,
a2.region_name  ,
a2.marketing_name ,
a2.shop_name  ,
a2.team_name  ,
a4.resblock_name,
a4.resblock_id
from 
(
select team_code ,
entity_id 
from dw.dw_house_groupdiv_da
where pt='20180613000000' -- 最新的分区
and is_valid='1' -- 有效
and div_type_code='110030001' -- 责任盘
and city_code='310000' -- 上海市 
) a1
join 
(
select distinct 
region_name,
marketing_name,
shop_code,
shop_name ,
team_code ,
team_name,
shop_leader_name
from dw.dw_uc_agent_all_info_branch_da  -- 分行表
where pt='20180613000000'
and corp_code='SH8888'
and region_name='沪东事业部'
) a2 
on a1.team_code=a2.team_code
join 
(
select
building_id,
building_name,
resblock_id
from dw.dw_house_building_da
where pt='20180613000000'
and city_code='310000'
and is_valid=1
)a3
on a1.entity_id =a3.building_id
join 
(
select resblock_id,
  resblock_name
  from dw.dw_house_resblock_da
  where pt='20180613000000'
and city_code='310000'
and is_valid=1
)a4
on a3.resblock_id=a4.resblock_id
left join 
(
select buildingid,circlename
  from ods.ods_dooioodw_dimmapareadrawunit_da
  where pt='20180613000000'
)a5
on a1.entity_id=a5.buildingid
group by a5.circlename  ,
a2.region_name  ,
a2.marketing_name ,
a2.shop_name  ,
a2.team_name  ,
a4.resblock_name,
a4.resblock_id) zeren
on weihu.resblock_id = zeren.resblock_id