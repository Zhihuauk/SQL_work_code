---- 每日无效经纪人
select
	hold_region_name`事业部`,
	hold_marketing_name `大区`,
	hold_team_name `店组`,
	hold_user_name `人`,
	custdel_id `客户id`,
	del_type `委托类型`,
	first_del_source_name `一级委托来源`,
	second_del_source_name `二级委托来源`,
	hold_time `维护时间`,
	typing_source `录入来源`,
	platform `平台`,
	register_time `注册时间`,
	register_source `注册来源`,
	invalid_ucid `无效经纪人`,
	invalid_time `无效时间`,
	invalid_reason `无效原因`,
	remark_times `被注次数`,
	last_remark_time `最后备注时间`
from
	dw.dw_allinfo_custdel_da
where
	pt = concat(regexp_replace(date_add(current_date,-1),'-',''),'000000')
	and hold_region_name = '沪东事业部'
	and to_date(invalid_time) >= '2019-01-01'
