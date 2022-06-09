
-- 宫格
select 
estatename
,resblockid
,areadraw25
,nearoneyearcomm
,nearoneyearcount
,nearoneyearcountrate
,areadraw25
from
ods.ods_dooioodw_dimfocalestatebak_da
where 
pt = '20180917000000'

--- 总房源数

select
estatename`楼盘名`
,counth`总套数`
,propertynum`总房源数`
from
ods.ods_dooioodw_estatecomplete_da
where 
pt = '20180917000000'
and cityname = '上海'
and estatename in ('艺泰安邦')


