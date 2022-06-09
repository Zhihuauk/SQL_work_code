--非C类房源，委托超60天，且60天0带看房源
select fy.hold_region_name
    ,fy.hold_marketing_name
    ,fy.hold_team_name
    ,fy.housedel_id
    ,fy.grade
    ,fy.listing_time
    ,fy.gpdd
from
(select hold_region_name
    ,hold_marketing_name
    ,hold_team_name
    ,hold_user_name
    ,housedel_id
     ,grade
     ,listing_time
     ,datediff(current_date, listing_time) gpdd
from dw.dw_allinfo_housedel_da
where pt = '20180910000000'
and del_type = '买卖'
and housedel_status = '有效'
and grade != 'C级房源'
and hold_region_name = '沪东事业部') fy

left join

(select housedel_id, max(showing_start_time) `max`, datediff(current_date,max(showing_start_time)) dkdd
from dw.dw_allinfo_evt_showing_da
where pt = '20180910000000'
group by housedel_id
) m
on fy.housedel_id = m.housedel_id

where gpdd > 60  and dkdd >60