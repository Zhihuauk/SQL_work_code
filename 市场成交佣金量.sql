--取出3月1日算的全部市场宫格信息
IF OBJECT_ID('Tempdb..#gg') IS NOT NULL
    DROP TABLE #gg
SELECT  resblockId ,
        Company25
INTO    #gg
FROM    DooiooDW..DimFocalEstateBak B WITH ( NOLOCK )
WHERE   CONVERT(VARCHAR(10), BakDate, 120) = '2017-06-21' 


IF OBJECT_ID('Tempdb..#ss') IS NOT NULL
DROP TABLE #ss

SELECT 
CASE WHEN de.BUName = '未知' THEN a.PartName ELSE de.BUName END 事业部,
(CASE WHEN de.PartName='未知' THEN de.BranchName ELSE de.PartName END) 大区,
sse.areaDrawName 商圈,
sse.areaDrawManager 商圈经理,
r.name AS 楼盘名,
ss.ljResblockId 楼盘ID,
ss.signdate 签约日期,
CAST(MONTH(ss.signdate) AS VARCHAR(50))+'月' 签约月份,
ss.price 成交价格,
ss.acreage 成交面积,
ISNULL(ssc.company,ss.intermediary) AS 中介公司,
ISNULL(#GG.Company25,'B55') 楼盘宫格,
(CASE WHEN #GG.Company25 IN ('B11','B12','B13','B21','B22','B23','B31','B32','B33') THEN '是' ELSE '否' END) AS 是否九宫格,
(CASE WHEN #GG.Company25 IN ('B11','B12','B21','B22') THEN '是' ELSE '否' END) AS 是否四宫格,
sse.isLink 是否链家,
sse.isBP 是否报盘
INTO #ss
FROM DooiooDW..SecondSale ss
LEFT JOIN DooiooDW..SecondsaleExt sse ON ss.id=sse.Secondsaleid
LEFT JOIN DooiooDW..DimSecondSaleCompany ssc WITH(NOLOCK) ON ssc.intermediary=ss.intermediary AND ss.signdate BETWEEN ssc.fromdate AND ssc.enddate --秘钥转换成真实公司名
LEFT JOIN loupan..t_core_resblock r WITH(NOLOCK)  ON ss.ljResblockId=r.id --楼盘信息表
LEFT JOIN #GG ON ss.ljResblockId=#GG.resblockId --宫格临时表
LEFT JOIN dooioodw..DimEmp de ON sse.areaDrawManagerID=de.EMpID
LEFT JOIN ( SELECT  PartName , ORG_NAME ,
                            Managerid ,
                            Manager
                    FROM    DooiooDW..DIM_AreaType
                    WHERE   AreaType = 4
                    AND partname LIKE '沪%事业部') a ON a.Managerid = sse.areaDrawManagerID
WHERE 
ss.signdate>='2017-01-01' AND ss.signdate<='2017-08-31'
AND sse.checkFlag=1 AND sse.housetype NOT IN ('办公楼','商铺','写字楼') --限定目标产品
AND sse.areaDrawName IS NOT NULL  --限定商圈内目标范围

SELECT  
s.大区,s.商圈,s.楼盘名,s.楼盘宫格,s.是否九宫格,s.是否四宫格,
COUNT(1) 近一年成交套数,
SUM(s.成交价格)*0.02/10000 '近一年成交佣金量(万元)'
FROM #ss s 
WHERE s.事业部='沪西北事业部'
GROUP BY s.大区,s.商圈,s.楼盘名,s.楼盘宫格,s.是否九宫格,s.是否四宫格
ORDER BY s.大区,s.商圈,'近一年成交佣金量(万元)'DESC