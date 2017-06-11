<?php
namespace app\admin\controller;
use \think\Controller;
use \org\Auth;
class Common extends Controller
{

    //当任何函数加载的时候 会调用此函数
    public function _initialize()  //磨人的方法 会自动执行 特征像构造方法
    {

        $uid = session('user')['id'];
        if(empty($uid)){
            return $this -> error('您还没有登录','login/login','3');
        }

        $AUTH = new Auth();
        dump($AUTH);die();
        // MODULE_NAME(index).'/'.CONTROLLER_NAME(index).'/'.ACTION_NAME(index)==index/index/index   //模块名、控制器名、方法名

        if(!$AUTH->check(MODULE_NAME.'/'.CONTROLLER_NAME.'/'.ACTION_NAME, session('user')['id'])){

            return $this -> error('没有权限','login/login',3);
        }
    }
}