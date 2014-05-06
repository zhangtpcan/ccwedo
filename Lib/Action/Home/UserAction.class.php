<?php
class UserAction extends Action {
	
	public $userModel;

	public $companyModel;

	public $adminModel;
	
	public $userGroupModel;

	public function __construct() {
		parent :: __construct();
		if(trim($_REQUEST['_URL_'][1]) != 'logout' && !checkLogin()) {
			$this->redirect('/Index/login');
		}
		$this->userModel = M("user");
		$this->companyModel = M("company");
		$this->userGroupModel = M("user_group");
	}

	public function _empty() {
		$this->redirect('/Index/login');
	}

    public function uList(){
    	CCwarn('需谨慎操作！', '111');
		$condition = " disable = 1 ";
		$keyword = trim(getParam("keyword"));
		if (trim(getParam("keyword")) != '') {
			$condition .= " AND uname like '%{$keyword}%'";
		}
		$userInfo = $uRole = array();
		import('ORG.Util.Page');
		$condition .= " AND uType = 2 ";
		$count = $this->userModel->where($condition)->count();
		$Page = new Page($count, 10);
		$show = $Page->show();
		$userInfo = $this->userModel->where($condition)->limit($Page->firstRow.','.$Page->listRows)->select();
		foreach ($userInfo as $key => $val) {
			$uRole[] = $val['gid'];
		}
		$compid = getCompid();
		$uRoles = $this->userGroupModel->where("gid in ('" . implode("','", $uRole) . "') AND compid = {$compid}")->select();
		if (!$uRoles) {
			$this->assign('NOUSER', true);
		}
		foreach ($userInfo as $keys => &$vals) {
			foreach ($uRoles as $num => $values) {
				if ((int)$vals['gid'] == $values['gid']) {
					$vals['typeName'] = trim($values['gname']);
				}
			}
		}
		$this->assign("page", $show);
		$this->assign("count", $count);
		$this->assign("user", $userInfo);
		$this->display();
    }
	
	public function uAdd() {
		if (!check_submit(getParam('hash'))) {
			$userRoles = array();
			$userRoles = $this->userGroupModel->select();
			$this->assign('userRoles', $userRoles);
			$this->display();
		} else {
			$param['uname'] = trim(getParam("uname"));
			$param['password'] = md5(trim(getParam("password")));
			$param['utype'] = (int)getParam("utype");
			$param['uemail'] = trim(getParam("uemail"));
			try {
				$uid = $this->userModel->add($param);
			} catch (Exception $e) {
				return $this->error("创建用户失败，未知错误！");
			}
			if ($uid) {
				$this->success("创建用户成功！");
			} else {
				$this->error("创建用户失败！");
			}
		}
	}
	
	public function uGroup() {
		$this->display("uAdd");
	}

	public function addGroup() {
		$this->display("uAdd");
	}

	public function permissions() {
		$this->display("uAdd");
	}

	public function uInfo() {
		$this->display("uAdd");
	}
	public function login() {
		if (!check_submit(getParam("hash"))) {
			$this->display("login");
		} else {
			$username = trim(getParam('username'));
			$password = MD5(trim(getParam('password')));
			if ($username != '' && $password ) {
				$userInfo = M("user")->query("SELECT u.*, c.compname company, c.compid FROM cc_user u LEFT JOIN cc_company c ON u.compid=c.compid WHERE u.uname = '{$username}' AND u.upassword = '{$password}' limit 1");
				#$info = array('uname'=>'apeng', 'uid'=>1, 'company'=>'CC维度网络工作室', 'utype' => 1, 'compid'=>1);
				#$info = array('uname'=>'apeng', 'uid'=>2, 'company'=>'CC维度网络工作室', 'utype' => 2, 'compid'=>1);
				if($userInfo && (int)$userInfo[0]['uid'] > 0) {
					setSession($userInfo[0]);
					$this->redirect('/Content/index');
				} else {
					$this->error("用户名密码输入错误，请重新输入！");
				}
			} else {
				$this->error("用户信息输入错误，请重新输入！");
			}
		}
	}

	public function logout(){
		setSessionEmpty();
		$this->redirect('/');
	}
}