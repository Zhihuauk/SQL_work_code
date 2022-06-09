select
estatename,
0.025*sum(price)/10000 `佣金量`,
from
rpt.rpt_sh_secondsaleext_da
  WHERE pt = 20181225000000
  AND to_date(signdate) between '2017-11-30' and '2018-11-30'
  AND estatename in 
('百欣苑',
'晨阳小区',
'龙馨华庭',
'天环苑',
'新建路82弄',
'海霞佳苑',
'海霞新苑',
'凌港城'
)
group by
estatename
