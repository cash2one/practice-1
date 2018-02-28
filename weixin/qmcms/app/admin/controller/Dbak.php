<?php
namespace app\admin\controller;
use app\admin\controller\Comm;

class Dbak extends Comm
{
    public function index()
    {
        $html=$this->fetch();
        return $html;
    }

    

}
