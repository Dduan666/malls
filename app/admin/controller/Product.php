<?php
namespace app\admin\controller;
use think\Controller;

class product extends Controller
{
    public function product_add()
    {
        $goods_type = db('goods_type');
        $data = $goods_type
            -> field("*,concat(path,'-',id) as paths")
            -> order('paths')
            -> select();
        foreach ($data as $k => $v) {
            $data[$k]['name'] = str_repeat("|------",$v['level']).$v['name'];
        }
        $this -> assign('data',$data);
        return $this->fetch();
    }
    //添加商品
    public function product_add_goods()
    {
        $data['goodsname'] = $_POST['goodsname'];
        $tid = explode(',',$_POST['tid']);
        $data['tid'] = $tid[0];
        $data['tpid'] = $tid[1];
        $data['unit'] = $_POST['unit'];
        $data['attributes'] = $_POST['attributes'];
        $data['number'] = $_POST['number'];
        $data['curprice'] = $_POST['curprice'];
        $data['oriprece'] = $_POST['oriprece'];
        $data['cosprice'] = $_POST['cosprice'];
        $data['inventory'] = $_POST['inventory'];
        $data['restrict'] = $_POST['restrict'];
        $data['already'] = $_POST['already'];
        $data['freight'] = $_POST['freight'];
        $data['status'] = $_POST['status'];
        $data['reorder'] = $_POST['reorder'];
        $data['text'] = $_POST['text'];
        $data['imgpath'] = '';
        $goods = db('goods');
        $result = $goods -> insert($data);
        if ($result){
            $this -> success('添加成功','product_add','','2');
        }else{
            $this -> error('添加失败','product_add','','2');
        }

    }
    public function product_brand()
    {
        return $this->fetch();
    }
    //获取商品信息
    public function product_list()
    {
        $goods = db('goods');
        $data = $goods -> select();
        $this -> assign('data',$data);
        return $this->fetch();
    }

    //商品发布状态修改
    public function product_edit_status()
    {
        $data = explode(',',$_POST['arr']);
        $result = db('goods') -> where("id=".$data[0]) -> setField('status', "$data[1]");
    }

    //显示需要修改商品信息
    public function product_edit_goods()
    {
        $id = input('id');
        if(empty($_POST)){
            $goods = db('goods') -> find($id);
            $this -> assign('goods',$goods);
            $data = db('goods_type')
                -> field("*,concat(path,'-',id) as paths")
                -> order('paths')
                -> select();
            foreach ($data as $k => $v) {
                $data[$k]['name'] = str_repeat("|------",$v['level']).$v['name'];
            }
            $this -> assign('data',$data);
        }else{
            $data['goodsname'] = $_POST['goodsname'];
            $tid = explode(',',$_POST['tid']);
            $data['tid'] = $tid[0];
            $data['tpid'] = $tid[1];
            $data['unit'] = $_POST['unit'];
            $data['attributes'] = $_POST['attributes'];
            $data['number'] = $_POST['number'];
            $data['curprice'] = $_POST['curprice'];
            $data['oriprece'] = $_POST['oriprece'];
            $data['cosprice'] = $_POST['cosprice'];
            $data['inventory'] = $_POST['inventory'];
            $data['restrict'] = $_POST['restrict'];
            $data['already'] = $_POST['already'];
            $data['freight'] = $_POST['freight'];
            $data['status'] = $_POST['status'];
            $data['reorder'] = $_POST['reorder'];
            $data['text'] = $_POST['text'];
            $data['imgpath'] = '';
            $goods = db('goods');
            $result = $goods -> where("id=".$id) -> update($data);
            if ($result){
                $this -> success('修改成功','product_list','','2');
            }else{
                $this -> error('修改失败','product_edit_goods','','2');
            }
        }
        return $this -> fetch();
    }

    //删除商品
    public function product_del_goods()
    {
        $result = db('goods') -> delete($_POST['id']);
        if($result){
            return 6;
        }
    }

    public function product_category()
    {
        return $this->fetch();
    }
    //获取分类数据
    public function product_category_ajax()
    {
        $data = db('goods_type') -> field('id,name,pid') -> select();
        echo json_encode($data);
    }

    //删除分类
    public function product_category_del()
    {
        $id = $_GET['id'];
        $goods_type = db('goods_type');
        $data = $goods_type -> where("pid=".$id) -> find();
        if($data){
            $str = "分类下面还有子分类，不允许删除";
            echo json_encode($str);
        }else{
            $del = $goods_type -> delete($id);
            if($del){
                return 1;
            }
        }
    }


    public function product_category_add()
    {
        $goods_type = db('goods_type');
        $data = $goods_type
            -> field("*,concat(path,'-',id) as paths")
            -> order('paths')
            -> select();
        foreach ($data as $k => $v) {
            $data[$k]['name'] = str_repeat("|------",$v['level']).$v['name'];
        }
        $this -> assign('data',$data);
        return $this->fetch();
    }


    //添加分类到数据库
    public function goods_type_add()
    {
        $data['name'] = $_POST['name'];
        if($data['name']=="" || $data['name'] ==null){
            return '<script>alert("添加失败，内容不能为空！");location.href = "product_category_add";</script>';
        }
        $data['pid'] = $_POST['pid'];
        $goods_type = db('goods_type');
        if($data['pid'] != 0){
            $path = $goods_type -> field("path") -> find($data['pid']); //获取父id path路径
            $data['path'] = $path['path'];
            $data['level'] = substr_count($data['path'],'-');

            $goods_type -> insert($data);
            $pid = $goods_type -> getLastInsID();   //获取当前插入数据库的id

            $path['id'] = $pid;
            $path['path'] = $data['path'].'-'.$pid;
            $path['level'] = substr_count($path['path'],'-');
            $res = $goods_type -> update($path);
            if($res){
                return '<script>alert("success");location.href = "product_category_add";</script>';
            }else{
                return '<script>alert("error");location.href = "product_category_add";</script>';
            }
        }else{
            $data['path'] = $data['pid'];
            $data['level'] = 1;
            $goods_type -> insert($data);
            $pid = $goods_type -> getLastInsID();

            $path['id'] = $pid;
            $path['path'] = $data['path'].'-'.$pid;
            $res = $goods_type -> update($path);
            if($res){
                return '<script>alert("success");location.href = "product_category_add";</script>';
            }else{
                return '<script>alert("error");location.href = "product_category_add";</script>';
            }
        }

    }

}