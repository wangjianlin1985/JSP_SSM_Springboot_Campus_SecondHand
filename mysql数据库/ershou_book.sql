/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50051
Source Host           : localhost:3306
Source Database       : ershou_book

Target Server Type    : MYSQL
Target Server Version : 50051
File Encoding         : 65001

Date: 2017-12-19 06:23:47
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `admin`
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `username` varchar(20) NOT NULL default '',
  `password` varchar(32) default NULL,
  PRIMARY KEY  (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('a', 'a');

-- ----------------------------
-- Table structure for `t_bookclass`
-- ----------------------------
DROP TABLE IF EXISTS `t_bookclass`;
CREATE TABLE `t_bookclass` (
  `bookClassId` int(11) NOT NULL auto_increment COMMENT '类别编号',
  `bookClassName` varchar(20) NOT NULL COMMENT '类别名称',
  PRIMARY KEY  (`bookClassId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_bookclass
-- ----------------------------
INSERT INTO `t_bookclass` VALUES ('1', '自然科学');

-- ----------------------------
-- Table structure for `t_bookorder`
-- ----------------------------
DROP TABLE IF EXISTS `t_bookorder`;
CREATE TABLE `t_bookorder` (
  `orderId` int(11) NOT NULL auto_increment COMMENT '订单id',
  `bookSellObj` int(11) NOT NULL COMMENT '图书信息',
  `userObj` varchar(30) NOT NULL COMMENT '意向用户',
  `price` float NOT NULL COMMENT '意向出价',
  `orderMemo` varchar(500) default NULL COMMENT '用户备注',
  `addTime` varchar(20) default NULL COMMENT '下单时间',
  PRIMARY KEY  (`orderId`),
  KEY `bookSellObj` (`bookSellObj`),
  KEY `userObj` (`userObj`),
  CONSTRAINT `t_bookorder_ibfk_2` FOREIGN KEY (`userObj`) REFERENCES `t_userinfo` (`user_name`),
  CONSTRAINT `t_bookorder_ibfk_1` FOREIGN KEY (`bookSellObj`) REFERENCES `t_booksell` (`sellId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_bookorder
-- ----------------------------
INSERT INTO `t_bookorder` VALUES ('1', '1', 'user1', '28', '我需要这个，给我吧！', '2017-12-18 14:15:16');
INSERT INTO `t_bookorder` VALUES ('3', '1', 'user2', '29', '我也喜欢这本书啊，给我吧，马上交易', '2017-12-19 06:20:48');

-- ----------------------------
-- Table structure for `t_bookseek`
-- ----------------------------
DROP TABLE IF EXISTS `t_bookseek`;
CREATE TABLE `t_bookseek` (
  `seekId` int(11) NOT NULL auto_increment COMMENT '求购id',
  `bookPhoto` varchar(60) NOT NULL COMMENT '图书主图',
  `bookName` varchar(20) NOT NULL COMMENT '图书名称',
  `bookClassObj` int(11) NOT NULL COMMENT '图书类别',
  `publish` varchar(50) NOT NULL COMMENT '出版社',
  `author` varchar(20) NOT NULL COMMENT '作者',
  `price` float NOT NULL COMMENT '求购价格',
  `xjcd` varchar(20) NOT NULL COMMENT '新旧程度',
  `seekDesc` varchar(5000) NOT NULL COMMENT '求购说明',
  `userObj` varchar(30) NOT NULL COMMENT '发布用户',
  `addTime` varchar(20) default NULL COMMENT '用户发布时间',
  PRIMARY KEY  (`seekId`),
  KEY `bookClassObj` (`bookClassObj`),
  KEY `userObj` (`userObj`),
  CONSTRAINT `t_bookseek_ibfk_2` FOREIGN KEY (`userObj`) REFERENCES `t_userinfo` (`user_name`),
  CONSTRAINT `t_bookseek_ibfk_1` FOREIGN KEY (`bookClassObj`) REFERENCES `t_bookclass` (`bookClassId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_bookseek
-- ----------------------------
INSERT INTO `t_bookseek` VALUES ('1', 'upload/7b7a3b3e-fd82-49b2-b16c-cecf26a9b6c5.jpg', '现代数字信号处理', '1', '机械工业出版社', '杨绿溪', '100', '7成新', '<p><span style=\"color: rgb(119, 119, 119); font-family: &quot;WenQuanYi Micro Hei&quot;, 微软雅黑, Arial, Helvetica, sans-serif; background-color: rgb(255, 255, 255); font-size: 14px;\">《现代数字信号处理》介绍了现代数字信号处理的主要内容。首先概述了离散时间信号处理和离散随机信号分析的基础内容，主要是一些基本概念和基本分析方法，然后重点叙述了基于二阶统计量的信号处理理论和方法，包括随机信号的线性预测、线性过程建模、最优维纳滤波和卡尔曼滤波、功率谱估计的经典方法和模型方法、特征空间分析、自适应滤波器以及多速率信号处理等。最后几章对现代数字信号处理的一些新进展内容也作了较简洁的介绍，内容包括信号的时频分析和小波变换、高阶谱分析以及盲信号处理。</span></p>', 'user1', '2017-12-18 23:43:11');
INSERT INTO `t_bookseek` VALUES ('2', 'upload/NoImage.jpg', '11', '1', '22', '333', '44', '55', '<p>6688sg</p>', 'user1', '2017-12-19 04:12:11');

-- ----------------------------
-- Table structure for `t_booksell`
-- ----------------------------
DROP TABLE IF EXISTS `t_booksell`;
CREATE TABLE `t_booksell` (
  `sellId` int(11) NOT NULL auto_increment COMMENT '出售id',
  `bookPhoto` varchar(60) NOT NULL COMMENT '图书主图',
  `bookName` varchar(20) NOT NULL COMMENT '图书名称',
  `bookClassObj` int(11) NOT NULL COMMENT '图书类别',
  `publish` varchar(20) NOT NULL COMMENT '出版社',
  `author` varchar(20) NOT NULL COMMENT '作者',
  `sellPrice` float NOT NULL COMMENT '出售价格',
  `xjcd` varchar(20) NOT NULL COMMENT '新旧程度',
  `sellDesc` varchar(5000) NOT NULL COMMENT '出售说明',
  `userObj` varchar(30) NOT NULL COMMENT '发布用户',
  `addTime` varchar(20) default NULL COMMENT '用户发布时间',
  PRIMARY KEY  (`sellId`),
  KEY `bookClassObj` (`bookClassObj`),
  KEY `userObj` (`userObj`),
  CONSTRAINT `t_booksell_ibfk_2` FOREIGN KEY (`userObj`) REFERENCES `t_userinfo` (`user_name`),
  CONSTRAINT `t_booksell_ibfk_1` FOREIGN KEY (`bookClassObj`) REFERENCES `t_bookclass` (`bookClassId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_booksell
-- ----------------------------
INSERT INTO `t_booksell` VALUES ('1', 'upload/def6d2e1-4a34-44ac-a579-dd6e998fc16b.jpg', '新闻摄影教程-第四版', '1', '中国人民大学出版社', '盛希贵', '30', '9成新', '<h2 class=\"tit\" style=\"margin: 0px; padding: 0px; border: 1px solid rgb(233, 233, 233); width: 102px; height: 32px; background: rgb(245, 245, 245); font-weight: normal; text-align: center; line-height: 32px; font-family: Arial, Verdana, 宋体; white-space: normal;\"><span style=\"margin: 0px; padding: 0px; border: 0px; color: rgb(51, 51, 51); font-weight: bold; font-size: 16px; font-family: &quot;Microsoft YaHei&quot;;\">本书特色</span></h2><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 15px 25px 0px 22px; border: 0px; line-height: 24px; color: rgb(102, 102, 102); font-size: 14px; font-family: Arial, Verdana, 宋体; white-space: normal; background-color: rgb(255, 255, 255);\">　　《“十二五”普通高等教育本科国家级规划教材·教育部普通高等教育精品教材：新闻摄影教程（第4版）》分为新闻摄影理论、新闻摄影实务和新闻摄影技术三部分，基本囊括了新闻摄影从发展历史、基本理论到实际操作全过程的细部知识，尤其是案例的穿插更增添了《“十二五”普通高等教育本科国家级规划教材·教育部普通高等教育精品教材：新闻摄影教程（第4版）》的可读性。与前三版相比，第四版有以下变化：第一，内容更加新鲜、实用。理论部分更加突出学术性，实务部分和技术部分更加注重实用性和可操作性，案例部分做了更新和增补。第二，呼应媒介融合时代的现实需求，增加了新媒体视觉传播的内容。就ipad摄影、手机摄影、社交网络兴起对新闻摄影发展的影响展开论述，将“新闻图示”单独列为一节。第三，用大事记的方式呈现历史。从技术发展和新闻摄影事业发展两个维度，按照年代梳理摄影发展历程，制成图表式附录“新闻摄影发展纪事”。</p><p><br/></p>', 'user1', '2017-12-18 23:48:11');
INSERT INTO `t_booksell` VALUES ('2', 'upload/NoImage.jpg', '222', '1', '33', '55', '44', '66', '<p>fasfasf</p>', 'user1', '2017-12-19 04:27:019');

-- ----------------------------
-- Table structure for `t_leaveword`
-- ----------------------------
DROP TABLE IF EXISTS `t_leaveword`;
CREATE TABLE `t_leaveword` (
  `leaveWordId` int(11) NOT NULL auto_increment COMMENT '留言id',
  `leaveTitle` varchar(80) NOT NULL COMMENT '留言标题',
  `leaveContent` varchar(2000) NOT NULL COMMENT '留言内容',
  `userObj` varchar(30) NOT NULL COMMENT '留言人',
  `leaveTime` varchar(20) default NULL COMMENT '留言时间',
  `replyContent` varchar(1000) default NULL COMMENT '管理回复',
  `replyTime` varchar(20) default NULL COMMENT '回复时间',
  PRIMARY KEY  (`leaveWordId`),
  KEY `userObj` (`userObj`),
  CONSTRAINT `t_leaveword_ibfk_1` FOREIGN KEY (`userObj`) REFERENCES `t_userinfo` (`user_name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_leaveword
-- ----------------------------
INSERT INTO `t_leaveword` VALUES ('1', '太好了，买书无忧了', '有了这个平台，以后可以淘到好书了', 'user1', '2017-12-18 23:50:45', '很好！', '2017-12-19 05:17:13');
INSERT INTO `t_leaveword` VALUES ('2', '111', '222', 'user1', '2017-12-19 05:16:45', 'test', '2017-12-19 05:17:01');

-- ----------------------------
-- Table structure for `t_notice`
-- ----------------------------
DROP TABLE IF EXISTS `t_notice`;
CREATE TABLE `t_notice` (
  `noticeId` int(11) NOT NULL auto_increment COMMENT '公告id',
  `title` varchar(80) NOT NULL COMMENT '标题',
  `content` varchar(5000) NOT NULL COMMENT '公告内容',
  `publishDate` varchar(20) default NULL COMMENT '发布时间',
  PRIMARY KEY  (`noticeId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_notice
-- ----------------------------
INSERT INTO `t_notice` VALUES ('1', '二手书平台开通了', '<h2>同学们以后来这里交易图书信息吧！</h2>', '2017-12-18 23:38:35');

-- ----------------------------
-- Table structure for `t_userinfo`
-- ----------------------------
DROP TABLE IF EXISTS `t_userinfo`;
CREATE TABLE `t_userinfo` (
  `user_name` varchar(30) NOT NULL COMMENT 'user_name',
  `password` varchar(100) NOT NULL COMMENT '登录密码',
  `name` varchar(20) NOT NULL COMMENT '姓名',
  `gender` varchar(4) NOT NULL COMMENT '性别',
  `birthDate` varchar(20) default NULL COMMENT '出生日期',
  `userPhoto` varchar(60) NOT NULL COMMENT '用户照片',
  `telephone` varchar(20) NOT NULL COMMENT '联系电话',
  `email` varchar(50) NOT NULL COMMENT '邮箱',
  `address` varchar(80) default NULL COMMENT '家庭地址',
  `regTime` varchar(20) default NULL COMMENT '注册时间',
  PRIMARY KEY  (`user_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_userinfo
-- ----------------------------
INSERT INTO `t_userinfo` VALUES ('user1', '$2a$10$FxAcoHcbrexH6Lq61O3jAe41LhgGw7QF2jiemXmc451vRxngfQd7m', '双鱼林', '男', '2017-12-01', 'upload/fc4c7dc8-c2d5-4527-8ba7-bb83e2c090e4.jpg', '13589834234', 'syl@163.com', '四川成都红星路', '2017-12-18 23:39:38');
INSERT INTO `t_userinfo` VALUES ('user2', '$2a$10$Q3p5vhW0vZO3ihn8bFJThOnb6hiTaT32f8b/9RYP6MhH2HdSDizEy', '李倩', '女', '2017-12-14', 'upload/NoImage.jpg', '13573598343', 'liqian@163.com', '四川成都广元市', '2017-12-19 05:26:17');
