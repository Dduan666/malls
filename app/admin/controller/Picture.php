<?php
namespace app\admin\controller;
use \think\Controller;
class Picture extends Controller
{
    public function picture_list()
{
    return $this -> fetch();
}
}