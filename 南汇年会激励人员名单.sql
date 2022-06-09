select t0.buname  `事业部`
	,t0.partname `大区`
	,t0.storename `门店`
	,t0.id `经纪人系统号`
	,ry.level `经纪人职级`
	,t0.mid `M店经理系统号`
	,t0.mxingming `M店经理姓名`
	,(datediff(date_add(CURRENT_DATE,-1),ry.entry_date)+1) `入职天数`
	,(datediff(date_add(CURRENT_DATE,-1),ry.entry_date)+1)/30 `入职月数`
	,t0.empname `经纪人姓名`
	,(nvl(t0.ysyj,0)+nvl(t0.esyj,0)+nvl(t0.zlyj,0)) `总业绩`
	,(nvl(t0.ysds,0)+nvl(t0.esds,0)) `买卖单数`
	,nvl(t0.zlds,0) `租赁单数`
	,nvl(dk.mmcnt,0)`买卖带看`
	,nvl(dk.zlcnt,0) `租赁带看`
	,nvl(t0.ysds,0) `一手单数`
	,nvl(t0.ysyj,0) `一手业绩`
	,nvl(t0.esds,0) `二手单数`
	,nvl(t0.esyj,0) `二手业绩`
	,nvl(t0.zlds,0) `租赁单数`
	,nvl(t0.zlyj,0) `租赁业绩`
	from 

(select * from 

(select 
  t1.buname 
  ,t1.partname
  ,t1.storename
  ,case when length(t1.empid)=5 then concat('220',t1.empid) 
  when length(t1.empid)=6 then concat('22',t1.empid) else '' end id
  ,t1.empname 
  ,case when length(t1.master)=5 then concat('220',t1.empid) 
  when length(t1.master)=6 then concat('22',t1.empid) else '' end mid
  ,t2.empname as mxingming
  ,yj.ysds
  ,yj.ysyj
  ,yj.esds
  ,yj.esyj
  ,yj.zlds
  ,yj.zlyj
  
from 


----取出所有经纪人&匹配的M

(select 
  distinct empid 
  ,buname
  ,partname
  ,storename
  ,master
  ,empname
  from ods.ods_dooioodw_dimemp_da 
  where pt='20190106000000'
  and rolename='经纪人'
  and buname like '沪东%'
  and statetag in(2,8)) t1

----匹配经纪人姓名

left join

(select buname
  ,partname
  ,storename
  ,master
  ,empid
  ,empname
  from ods.ods_dooioodw_dimemp_da 
  where pt='20190106000000'
  and rolename='经纪人'
  and statetag in(2,8)) t2 on t1.master=t2.empid

----匹配经纪人业绩
  

left join 

(select empid
  ,nvl(sum(nvl(firsthandcount,0)),0)as ysds
  ,nvl(sum(nvl(firsthandcommision,0)),0)as  ysyj
  ,nvl(sum(nvl(secondhandcount,0)),0) as esds
  ,nvl(sum(nvl(secondhandcommision,0)),0) as esyj
  ,nvl(sum(nvl(rentcount,0)),0) as zlds
  ,nvl(sum(nvl(rentcommision,0)),0) as zlyj
 from ods.ods_dooioodw_factcommdayemp_da 
 where pt = '20190106000000'
 and rptdate between '2018-01-01' and '2018-12-31'
 group by empid


)yj on t1.empid= yj.empid)t3)t0


left join

(select region_name
  ,marketing_name
  ,shop_name
  ,account
  ,uc_id
  ,level
 ,entry_date
  from dw.dw_uc_agent_all_info_branch_da 
  where pt='20190106000000'         
    and region_name like '沪东%'       ---------- 事业部
    and position_name in ('综合经纪人','租赁经纪人','买卖经纪人')
    and corp_code='SH8888'
    and status='1')ry on t0.id=ry.account


left join 
  (SELECT AA.broker_uid
    ,AA.broker_name
    ,count(case when AA.biz_type != 200200000002 then 1 else null end) mmcnt
    ,count(case when AA.biz_type = 200200000002 then 1 else null end) zlcnt
      ,count(case when AA.biz_type=200200000001 and multDK=1 then 1 else null end) ydsk
    ,count(case when AA.biz_type=200200000002 and multDK=1 then 1 else null end) yddk
  from
  (
    SELECT  
        broker_uid
        ,broker_name
        ,id
        ,biz_type
        ,case when count(biz_type)>=3 and biz_type=200200000001 then 1 
        else (case when count(biz_type)>=2 and biz_type=200200000002 dw_evt_showing_detail_all_info_branch_da 
then 1 else 0 end) end multDK

    FROM dw.    WHERE pt='20190106000000'                           ---------- 常规 PT
    and to_date(start_time) between '2018-01-01' and '2019-12-31'
    group by broker_uid
        ,broker_name
        ,id
        ,biz_type
  ) AA
 
  group by AA.broker_uid
      ,AA.broker_name
) dk on ry.uc_id=dk.broker_uid