# 每月新增带看

#二手
(
select 
		substr(showing_start_time,1,7),
		agent_marketing_name,
		count(distinct showing_id) maimai_showing_cnt
from 
	dw.dw_allinfo_evt_showing_da
where 
	pt=20190106000000
	and is_valid = 1
	and to_date(showing_start_time) between '2018-01-01' and '2018-12-31'
	and agent_region_name like '沪%'
	and del_type = '买卖'
group by 
	agent_marketing_name,
	substr(showing_start_time,1,7)
)es
# 新房
select  
		substr(t2.stat_date,1,6)`month`,
		region_name
		,marketing_name
-- 		,team_name
		,sum(t2.showing_cnt) `新房带看`
-- 		,count(distinct t2.user_code) `新房带看人数`
from
(
select distinct region_name
	,marketing_name
	,team_name
	,employee_no
	,uc_job_name
from dw.dw_allinfo_agent_da
where pt=20190106000000    
and region_name like '沪%'
) t1

inner join

(
 select 
	stat_date,
	user_code,
	sum(showing_cnt) showing_cnt
from olap.olap_sh_work_agent_di
where pt between 20180101 and 20181231
and biz_type = '1000000000003'
group by 
	user_code,
	stat_date
) t2
on t1.employee_no = t2.user_code

group by region_name
	,marketing_name
-- 	,team_name
	,substr(t2.stat_date,1,6)