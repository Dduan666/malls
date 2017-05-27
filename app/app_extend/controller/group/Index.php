<?php
namespace app\app_extend\controller\group;
use \think\Controller;
class Index extends Controller
{
    public function index()
    {
        return $this->fetch();
    }
}
