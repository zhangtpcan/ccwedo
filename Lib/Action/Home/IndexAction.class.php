<?php
// 本类由系统自动生成，仅供测试用途
class IndexAction extends Action {
	
	public $userModel;

	public $companyModel;

	public $adminModel;
	
	public $userGroupModel;

	public function __construct() {
		parent :: __construct();
		if(trim($_REQUEST['_URL_'][1]) != 'logout' && checkLogin()) {
			$this->redirect('/Content/index');
		}
		$this->userModel = M("user");
		$this->companyModel = M("company");
		$this->adminModel = M("admin");
		$this->userGroupModel = M("user_group");
	}

    public function index(){
		$this->display("login");
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