<?php
$menusConfig = array(
	'用户管理' => array(
		'action' => 'User',
		'1' => array(
			'name' => '用户列表',
			'method' => 'uList',
		),
		'2' => array(
			'name' => '添加用户',
			'method' => 'uAdd',
		),
		'3' => array(
			'name' => '部门管理',
			'method' => 'uGroup',
		),
		'4' => array(
			'name' => '添加部门',
			'method' => 'addGroup',
		),
		'5' => array(
			'name' => '权限设置',
			'method' => 'permissions',
		),
		'6' => array(
			'name' => '信息设置',
			'method' => 'uInfo',
		),
	),
	'企业信息管理' => array(
		'action' => 'Company',
		'1' => array(
			'name' => '公司LOGO',
			'method' => 'clogo',
			
		),
		'2' => array(
			'name' => '公司信息',
			'method' => 'cInfo',
			
		),
		'3' => array(
			'name' => '域名设置',
			'method' => 'cdomin',
			
		),
	),
	'共享文件管理' => array(
		'action' => 'File',
		'1' => array(
			'name' => '文件列表',
			'method' => 'fList',
			
		),
		'2' => array(
			'name' => '上传文件',
			'method' => 'fAdd',
			
		),
	),
	'项目管理' => array(
		'action' => 'Object',
		'1' => array(
			'name' => '项目列表',
			'method' => 'oList',
			
		),
		'2' => array(
			'name' => '添加项目',
			'method' => 'oAdd',
			
		),
	),
	'消息管理' => array(
		'action' => 'Message',
		'1' => array(
			'name' => '消息列表',
			'method' => 'mList',
		),
		'2' => array(
			'name' => '推送消息',
			'method' => 'mPush',
			
		),
		'3' => array(
			'name' => '及时聊天',
			'method' => 'mTalk',
			
		),
	
	),
	'会议室预订管理' => array(
		'action' => 'Office',
		'1' => array(
			'name' => '会议室列表',
			'method' => 'ofList',
		),
		'2' => array(
			'name' => '添加会议室',
			'method' => 'ofAdd',
			
		),
		'3' => array(
			'name' => '会议室预订',
			'method' => 'ofReserv',
		),
	),
	'贴吧管理' => array(
		'action' => 'Tieba',
		'1' => array(
			'name' => '贴吧列表',
			'method' => 'tList',
		),
		'2' => array(
			'name' => '发帖',
			'method' => 'tAdd',
			
		),
	),
	'成员管理' => array(
		'action' => 'ShowUser',
		'1' => array(
			'name' => '同组成员',
			'method' => 'tList',
		),
		'2' => array(
			'name' => '全部成员',
			'method' => 'tAdd',
			
		),
	),
	
);
?>