select 
substr(areadrawbuname,1,instr(areadrawbuname,'事业部')+2)`事业部`
,substr(areadrawpartname,1,instr(areadrawpartname,'大区')+1)`大区`
,areadrawname`商圈`
,estatename `楼盘`
,month('to_date(signdate)')`月份`
	,sum(case when checkflag=1 then 1 else 0 end) `目标市场交易量`
	,sum(case when islink = '是'and checkflag=1 then 1 else 0 end)`链家成交`
--	,sum(case when checkflag=1 then 1 else 0 end)/count(1) `目标市场交易占比`
	,sum(case when islink='是' and checkflag=1 then 1 else 0 end)/sum(case when checkflag=1 then 1 else 0 end) `市占`
	,sum(case when isbp = '是' and checkflag=1 then 1 else 0 end)`链家报盘套数`
	,sum(case when isbp='是' and checkflag=1 then 1 else 0 end)/sum(case when checkflag=1 then 1 else 0 end) `报盘率`
--,count(1) as quanbumark,
--	sum(case when checkflag=1 then 1 else 0 end) as mubiaomark,
---	sum(case when islink='是' and checkflag=1 then 1 else 0 end) as link_cnt,
---	sum(case when isbp='是' and checkflag=1 then 1 else 0 end) as bp_cnt
from rpt.rpt_sh_secondsaleext_da
	where pt='20181112000000'
	and to_date(signdate) BETWEEN '2018-01-01'and '2018-10-31'
	and housetype NOT IN('办公楼','厂房','车库','工厂','商铺','写字楼')
	and areaDrawPartName<>'运营支持部'
	and areadrawpartname  = '高行大区'
group by substr(areadrawbuname,1,instr(areadrawbuname,'事业部')+2)
,substr(areadrawpartname,1,instr(areadrawpartname,'大区')+1)
,areadrawname
,estatename





select
areadrawbuname `事业部`
,areadrawpartname`大区`
,areadrawname`商圈`
,estatename`楼盘名`
,secondsaleid`二手id`
,price`价格`
,intermediary`网签公司`
,to_date(signdate)`网签时间`
,islink`是否链家成交`
,isbp`是否报盘`
from
rpt.rpt_sh_secondsaleext_da
	where pt='20181115000000'
	and to_date(signdate) BETWEEN '2018-01-01'and '2018-10-31'
	and housetype NOT IN('办公楼','厂房','车库','工厂','商铺','写字楼')
	and areaDrawPartName<>'运营支持部'
	and areadrawpartname  = '高行大区'
	and checkflag=1 

