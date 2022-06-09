select
r.buname `事业部`
,r.partname `大区`
,r.branchname `分行`
,r.empname `姓名`
,r.empid `工号`
,r.promotiontime_title `变更时间`
,sum(yj.firsthandcommision) `一手总业绩`
,sum(yj.secondhandcommision) `二手总业绩`
,sum(yj.rentcommision) `租赁总业绩`
,sum(yj.firsthandcommision)/(datediff(to_date(r.promotiontime_title),CURRENT_DATE)/30)`月均一手业绩`
,sum(yj.secondhandcommision)/(datediff(to_date(r.promotiontime_title),CURRENT_DATE)/30)`月均二手业绩`
,sum(yj.rentcommision)/(datediff(to_date(r.promotiontime_title),CURRENT_DATE)/30)`月均租赁业绩`
,datediff(to_date(r.promotiontime_title),CURRENT_DATE)/30`月份差`

from
(
select 
buname
,partname
,branchname
,branchid
,empid
,empname
,titledegreenew
,promotiontime
,promotiontime_title
	from ods.ods_dooioodw_dimemp_da
	where pt = '20181118000000'
	and statetag in (2,8)
	and titledegreenew	 like 'B%'
	and buname = '沪东事业部'
	and to_date(promotiontime_title) <= '2018-05-01'
)r
--业绩
inner join
(
select
*
from
ods.ods_dooioodw_factcommdayemp_da
where pt = '20181118000000'
)yj
on r.branchid = yj.branchid
-- 设定时间
where 
yj.pt >= date_add(to_date(promotiontime_title),180)
group by
r.buname
,r.partname
,r.branchname
,r.empname
,r.empid
,r.promotiontime_title