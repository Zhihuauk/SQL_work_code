select d.month `月份`
       ,d.marketing_name `大区`
	   ,d.shop_name `门店`
	   ,d.team_name `分行`
	   ,d.renshu `人数`

from

(select branchid
       ,branch_code
	   ,branchname
	   ,partname
	   ,buname
from ods.ods_dooioodw_dimbranch_da
where pt=concat(regexp_replace(date_add(current_date,-1),'-',''),'000000')
and actived='1'
)a		

left join 

(select substr(c.rpt_date,1,7) `month`
        ,c.region_name
        ,c.marketing_name
        ,c.shop_name
        ,c.team_name
        ,c.team_code
        ,avg(c.num) `renshu`
 from

(select 
        region_name
        ,marketing_name
        ,shop_name
        ,team_name
        ,team_code
        ,rpt_date
 ,count(distinct employee_ucid) `num`

from

(select 
 regexp_extract(region_name,'(.*?)(事业部)(.*?)',0) `region_name`
,regexp_extract(marketing_name,'(.*?)(大区)(.*?)',0) `marketing_name`
,shop_name
,team_name
,team_code
,employee_ucid
,concat(substring(pt,1,4),'-',substring(pt,5,2),'-',substring(pt,7,2)) `rpt_date`
from dw.dw_allinfo_agent_da
where pt between '20180101000000' and concat(regexp_replace(date_add(current_date,-1),'-',''),'000000')----限制pt
        and on_job_status_code != '170007001'   -- 在职状态编码：170007001:离职,170007002:在职在岗,170007003:在职不在岗
		and employee_category_code = '170001001' -- 员工类别编码：170001001:内部员工,170001002:加盟员工	
		and post_status_code != '170009001' -- 岗位状态编码：170009001:离职,170009002:在职在岗,170009003:在职不在岗
	 	
        and uc_job_name in ('租赁经纪人', '综合经纪人', '买卖经纪人')
		and uc_job_name not in ('商圈经理', '总监', '租赁商圈经理')
	    and corp_name ='上海链家'
		and region_name like '沪东%'
)b
group by region_name
        ,marketing_name
        ,shop_name
        ,team_name
        ,team_code
        ,rpt_date
)c

 group by substr(c.rpt_date,1,7)
        ,c.region_name
        ,c.marketing_name
        ,c.shop_name
        ,c.team_name
        ,c.team_code
 
)d on a.branch_code=d.team_code
where d.team_code is not null
order by `大区`,`门店`,`分行`,`月份`