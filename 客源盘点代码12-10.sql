select
ky.custdel_id `客源编号`
,ky.typing_region_name `事业部`
,ky.typing_marketing_name`大区`
,ky.typing_team_name`店组`
,ky.typing_user_name`经纪人`
,substr(ky.typing_ucid,9)`工号`
,ky.custdel_name `客源姓名`
,ky.status_desc `客源状态`
,ky.del_time`录入时间`
,ky.register_source`注册来源`
,ky.first_del_source_name `一级委托渠道`
,ky.second_del_source_name `二级委托渠道`
,ky.remark_times`被注次数`
,ky.last_remark_time`最新备注时间`
,ky.will_strength`意愿强弱`
,nvl(dk.showing_id,0)`近两周客户看量`
,nvl(dk.showing_housedel_cnt,0)`近两周客户看房总量`
,nvl(dk.max_showing_create_time,"无带看")`最近一次带看时间`
,nvl(dk.min_showing_create_time,"无带看")`第一次带看时间`
-- ,fw.price`价格段`
-- ,fw.area`面积段`
-- ,fw.payment`首付段`
-- ,fw.month_payment`月供段`
-- ,jd.is_jd `是否有解读`
-- ,lm.broker_uid `发起共享对象`
-- ,lm.status `状态值`
,nvl(lm.created_time,0) `发起合作联盟时间`
-- ,lm.message
,nvl(lm.build_time,0) `合作联盟建立时间`
,nvl(dk1.showing_id,0) `总带看量`
,jd.is_jd `是否有解读`
,ky.invalid_time `无效时间`
,ky.invalid_ucid `无效经纪人`
from
-- 客源'
(
select
custdel_id
,custdel_name
,typing_region_name
,typing_marketing_name
,typing_team_name
,typing_user_name
,typing_ucid
,del_type_code
,del_time
,first_del_source_name
,second_del_source_name
,register_source
,remark_times
,max(last_remark_time) `last_remark_time`
,case  will_strength when "强" then "三星" when "中" then "二星" when "弱" then "一星" else "无" end as `will_strength`
,telephone1
,status_desc
,invalid_time
,invalid_ucid
from dw.dw_allinfo_custdel_da
where typing_region_name = '沪东事业部'
and pt = '20181205000000'
and del_type_code in ('990001001','990001003')
and status_code in ('140101001')
AND hold_is_serving = 1
--- AND ((to_date(del_time) BETWEEN '2018-11-21' AND '2018-12-05') and status_code = '140101003')
group by
custdel_id
,typing_region_name
,typing_marketing_name
,typing_team_name
,typing_user_name
,typing_ucid
,del_type_code
,del_time
,first_del_source_name
,second_del_source_name
,register_source
,remark_times
,will_strength
,telephone1
,custdel_name
,status_desc
,invalid_time
,invalid_ucid
)ky


left join

-- 客源解读

(
select
DISTINCT custdel_id
,case when jd1.bhv_type is not null then 1 else 0 end is_jd
from
	(
	select
	custdel_id
	,telephone1
	from dw.dw_allinfo_custdel_da
	where typing_region_name = '沪东事业部'
	and pt = '20181205000000'
	and del_type_code in ('990001001','990001003')
	and status_code = '140101001'
	)ky1
	left join
	(
	select
	customer_phone
	,bhv_type
	,MAX(track_time) track_time
	from rpt.rpt_nh_customer_trail_second_online_detail_da
	where 
	pt = '20181205000000'
	and city_id = '310000'
	GROUP BY
	customer_phone
	,bhv_type
	)jd1
	on ky1.telephone1 = jd1.customer_phone
)jd
on ky.custdel_id = jd.custdel_id

-- 过去两周带看

left join

(
select
custdel_id
,count(showing_id) `showing_id`
,sum(showing_housedel_cnt) `showing_housedel_cnt`
,MAX(showing_create_time) `max_showing_create_time`
,MIN(showing_create_time) `min_showing_create_time`
from
dw.dw_allinfo_evt_showing_da
where
pt = '20181205000000'
and del_type_code in (990001001,990001003)
and to_date(showing_create_time) BETWEEN '2018-11-21' AND '2018-12-05'
group BY
custdel_id
ORDER BY
custdel_id
)dk
on dk.custdel_id = ky.custdel_id

--  合作联盟 ----
left join
(
select
customer_id
,max(created_time)`created_time`
,max(build_time)`build_time`
-- ,broker_uid  -- 一个客户可能会被共享多次,所以这个字段不用,只取最新一次
-- ,status --原因同上(状态值有多个)
-- ,message
from
rpt.rpt_cust_post_cooperation_da
where pt = '20181205000000'
group by
customer_id
-- ,status
-- ,message
)lm
on lm.customer_id = ky.custdel_id

-- 总带看量
left join
(
select
custdel_id
,count(showing_id) `showing_id`
,sum(showing_housedel_cnt) `showing_housedel_cnt`
from
dw.dw_allinfo_evt_showing_da
where
pt = '20181205000000'
and del_type_code in (990001001,990001003)
group BY
custdel_id
ORDER BY
custdel_id
)dk1
on dk1.custdel_id = ky.custdel_id


union all

select
ky.custdel_id `客源编号`
,ky.typing_region_name `事业部`
,ky.typing_marketing_name`大区`
,ky.typing_team_name`店组`
,ky.typing_user_name`经纪人`
,substr(ky.typing_ucid,9)`工号`
,ky.custdel_name `客源姓名`
,ky.status_desc `客源状态`
,ky.del_time`录入时间`
,ky.register_source`注册来源`
,ky.first_del_source_name `一级委托渠道`
,ky.second_del_source_name `二级委托渠道`
,ky.remark_times`被注次数`
,ky.last_remark_time`最新备注时间`
,ky.will_strength`意愿强弱`
,nvl(dk.showing_id,0)`近两周客户看量`
,nvl(dk.showing_housedel_cnt,0)`近两周客户看房总量`
,nvl(dk.max_showing_create_time,"无带看")`最近一次带看时间`
,nvl(dk.min_showing_create_time,"无带看")`第一次带看时间`
-- ,fw.price`价格段`
-- ,fw.area`面积段`
-- ,fw.payment`首付段`
-- ,fw.month_payment`月供段`
-- ,jd.is_jd `是否有解读`
-- ,lm.broker_uid `发起共享对象`
-- ,lm.status `状态值`
,lm.created_time `发起合作联盟时间`
-- ,lm.message
,lm.build_time `合作联盟建立时间`
,dk1.showing_id `总带看量`
,jd.is_jd `是否有解读`
,ky.invalid_time `无效时间`
 ,ky.invalid_ucid `无效经纪人`
from
-- 客源'
(
select
custdel_id
,custdel_name
,typing_region_name
,typing_marketing_name
,typing_team_name
,typing_user_name
,typing_ucid
,del_type_code
,del_time
,first_del_source_name
,second_del_source_name
,register_source
,remark_times
,max(last_remark_time) `last_remark_time`
,case  will_strength when "强" then "三星" when "中" then "二星" when "弱" then "一星" else "无" end as `will_strength`
,telephone1
,status_desc
,invalid_time
,invalid_ucid
from dw.dw_allinfo_custdel_da
where typing_region_name = '沪东事业部'
and pt = '20181205000000'
and del_type_code in ('990001001','990001003')
-- and status_code in ('140101003')
AND hold_is_serving = 1
AND ((to_date(del_time) BETWEEN '2018-11-21' AND '2018-12-05') and status_code = '140101003')
group by
custdel_id
,typing_region_name
,typing_marketing_name
,typing_team_name
,typing_user_name
,typing_ucid
,del_type_code
,del_time
,first_del_source_name
,second_del_source_name
,register_source
,remark_times
,will_strength
,telephone1
,custdel_name
,status_desc
,invalid_time
,invalid_ucid
)ky

left join

-- 客源解读

(
select
DISTINCT custdel_id
,case when jd1.bhv_type is not null then 1 else 0 end is_jd
from
	(
	select
	custdel_id
	,telephone1
	from dw.dw_allinfo_custdel_da
	where typing_region_name = '沪东事业部'
	and pt = '20181205000000'
	and del_type_code in ('990001001','990001003')
	and status_code = '140101003'
	)ky1
	left join
	(
	select
	customer_phone
	,bhv_type
	,MAX(track_time) track_time
	from rpt.rpt_nh_customer_trail_second_online_detail_da
	where 
	pt = '20181205000000'
	and city_id = '310000'
	GROUP BY
	customer_phone
	,bhv_type
	)jd1
	on ky1.telephone1 = jd1.customer_phone
)jd
on ky.custdel_id = jd.custdel_id

-- 过去两周带看

left join

(
select
custdel_id
,count(showing_id) `showing_id`
,sum(showing_housedel_cnt) `showing_housedel_cnt`
,MAX(showing_create_time) `max_showing_create_time`
,MIN(showing_create_time) `min_showing_create_time`
from
dw.dw_allinfo_evt_showing_da
where
pt = '20181205000000'
and del_type_code in (990001001,990001003)
and to_date(showing_create_time) BETWEEN '2018-11-21' AND '2018-12-05'
group BY
custdel_id
ORDER BY
custdel_id
)dk
on dk.custdel_id = ky.custdel_id

--  合作联盟 ----
left join
(
select
customer_id
,max(created_time)`created_time`
,max(build_time)`build_time`
-- ,broker_uid  -- 一个客户可能会被共享多次,所以这个字段不用,只取最新一次
-- ,status --原因同上(状态值有多个)
-- ,message
from
rpt.rpt_cust_post_cooperation_da
where pt = '20181205000000'
group by
customer_id
-- ,status
-- ,message
)lm
on lm.customer_id = ky.custdel_id

-- 总带看量
left join
(
select
custdel_id
,count(showing_id) `showing_id`
,sum(showing_housedel_cnt) `showing_housedel_cnt`
from
dw.dw_allinfo_evt_showing_da
where
pt = '20181205000000'
and del_type_code in (990001001,990001003)
group BY
custdel_id
ORDER BY
custdel_id
)dk1
on dk1.custdel_id = ky.custdel_id
