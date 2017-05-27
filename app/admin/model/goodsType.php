<?php
namespace \app\admin\model;
use think\model;
class Index extends model
{
    public function index()
    {
        $m = model('goods_type');
        var_dump($m);
    }
}



