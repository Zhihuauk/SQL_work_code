select
M.partname,
M.branchname,
M.empid,
M.empname,
M.titledegreenew,
A.empid,
A.empname,
A.titledegreenew
from
(
select
partname,
branchname,
empid,
empname,
titledegreenew,
master
from
ods.ods_dooioodw_dimemp_da
where
buname like '沪东%'
and pt = 20190213000000
and titledegreenew like 'M%'
and statetag in(2,8)
and rolename='经纪人'
)M
left join
(
select
partname,
branchname,
empid,
empname,
titledegreenew,
master
from
ods.ods_dooioodw_dimemp_da
where
buname like '沪东%'
and pt = 20190213000000
-- and titledegreenew like 'A%'
and statetag in(2,8)
and rolename='经纪人'
and master <> 0
)A
on M.empid = A.master

