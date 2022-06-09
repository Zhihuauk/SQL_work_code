select
a1.marketing_name `大区`
,a1.shop_name`店`
,a1.resblock_name`楼盘`
,a2.price`网签金额`
,a2.link_price`链家网签金额`
,a2.mark_cnt`市场成交`
,a2.link_cnt`链家成交`
,a2.bp_cnt`链家报盘`
from
(
select
distinct(house_resblock_id)
,region_name
,marketing_name
,shop_name
,resblock_name
from
olap.olap_house_duty_info_da
WHERE
region_name = "沪东事业部"
and marketing_name = "川沙大区"
)a1

 left join

(
 select
 resblock_id
 ,price
 ,link_price
 ,mark_cnt
 ,link_cnt
 ,bp_cnt
 from
 olap.olap_sh_markrate_da
 where 
 pt = '20180831000000' 
)a2
on a1.house_resblock_id=a2.resblock_id
order by
`店`
