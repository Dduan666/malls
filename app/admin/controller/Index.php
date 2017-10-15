<?php
namespace app\admin\controller;
//use app\admin\common;
class Index extends Common
{
    public function index()
    {

        return $this->fetch();

    }
    public function welcome()
{
    return $this -> fetch();
}
}
