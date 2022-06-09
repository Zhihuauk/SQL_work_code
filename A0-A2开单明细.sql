-- A0-A2开单明细
select
area_name`区域名称`
,marketing_code`运营大区`
,shop_name` 门店名称`
,user_code``
,user_name``
,agent_level`经纪人级别`
,position_name`经纪人类别`
,secondhand_cnt`二手单量`
,newhouse_cnt`一手单量`
,general_rent_cnt`普租单量`
,freely_cnt`自如单量`
,rpt_date
from
rpt.rpt_sh_deal_contract_cnt_agent_all_da
where
pt = '20180920000000'
and rpt_date = '20180901000000'
and marketing_name = '南汇大区'
