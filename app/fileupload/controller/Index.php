<?php
namespace app\fileupload\controller;
use think\Controller;
use org\upload;

class Index extends Controller
{
    public function index()
    {
        return $this -> fetch();
    }
    public function file_upload()
    {
        var_dump($_FILES);
    }
}
