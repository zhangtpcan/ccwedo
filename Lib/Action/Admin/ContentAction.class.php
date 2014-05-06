<?php
// 本类由系统自动生成，仅供测试用途
class ContentAction extends Action {

	public function __construct() {
		parent :: __construct();
		if(!checkLogin()) {
			$this->redirect('/Admin/Index/login');
		}
	}

    public function index(){
		$this->display("index");
    }
}