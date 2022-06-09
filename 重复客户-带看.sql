select
ck.custdel_id `客原编码`,
ck.telephone1 `客户手机`,
ck.del_type `委托类型`,
ck.typing_time`委托时间`,
ck.first_del_source_name`一级来源`,
ck.second_del_source_name`二级来源`,
ck.hold_ucid`维护人id`,
ck.hold_user_name`维护人`,
ck.hold_team_name`维护店`,
ck.hold_marketing_name`维护区`,
ck.status_desc`客源状态`,
ck.invalid_ucid`无效人`,
ck.invalid_reason`无效理由`,
dk.cnt_dk`带看次数`,
dk.cnt_fy`带看房源数`,
dk.dk_last_time`最后带看时间`,
dk.agent_ucid`带看人id`,
dk.agent_name`带看人`,
dk.agent_team_name`带看店组`,
dk.agent_marketing_name`带看区`
from
(
-- 重客
SELECT
	custdel_id,
	telephone1,
	del_type,
	typing_time,
	first_del_source_name,
	second_del_source_name,
	hold_ucid,
	hold_user_name,
	hold_team_name,
	hold_marketing_name,
	hold_region_name,
	status_desc,
	invalid_ucid,
	invalid_reason
FROM
	dw.dw_allinfo_custdel_da
WHERE
	pt = 20190110000000
	and to_date(typing_time) between '2018-10-01' and '2019-01-10'
	AND hold_region_name = '沪东事业部'
)ck

left join

(
-- 带看
select
	custdel_id,
	count(uniq_evt_code) cnt_dk,
	count(showing_housedel_cnt) cnt_fy,
	max(to_date(showing_create_time)) dk_last_time,
	-- agent_ucid,
	-- agent_name,
	-- agent_team_name,
	-- agent_marketing_name,
	-- agent_region_name
from
	dw.dw_allinfo_evt_showing_da
where
	pt = 20190110000000
	and agent_region_name = '沪东事业部'
	and to_date(showing_create_time) between '2018-10-01' and '2019-01-10'
group by
	custdel_id,
	-- agent_ucid,
	-- agent_name,
	-- agent_team_name,
	-- agent_marketing_name,
	-- agent_region_name
)dk
on dk.custdel_id = ck.custdel_id