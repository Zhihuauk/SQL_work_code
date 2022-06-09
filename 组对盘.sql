select
	partname,
	areadrawname,
	estatename
from
	ods.ods_dooioodw_mapareadrawestate_da
WHERE
	partname = '金杨大区'
	and pt = concat(REGEXP_replace(date_add(CURRENT_DATE,-1),'-',''),'000000')

--  事业部,大区 ,店
SELECT
	region_name,
	marketing_name,
	team_name,
	team_code
from
	dw.dw_allinfo_agent_da
where
	pt = concat(regexp_replace(date_add(current_date,1),'-',''),'000000')
	
-- 组对盘
select
	team_code,
	case div_type_code when 110030001 then '责任盘'
	when 110030002 then '维护盘'
	when 110030003 then '范围盘'
	when 110030004 then '共享盘'
	when 110030006 then '公盘'
	else '其他' end as `盘类型`,
	case is_mkt_shares when 1 then '考核'
	when 0 then '不考核'
	when -1 then '未知'
	end as `是否考核`
from	
	dw.dw_house_groupdiv_da
where
	pt = concat(regexp_replace(date_add(current_date,1),'-',''),'000000')
