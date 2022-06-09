-- 链家市占,网签占比
select
a2.areaname
,a2.company25
,a1.price
,a1.link_price
,a1.mark_cnt
,a1.link_cnt
,a1.bp_cnt
from
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
pt ="20180909000000"
)a1
left join 
(
select 
estatename 
,resblockid 
,areaname 
,estateid 
,company25
,nearoneyearcomm 
,nearoneyearcount 
,nearoneyearcountrate 
,nearoneyearlianjiacount 
,bakdate
from
ods.ods_dooioodw_dimfocalestatebak_da
where 
pt = "20180906000000"
and areaname="川沙"
)a2
on a1.resblock_id=a2.resblock_id
join 
(
select
max(bakdate) `bakdate`
from ods.ods_dooioodw_dimfocalestatebak_da
where pt='20180906000000'
)a12
on a2.bakdate = a12.bakdate