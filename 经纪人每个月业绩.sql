-- 经纪人业绩  1 2 3 4 5 6 7 8 9 
select
region_name,
marketing_name,
user_code,
user_name,
month(to_date(create_month)),
sum(agreement_amt)
from
rpt.rpt_sh_deal_contract_agent_mi
where
pt = 20190213000000
-- and create_month between '2018-01-01' and '2018-12-31'
group by
region_name,
marketing_name,
user_code,
user_name,
month(to_date(create_month))