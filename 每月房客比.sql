-- 时间分隔 2019-01-06
-- 时间分隔 2019-01-06
select
fy.year,
fy.month,
fy.hold_region_name,
fy.hold_marketing_name,
fy.hold_team_name,
fy.cnt_fy,
ky.cnt_ky
from
(
select
substr(pt,0,4) `year`,
substr(pt,5,2) `month`,
hold_region_name,
hold_marketing_name,
hold_team_name,
hold_team_code,
pt,
count(housedel_id) `cnt_fy`
from dw.dw_allinfo_housedel_da
where 
pt between '20180101' and '20181231'
and housedel_status_code = 120011001
and del_type_code != 990001002
group by
hold_region_name,
hold_marketing_name,
hold_team_name,
hold_team_code,
pt
)fy

left join

(
select
substr(pt,0,4) `year`,
substr(pt,5,2) `month`,
hold_region_name,
hold_marketing_name,
hold_team_name,
hold_team_code,
pt,
count(custdel_id) `cnt_ky`
from dw.dw_allinfo_custdel_da
where 
pt = 20190106000000
and del_type_code in ('990001001','990001003')
and status_code in ('140101001')
AND hold_is_serving = 1
-- and int(substr(pt,0,4)) > 2018
group by
hold_region_name,
hold_marketing_name,
hold_team_name,
hold_team_code,
pt
)ky
on fy.hold_team_name = ky.hold_team_name

union all

-- 时间分隔 2018-01-01
select
fy.year,
fy.month,
fy.hold_region_name,
fy.hold_marketing_name,
fy.hold_team_name,
fy.cnt_fy,
ky.cnt_ky
from
(
select
substr(pt,0,4) `year`,
substr(pt,5,2) `month`,
hold_region_name,
hold_marketing_name,
hold_team_name,
hold_team_code,
pt,
count(housedel_id) `cnt_fy`
from dw.dw_allinfo_housedel_da
where 
pt = 20180101000000
and housedel_status_code = 120011001
and del_type_code != 990001002
group by
hold_region_name,
hold_marketing_name,
hold_team_name,
hold_team_code,
pt
)fy

left join

(
select
substr(pt,0,4) `year`,
substr(pt,5,2) `month`,
hold_region_name,
hold_marketing_name,
hold_team_name,
hold_team_code,
pt,
count(custdel_id) `cnt_ky`
from dw.dw_allinfo_custdel_da
where 
pt = 20180101000000
and del_type_code in ('990001001','990001003')
and status_code in ('140101001')
AND hold_is_serving = 1
-- and int(substr(pt,0,4)) > 2018
group by
hold_region_name,
hold_marketing_name,
hold_team_name,
hold_team_code,
pt
)ky
on fy.hold_team_name = ky.hold_team_name

union all


-- 时间分隔 2018-02-01
select
fy.year,
fy.month,
fy.hold_region_name,
fy.hold_marketing_name,
fy.hold_team_name,
fy.cnt_fy,
ky.cnt_ky
from
(
select
substr(pt,0,4) `year`,
substr(pt,5,2) `month`,
hold_region_name,
hold_marketing_name,
hold_team_name,
hold_team_code,
pt,
count(housedel_id) `cnt_fy`
from dw.dw_allinfo_housedel_da
where 
pt = 20180201000000
and housedel_status_code = 120011001
and del_type_code != 990001002
group by
hold_region_name,
hold_marketing_name,
hold_team_name,
hold_team_code,
pt
)fy

left join

(
select
substr(pt,0,4) `year`,
substr(pt,5,2) `month`,
hold_region_name,
hold_marketing_name,
hold_team_name,
hold_team_code,
pt,
count(custdel_id) `cnt_ky`
from dw.dw_allinfo_custdel_da
where 
pt = 20180201000000
and del_type_code in ('990001001','990001003')
and status_code in ('140101001')
AND hold_is_serving = 1
-- and int(substr(pt,0,4)) > 2018
group by
hold_region_name,
hold_marketing_name,
hold_team_name,
hold_team_code,
pt
)ky
on fy.hold_team_name = ky.hold_team_name

union all


-- 时间分隔 2018-03-01
select
fy.year,
fy.month,
fy.hold_region_name,
fy.hold_marketing_name,
fy.hold_team_name,
fy.cnt_fy,
ky.cnt_ky
from
(
select
substr(pt,0,4) `year`,
substr(pt,5,2) `month`,
hold_region_name,
hold_marketing_name,
hold_team_name,
hold_team_code,
pt,
count(housedel_id) `cnt_fy`
from dw.dw_allinfo_housedel_da
where 
pt = 20180301000000
and housedel_status_code = 120011001
and del_type_code != 990001002
group by
hold_region_name,
hold_marketing_name,
hold_team_name,
hold_team_code,
pt
)fy

left join

(
select
substr(pt,0,4) `year`,
substr(pt,5,2) `month`,
hold_region_name,
hold_marketing_name,
hold_team_name,
hold_team_code,
pt,
count(custdel_id) `cnt_ky`
from dw.dw_allinfo_custdel_da
where 
pt = 20180301000000
and del_type_code in ('990001001','990001003')
and status_code in ('140101001')
AND hold_is_serving = 1
-- and int(substr(pt,0,4)) > 2018
group by
hold_region_name,
hold_marketing_name,
hold_team_name,
hold_team_code,
pt
)ky
on fy.hold_team_name = ky.hold_team_name


union all


-- 时间分隔 20180401000000
select
fy.year,
fy.month,
fy.hold_region_name,
fy.hold_marketing_name,
fy.hold_team_name,
fy.cnt_fy,
ky.cnt_ky
from
(
select
substr(pt,0,4) `year`,
substr(pt,5,2) `month`,
hold_region_name,
hold_marketing_name,
hold_team_name,
hold_team_code,
pt,
count(housedel_id) `cnt_fy`
from dw.dw_allinfo_housedel_da
where 
pt = 20180401000000
and housedel_status_code = 120011001
and del_type_code != 990001002
group by
hold_region_name,
hold_marketing_name,
hold_team_name,
hold_team_code,
pt
)fy

left join

(
select
substr(pt,0,4) `year`,
substr(pt,5,2) `month`,
hold_region_name,
hold_marketing_name,
hold_team_name,
hold_team_code,
pt,
count(custdel_id) `cnt_ky`
from dw.dw_allinfo_custdel_da
where 
pt = 20180401000000
and del_type_code in ('990001001','990001003')
and status_code in ('140101001')
AND hold_is_serving = 1
-- and int(substr(pt,0,4)) > 2018
group by
hold_region_name,
hold_marketing_name,
hold_team_name,
hold_team_code,
pt
)ky
on fy.hold_team_name = ky.hold_team_name

union all


-- 时间分隔 20180501000000
select
fy.year,
fy.month,
fy.hold_region_name,
fy.hold_marketing_name,
fy.hold_team_name,
fy.cnt_fy,
ky.cnt_ky
from
(
select
substr(pt,0,4) `year`,
substr(pt,5,2) `month`,
hold_region_name,
hold_marketing_name,
hold_team_name,
hold_team_code,
pt,
count(housedel_id) `cnt_fy`
from dw.dw_allinfo_housedel_da
where 
pt = 20180501000000
and housedel_status_code = 120011001
and del_type_code != 990001002
group by
hold_region_name,
hold_marketing_name,
hold_team_name,
hold_team_code,
pt
)fy

left join

(
select
substr(pt,0,4) `year`,
substr(pt,5,2) `month`,
hold_region_name,
hold_marketing_name,
hold_team_name,
hold_team_code,
pt,
count(custdel_id) `cnt_ky`
from dw.dw_allinfo_custdel_da
where 
pt = 20180501000000
and del_type_code in ('990001001','990001003')
and status_code in ('140101001')
AND hold_is_serving = 1
-- and int(substr(pt,0,4)) > 2018
group by
hold_region_name,
hold_marketing_name,
hold_team_name,
hold_team_code,
pt
)ky
on fy.hold_team_name = ky.hold_team_name

union all


-- 时间分隔 20180601000000
select
fy.year,
fy.month,
fy.hold_region_name,
fy.hold_marketing_name,
fy.hold_team_name,
fy.cnt_fy,
ky.cnt_ky
from
(
select
substr(pt,0,4) `year`,
substr(pt,5,2) `month`,
hold_region_name,
hold_marketing_name,
hold_team_name,
hold_team_code,
pt,
count(housedel_id) `cnt_fy`
from dw.dw_allinfo_housedel_da
where 
pt = 20180601000000
and housedel_status_code = 120011001
and del_type_code != 990001002
group by
hold_region_name,
hold_marketing_name,
hold_team_name,
hold_team_code,
pt
)fy

left join

(
select
substr(pt,0,4) `year`,
substr(pt,5,2) `month`,
hold_region_name,
hold_marketing_name,
hold_team_name,
hold_team_code,
pt,
count(custdel_id) `cnt_ky`
from dw.dw_allinfo_custdel_da
where 
pt = 20180601000000
and del_type_code in ('990001001','990001003')
and status_code in ('140101001')
AND hold_is_serving = 1
-- and int(substr(pt,0,4)) > 2018
group by
hold_region_name,
hold_marketing_name,
hold_team_name,
hold_team_code,
pt
)ky
on fy.hold_team_name = ky.hold_team_name

union all


-- 时间分隔 20180701000000
select
fy.year,
fy.month,
fy.hold_region_name,
fy.hold_marketing_name,
fy.hold_team_name,
fy.cnt_fy,
ky.cnt_ky
from
(
select
substr(pt,0,4) `year`,
substr(pt,5,2) `month`,
hold_region_name,
hold_marketing_name,
hold_team_name,
hold_team_code,
pt,
count(housedel_id) `cnt_fy`
from dw.dw_allinfo_housedel_da
where 
pt = 20180701000000
and housedel_status_code = 120011001
and del_type_code != 990001002
group by
hold_region_name,
hold_marketing_name,
hold_team_name,
hold_team_code,
pt
)fy

left join

(
select
substr(pt,0,4) `year`,
substr(pt,5,2) `month`,
hold_region_name,
hold_marketing_name,
hold_team_name,
hold_team_code,
pt,
count(custdel_id) `cnt_ky`
from dw.dw_allinfo_custdel_da
where 
pt = 20180701000000
and del_type_code in ('990001001','990001003')
and status_code in ('140101001')
AND hold_is_serving = 1
-- and int(substr(pt,0,4)) > 2018
group by
hold_region_name,
hold_marketing_name,
hold_team_name,
hold_team_code,
pt
)ky
on fy.hold_team_name = ky.hold_team_name

union all


-- 时间分隔 20180801000000
select
fy.year,
fy.month,
fy.hold_region_name,
fy.hold_marketing_name,
fy.hold_team_name,
fy.cnt_fy,
ky.cnt_ky
from
(
select
substr(pt,0,4) `year`,
substr(pt,5,2) `month`,
hold_region_name,
hold_marketing_name,
hold_team_name,
hold_team_code,
pt,
count(housedel_id) `cnt_fy`
from dw.dw_allinfo_housedel_da
where 
pt = 20180801000000
and housedel_status_code = 120011001
and del_type_code != 990001002
group by
hold_region_name,
hold_marketing_name,
hold_team_name,
hold_team_code,
pt
)fy

left join

(
select
substr(pt,0,4) `year`,
substr(pt,5,2) `month`,
hold_region_name,
hold_marketing_name,
hold_team_name,
hold_team_code,
pt,
count(custdel_id) `cnt_ky`
from dw.dw_allinfo_custdel_da
where 
pt = 20180801000000
and del_type_code in ('990001001','990001003')
and status_code in ('140101001')
AND hold_is_serving = 1
-- and int(substr(pt,0,4)) > 2018
group by
hold_region_name,
hold_marketing_name,
hold_team_name,
hold_team_code,
pt
)ky
on fy.hold_team_name = ky.hold_team_name

union all


-- 时间分隔 201820180901000000
select
fy.year,
fy.month,
fy.hold_region_name,
fy.hold_marketing_name,
fy.hold_team_name,
fy.cnt_fy,
ky.cnt_ky
from
(
select
substr(pt,0,4) `year`,
substr(pt,5,2) `month`,
hold_region_name,
hold_marketing_name,
hold_team_name,
hold_team_code,
pt,
count(housedel_id) `cnt_fy`
from dw.dw_allinfo_housedel_da
where 
pt = 20180901000000
and housedel_status_code = 120011001
and del_type_code != 990001002
group by
hold_region_name,
hold_marketing_name,
hold_team_name,
hold_team_code,
pt
)fy

left join

(
select
substr(pt,0,4) `year`,
substr(pt,5,2) `month`,
hold_region_name,
hold_marketing_name,
hold_team_name,
hold_team_code,
pt,
count(custdel_id) `cnt_ky`
from dw.dw_allinfo_custdel_da
where 
pt = 20180901000000
and del_type_code in ('990001001','990001003')
and status_code in ('140101001')
AND hold_is_serving = 1
-- and int(substr(pt,0,4)) > 2018
group by
hold_region_name,
hold_marketing_name,
hold_team_name,
hold_team_code,
pt
)ky
on fy.hold_team_name = ky.hold_team_name

union all


-- 时间分隔 20181001000000
select
fy.year,
fy.month,
fy.hold_region_name,
fy.hold_marketing_name,
fy.hold_team_name,
fy.cnt_fy,
ky.cnt_ky
from
(
select
substr(pt,0,4) `year`,
substr(pt,5,2) `month`,
hold_region_name,
hold_marketing_name,
hold_team_name,
hold_team_code,
pt,
count(housedel_id) `cnt_fy`
from dw.dw_allinfo_housedel_da
where 
pt = 20181001000000
and housedel_status_code = 120011001
and del_type_code != 990001002
group by
hold_region_name,
hold_marketing_name,
hold_team_name,
hold_team_code,
pt
)fy

left join

(
select
substr(pt,0,4) `year`,
substr(pt,5,2) `month`,
hold_region_name,
hold_marketing_name,
hold_team_name,
hold_team_code,
pt,
count(custdel_id) `cnt_ky`
from dw.dw_allinfo_custdel_da
where 
pt = 20181001000000
and del_type_code in ('990001001','990001003')
and status_code in ('140101001')
AND hold_is_serving = 1
-- and int(substr(pt,0,4)) > 2018
group by
hold_region_name,
hold_marketing_name,
hold_team_name,
hold_team_code,
pt
)ky
on fy.hold_team_name = ky.hold_team_name

union all


-- 时间分隔 20181101000000
select
fy.year,
fy.month,
fy.hold_region_name,
fy.hold_marketing_name,
fy.hold_team_name,
fy.cnt_fy,
ky.cnt_ky
from
(
select
substr(pt,0,4) `year`,
substr(pt,5,2) `month`,
hold_region_name,
hold_marketing_name,
hold_team_name,
hold_team_code,
pt,
count(housedel_id) `cnt_fy`
from dw.dw_allinfo_housedel_da
where 
pt = 20181101000000
and housedel_status_code = 120011001
and del_type_code != 990001002
group by
hold_region_name,
hold_marketing_name,
hold_team_name,
hold_team_code,
pt
)fy

left join

(
select
substr(pt,0,4) `year`,
substr(pt,5,2) `month`,
hold_region_name,
hold_marketing_name,
hold_team_name,
hold_team_code,
pt,
count(custdel_id) `cnt_ky`
from dw.dw_allinfo_custdel_da
where 
pt = 20181101000000
and del_type_code in ('990001001','990001003')
and status_code in ('140101001')
AND hold_is_serving = 1
-- and int(substr(pt,0,4)) > 2018
group by
hold_region_name,
hold_marketing_name,
hold_team_name,
hold_team_code,
pt
)ky
on fy.hold_team_name = ky.hold_team_name

union all


-- 时间分隔 20181201000000
select
fy.year,
fy.month,
fy.hold_region_name,
fy.hold_marketing_name,
fy.hold_team_name,
fy.cnt_fy,
ky.cnt_ky
from
(
select
substr(pt,0,4) `year`,
substr(pt,5,2) `month`,
hold_region_name,
hold_marketing_name,
hold_team_name,
hold_team_code,
pt,
count(housedel_id) `cnt_fy`
from dw.dw_allinfo_housedel_da
where 
pt = 20181201000000
and housedel_status_code = 120011001
and del_type_code != 990001002
group by
hold_region_name,
hold_marketing_name,
hold_team_name,
hold_team_code,
pt
)fy

left join

(
select
substr(pt,0,4) `year`,
substr(pt,5,2) `month`,
hold_region_name,
hold_marketing_name,
hold_team_name,
hold_team_code,
pt,
count(custdel_id) `cnt_ky`
from dw.dw_allinfo_custdel_da
where 
pt = 20181201000000
and del_type_code in ('990001001','990001003')
and status_code in ('140101001')
AND hold_is_serving = 1
-- and int(substr(pt,0,4)) > 2018
group by
hold_region_name,
hold_marketing_name,
hold_team_name,
hold_team_code,
pt
)ky
on fy.hold_team_name = ky.hold_team_name