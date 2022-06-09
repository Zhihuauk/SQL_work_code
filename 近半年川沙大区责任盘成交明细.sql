select 
a1.partname`大区`
,a1.manager`区总`
,a1.branchname`分行名`
,a1.resblockname`楼盘名`
,a2.orderid`成交id`
,a2.order_date`成交时间`
,a2.order_price`转定价格`
,a2.deal_branchname`成交分行`
,a3.floor_area`面积`
,a3.face_code`朝向`
-- ,a3.grade_code``
,a3.huxing`户型(室厅厨卫)`

from
(
select
    manager
    ,branchid
    ,branchname
    ,resblockid
    ,resblockname
    ,partid 
    ,partname
    ,areadrawid 
    from ods.ods_dooioodw_mapareadrawzuduipan_da
    where
    pt = '20180915000000'
	and manager = '丁杰'
    group by
    manager
    ,branchid
    ,branchname
    ,resblockid
    ,resblockname
    ,partid 
    ,partname
    ,areadrawid 
	order by
    branchname
	)a1
	left join 
(
select
orderid
,order_date
,order_price
,deal_branchname
,estate_name
,partid
,partname
,resblockid
,signedtype
,houseid
from
olap.olap_dooioodw_meacasedetail_da
where
pt = '20180916000000'
and partname = '川沙大区'
and to_date(order_date) between '2018-03-16' and '2018-09-16'
and signedtype in ('1','null')
)a2
on a1.resblockid = a2.resblockid

left join

(
select 
housedel_id
,house_id
,floor_area
,face_code
,grade_code
,concat (room_cnt,'-',parlor_cnt,'-',kitchen_cnt,'-',toilet_cnt)`huxing`
from
dw.dw_hdel_housedel_da
where
pt = '20180916000000'
)a3
on a3.house_id=a2.houseid