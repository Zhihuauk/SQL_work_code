-- 半年内川沙成交明细
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
from
olap.olap_dooioodw_meacasedetail_da
where
pt = '20180916000000'
and partname = '川沙大区'
and to_date(order_date) between '2018-03-16' and '2018-09-16'
and signedtype in ('1','null')


-- 
select
operationid
,order_date
,order_price
,deal_branchname
,estate_name
,partid
,partname
,resblockid
,signedtype
from
olap.olap_dooioodw_meacasedetail_da
where
pt = '20180916000000'
-- and partname = '川沙大区'
-- to_date(order_date) between '2018-03-16' and '2018-09-16'

-- 组对盘
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
	order by
    branchname