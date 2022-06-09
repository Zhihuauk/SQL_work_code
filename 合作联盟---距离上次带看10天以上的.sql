-- 大区数据 合作联盟发起情况-北蔡
select mx.region_name `事业部`,
	mx.marketing_name `大区`,
	mx.team_name `分行`,
	mx.uc_id-1000000022000000 `经纪人工号`,
	mx.user_name `经纪人姓名`,
	mx.cust_id `客源id`,
	mx.keyin_date `客源录入时间`,
	mx.showing_times_7_days`近7天带看`,
	mx.showing_times_15_days`近15天带看`,
	mx.m `发起合作时间` ,
	mx.type `合作联盟操作`, -- 操作类型.1:合作邀请 2:取消合作邀请
	(CASE mx.type
	 when '1' THEN '合作邀请'
	 when '2' THEN '取消合作邀请'	 
	 ELSE 'null'
	 END)`合作操作`,
	mx.status `合作联盟状态`,-- 状态.1:待确认 2:已达成 3:已取消 4:已过期 5:建立失败 6:共享
	(case mx.status
	when '1' THEN '待确认'
	when '2' THEN '已达成'
	when '3' THEN '已取消'
	when '4' THEN '已过期'
	when '5' THEN '建立失败'
	when '6' THEN '共享'	 
	ELSE 'null'
	END)`合作状态`
from (
	
	select e.region_name,
		e.marketing_name,
		e.team_name,
		e.uc_id,
		e.user_name,
		e.level,
		a.cust_id,
		a.keyin_date,
		b.m,
        b.status,
	    b.type,
  		datediff(current_date,a.keyin_date) cc,
		datediff(b.m,a.keyin_date) dd,
  		a.showing_times_7_days,
	   	a.showing_times_15_days
	 from (
		select cust_id,
			cust_name,
			keyin_agent_id,
			keyin_date,
			share_pool_enter_date,
			holder_agent_id,
			holder_date,
			showing_total_times,
	   		showing_times_7_days,
	   		showing_times_15_days
		from dw.dw_cust_custdel_all_info_branch_da
		where pt = '20190107000000'
		and del_type_name like '求购%'
		and datediff(current_date,to_date(keyin_date)) >= 10  -- 录入超过30天，人性化
	    and showing_total_times >= 1  -- 至少产生过一次带看
	    and showing_times_7_days = 0 --近7日带看为0，先预警
	    and showing_times_15_days = 0  -- 近15日带看为0，沉默客户
		and status_name like '有效%' ) a 
	left join (
		select customer_id,
			broker_uid,
			to_date(created_time) m,
	  		status,
			type
		from rpt.rpt_cust_post_cooperation_da
		where pt = '20190107000000'
		-- and status = 2    -- 合作联盟未达成
		-- and type = 1 -- 操作类型.1:合作邀请 2:取消合作邀请
				) b 
	on a.cust_id = b.customer_id	
	inner join (
		select region_name,
			marketing_name,
			team_name,
			uc_id,
	  		user_name,
	  		level
		from dw.dw_uc_agent_all_info_branch_da
		where pt = '20190107000000'
		and region_name = '沪东事业部'
	  	and marketing_name = '北蔡大区'
		and status = 1                         -- 剔除离职经纪人
	) e
	on a.holder_agent_id = e.uc_id ) mx