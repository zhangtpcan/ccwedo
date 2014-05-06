<?php
function checkLogin() {
	if(getSession('uid') && trim(getSession('uname')) && trim(getSession('token')) == md5(getSession('uid') . trim(getSession('uname')))) {
		return true;
	} else {
		return false;
	}
}

function getSession($name){
	$prefix = MD5('ccwdo');
	return session($prefix . '_' . $name);
}

function setSession($user_info){
	$prefix = MD5('ccwdo');
	if ($user_info['uname']) {
		session($prefix.'_uname', $user_info['uname']);
	}
	if ($user_info['uid']) {
		session($prefix.'_uid', (int)$user_info['uid']);
		session("md5UID", md5((int)$user_info['uid']));
	}
	if ($user_info['utype']) {
		session($prefix.'_utype', (int)$user_info['utype']);
	}
	if ($user_info['company']) {
		session($prefix.'_company', $user_info['company']);
	}
	if ($user_info['compid']) {
		session($prefix.'_compid', $user_info['compid']);
	}
	if ($user_info['uid'] && $user_info['uname']) {
		session($prefix.'_token', md5($user_info['uid'].$user_info['uname']));
	}
	return true;
}

function setSessionEmpty($prefix = '') {
	$prefix = MD5('ccwdo');
	session($prefix.'_uname', null);
	session($prefix.'_uid', null);
	session($prefix.'_token', null);
	session($prefix.'_company', null);
	session($prefix.'_compid', null);
	session($prefix.'_utype', null);
	return true;
}

function getParam($name, $default = '') {
	$value = $_REQUEST[$name];
	if (!$value || empty($value)) {
		$value = $default;
	}
	return $value;
}

function check_submit($parse) {
	if ($parse != 'true') {
		return false;
	}
	return true;
}

function getUid() {
	$prefix = MD5("ccwdo");
	return (int)session($prefix . '_uid');
}

function getCompid() {
	$prefix = MD5("ccwdo");
	return (int)session($prefix . '_compid');

}

function get_user_info() {
	$prefix = MD5("ccwdo");
	$userInfo['uname'] = trim(session($prefix . '_uname'));
	$userInfo['uid'] = (int)session($prefix . '_uid');
	$userInfo['company'] = trim(session($prefix . '_company'));
	return $userInfo;
}

function getMenuConfig() {
	$perMenu =  array();
	include getcwd() . '/Common/menu.class.php';
	$perMenu = getPermission();
	if (is_array($perMenu) && !empty($perMenu)) {
		foreach($menusConfig as $key => &$val) {
			foreach ($val as $menu => $mval){
				foreach($perMenu as $per => $perVal) {
					if (trim($perVal['plurl']) == trim($val['action']. '/' .$mval['method'])) {
						unset($val[$menu]);
					}	
				}
			}
		}
	}
	foreach($menusConfig as $keys => $vals) {
		if (count($vals) <= 1) {
			unset($menusConfig[$keys]);
		}
	}
	return $menusConfig;
}

function getRoute() {
	$route = $_SERVER['PATH_INFO'];
	$routeArr = @explode('/', trim($route, '/'));
	$routerReturn['action'] = trim($routeArr[0]);
	$routerReturn['method'] = trim($routeArr[1]);
	return $routerReturn;
}

function getPermission() {
	$prefix = MD5('ccwdo');
	$uType = (int)session($prefix . "_utype");
	$uid = (int)session($prefix . "_uid");
	$compid = (int)session($prefix . "_compid");
	$perList = array();
	if((int)$uType == 1) {
		$persList = M("company_plugin")->where("compid = {$compid}")->find();
		if($persList && trim($persList['cpplugins']) != '') {
			$pers = implode("','", explode(',', trim($persList['cpplugins'])));
			$persInfo = M("plugin")->where("plid not in('". $pers ."') AND plstatus = 2")->select();
			return  $persInfo;
		} else{
			#TODO 数据出错，重新登录
			return false;
		}
	} else {
		$userInfo = M("user")->where("uid = {$uid} AND compid={$compid}")->find();
		if($userInfo && (int)$userInfo['gid'] > 0) {
			$groupInfo = M("user_group")->where("gid = {$userInfo['gid']} AND compid={$compid}")->find();
			$pers = implode("','", explode(',', trim($groupInfo['gpermission'])));
			$persInfo = M("plugin")->where("plid not in('". $pers ."') AND plstatus = 2")->select();
			return  $persInfo;
		} else{
			#TODO 数据出错，重新登录
			return false;
		}
	}
}

function CCerror($message, $url) {
	$errString = createHTML('error', $message);
	echo $errString;
}

function CCsuccess($message, $url) 	{
	$succString = createHTML('', $message);
	echo $succString;
}

function CCwarn($message, $url, $second = 3) {
	$warnString = createHTML('warn', $message);
	echo $warnString;
}

function createHTML($status = 'success', $message = '操作成功！') {
	if(trim($status) == 'error') {
		$htmlString = '<div class="alertMin"><div class="CCsuccess error png_bg"><a class="close" href="#"><img alt="close" title="Close this notification" src="'. SITE_URL .'/Public/images/icons/cross_grey_small.png"></a><div>'. $message .'</div></div></div>';
	} else if (trim($status) == 'warn') {
		$htmlString = '<div class="alertMin"><div class="CCsuccess attention png_bg"><a class="close" href="#"><img alt="close" title="Close this notification" src="'. SITE_URL .'/Public/images/icons/cross_grey_small.png"></a><div>'. $message .'</div></div></div>';
	}else {
		$htmlString = '<div class="alertMin"><div class="CCsuccess success png_bg"><a class="close" href="#"><img alt="close" title="Close this notification" src="'. SITE_URL .'/Public/images/icons/cross_grey_small.png"></a><div>'. $message .'</div></div></div>';
	}
	return $htmlString;
}

function createJS($url) {
	$jsString = <<<JSOBJ
	<script type="text/javascript">
	/*window.location.href="$url";*/
	alert(11111);
	</script>';
JSOBJ;
	return $jsString;
}
?>