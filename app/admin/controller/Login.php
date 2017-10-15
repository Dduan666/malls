<?php
namespace app\admin\controller;
use tests\thinkphp\library\think\dbTest;
use \think\Controller;
class Login extends Controller
{
    //显示登录页面
    public function login()
    {
        $dd = md5('admin');
        return $this -> fetch();
    }
//    public function doLogin(){
//        $result = db('admin_user')
//            -> where("admin_name='".$_POST['admin_name']."' and admin_password='".md5($_POST['admin_password'])."'")
//            -> field('id,admin_name')
//            -> find();
//        if($result){
//            session('user',$result);
//            return $this -> success('登录成功','index/index',3);
//        }else{
//            return $this -> error('登录失败');
//        }
//    }
}