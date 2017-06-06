<?php
namespace app\admin\controller;
use \think\Controller;
use \org\auth;
class Users extends Controller
{
    //管理员列表页面
    public function admin_list()
    {
        return $this -> fetch();
    }
    //添加管理员页面
    public function admin_add()
    {
        if($_POST){
            $data['admin_name'] = $_POST['admin_name'];
            $data['admin_password'] = md5($_POST['admin_password']);
            $data['sex'] = $_POST['sex'];
            $data['phone'] = $_POST['phone'];
            $data['email'] = $_POST['email'];
            $data['admin_rule'] = $_POST['admin_rule'];
            $data['admin_remark'] = $_POST['admin_remark'];
            $data['add_time'] = 1;
            $result = db('admin_user') -> insert($data);
            if($result){
                return $this -> success('成功','users/admin_add','3');
            }else{
                return $this -> error('失败','users/admin_add','3');
            }
        }else{
            $data = db('auth_rule') -> field('id,title') -> select();
            $this -> assign('data',$data);
            return $this -> fetch();
        }
    }
    //权限列表页面
    public function admin_permission()
    {
        return $this -> fetch();
    }
    //添加权限页面
    public function admin_permission_add()
    {
        if($_POST){
            $data['name'] = $_POST['name'];
            $data['title'] = $_POST['title'];
            $data['type'] = 1;
            $data['status'] = 1;
            $result = db('auth_rule') -> insert($data);
            if ($result){
                return $this -> success('success','users/admin_permission_add',1);
            }else{
                return $this -> error('error');
            }
        }else{
            return $this -> fetch();
        }

    }
    //角色列表页面
    public function admin_role()
    {
        return $this -> fetch();
    }
    //添加角色页面
    public function admin_role_add()
    {
        return $this -> fetch();
    }
}