select
uc_id
,user_code
,birth_place
,huji_address
,mobile
,home_phone
,entry_date
,zhiwu_seriel
,city_code
from
dw.dw_uc_agent_all_info_branch_da
where
status = 1
and pt = "20180912000000"
and user_name in ('魏春彦',
'李永根',
'王俊',
'李加兵',
'朱玉巧',
'朱利萍',
'陆志祥',
'张维平',
'杨浩',
'张继凯',
'钟丽萍',
'李辞英',
'马勇',
'沈阳',
'邓文蛟',
'李刚明',
'严凯',
'何军',
'何致远',
'张涛',
'乐秀峰',
'吴华丽',
'李示威',
'李晓萌',
'贾德琨',
'郑小华',
'茅凯砚',
'曹琳',
'苏会富',
'张海翔',
'戴辉',
'覃宗稳',
'黄春莉',
'曹丹红',
'高垚',
'高旭',
'魏恒',
'孙建刚',
'王永刚',
'王贺',
'夏雪妮',
'王珏',
'王经卫',
'王洪宇',
'葛明和',
'彭勤香',
'袁野',
'王盼',
'陈杰',
'于鹏',
'赵志芳',
'张勇军',
'董子健',
'罗成',
'左诗瑶',
'曹翠虎',
'徐海生',
'赵雪梅',
'高腾飞',
'刘梅',
'邓仁海',
'仲召东',
'陈轶峰',
'周鑫',
'徐佳文',
'周婷',
'梁洁琼',
'张世文',
'吴青辉',
'赵献民',
'冯琮炯',
'吴伏毅',
'张伟举',
'唐慧子',
'戴秀培',
'薛拥来',
'杨振',
'胡继广',
'尚田红',
'徐一波',
'李娜',
'董磊',
'李继云',
'张睿宸',
'冯超',
'唐翔波',
'赵金珠',
'王飞',
'吴文华',
'匡小佳',
'陈爱玮',
'余金波',
'刘江',
'王佳佳',
'王庆功',
'黄善德',
'邢业胜',
'朱莉',
'程明娟',
'田凇宇',
'蔡红根',
'黄超',
'李晓南',
'张楹',
'肖墩艳',
'韩霆',
'惠泉松',
'郭玲',
'叶文波',
'蔡文武',
'吕国永',
'郑伟',
'许凤琪',
'李晓玲',
'蒋立',
'张晏端',
'欧俊斐',
'马丙志',
'王峰',
'牟容',
'陶靓',
'孔艳艳',
'龚长春',
'张新超',
'高明',
'韩忠友',
'倪俊杰',
'刘华平',
'奚琳',
'陈冬梅',
'李露',
'胡来文',
'李敬德',
'马军强',
'魏露',
'杨长海',
'钟凤',
'李祥祥',
'王磊',
'冒清',
'陆稽',
'李小利',
'杨尚军',
'田圆圆',
'宁泽青',
'窦记深',
'杨锦',
'丁玲',
'白立沙',
'徐洪',
'李其锋',
'韩松',
'刘晓龙',
'赵晶',
'汪丽',
'周国盛',
'田瑞环',
'乔志刚',
'刘石',
'杨小娥',
'赵为霞',
'宝喜',
'管文涛',
'丁心永',
'廖月飞',
'李申成',
'张晓云',
'郑巨春',
'赵凯',
'古奥美',
'杨以恒',
'万嘉宗',
'张念云',
'崔原',
'胡文东',
'张威',
'王东学',
'阮天宇',
'赵婷婷',
'邓欢欢',
'郝展',
'葛静',
'杨盛兰',
'胡景波',
'李利增',
'赵雪冬',
'余碧娇',
'汪婷婷',
'赵士林',
'蒋开远',
'熊惬',
'濮业业',
'刘维维',
'王顺燕',
'王锋',
'马志阳',
'唐城',
'陈兰',
'孙政',
'贺虎',
'朱治通',
'周瑶',
'闵定坚',
'刘敏琍',
'李玉龙',
'邱明',
'鹿华帅',
'李德文',
'邱宗炎',
'刘现强',
'童忠弟',
'常宗艳',
'施凯华',
'陈华侃',
'程燕伟',
'朱韬',
'罗伟',
'吴逸辰',
'杜永丽',
'徐静静',
'付川川',
'沈捷',
'胡新雨',
'岳媛媛',
'周丹',
'温世元',
'张珂珂',
'董强',
'曹得亮',
'胡水林',
'郑锐',
'何建兵',
'金永涛',
'魏存',
'宋梅香',
'王晶茹',
'刘益章',
'杨毅',
'卓浪',
'谭富',
'曹辉',
'曹小进',
'胡启祥',
'唐慕燕',
'吴义春',
'谢长春',
'郭巧良',
'顾旭东',
'邹宇冰',
'周晋妃',
'贺敏',
'梁天顺',
'豆凤娇',
'年景瑞',
'吕瑞香',
'刘广胜',
'叶德华',
'郑义明',
'刘向涛',
'张小军',
'黄守均',
'魏静',
'施庙全',
'陈川',
'马颖之',
'王敏杰',
'赵建斌',
'刘利',
'赵卓娜',
'宋继德',
'贾新成',
'张瑜',
'王红',
'王华',
'卢江',
'乐伟峰',
'付尘杉',
'王海',
'罗凯',
'马能俊',
'张旭',
'曹瑞饶',
'李程',
'徐法中',
'赵坤',
'马燕',
'朱福云',
'李宇',
'王敏栋',
'石霞萍',
'王传鹏',
'陈忠涛',
'余国栋',
'颜家华',
'王钶崴',
'姚祎',
'张艳华',
'张佳',
'彭有兰',
'门成奎',
'杨代兵',
'黄文霁',
'李鹏',
'曹国祥',
'金晓行',
'刘龙南',
'胡贺贺',
'张金乐',
'李培军',
'汪美玲',
'王玉娟',
'陈培钊',
'蒋平',
'王娜',
'陈伟丽',
'曹亮',
'任伟',
'马步超',
'宋晓晓',
'王子佳',
'李坤朋',
'殷劲松',
'王媛',
'晏然',
'张任飞',
'申曦',
'李奇',
'张喜波',
'陈诚',
'丁雪冬',
'周文俊',
'郭帅文',
'王丹萍',
'李顺峰',
'肖飞',
'周东梅',
'杨燕青',
'毛敏',
'高马俊',
'杨斌',
'吴月梅',
'苏仕亮',
'翟强',
'胡子伟',
'付正萌',
'韩笑',
'姜佳美',
'张帝',
'赵曾忠',
'王保平',
'罗金勇',
'廖星惟',
'孔德军',
'任俊青',
'姚庆',
'冯芳勇',
'程金伟',
'杨运淼',
'蒋春明',
'刘跃平',
'严婷婷',
'贺华',
'于卫',
'袁泉',
'张洋',
'王星',
'廖福林',
'楼云云',
'占克林',
'李娟',
'鲍远元',
'张鹏',
'金汉川',
'石绮',
'方勇',
'赵娜',
'曹同锋',
'刘春慧',
'魏书剑',
'刘庆',
'蔡怀强',
'陈敏',
'刘阳',
'王利',
'沈博',
'栾承平',
'潘倩玲',
'黄华飞',
'郭梦婷',
'张军委',
'万海兰',
'夏良俊',
'张德净',
'刘辉',
'尹艳',
'郁书成',
'蒋春蒙',
'杨月',
'黄贝贝',
'高蓉蓉',
'庞浦',
'欧艳',
'周新',
'奥运毕力格',
'陈开',
'徐金良',
'江以红',
'付占扣',
'杨世祥',
'彭鼎盛',
'方正焘',
'杜艳丽',
'彭彩辉',
'刘昕',
'张彦',
'方宇玮',
'江海兰',
'李龙',
'陈举明',
'郎茂才',
'许卫卫',
'李加套',
'储开富',
'方修国',
'朱威',
'马玉明',
'窦培培',
'陈刚',
'郝文庆',
'李兰',
'王成艳',
'李阳',
'余飛汗',
'刘志',
'张国',
'张勇',
'刘青',
'任柴胜',
'付军辉',
'董国倩',
'姜毓琦',
'田树华',
'王经杰',
'彭德宝',
'骆作帅',
'张伟',
'孙卓奎',
'张超平',
'程千仲',
'管克元',
'严万阳',
'汪海平',
'高健',
'郗栋梁',
'翁麒',
'陶菊红',
'张杰',
'姜菊花',
'董丽娜',
'杨宁',
'王善红',
'赵恒',
'丁飞',
'冯科',
'侯磊',
'刘笑',
'赵锐',
'梁丹',
'迟学明',
'黄琦',
'夏进冬',
'赵小龙',
'周志波',
'张金明',
'王莉',
'储青',
'王娟',
'杨夕锋',
'龚吉锋',
'潘丽雅',
'任坤',
'乔明利',
'陈照生',
'田甜',
'郝朝',
'姜云见',
'倪小宝',
'支武涛',
'翟宁亚',
'王丽',
'张志军',
'李莎',
'杨治国',
'曾坤',
'席锋',
'方达坤',
'宋子凌',
'樊发通',
'钟春艳',
'张梅菊',
'许飞',
'裴存玉',
'王辉',
'孙阿永',
'高小军',
'袁应明',
'浦清',
'旷艳萍',
'沙贤伟',
'王玉超',
'董甲生',
'向阳',
'陈星宇',
'张小杰',
'石园园',
'陆婷',
'闻雪达',
'徐辉艳',
'苗可',
'张华杰',
'黄宇帆',
'邹威',
'王晓静',
'金宇礽',
'袁跃海',
'马德帅',
'孙金荣',
'严逸明',
'魏良庆',
'涂巧娟',
'于凡钧',
'王赛月',
'张安圣',
'乔现磊',
'赵艺飞',
'饶正平',
'何业锋',
'陈东升',
'王刚领',
'王艳茹',
'饶子航',
'赵炎',
'张鑫珏',
'杜家倩',
'曾安平',
'黄敏',
'曹雪枫',
'张业兵',
'宋德胜',
'殷允平',
'李小浩',
'荀小芳',
'朱新华',
'曹来宾',
'程利鹏',
'方根',
'苏玉华',
'王昆朋',
'苏伟锋',
'王军',
'何云鸿',
'邢凌云',
'颜会童',
'柏海明',
'张春临',
'管庆勇',
'郭江平',
'戴超',
'张向红',
'武欣欣',
'姜伟',
'鲍仲',
'侯宇佳',
'孙凯凯',
'刘青',
'常红',
'刘娇',
'杜竹花',
'王紫阳',
'陶冶',
'王畅',
'李鑫',
'马磊',
'邹红旗',
'王纯玲',
'薛博',
'白福全',
'韩锋利',
'周洪建',
'刘卫',
'苏小康',
'唐超',
'徐仙英',
'吴根涛',
'李元春',
'王玉鑫',
'殷世斌',
'董磊',
'毕洁超',
'解秀娟',
'朱彪',
'叶聪',
'胡振轩',
'张世玺',
'陆超',
'涂克森',
'陈贤其',
'李亮亮',
'傅玲',
'李莹莹',
'张亚东',
'卓燕辉',
'何鹏飞',
'张军民',
'杨正荣',
'谢君钊',
'陈海泉',
'王杰',
'张鑫',
'许昌文',
'冯清',
'陈莎莎',
'朱晓',
'薛莉萍',
'魏永柯',
'倪建成',
'付贤进',
'柳冬',
'张荣昌',
'梅士伟',
'潘克龙',
'王兵兵',
'贾薇薇',
'张勇',
'李大学',
'周伟建',
'汤寿发',
'何晓辉',
'潘旺军',
'李炎',
'董少功',
'李庆',
'刘景栋',
'王俊',
'陈璜蕾',
'林小建',
'杨海燕',
'张雪伟',
'谢国双',
'焦英强',
'曹东东',
'韩云彬',
'彭美平',
'孟新岗',
'马成帅',
'游泽伟',
'伍书丹',
'徐秀明',
'李文',
'丁震辉',
'李伟',
'杨细平',
'石茂红',
'贺志华',
'陆洁华',
'蔡城城',
'黄清俊',
'彭腾飞',
'严锐',
'张文彬',
'李群琴',
'尤城钛',
'石凤',
'王原涛',
'钱亮',
'何彬彬',
'马宝仓',
'杨明昕',
'朱秉华',
'王伟',
'陈小妹',
'袁秀红',
'程龙辉',
'李滨',
'王鹏',
'张昭',
'罗立谱',
'房艳敏',
'左如义',
'佘依洋',
'吴骁',
'蔡卓成',
'李培松',
'张苗华',
'谢公强',
'吴君臣',
'李锋',
'陈孝飞',
'陈锐',
'祝蔚',
'杨林',
'苏士中',
'徐俊',
'刘坤',
'罗贤珍',
'王彦',
'吴义有',
'夏斌',
'徐玉',
'杨千千',
'韩峰',
'冯成瑜',
'王超',
'张凤',
'游祺',
'季秀云',
'刘梅',
'宫报',
'庞先锋',
'葛艳召',
'田英伟',
'苏煜祥',
'蔡淑野',
'陈方方',
'杨培培',
'郭冰',
'崔中禾',
'王珊珊',
'马文学',
'梁家助',
'张贵超',
'程学祥',
'陶嫣',
'蔡利利',
'李文',
'韩伟伟',
'武三军',
'陈艳朵',
'王海洋',
'张振红',
'王志华',
'简丹萍',
'李丹',
'张志强',
'吴庭',
'李志鹏',
'张万南',
'徐红飞',
'胡文涛',
'王卉',
'曹抒华',
'朋浩',
'王叶成',
'孟会丽',
'路明',
'孙庆庆',
'芦毅',
'郑欢庆',
'何辉',
'任祥',
'解承天',
'刘强',
'顾丽华',
'王立军',
'李笑妍',
'李想',
'李英霞',
'黄嵬',
'彭纯夫',
'张浩',
'刘通海',
'王方陆',
'周佳佳',
'邱军',
'周伟',
'梁世有',
'周文',
'胡明锋',
'吉美',
'王宇',
'汪光亮',
'王腾飞',
'吴超',
'蒋雷明',
'董青战',
'刘燕',
'林霄',
'李波',
'刘峰',
'赵波',
'杨林',
'肖苗',
'左振刚',
'张凯',
'华强',
'李义丰',
'李飞',
'江淑芬',
'张鹏',
'梁恒',
'李蓉',
'王毛毛',
'张明山',
'卜俊逸',
'周浩纲',
'江文娟',
'崔健',
'王静静',
'钟国富',
'尹华盛',
'陶应高',
'王迎晓',
'白鹏飞',
'刘乾昊',
'杨潇',
'郭晓明',
'陈朝健',
'左刚',
'杨兰英',
'秦嬛',
'吴光美',
'王春鹏',
'周猛',
'申淑港',
'吴良丰',
'张宏超',
'陈剑萍',
'黄文龙',
'李小平',
'陈健',
'李步明',
'马丹',
'唐明祥',
'尤培刚',
'徐红珍',
'丁健松',
'唐谱成',
'武威',
'张闯闯',
'周玲丽',
'胥云芳',
'俄士军',
'胡光维',
'张秀秀',
'顾杰',
'许继峰',
'缪维勇',
'董秋波',
'卞松颖',
'范明晶',
'侯永生',
'吴慧星',
'姜影',
'张剑锋',
'方刚',
'安晓伟',
'熊航',
'程小龙',
'程跃全',
'陈基玉',
'张洋',
'王清华',
'韩成功',
'徐国斌',
'仝妮妮',
'潘婕妤',
'叶阳开',
'丁增冬',
'杨珊珊',
'谭斌',
'王赛',
'陆贤',
'王菊华',
'徐鹏程',
'杭治国',
'王晓红',
'孙殿国',
'王莹',
'于忠磊',
'谢娟',
'范永新',
'刘凯华',
'类维玉',
'郑微',
'闫小强',
'汪华',
'宣扬',
'徐鹏飞',
'木红锐',
'王文强',
'胡铃凌',
'艾海山',
'向玉妮',
'田小三',
'魏茂欢',
'吴刚',
'巴春辉',
'屠文清',
'张文力',
'王兆明',
'李金海',
'张静',
'刘颖祯',
'刘晶杰',
'曹振群',
'吉湛江',
'余刚',
'邹晓轩',
'叶世锋',
'马亮',
'刘峰',
'张超',
'王金萍',
'徐旭',
'高鹏',
'朱小毅',
'侯意乐',
'夏宇',
'孙振东',
'宣元',
'徐磊',
'郑宁',
'郭守允',
'刘香',
'李青',
'李晶',
'李杰',
'胡炯',
'朱吕萍',
'何州',
'杨波',
'高伯元',
'谭星',
'刘锋',
'于占庆',
'程栋森',
'王平',
'殷丁金',
'尹露香',
'熊夕文',
'祝志良',
'王赞',
'吴辉兴',
'刘宏伟',
'骆成虎',
'胡伟民',
'王华芬',
'董凌飞',
'李佳融',
'郭子聪',
'仲剑峰',
'黄雅楠',
'吕璐瑶',
'汪定平',
'汪美娇',
'周杰',
'许方铣',
'高琳琳',
'王安敏',
'尹芬宝',
'赵非非',
'晏纯',
'汪力敏',
'蒋威震',
'杨军侠',
'许惠德',
'朱晔端',
'刘婧',
'邵珠虎',
'顾志霞',
'支海燕',
'郑君赞',
'孙琳娜',
'王青山',
'徐娜',
'张伦锦',
'许民',
'倪伟伟',
'周祥杰',
'徐万金',
'丁海孝',
'叶慧玲',
'胡中腾',
'高淑芹',
'徐景霞',
'张光祥',
'柳甫',
'滕家发',
'李卓斌',
'袁之芬',
'曹亮',
'顾怡雯',
'倪卫家',
'谢昆',
'蒋碧绮',
'邱烨云',
'刘森林',
'陈曦',
'唐娟',
'陈彦',
'王开启',
'胡海文',
'姚奇',
'谢得奎',
'张健军',
'胡翔吉',
'李景奇',
'邱文玲',
'叶鹏',
'陈磊',
'王利平',
'钱浩宇',
'聂成梅',
'唐斌',
'许周平',
'胡鹏旭',
'汤得平',
'黄紫云',
'杨国辉',
'彭红玲',
'贾春燕',
'张保亮',
'樊良俊',
'汤凤琴',
'廖晖',
'陈雪',
'廖丽娟',
'徐彦',
'李玉峰',
'马佳佳',
'薛雯静',
'周翬',
'张延飞',
'张孙闻',
'郭静',
'杨发才',
'陈定一',
'刘东恒',
'张岚',
'刘倩倩',
'陈雯雯',
'王欣华',
'李轶群',
'陶舒燕',
'王涛',
'易晓林',
'鲍征',
'刘玉成',
'王真',
'王振国',
'朱叔信',
'周毅',
'李健康',
'池苗',
'王东方',
'吕轩',
'周美丽',
'闵洲',
'徐业龙',
'秦磊',
'吴光茂',
'王强',
'岑曙汛',
'尤建红',
'孙江涛',
'李伟斌',
'沈杏花',
'徐志涛',
'徐盈盈',
'刘悦纳',
'张德雄',
'汪安舟',
'郭向委',
'王伟',
'李薇薇',
'郁敏敏',
'杨明昭',
'刘珍珍',
'礼广宇',
'许伟',
'徐丽',
'区段号；03-经12',
'姓  名',
'王品',
'汪厉冰',
'吴雄杰',
'张帅',
'齐明会',
'张依娜',
'孙明龙',
'韩磊',
'李青',
'张文娟',
'卢佳',
'王小梅',
'贺盛敏',
'许颖霞',
'卢雪蕾',
'陈思博',
'郑丽娟',
'余开运',
'郭修梅',
'刘琳琳',
'相开圣',
'马涛',
'余凤娇',
'陆杞冰',
'戴林芃',
'陈睿',
'梁同鹤',
'申晓东',
'秦浩',
'',
)