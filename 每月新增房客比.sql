------------------======时间分隔符-1======-------------------
select
上海链家,
1,    ---- 改月份
ky.hold_region_name,
ky.hold_marketing_name,
ky.hold_team_name,
ky.cnt_ky,
fy.cnt_fy
from
(
select 
	hold_region_name 
	,hold_marketing_name 
	,hold_team_name 
	,hold_team_code
	,count(custdel_id) cnt_ky
from 
	dw.dw_allinfo_custdel_da 
where 
	pt = 20190102000000
	and year(to_date(typing_time)) = 2018 
	and month(to_date(typing_time)) = 1 
	and hold_region_name  like '沪%事业部'
	and hold_marketing_name like '%大区'
	and hold_team_name like '%分行'
group by
	hold_region_name
	,hold_marketing_name
	,hold_team_name
	,hold_team_code
)ky

left join

(
select
	hold_region_name 
	,hold_marketing_name 
	,hold_team_name 
	,hold_team_code
	,count(housedel_id) cnt_fy
from
	dw.dw_allinfo_housedel_da
where
	pt = 20190102000000
	and year(to_date(listing_time)) = 2018 
	and month(to_date(listing_time)) = 1 
	and hold_region_name  like '沪%事业部'
	and hold_marketing_name like '%大区'
	and hold_team_name like '%分行'
	and del_type_code != 990001002    -- 排除租客
group by
	hold_region_name
	,hold_marketing_name
	,hold_team_name
	,hold_team_code
)fy
on ky.hold_team_code = fy.hold_team_code

------------------======时间分隔符-2======-------------------
union all

select
上海链家,
2,    ---- 改月份
ky.hold_region_name,
ky.hold_marketing_name,
ky.hold_team_name,
ky.cnt_ky,
fy.cnt_fy
from
(
select 
	hold_region_name 
	,hold_marketing_name 
	,hold_team_name 
	,hold_team_code
	,count(custdel_id) cnt_ky
from 
	dw.dw_allinfo_custdel_da 
where 
	pt = 20190102000000
	and year(to_date(typing_time)) = 2018 
	and month(to_date(typing_time)) = 2			------- 改时间
	and hold_region_name  like '沪%事业部'
	and hold_marketing_name like '%大区'
	and hold_team_name like '%分行'
group by
	hold_region_name
	,hold_marketing_name
	,hold_team_name
	,hold_team_code
)ky

left join

(
select
	hold_region_name 
	,hold_marketing_name 
	,hold_team_name 
	,hold_team_code
	,count(housedel_id) cnt_fy
from
	dw.dw_allinfo_housedel_da
where
	pt = 20190102000000
	and year(to_date(listing_time)) = 2018 
	and month(to_date(listing_time)) = 2 			------- 改时间
	and hold_region_name  like '沪%事业部'
	and hold_marketing_name like '%大区'
	and hold_team_name like '%分行'
	and del_type_code != 990001002    -- 排除租客
group by
	hold_region_name
	,hold_marketing_name
	,hold_team_name
	,hold_team_code
)fy
on ky.hold_team_code = fy.hold_team_code

------------------======时间分隔符-3======-------------------
union all

select
上海链家,
3,    ---- 改月份
ky.hold_region_name,
ky.hold_marketing_name,
ky.hold_team_name,
ky.cnt_ky,
fy.cnt_fy
from
(
select 
	hold_region_name 
	,hold_marketing_name 
	,hold_team_name 
	,hold_team_code
	,count(custdel_id) cnt_ky
from 
	dw.dw_allinfo_custdel_da 
where 
	pt = 20190102000000
	and year(to_date(typing_time)) = 2018 
	and month(to_date(typing_time)) = 3
	and hold_region_name  like '沪%事业部'
	and hold_marketing_name like '%大区'
	and hold_team_name like '%分行'
group by
	hold_region_name
	,hold_marketing_name
	,hold_team_name
	,hold_team_code
)ky

left join

(
select
	hold_region_name 
	,hold_marketing_name 
	,hold_team_name 
	,hold_team_code
	,count(housedel_id) cnt_fy
from
	dw.dw_allinfo_housedel_da
where
	pt = 20190102000000
	and year(to_date(listing_time)) = 2018 
	and month(to_date(listing_time)) = 3 
	and hold_region_name  like '沪%事业部'
	and hold_marketing_name like '%大区'
	and hold_team_name like '%分行'
	and del_type_code != 990001002    -- 排除租客
group by
	hold_region_name
	,hold_marketing_name
	,hold_team_name
	,hold_team_code
)fy
on ky.hold_team_code = fy.hold_team_code

------------------======时间分隔符-4======-------------------
union all

select
上海链家,
4,    ---- 改月份
ky.hold_region_name,
ky.hold_marketing_name,
ky.hold_team_name,
ky.cnt_ky,
fy.cnt_fy
from
(
select 
	hold_region_name 
	,hold_marketing_name 
	,hold_team_name 
	,hold_team_code
	,count(custdel_id) cnt_ky
from 
	dw.dw_allinfo_custdel_da 
where 
	pt = 20190102000000
	and year(to_date(typing_time)) = 2018 
	and month(to_date(typing_time)) = 4		------- 改时间
	and hold_region_name  like '沪%事业部'
	and hold_marketing_name like '%大区'
	and hold_team_name like '%分行'
group by
	hold_region_name
	,hold_marketing_name
	,hold_team_name
	,hold_team_code
)ky

left join

(
select
	hold_region_name 
	,hold_marketing_name 
	,hold_team_name 
	,hold_team_code
	,count(housedel_id) cnt_fy
from
	dw.dw_allinfo_housedel_da
where
	pt = 20190102000000
	and year(to_date(listing_time)) = 2018 
	and month(to_date(listing_time)) = 4 			------- 改时间
	and hold_region_name  like '沪%事业部'
	and hold_marketing_name like '%大区'
	and hold_team_name like '%分行'
	and del_type_code != 990001002    -- 排除租客
group by
	hold_region_name
	,hold_marketing_name
	,hold_team_name
	,hold_team_code
)fy
on ky.hold_team_code = fy.hold_team_code

------------------======时间分隔符-5======-------------------
union all

select
上海链家,
5,    ---- 改月份
ky.hold_region_name,
ky.hold_marketing_name,
ky.hold_team_name,
ky.cnt_ky,
fy.cnt_fy
from
(
select 
	hold_region_name 
	,hold_marketing_name 
	,hold_team_name 
	,hold_team_code
	,count(custdel_id) cnt_ky
from 
	dw.dw_allinfo_custdel_da 
where 
	pt = 20190102000000
	and year(to_date(typing_time)) = 2018 
	and month(to_date(typing_time)) = 4 
	and hold_region_name  like '沪%事业部'
	and hold_marketing_name like '%大区'
	and hold_team_name like '%分行'
group by
	hold_region_name
	,hold_marketing_name
	,hold_team_name
	,hold_team_code
)ky

left join

(
select
	hold_region_name 
	,hold_marketing_name 
	,hold_team_name 
	,hold_team_code
	,count(housedel_id) cnt_fy
from
	dw.dw_allinfo_housedel_da
where
	pt = 20190102000000
	and year(to_date(listing_time)) = 2018 
	and month(to_date(listing_time)) = 4 
	and hold_region_name  like '沪%事业部'
	and hold_marketing_name like '%大区'
	and hold_team_name like '%分行'
	and del_type_code != 990001002    -- 排除租客
group by
	hold_region_name
	,hold_marketing_name
	,hold_team_name
	,hold_team_code
)fy
on ky.hold_team_code = fy.hold_team_code

------------------======时间分隔符-5======-------------------
union all

select
上海链家,
5,    ---- 改月份
ky.hold_region_name,
ky.hold_marketing_name,
ky.hold_team_name,
ky.cnt_ky,
fy.cnt_fy
from
(
select 
	hold_region_name 
	,hold_marketing_name 
	,hold_team_name 
	,hold_team_code
	,count(custdel_id) cnt_ky
from 
	dw.dw_allinfo_custdel_da 
where 
	pt = 20190102000000
	and year(to_date(typing_time)) = 2018 
	and month(to_date(typing_time)) = 5			------- 改时间
	and hold_region_name  like '沪%事业部'
	and hold_marketing_name like '%大区'
	and hold_team_name like '%分行'
group by
	hold_region_name
	,hold_marketing_name
	,hold_team_name
	,hold_team_code
)ky

left join

(
select
	hold_region_name 
	,hold_marketing_name 
	,hold_team_name 
	,hold_team_code
	,count(housedel_id) cnt_fy
from
	dw.dw_allinfo_housedel_da
where
	pt = 20190102000000
	and year(to_date(listing_time)) = 2018 
	and month(to_date(listing_time)) = 5 			------- 改时间
	and hold_region_name  like '沪%事业部'
	and hold_marketing_name like '%大区'
	and hold_team_name like '%分行'
	and del_type_code != 990001002    -- 排除租客
group by
	hold_region_name
	,hold_marketing_name
	,hold_team_name
	,hold_team_code
)fy
on ky.hold_team_code = fy.hold_team_code

------------------======时间分隔符-3======-------------------
union all

------------------======时间分隔符-1======-------------------
select
上海链家,
1,    ---- 改月份
ky.hold_region_name,
ky.hold_marketing_name,
ky.hold_team_name,
ky.cnt_ky,
fy.cnt_fy
from
(
select 
	hold_region_name 
	,hold_marketing_name 
	,hold_team_name 
	,hold_team_code
	,count(custdel_id) cnt_ky
from 
	dw.dw_allinfo_custdel_da 
where 
	pt = 20190102000000
	and year(to_date(typing_time)) = 2018 
	and month(to_date(typing_time)) = 1 
	and hold_region_name  like '沪%事业部'
	and hold_marketing_name like '%大区'
	and hold_team_name like '%分行'
group by
	hold_region_name
	,hold_marketing_name
	,hold_team_name
	,hold_team_code
)ky

left join

(
select
	hold_region_name 
	,hold_marketing_name 
	,hold_team_name 
	,hold_team_code
	,count(housedel_id) cnt_fy
from
	dw.dw_allinfo_housedel_da
where
	pt = 20190102000000
	and year(to_date(listing_time)) = 2018 
	and month(to_date(listing_time)) = 1 
	and hold_region_name  like '沪%事业部'
	and hold_marketing_name like '%大区'
	and hold_team_name like '%分行'
	and del_type_code != 990001002    -- 排除租客
group by
	hold_region_name
	,hold_marketing_name
	,hold_team_name
	,hold_team_code
)fy
on ky.hold_team_code = fy.hold_team_code

------------------======时间分隔符-2======-------------------
union all

select
上海链家,
2,    ---- 改月份
ky.hold_region_name,
ky.hold_marketing_name,
ky.hold_team_name,
ky.cnt_ky,
fy.cnt_fy
from
(
select 
	hold_region_name 
	,hold_marketing_name 
	,hold_team_name 
	,hold_team_code
	,count(custdel_id) cnt_ky
from 
	dw.dw_allinfo_custdel_da 
where 
	pt = 20190102000000
	and year(to_date(typing_time)) = 2018 
	and month(to_date(typing_time)) = 2			------- 改时间
	and hold_region_name  like '沪%事业部'
	and hold_marketing_name like '%大区'
	and hold_team_name like '%分行'
group by
	hold_region_name
	,hold_marketing_name
	,hold_team_name
	,hold_team_code
)ky

left join

(
select
	hold_region_name 
	,hold_marketing_name 
	,hold_team_name 
	,hold_team_code
	,count(housedel_id) cnt_fy
from
	dw.dw_allinfo_housedel_da
where
	pt = 20190102000000
	and year(to_date(listing_time)) = 2018 
	and month(to_date(listing_time)) = 2 			------- 改时间
	and hold_region_name  like '沪%事业部'
	and hold_marketing_name like '%大区'
	and hold_team_name like '%分行'
	and del_type_code != 990001002    -- 排除租客
group by
	hold_region_name
	,hold_marketing_name
	,hold_team_name
	,hold_team_code
)fy
on ky.hold_team_code = fy.hold_team_code

------------------======时间分隔符-3======-------------------
union all

------------------======时间分隔符-1======-------------------
select
上海链家,
1,    ---- 改月份
ky.hold_region_name,
ky.hold_marketing_name,
ky.hold_team_name,
ky.cnt_ky,
fy.cnt_fy
from
(
select 
	hold_region_name 
	,hold_marketing_name 
	,hold_team_name 
	,hold_team_code
	,count(custdel_id) cnt_ky
from 
	dw.dw_allinfo_custdel_da 
where 
	pt = 20190102000000
	and year(to_date(typing_time)) = 2018 
	and month(to_date(typing_time)) = 1 
	and hold_region_name  like '沪%事业部'
	and hold_marketing_name like '%大区'
	and hold_team_name like '%分行'
group by
	hold_region_name
	,hold_marketing_name
	,hold_team_name
	,hold_team_code
)ky

left join

(
select
	hold_region_name 
	,hold_marketing_name 
	,hold_team_name 
	,hold_team_code
	,count(housedel_id) cnt_fy
from
	dw.dw_allinfo_housedel_da
where
	pt = 20190102000000
	and year(to_date(listing_time)) = 2018 
	and month(to_date(listing_time)) = 1 
	and hold_region_name  like '沪%事业部'
	and hold_marketing_name like '%大区'
	and hold_team_name like '%分行'
	and del_type_code != 990001002    -- 排除租客
group by
	hold_region_name
	,hold_marketing_name
	,hold_team_name
	,hold_team_code
)fy
on ky.hold_team_code = fy.hold_team_code

------------------======时间分隔符-2======-------------------
union all

select
上海链家,
2,    ---- 改月份
ky.hold_region_name,
ky.hold_marketing_name,
ky.hold_team_name,
ky.cnt_ky,
fy.cnt_fy
from
(
select 
	hold_region_name 
	,hold_marketing_name 
	,hold_team_name 
	,hold_team_code
	,count(custdel_id) cnt_ky
from 
	dw.dw_allinfo_custdel_da 
where 
	pt = 20190102000000
	and year(to_date(typing_time)) = 2018 
	and month(to_date(typing_time)) = 2			------- 改时间
	and hold_region_name  like '沪%事业部'
	and hold_marketing_name like '%大区'
	and hold_team_name like '%分行'
group by
	hold_region_name
	,hold_marketing_name
	,hold_team_name
	,hold_team_code
)ky

left join

(
select
	hold_region_name 
	,hold_marketing_name 
	,hold_team_name 
	,hold_team_code
	,count(housedel_id) cnt_fy
from
	dw.dw_allinfo_housedel_da
where
	pt = 20190102000000
	and year(to_date(listing_time)) = 2018 
	and month(to_date(listing_time)) = 2 			------- 改时间
	and hold_region_name  like '沪%事业部'
	and hold_marketing_name like '%大区'
	and hold_team_name like '%分行'
	and del_type_code != 990001002    -- 排除租客
group by
	hold_region_name
	,hold_marketing_name
	,hold_team_name
	,hold_team_code
)fy
on ky.hold_team_code = fy.hold_team_code

------------------======时间分隔符-3======-------------------
union all

------------------======时间分隔符-1======-------------------
select
上海链家,
1,    ---- 改月份
ky.hold_region_name,
ky.hold_marketing_name,
ky.hold_team_name,
ky.cnt_ky,
fy.cnt_fy
from
(
select 
	hold_region_name 
	,hold_marketing_name 
	,hold_team_name 
	,hold_team_code
	,count(custdel_id) cnt_ky
from 
	dw.dw_allinfo_custdel_da 
where 
	pt = 20190102000000
	and year(to_date(typing_time)) = 2018 
	and month(to_date(typing_time)) = 1 
	and hold_region_name  like '沪%事业部'
	and hold_marketing_name like '%大区'
	and hold_team_name like '%分行'
group by
	hold_region_name
	,hold_marketing_name
	,hold_team_name
	,hold_team_code
)ky

left join

(
select
	hold_region_name 
	,hold_marketing_name 
	,hold_team_name 
	,hold_team_code
	,count(housedel_id) cnt_fy
from
	dw.dw_allinfo_housedel_da
where
	pt = 20190102000000
	and year(to_date(listing_time)) = 2018 
	and month(to_date(listing_time)) = 1 
	and hold_region_name  like '沪%事业部'
	and hold_marketing_name like '%大区'
	and hold_team_name like '%分行'
	and del_type_code != 990001002    -- 排除租客
group by
	hold_region_name
	,hold_marketing_name
	,hold_team_name
	,hold_team_code
)fy
on ky.hold_team_code = fy.hold_team_code

------------------======时间分隔符-2======-------------------
union all

select
上海链家,
2,    ---- 改月份
ky.hold_region_name,
ky.hold_marketing_name,
ky.hold_team_name,
ky.cnt_ky,
fy.cnt_fy
from
(
select 
	hold_region_name 
	,hold_marketing_name 
	,hold_team_name 
	,hold_team_code
	,count(custdel_id) cnt_ky
from 
	dw.dw_allinfo_custdel_da 
where 
	pt = 20190102000000
	and year(to_date(typing_time)) = 2018 
	and month(to_date(typing_time)) = 2			------- 改时间
	and hold_region_name  like '沪%事业部'
	and hold_marketing_name like '%大区'
	and hold_team_name like '%分行'
group by
	hold_region_name
	,hold_marketing_name
	,hold_team_name
	,hold_team_code
)ky

left join

(
select
	hold_region_name 
	,hold_marketing_name 
	,hold_team_name 
	,hold_team_code
	,count(housedel_id) cnt_fy
from
	dw.dw_allinfo_housedel_da
where
	pt = 20190102000000
	and year(to_date(listing_time)) = 2018 
	and month(to_date(listing_time)) = 2 			------- 改时间
	and hold_region_name  like '沪%事业部'
	and hold_marketing_name like '%大区'
	and hold_team_name like '%分行'
	and del_type_code != 990001002    -- 排除租客
group by
	hold_region_name
	,hold_marketing_name
	,hold_team_name
	,hold_team_code
)fy
on ky.hold_team_code = fy.hold_team_code

------------------======时间分隔符-3======-------------------
union all


