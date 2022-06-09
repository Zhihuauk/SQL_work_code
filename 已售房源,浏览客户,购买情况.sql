select 
ky.cust_id,
ky.cust_uid,
ky.cust_phone1,
ky.cust_showing_times,
ky.cust_showing_houses,
ky.housedel_id,
ky.housedel_district_name,
ky.housedel_bizcircle_name,
ky.housedel_build_area,
ky.deal_price,
fy.hold_marketing_name,
fy.resblock_name
from
	-- 成交客源
	(
	select
	cust_id,
	cust_uid,
	cust_phone1,
	cust_showing_times,
	cust_showing_houses,
	housedel_id,
	housedel_district_name,
	housedel_bizcircle_name,
	housedel_build_area,
	deal_price
	from
	dw.dw_contract_contract_all_info_branch_da
	where
	pt = '20181220000000'
	and to_date(real_sign_time) between '2018-12-01' and '2018-12-20'
	and biz_type_name != '租赁'
	)ky
	left join
	-- 匹配房源
	(
	select
	housedel_id, 
	hold_region_name,
	hold_marketing_name,
	resblock_id,
	resblock_name
	from
	dw.dw_allinfo_housedel_da
	where
	pt = '20181220000000'
	and hold_marketing_name = '川沙大区'
	)fy
	on  ky.housedel_id = fy.housedel_id

