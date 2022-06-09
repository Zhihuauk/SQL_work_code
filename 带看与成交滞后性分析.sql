select
	kh.,
	kh.,
	kh.,
	kh.,
	kh.,
	chk.,
	chk.,
	chk.,
	chk.,
	chk.,
	dk.,
	dk.,
	dk.,
	dk.,
	dk.,

(
select
	contract_sign_marketing_name `大区`,
	contract_sign_team_name `店组`,
	cust_id `客源编码吗`,
	cust_uid ` 客户UCID`,
	cust_keyin_time `录客时间`,
	cust_first_showing_time `首次带看时间`,
	cust_showing_houses	`带看的房源总量`,
	cust_showing_times	`带看总量`,
	real_sign_time `实际签约时间`
from
	dw.dw_contract_contract_all_info_branch_da
where
	pt = 20190219
	and real_sign_time like "2018%"

)kh	

(
select
	partname,
	deal_branchname,
	customer_no,
	order_real_time
from
	ods.ods_dooioodw_meacasedetail_da
where
	pt = 20190218000000
	and order_real_time like "2018%"
)cjk


(
select
	dk1.custdel_id,
	min(dk1.showing_start_time) `showing_first_time`,
	max(dk1.showing_start_time) `showing_last_time`,
	count(dk1.uniq_evt_code) `showing_cnt`,
	count(dk1.showing_housedel_cnt) `house_cnt`
from
(
select 
	custdel_id,
	showing_start_time,
	showing_housedel_cnt,
	total_showing_feedback,
	uniq_evt_code,
	showing_housedel_cnt
from
	dw.dw_allinfo_evt_showing_da
where
	pt = 20190219000000
	and agent_corp_name = "上海链家"
	and del_type_code <> 990001002
)dk1
group by
custdel_id
)dk


