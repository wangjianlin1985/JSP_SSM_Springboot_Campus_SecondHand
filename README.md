# JSP_SSM_Springboot_Campus_SecondHand
JSP基于SSM校园二手书跳蚤市场交易平台可升级SpringBoot毕业源码案例设计
## 程序开发环境：myEclipse/Eclipse/Idea都可以 + mysql数据库
## 前台技术框架： Bootstrap  后台架构框架: SSM
(1)登陆注册模块：未注册用户进行登陆注册，才能发布二手书信息

(2)用户管理模块：该模块管理员可查看已注册用户信息，删除无效的已毕业的用户信息。

(3)管理员管理模块：该模块包括管理员信息的增加、删除、修改、查询。

(4)二手书信息管理模块：用户填写二手书出售或求购信息，发布二手书出售信息或发布二手书求购信息，查看、修改二手书发布信息。管理员根据二手书的交易状态，删除已交易成功的图书。

(5)留言功能模块：注册用户、未注册用户、管理员查看留言；注册用户和管理员发表留言；管理员删除留言。

(6)个人信息管理模块：注册用户和管理员对自己的个人信息进行管理，包括密码修改

(7)公告管理模块：管理员对公告信息进行增、删、改操作。

(8）分享模块：分享主要是通过添加链接到剪贴板的方式，让用户可以方便的将链接发给好友。

(9）意见反馈模块：意见反馈模块主要是通过用户意见反馈，将收集意见在后台及时的做出改进。
## 实体ER属性：
用户: 用户名,登录密码,姓名,性别,出生日期,用户照片,联系电话,邮箱,家庭地址,注册时间

图书类别: 类别编号,类别名称

求购: 求购id,图书主图,图书名称,图书类别,出版社,作者,求购价格,新旧程度,求购说明,发布用户,用户发布时间

图书出售: 出售id,图书主图,图书名称,图书类别,出版社,作者,出售价格,新旧程度,出售说明,发布用户,用户发布时间

图书订单: 订单id,图书信息,意向用户,意向出价,用户备注,下单时间

留言: 留言id,留言标题,留言内容,留言人,留言时间,管理回复,回复时间

新闻公告: 公告id,标题,公告内容,发布时间