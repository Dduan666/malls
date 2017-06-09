<?php
namespace app\admin\controller;
use think\Controller;
class Admin extends Common
{
    public function user(){
        return $this->fetch();
    }
    public function role(){
        return $this->fetch();
    }
}


