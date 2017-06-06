<?php
namespace app\admin\controller;
use \think\Controller;
use \org\Auth;
class Common extends Controller
{
    //当任何函数加载的时候 会调用此函数
    public function _initalize()  //磨人的方法 会自动执行 特征像构造方法
    {
        $uid = session('user')['id'];
        if(empty($uid)){
            return $this -> error('您还没有登录','login/login','3');
        }

        $AUTH = new \org\Auth();
    }
}