<?php
namespace app\admin\controller;
use \think\Controller;
class Picture extends Common
{
    public function picture_list()
{
    return $this -> fetch();
}
}