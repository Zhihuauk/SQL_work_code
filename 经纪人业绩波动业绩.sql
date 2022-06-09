-- sql server业绩
SELECT
yj.RptYear,
yj.RptMonth,
r.PartName,
r.BranchName,
r.EMPName,
yj.EMpID,
SUM(yj.SecondComm_m)+SUM(yj.FirstComm_m)+SUM(yj.RentComm_m)
FROM
	DooiooDW..FactCommMonthEmp AS yj 
	LEFT JOIN 
	DooiooDW..DimEmp AS r 
	ON r.EMpID = yj.EMpID
WHERE
	r.StateTag IN (2,8)
	AND yj.RptYear = 2018
GROUP BY
yj.RptYear,
yj.RptMonth,
r.PartName,
r.BranchName,
r.EMPName,
yj.EMpID
ORDER BY
RptYear,
RptMonth,

-- hive sql 业绩
SELECT
    r.region_name,
    r.marketing_name,
    r.team_name,
    r.employee_no,
    r.uc_job_level_name,
    r.entry_date,
    yj.month,
    case 
    when yj.zyj is null then 0
	when yj.zyj is not null then yj.zyj
    end zyj
FROM
(
SELECT
    region_name,
    marketing_name,
    team_name,
    employee_no,
    employee_name,
    on_job_status,
	uc_job_level_name,
	entry_date
FROM
    dw.dw_allinfo_agent_da
WHERE
    pt = 20190215000000
    AND on_job_status_code IN (170007002,170007003)
	AND to_date(entry_date) < '2017-12-31' 
	AND uc_job_level_name in 
    ('A3','A4','A5','A6','A7','A8','A9','A10',
	 'M1','M2','M3','M4','M5','M6','M7','M8','M9','M10')
)r

LEFT JOIN

(
SELECT
    substr(yj1.rptdate,6,2) `month`,
    case 
	when length(yj1.empid) = 5 then concat('220',yj1.empid)
    when length(yj1.empid) = 6 then concat('22',yj1.empid)
    end `empid`,
    sum(yj1.secondhandcommision)+sum(yj1.firsthandcommision)+sum(yj1.rentcommision) `zyj`
FROM
    (
     SELECT
        rptdate,
        empid,
        secondhandcommision,
        firsthandcommision,
        rentcommision
    FROM
        ods.ods_dooioodw_factcommdayemp_da
    WHERE
    pt = 20190131000000
    and  year(to_date(rptdate)) = 2018
    )yj1
GROUP BY
    substr(yj1.rptdate,6,2),
    empid
)yj
ON yj.empid = r.employee_no

ORDER BY
r.region_name,
r.marketing_name,
r.team_name,
yj.month