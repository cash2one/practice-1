<?php

class Pages extends Think {
    // 起始行数
    public $firstRow;
    // 列表每页显示行数
    public $listRows;
	// 当前页数
    public $nowPage;
    // 页数跳转时要带的参数
    public $parameter;
    // 分页总页面数
    protected $totalPages;
    // 总行数
    protected $totalRows;
    
    // 分页的栏的总页数
    protected $coolPages;
    // 分页栏每页显示的页数
    protected $rollPage;
	// 分页显示定制
    protected $config  =	array('prev'=>'上一页','next'=>'下一页','first'=>'首页','last'=>'末页','theme'=>'%first%  %prevPage%  %linkPage%  %nextPage% %last%');

    /**
     +----------------------------------------------------------
     * 架构函数
     +----------------------------------------------------------
     * @access public
     +----------------------------------------------------------
     * @param array $totalRows  总的记录数
     * @param array $listRows  每页显示记录数
     * @param array $parameter  分页跳转的参数
     +----------------------------------------------------------
     */
    public function __construct($totalRows,$listRows,$parameter='') {
        $this->totalRows = $totalRows;
        $this->parameter = $parameter;
        $this->rollPage = C('PAGE_ROLLPAGE');
        $this->listRows = !empty($listRows)?$listRows:C('PAGE_LISTROWS');
        $this->totalPages = ceil($this->totalRows/$this->listRows);     //总页数
        $this->coolPages  = ceil($this->totalPages/$this->rollPage);
        $this->nowPage  = !empty($_GET['p'])?$_GET['p']:1;
        if(!empty($this->totalPages) && $this->nowPage>$this->totalPages) {
            $this->nowPage = $this->totalPages;
        }
        $this->firstRow = $this->listRows*($this->nowPage-1);
    }

    public function setConfig($name,$value) {
        if(isset($this->config[$name])) {
            $this->config[$name]    =   $value;
        }
    }

    /**
     +----------------------------------------------------------
     * 分页显示输出
     +----------------------------------------------------------
     * @access public
     +----------------------------------------------------------
     */
    public function show($para) {
        if(0 == $this->totalRows) return '';
        $p = C('VAR_PAGE');
        $nowCoolPage      = ceil($this->nowPage/$this->rollPage);
        $url  =  $_SERVER['REQUEST_URI'].(strpos($_SERVER['REQUEST_URI'],'?')?'':"?").$this->parameter;
        $parse = parse_url($url);
        if(isset($parse['query'])) {
            parse_str($parse['query'],$params);
            unset($params[$p]);
            $url   =  $parse['path'].'?'.http_build_query($params);
        }
        //上下翻页字符串
        $upRow   = $this->nowPage-1;
        $downRow = $this->nowPage+1;
		$firsttext=$this->config['first'];
		$prevtext=$this->config['prev'];
		$nexttext=$this->config['next'];
		$lasttext=$this->config['last'];
		
		$pageUrl=$url."?".$p;
		if ($para!=''){$pageUrl=$para."?p";}
		
		//首页 上一页
		if($this->nowPage==1){
			$firstPage="<a href='javascript:void(0)' class='tips'>{$firsttext}</a>";
			$prevPage="<a href='javascript:void(0)' class='tips'>{$prevtext}</a>";
		}else{
			$firstPage="<a href='{$pageUrl}=1' class='tips'>{$firsttext}</a>";
			$prevPage="<a href='{$pageUrl}={$upRow}' class='tips'>{$prevtext}</a>";
		}
		
		/*
		
		除首末后 页面分页逻辑
		
		*/
        //10页（含）以下
		$currnt="";
		$linkPage='';
		if($this->totalPages<=10)
		 {
			for($i=1;$i<=$this->totalPages;$i++)
			{
				$currnt=($i==$this->nowPage)?" class='current'":'';
				$linkPage.="<a href='{$pageUrl}={$i}'{$currnt}>$i</a>" ;
			}
		 }else	//10页以上
		 {
			if($this->nowPage<3)  //当前页小于3
		    {
				 for($i=1;$i<=3;$i++)
				 {
					$currnt=($i==$this->nowPage)?" class='current'":'';
					$linkPage.="<a href='{$pageUrl}={$i}'{$currnt}>$i</a>" ;
				 }
	             $linkPage.="<span class='dot'>……</span>";
				 for($i=$this->totalPages-3+1;$i<=$this->totalPages;$i++)
				 {
					$linkPage.="<a href='{$pageUrl}={$i}'>{$i}</a>" ;
				 }
		    }elseif($this->nowPage<=5){   //   5 >= 当前页 >= 3
				 for($i=1;$i<=($downRow);$i++){
					$currnt=($i==$this->nowPage)?" class='current'":'';
					$linkPage.="<a href='{$pageUrl}={$i}'{$currnt}>{$i}</a>" ;
				 }
				 $linkPage.="<span class='dot'>……</span>";
				 
				 for($i=$this->totalPages-3+1;$i<=$this->totalPages;$i++)
				 {
					$linkPage.="<a href='{$pageUrl}={$i}'>{$i}</a>" ;
				 }
				  
			}elseif(5<$this->nowPage&&$this->nowPage<=$this->totalPages-5){           //当前页大于5，同时小于总页数-5

				for($i=1;$i<=3;$i++)
				{
					$linkPage .="<a href='{$pageUrl}={$i}' >$i</a>";
				}
                $linkPage.="<span class='dot'>……</span>";			 
				for($i=$upRow;$i<=$downRow&&$i<=$this->totalPages-5+1;$i++)
				{
					$currnt=($i==$this->nowPage)?" class='current'":'';
					$linkPage .="<a href='{$pageUrl}={$i}'{$currnt}>$i</a>\n" ;
				}
				$linkPage.="<span class='dot'>……</span>";
				 
				for($i=$this->totalPages-3+1;$i<=$this->totalPages;$i++)
				{
					$linkPage .="<a href='{$pageUrl}={$i}'>$i</a>\n" ;
				}
			}else{
				 
				for($i=1;$i<=3;$i++)
				{
					 $linkPage .="<a href='{$pageUrl}={$i}'>$i</a>\n" ;
				}
                $linkPage.="<span class='dot'>……</span>\n";
				  
				for($i=$this->totalPages-5;$i<=$this->totalPages;$i++)//功能1
				{
					$currnt=($i==$this->nowPage)?" class='current'":'';
					$linkPage .="<a href='{$pageUrl}={$i}'{$currnt}>$i</a>\n" ;
				}
			}
		 }
		 
		 /*
		
		除首末后 页面分页逻辑结束
		
		*/
		
		//下一页 末页
		if($this->nowPage==$this->totalPages)
		{	
		    $nextPage="<a href='javascript:void(0)' class='tips'>$nexttext</a>" ;
			$lastPage="<a href='javascript:void(0)' class='tips'>$lasttext</a>";
		}else{
		 	$nextPage="<a href='{$pageUrl}=".$downRow."' class='tips'>$nexttext</a>";
			$lastPage="<a href='{$pageUrl}={$this->totalPages}' class='tips'>$lasttext</a>";
		}

        $pageStr=str_replace(
            array('%first%','%prevPage%','%linkPage%','%nextPage%','%last%'),
            array($firstPage,$prevPage,$linkPage,$nextPage,$lastPage),$this->config['theme']);
        return $pageStr;
    }

}
?>