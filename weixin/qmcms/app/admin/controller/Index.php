<?php
namespace app\admin\controller;
use app\admin\controller\Comm;


class Index extends Comm
{
    public function index()
    {
        $mb='index';//模板是小写字母
        $html=$this->fetch($mb);
        return $html;
    }


}
