(
select
partname,
branchname,
count(branchid) `人店数`
from
ods.ods_dooioodw_dimemp_da
where
buname like '沪东%'
and pt = 20190213000000
and statetag in(2,8)
and rolename='经纪人'
)rs

(
select
hold_region_name,
hold_marketing_name,
hold_team_name,
hold_user_name,
count(case when)

from 
dw.dw_allinfo_housedel_da

)fy