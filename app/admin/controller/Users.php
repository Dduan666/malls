<?php
namespace app\admin\controller;
use tests\thinkphp\library\think\dbTest;
use \think\Controller;
use \org\auth;
class Users extends Common
{
    //管理员列表页面
    public function admin_list()
    {
        $data = db('admin_user')
//            -> alias('a')
//            -> join('ma_auth_group b','a.admin_rule = b.id','left')
//            -> field('a.*,b.title')
            -> select();
//        return $this -> getLastsql();
        $this -> assign('data',$data);
        return $this -> fetch();
    }
    //添加管理员页面
    public function admin_add()
    {
        if($_POST){
            $admin_user = db('admin_user');
            $data['admin_name'] = $_POST['admin_name'];
            $data['admin_password'] = md5($_POST['admin_password']);
            $data['sex'] = $_POST['sex'];
            $data['phone'] = $_POST['phone'];
            $data['email'] = $_POST['email'];
            $data['group_id'] = $_POST['group_id'];
            $data['admin_remark'] = $_POST['admin_remark'];
            $data['add_time'] = 1;
            $repname = $admin_user -> where("admin_name='".$data['admin_name']."'") -> find();

            if (!$repname){
                $res1 = $admin_user -> insert($data); //   将信息添加到管理员表中
                $group['uid'] = $admin_user -> getLastInsID(); //  获取最后一次插入表中的id
                $group['group_id'] = $_POST['group_id'];
                $res2 = db('auth_group_access') -> insert($group);  //  分组数据库
                if ($res1 && $res2){
                    return $this -> success('成功','users/admin_add',3);
                }else{
                    return $this -> error('失败');
                }

            }else{
                return $this -> error('当前用户名已存在！');
            }
        }else{
            $data = db('auth_group') -> field('id,title') -> select();
            $this -> assign('data',$data);
            return $this -> fetch();
        }
    }
    //权限列表页面
    public function admin_permission()
    {
        $data = db('auth_rule') -> select();
        $this -> assign('data',$data);
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

    //修改权限页面
    public function admin_permission_edit()
    {
        return $this -> fetch();
    }
    //角色列表页面
    public function admin_role()
    {
        $data = db('auth_group') -> select();
        $this -> assign('data',$data);
        return $this -> fetch();
    }
    //添加角色页面
    public function admin_role_add()
    {
            $data = db('auth_rule') -> field('id,name,title') -> select();
            $this -> assign('data',$data);
            return $this -> fetch();

    }
    //添加角色到数据库
    public function admin_role_add_user()
    {
        $data['title'] = $_POST['roleName'];
        if(!empty($_POST['id'])){
            $data['rules'] = implode(",", $_POST['check']);
        }
        $data['status'] = 1;
        $data['text'] = $_POST['roleText'];
        $resule = db('auth_group') -> insert($data);
        if ($resule){
            return $this -> success('成功','admin_role_add','3');
        }else{
            return $this -> error('失败');
        }
    }

    public function admin_role_del()
    {
        $resule = db('auth_group') -> where("id=".$_POST['id']) ->delete();
        if($resule){
            return 1;
        }else{
            return 2;
        }
    }
}