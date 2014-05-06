<?php
	return array(
		'APP_DEBUG' => true, // 开启调试模式

		'DB_TYPE'=> 'mysql',          // 数据库类型

		'DB_HOST'=> 'localhost', // 数据库服务器地址

		'DB_NAME'=>'ccwedo',  // 数据库名称

		'DB_USER'=>'root', // 数据库用户名

		'DB_PWD'=>'', // 数据库密码

		'DB_PORT'=>'3306', // 数据库端口

		'DB_PREFIX'=>'cc_', // 数据表前缀
		
		'APP_GROUP_LIST' => 'Home,Admin', //项目分组设定
		
		'DEFAULT_GROUP'  => 'Home', //默认分组
		
		'TMPL_PARSE_STRING' => array(
				'__PUBLIC__' => SITE_URL.'/Public'
		),
			
		'DEFAULT_UPLOAD_DIR' => './Public/upload/',
			
		'UPLOAD_URL' => SITE_URL.'/Public/upload/',
);
?>