-- phpMyAdmin SQL Dump
-- version 2.11.9.2
-- http://www.phpmyadmin.net
--
-- 主机: 127.0.0.1:3306
-- 生成日期: 2014 年 04 月 01 日 05:04
-- 服务器版本: 5.1.28
-- PHP 版本: 5.2.6

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `ccwedo`
--

-- --------------------------------------------------------

--
-- 表的结构 `cc_admin`
--

CREATE TABLE IF NOT EXISTS `cc_admin` (
  `adminuid` int(11) NOT NULL AUTO_INCREMENT COMMENT '超级管理员id',
  `adminuname` char(50) NOT NULL,
  `adminpassword` varchar(50) NOT NULL,
  `adminemail` varchar(50) NOT NULL,
  `adminphone` varchar(50) NOT NULL,
  PRIMARY KEY (`adminuid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- 导出表中的数据 `cc_admin`
--


-- --------------------------------------------------------

--
-- 表的结构 `cc_company`
--

CREATE TABLE IF NOT EXISTS `cc_company` (
  `compid` int(11) NOT NULL AUTO_INCREMENT,
  `compname` varchar(60) NOT NULL COMMENT '企业名称',
  `complogo` varchar(100) NOT NULL,
  `comptel` varchar(50) NOT NULL,
  `compphone` varchar(50) NOT NULL,
  `compemail` varchar(50) NOT NULL COMMENT '企业邮箱',
  `compadress` varchar(100) NOT NULL,
  `regtime` int(11) NOT NULL COMMENT '注册时间',
  `failuretime` int(11) NOT NULL COMMENT '失效时间',
  PRIMARY KEY (`compid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 导出表中的数据 `cc_company`
--

INSERT INTO `cc_company` (`compid`, `compname`, `complogo`, `comptel`, `compphone`, `compemail`, `compadress`, `regtime`, `failuretime`) VALUES
(1, 'CC维度网络工作室', '', '', '18600754451', 'ccwedo@163.com', '北京市海淀区', 1395812489, 0);

-- --------------------------------------------------------

--
-- 表的结构 `cc_company_plugin`
--

CREATE TABLE IF NOT EXISTS `cc_company_plugin` (
  `cpid` int(11) NOT NULL AUTO_INCREMENT,
  `compid` int(11) NOT NULL,
  `cpplugins` varchar(512) NOT NULL COMMENT '多个plid以逗号隔开',
  PRIMARY KEY (`cpid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 导出表中的数据 `cc_company_plugin`
--

INSERT INTO `cc_company_plugin` (`cpid`, `compid`, `cpplugins`) VALUES
(1, 1, '1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20');

-- --------------------------------------------------------

--
-- 表的结构 `cc_domin_name`
--

CREATE TABLE IF NOT EXISTS `cc_domin_name` (
  `dnid` int(11) NOT NULL,
  `compid` int(11) NOT NULL,
  `dndomin` varchar(255) NOT NULL,
  `disable` int(11) NOT NULL DEFAULT '1' COMMENT '是否允许 1 否 2 是',
  PRIMARY KEY (`dnid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 导出表中的数据 `cc_domin_name`
--


-- --------------------------------------------------------

--
-- 表的结构 `cc_file`
--

CREATE TABLE IF NOT EXISTS `cc_file` (
  `fid` int(11) NOT NULL AUTO_INCREMENT,
  `compid` int(11) NOT NULL,
  `foldname` varchar(100) NOT NULL,
  `fname` varchar(100) NOT NULL,
  `fpath` varchar(255) NOT NULL,
  `ftype` varchar(50) NOT NULL,
  PRIMARY KEY (`fid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- 导出表中的数据 `cc_file`
--


-- --------------------------------------------------------

--
-- 表的结构 `cc_gonggao`
--

CREATE TABLE IF NOT EXISTS `cc_gonggao` (
  `gid` int(11) NOT NULL AUTO_INCREMENT,
  `gtitle` varchar(55) NOT NULL,
  `gcontent` varchar(512) NOT NULL,
  `compid` int(11) NOT NULL,
  `createtime` int(11) NOT NULL,
  PRIMARY KEY (`gid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- 导出表中的数据 `cc_gonggao`
--


-- --------------------------------------------------------

--
-- 表的结构 `cc_message`
--

CREATE TABLE IF NOT EXISTS `cc_message` (
  `mid` int(11) NOT NULL,
  `compid` int(11) NOT NULL COMMENT '企业id',
  `mcontent` varchar(512) NOT NULL COMMENT '推送消息内容',
  `uid` int(11) NOT NULL,
  `mtime` int(11) NOT NULL COMMENT '推送时间',
  `mstatus` int(11) NOT NULL COMMENT '消息状态 1 未读 2 已读',
  PRIMARY KEY (`mid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 导出表中的数据 `cc_message`
--


-- --------------------------------------------------------

--
-- 表的结构 `cc_message_board`
--

CREATE TABLE IF NOT EXISTS `cc_message_board` (
  `mbid` int(11) NOT NULL AUTO_INCREMENT,
  `compid` int(11) NOT NULL,
  `mbcontent` varchar(512) NOT NULL,
  `fromuid` int(11) NOT NULL,
  `touid` int(11) NOT NULL,
  `createtime` int(11) NOT NULL,
  PRIMARY KEY (`mbid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- 导出表中的数据 `cc_message_board`
--


-- --------------------------------------------------------

--
-- 表的结构 `cc_object_detail`
--

CREATE TABLE IF NOT EXISTS `cc_object_detail` (
  `odid` int(11) NOT NULL AUTO_INCREMENT,
  `omid` int(11) NOT NULL,
  `oddescription` varchar(255) CHARACTER SET utf8 NOT NULL COMMENT '项目功能描述',
  `odprogress` varchar(60) CHARACTER SET utf8 NOT NULL COMMENT '完成进度',
  `odplanday` int(11) NOT NULL COMMENT '计划天数',
  `odrealday` int(11) NOT NULL COMMENT '实际天数',
  PRIMARY KEY (`odid`)
) ENGINE=MyISAM DEFAULT CHARSET=ucs2 AUTO_INCREMENT=1 ;

--
-- 导出表中的数据 `cc_object_detail`
--


-- --------------------------------------------------------

--
-- 表的结构 `cc_object_manage`
--

CREATE TABLE IF NOT EXISTS `cc_object_manage` (
  `omid` int(11) NOT NULL AUTO_INCREMENT,
  `compid` int(11) NOT NULL,
  `omtitle` varchar(255) NOT NULL,
  `omdescription` varchar(512) NOT NULL,
  `uid` int(11) NOT NULL COMMENT '创建人id',
  `omworker` varchar(255) NOT NULL COMMENT '项目参与者',
  `omleader` varchar(255) NOT NULL COMMENT '项目负责人',
  `omstarttime` int(11) NOT NULL,
  `omendtime` int(11) NOT NULL,
  `omfile` varchar(255) NOT NULL COMMENT '附件',
  PRIMARY KEY (`omid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- 导出表中的数据 `cc_object_manage`
--


-- --------------------------------------------------------

--
-- 表的结构 `cc_office`
--

CREATE TABLE IF NOT EXISTS `cc_office` (
  `oid` int(11) NOT NULL AUTO_INCREMENT,
  `oname` varchar(50) NOT NULL,
  `compid` int(11) NOT NULL,
  `osize` varchar(100) NOT NULL COMMENT '会议室大小',
  `onumber` int(11) NOT NULL COMMENT '会议室编号',
  PRIMARY KEY (`oid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- 导出表中的数据 `cc_office`
--


-- --------------------------------------------------------

--
-- 表的结构 `cc_office_resev`
--

CREATE TABLE IF NOT EXISTS `cc_office_resev` (
  `orid` int(11) NOT NULL AUTO_INCREMENT,
  `orname` varchar(50) NOT NULL COMMENT '预订人',
  `orreason` varchar(255) NOT NULL COMMENT '预订用途',
  `orstarttime` int(11) NOT NULL,
  `orendtime` int(11) NOT NULL,
  `ordescription` varchar(255) NOT NULL,
  PRIMARY KEY (`orid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- 导出表中的数据 `cc_office_resev`
--


-- --------------------------------------------------------

--
-- 表的结构 `cc_plugin`
--

CREATE TABLE IF NOT EXISTS `cc_plugin` (
  `plid` int(11) NOT NULL AUTO_INCREMENT,
  `plname` varchar(255) NOT NULL,
  `plurl` varchar(255) NOT NULL,
  `plstatus` int(11) NOT NULL DEFAULT '2' COMMENT '1为关闭 2为开启',
  PRIMARY KEY (`plid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=24 ;

--
-- 导出表中的数据 `cc_plugin`
--

INSERT INTO `cc_plugin` (`plid`, `plname`, `plurl`, `plstatus`) VALUES
(1, '用户列表', 'User/uList', 2),
(2, '添加用户', 'User/uAdd', 2),
(3, '角色管理', 'User/uGroup', 2),
(4, '添加角色', 'User/addGroup', 2),
(5, '权限设置', 'User/permissions', 2),
(6, '信息设置', 'User/uInfo', 2),
(7, '公司LOGO', 'Company/clogo', 2),
(8, '公司信息', 'Company/cInfo', 2),
(9, '域名设置', 'Company/cdomin', 2),
(10, '文件列表', 'File/fList', 2),
(11, '上传文件', 'File/fAdd', 2),
(12, '项目列表', 'Object/oList', 2),
(13, '添加项目', 'Object/oAdd', 2),
(14, '消息列表', 'Message/mList', 2),
(15, '推送消息', 'Message/mPush', 2),
(16, '及时聊天', 'Message/mTalk', 2),
(17, '会议室列表', 'Office/ofList', 2),
(18, '添加会议室', 'Office/ofAdd', 2),
(19, '会议室预订', 'Office/ofReserv', 2),
(20, '贴吧列表', 'Tieba/tList', 2),
(21, '发帖', 'Tieba/tAdd', 2),
(22, '同组成员', 'ShowUser/tList', 2),
(23, '全部成员', 'ShowUser/tAdd', 2);

-- --------------------------------------------------------

--
-- 表的结构 `cc_push_message`
--

CREATE TABLE IF NOT EXISTS `cc_push_message` (
  `pushid` int(11) NOT NULL AUTO_INCREMENT,
  `compid` int(11) NOT NULL,
  `pushcontent` varchar(512) NOT NULL,
  `pushto` varchar(512) NOT NULL,
  `pushtime` int(11) NOT NULL,
  PRIMARY KEY (`pushid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- 导出表中的数据 `cc_push_message`
--


-- --------------------------------------------------------

--
-- 表的结构 `cc_tieba`
--

CREATE TABLE IF NOT EXISTS `cc_tieba` (
  `tid` int(11) NOT NULL AUTO_INCREMENT,
  `compid` int(11) NOT NULL COMMENT '企业id',
  `tcontent` varchar(512) NOT NULL COMMENT '内容',
  `uid` int(11) NOT NULL COMMENT '发表用户',
  `good` int(11) NOT NULL DEFAULT '0' COMMENT '赞',
  `tfrom` int(11) NOT NULL COMMENT '是不是转载，转载的话这里是被转的tid，否则为空',
  PRIMARY KEY (`tid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- 导出表中的数据 `cc_tieba`
--


-- --------------------------------------------------------

--
-- 表的结构 `cc_user`
--

CREATE TABLE IF NOT EXISTS `cc_user` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `uname` varchar(50) NOT NULL,
  `upassword` varchar(50) NOT NULL,
  `ulogo` varchar(100) NOT NULL,
  `uqq` varchar(50) NOT NULL,
  `uphone` varchar(50) NOT NULL,
  `uemail` varchar(50) NOT NULL,
  `compid` int(11) NOT NULL,
  `gid` int(11) NOT NULL COMMENT '用户组id',
  `utype` int(11) NOT NULL COMMENT '1为企业管理员 2 为企业用户',
  PRIMARY KEY (`uid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- 导出表中的数据 `cc_user`
--

INSERT INTO `cc_user` (`uid`, `uname`, `upassword`, `ulogo`, `uqq`, `uphone`, `uemail`, `compid`, `gid`, `utype`) VALUES
(1, 'ccwdo', 'e65e70aafe320494e912cee0956693ff', '', '904812200', '18600754451', 'ccwedo@163.com', 1, 0, 1),
(2, 'apeng', 'e65e70aafe320494e912cee0956693ff', '', '904272926', '18600754451', 'zhangtpcan@163.com', 1, 1, 2);

-- --------------------------------------------------------

--
-- 表的结构 `cc_user_group`
--

CREATE TABLE IF NOT EXISTS `cc_user_group` (
  `gid` int(11) NOT NULL AUTO_INCREMENT,
  `compid` int(11) NOT NULL,
  `gname` varchar(50) NOT NULL COMMENT '分组名称',
  `gpermission` varchar(255) NOT NULL COMMENT '分组权限',
  PRIMARY KEY (`gid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 导出表中的数据 `cc_user_group`
--

INSERT INTO `cc_user_group` (`gid`, `compid`, `gname`, `gpermission`) VALUES
(1, 1, '企业用户', '1,2,3,4,5,6,7,8,9,10');
