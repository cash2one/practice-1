<?php
function is_mobile() {
    $user_agent = $_SERVER['HTTP_USER_AGENT'];$mobile_agents = Array("240x320","acer","acoon","acs-","abacho","ahong","airness","alcatel","amoi","android","anywhereyougo.com","applewebkit/525","applewebkit/532","asus","audio","au-mic","avantogo","becker","benq","bilbo","bird","blackberry","blazer","bleu","cdm-","compal","coolpad","danger","dbtel","dopod","elaine","eric","etouch","fly ","fly_","fly-","go.web","goodaccess","gradiente","grundig","haier","hedy","hitachi","htc","huawei","hutchison","inno","ipad","ipaq","ipod","jbrowser","kddi","kgt","kwc","lenovo","lg ","lg2","lg3","lg4","lg5","lg7","lg8","lg9","lg-","lge-","lge9","longcos","maemo","mercator","meridian","micromax","midp","mini","mitsu","mmm","mmp","mobi","mot-","moto","nec-","netfront","newgen","nexian","nf-browser","nintendo","nitro","nokia","nook","novarra","obigo","palm","panasonic","pantech","philips","phone","pg-","playstation","pocket","pt-","qc-","qtek","rover","sagem","sama","samu","sanyo","samsung","sch-","scooter","sec-","sendo","sgh-","sharp","siemens","sie-","softbank","sony","spice","sprint","spv","symbian","tablet","talkabout","tcl-","teleca","telit","tianyu","tim-","toshiba","tsm","up.browser","utec","utstar","verykool","virgin","vk-","voda","voxtel","vx","wap","wellco","wig browser","wii","windows ce","wireless","xda","xde","zte");
    $is_mobile = false;
    foreach ($mobile_agents as $device) {if (stristr($user_agent, $device)) {$is_mobile = true;break;}}
    return $is_mobile;
}
$url=$_SERVER['REQUEST_URI'];
//echo "<!--".$url."-->";
/*判断是否是前端其它交互式程序 比如表单提交 根据特殊网址判断即可*/
function do_open($url)
{
    $array_open=array('vouch','msg29','msg8','admin','?cs','zan','hit','msg9');
    foreach ($array_open as $ky) {if ($url!=str_replace('/'.$ky,'',$url)){return true;}}
    return false;
}
if (!do_open($url))
{
    $urls2=$url;
    $url=str_replace('%','',$url);
    $url=str_replace('"','',$url);
    $url=str_replace(' ','',$url);
    $url=str_replace("'","",$url);
    $url=str_replace('index.php/index/index/url', '', $url);
    $url=str_replace('index.php', '', $url);
    $url=str_replace(".htm5",".html",$url);
    $str1=substr($url,0,1);
    if ($str1=='/'){$url=substr($url,1,strlen($url)-1);}
    if ($url==str_replace('.html','',$url))
    {
        $url.='/index.html';$url=str_replace('//', '/', $url);
    }
    $str1=substr($url,0,1);
    if ($str1=='/'){$url=substr($url,1,strlen($url)-1);}
    $urls=explode('?',$url);
    $url=$urls[0];
    if ($url=='index.html' || $url==''){$url='home.html';}
    //echo "<!--".$url."-->";
    $url=str_replace('/','_fg_',$url);
    $url=APP_HTML.$url;
    $HTMLURL=$url;
    if (file_exists($url) && $url!=str_replace('.htm','',$url))
    {  
        //如果有手机端才启用
        if (is_mobile()){$url=str_replace('.html','.htm',$url);}
        if (file_exists($url))
        {
            $contents = file_get_contents($url);
            echo $contents;
            /*运行时间*/
            $runtime_stop = microtime(true);  
            echo "<!--by www.quanmeicm.net/?".round($runtime_stop-$runtime_start,6)." -->";
            exit();
        }
    }
}