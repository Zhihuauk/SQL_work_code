select
	ky.month , 
	ky.hold_region_name,
	ky.hold_marketing_name,
	ky.hold_team_name,
	ky.cnt_ky,
	fy.cnt_fy
from
(
select
	substr(typing_time,1,7) `month`
	,hold_region_name
    ,hold_marketing_name
    ,hold_team_name
	,hold_team_code
	,count(distinct telephone1) cnt_ky		-- 客源新增,要看公司/市场,用手机;要看店层级用客源编号,或者是不去重
from
	dw.dw_allinfo_custdel_da
where
	 pt =concat(regexp_replace(date_add(current_date,-1),'-',''),'000000')
     and to_date(typing_time) between '2018-01-01' and '2018-12-31'
	 and hold_region_name  like '沪%事业部'
	 and hold_marketing_name like '%大区'
	 and hold_team_name like '%分行'
	 and del_type_code != 990001002    -- 排除租客
GROUP BY
	 substr(typing_time,1,7) 
	,hold_region_name
    ,hold_marketing_name
    ,hold_team_name
	,hold_team_code
)ky

left join

(
SELECT 
	substr(listing_time,1,7) `month`
	,hold_region_name
    ,hold_marketing_name
    ,hold_team_name
	,hold_team_code
	,count(distinct housedel_id) cnt_fy
from 
	dw.dw_allinfo_housedel_da
where
   pt =concat(regexp_replace(date_add(current_date,-1),'-',''),'000000')
   and to_date(listing_time) between '2018-01-01' and '2018-12-31'
   and hold_region_name  like '沪%事业部'
   and hold_marketing_name like '%大区'
   and hold_team_name like '%分行'
   and del_type_code != 990001002  
group  by 
	substr(listing_time,1,7)
    ,hold_region_name
	,hold_marketing_name
	,hold_team_name
    ,hold_team_code
 )fy
 on 
	ky.hold_team_code = fy.hold_team_code
	and ky.month = fy.month