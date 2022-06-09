
-- 开店代码
(
select
secondsaleid
,real_price
,build_area
,resblock_name
,resblock_id
,sign_time
,isbp
from dw.dw_sh_market_share_base_da
where
pt = '20180919000000'
and to_date(sign_time) between '2017-09-01' and '2018-09-01'
and city_code = '310000'
and resblock_name = '艺泰安邦'
)a1

left join 
 
(
select

)

