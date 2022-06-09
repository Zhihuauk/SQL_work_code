select
a.housedel_id
,a.resblock_id
,a.resblock_name
,a.hold_user_name
,a.hold_team_name
,a.hold_marketing_name
,b.building_id  `楼栋id`
-- ,b.building_name `楼栋名称`
,c.groupdiv_type `组对盘名称`
,d.team_name `责任分行`
,d.region_name `责任大区`

from

-- 房源宽表
(
select
house_id
,housedel_id
,resblock_id
,resblock_name
,hold_user_name
,hold_team_name
,hold_marketing_name
,bizcircle_name
from
dw.dw_allinfo_housedel_da
where
hold_region_name = '沪东事业部'
and housedel_status_code = 120011001
and del_type_code in (990001001,990001003)
and pt = '20181128000000'
)a

left join

-- 房屋表/楼栋表 主要是要building_id
(
select
house_id
,building_id -- 匹配entity_id
,resblock_id
from
dw.dw_house_house_da
where 
pt = '20181128000000'
-- and city_code = 3100000
)b
on a.house_id = b.house_id

left join

-- 组织机构表

(
select
entity_id  -- dw_house_building_da.building_id
,team_code
,case div_type_code
when 110030001 then '责任盘'
when 110030002 then '维护盘'
when 110030003 then '范围盘'
when 110030004 then '共享盘'
when 110030006 then '公盘'
when 110030007 then '非范围盘'
end as groupdiv_type
from dw.dw_house_groupdiv_da
where pt = '20181112000000' 
and is_valid = 1
and city_code = '310000'
and div_type_code='110030001'-----责任盘
)c on c.entity_id = b.building_id

left join

(
select 
org_level8_code as team_code
,org_level8_name as team_name
,org_level7_name as shop_name
,org_level5_name as region_name
,org_level4_name as buname
from dw.dw_hr_org_da
where pt = '20181112000000'
and is_valid = 1
and node_level = 8 
and org_level4_name  like '沪%'
-----and org_level5_name = '市中大区'
)d
 on d.team_code = c.team_code
