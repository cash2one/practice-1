<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006-2012 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: liu21st <liu21st@gmail.com>
// +----------------------------------------------------------------------

/**
 * Think ��׼ģʽ����������
 * @category   Think
 * @package  Common
 * @author   liu21st <liu21st@gmail.com>
 */

/**
 * �������
 * @param mixed $error ����
 * @return void
 */
function halt($error) {
    $e = array();
    if (APP_DEBUG) {
        //����ģʽ�����������Ϣ
        if (!is_array($error)) {
            $trace          = debug_backtrace();
            $e['message']   = $error;
            $e['file']      = $trace[0]['file'];
            $e['line']      = $trace[0]['line'];
            ob_start();
            debug_print_backtrace();
            $e['trace']     = ob_get_clean();
        } else {
            $e              = $error;
        }
    } else {
        //�����򵽴���ҳ��
        $error_page         = C('ERROR_PAGE');
        if (!empty($error_page)) {
            redirect($error_page);
        } else {
            if (C('SHOW_ERROR_MSG'))
                $e['message'] = is_array($error) ? $error['message'] : $error;
            else
                $e['message'] = C('ERROR_MESSAGE');
        }
    }
    // �����쳣ҳ��ģ��
    include C('TMPL_EXCEPTION_FILE');
    exit;
}

/**
 * �Զ����쳣����
 * @param string $msg �쳣��Ϣ
 * @param string $type �쳣���� Ĭ��ΪThinkException
 * @param integer $code �쳣���� Ĭ��Ϊ0
 * @return void
 */
function throw_exception($msg, $type='ThinkException', $code=0) {
    if (class_exists($type, false))
        throw new $type($msg, $code);
    else
        halt($msg);        // �쳣���Ͳ����������������Ϣ�ִ�
}

/**
 * ������Ѻõı������
 * @param mixed $var ����
 * @param boolean $echo �Ƿ���� Ĭ��ΪTrue ���Ϊfalse �򷵻�����ַ���
 * @param string $label ��ǩ Ĭ��Ϊ��
 * @param boolean $strict �Ƿ��Ͻ� Ĭ��Ϊtrue
 * @return void|string
 */
function dump($var, $echo=true, $label=null, $strict=true) {
    $label = ($label === null) ? '' : rtrim($label) . ' ';
    if (!$strict) {
        if (ini_get('html_errors')) {
            $output = print_r($var, true);
            $output = '<pre>' . $label . htmlspecialchars($output, ENT_QUOTES) . '</pre>';
        } else {
            $output = $label . print_r($var, true);
        }
    } else {
        ob_start();
        var_dump($var);
        $output = ob_get_clean();
        if (!extension_loaded('xdebug')) {
            $output = preg_replace('/\]\=\>\n(\s+)/m', '] => ', $output);
            $output = '<pre>' . $label . htmlspecialchars($output, ENT_QUOTES) . '</pre>';
        }
    }
    if ($echo) {
        echo($output);
        return null;
    }else
        return $output;
}

/**
 * 404���� 
 * ����ģʽ�����쳣 
 * ����ģʽ���洫��url��������ָ����תҳ�棬������404��Ϣ
 * @param string $msg ��ʾ��Ϣ
 * @param string $url ��תURL��ַ
 * @return void
 */
function _404($msg='',$url='') {
    APP_DEBUG && throw_exception($msg);
    if($msg && C('LOG_EXCEPTION_RECORD')) Log::write($msg);
    if(empty($url) && C('URL_404_REDIRECT')) {
        $url    =   C('URL_404_REDIRECT');
    }
    if($url) {
        redirect($url);
    }else{
        send_http_status(404);
        exit;
    }
}

/**
 * ���õ�ǰҳ��Ĳ���
 * @param string|false $layout �������� Ϊfalse��ʱ���ʾ�رղ���
 * @return void
 */
function layout($layout) {
    if(false !== $layout) {
        // ��������
        C('LAYOUT_ON',true);
        if(is_string($layout)) { // �����µĲ���ģ��
            C('LAYOUT_NAME',$layout);
        }
    }else{// ��ʱ�رղ���
        C('LAYOUT_ON',false);
    }
}

/**
 * URL��װ ֧�ֲ�ͬURLģʽ
 * @param string $url URL���ʽ����ʽ��'[����/ģ��/����#ê��@����]?����1=ֵ1&����2=ֵ2...'
 * @param string|array $vars ����Ĳ�����֧��������ַ���
 * @param string $suffix α��̬��׺��Ĭ��Ϊtrue��ʾ��ȡ����ֵ
 * @param boolean $redirect �Ƿ���ת���������Ϊtrue���ʾ��ת����URL��ַ
 * @param boolean $domain �Ƿ���ʾ����
 * @return string
 */
function U($url='',$vars='',$suffix=true,$redirect=false,$domain=false) {
    // ����URL
    $info   =  parse_url($url);
    $url    =  !empty($info['path'])?$info['path']:ACTION_NAME;
    if(isset($info['fragment'])) { // ����ê��
        $anchor =   $info['fragment'];
        if(false !== strpos($anchor,'?')) { // ��������
            list($anchor,$info['query']) = explode('?',$anchor,2);
        }        
        if(false !== strpos($anchor,'@')) { // ��������
            list($anchor,$host)    =   explode('@',$anchor, 2);
        }
    }elseif(false !== strpos($url,'@')) { // ��������
        list($url,$host)    =   explode('@',$info['path'], 2);
    }
    // ����������
    if(isset($host)) {
        $domain = $host.(strpos($host,'.')?'':strstr($_SERVER['HTTP_HOST'],'.'));
    }elseif($domain===true){
        $domain = $_SERVER['HTTP_HOST'];
        if(C('APP_SUB_DOMAIN_DEPLOY') ) { // ��������������
            $domain = $domain=='localhost'?'localhost':'www'.strstr($_SERVER['HTTP_HOST'],'.');
            // '������'=>array('��Ŀ[/����]');
            foreach (C('APP_SUB_DOMAIN_RULES') as $key => $rule) {
                if(false === strpos($key,'*') && 0=== strpos($url,$rule[0])) {
                    $domain = $key.strstr($domain,'.'); // ���ɶ�Ӧ������
                    $url    =  substr_replace($url,'',0,strlen($rule[0]));
                    break;
                }
            }
        }
    }

    // ��������
    if(is_string($vars)) { // aaa=1&bbb=2 ת��������
        parse_str($vars,$vars);
    }elseif(!is_array($vars)){
        $vars = array();
    }
    if(isset($info['query'])) { // ������ַ������� �ϲ���vars
        parse_str($info['query'],$params);
        $vars = array_merge($params,$vars);
    }
    
    // URL��װ
    $depr = C('URL_PATHINFO_DEPR');
    if($url) {
        if(0=== strpos($url,'/')) {// ����·��
            $route      =   true;
            $url        =   substr($url,1);
            if('/' != $depr) {
                $url    =   str_replace('/',$depr,$url);
            }
        }else{
            if('/' != $depr) { // ��ȫ�滻
                $url    =   str_replace('/',$depr,$url);
            }
            // �������顢ģ��Ͳ���
            $url        =   trim($url,$depr);
            $path       =   explode($depr,$url);
            $var        =   array();
            $var[C('VAR_ACTION')]       =   !empty($path)?array_pop($path):ACTION_NAME;
            $var[C('VAR_MODULE')]       =   !empty($path)?array_pop($path):MODULE_NAME;
            if($maps = C('URL_ACTION_MAP')) {
                if(isset($maps[strtolower($var[C('VAR_MODULE')])])) {
                    $maps    =   $maps[strtolower($var[C('VAR_MODULE')])];
                    if($action = array_search(strtolower($var[C('VAR_ACTION')]),$maps)){
                        $var[C('VAR_ACTION')] = $action;
                    }
                }
            }
            if($maps = C('URL_MODULE_MAP')) {
                if($module = array_search(strtolower($var[C('VAR_MODULE')]),$maps)){
                    $var[C('VAR_MODULE')] = $module;
                }
            }            
            if(C('URL_CASE_INSENSITIVE')) {
                $var[C('VAR_MODULE')]   =   parse_name($var[C('VAR_MODULE')]);
            }
            if(!C('APP_SUB_DOMAIN_DEPLOY') && C('APP_GROUP_LIST')) {
                if(!empty($path)) {
                    $group                  =   array_pop($path);
                    $var[C('VAR_GROUP')]    =   $group;
                }else{
                    if(GROUP_NAME != C('DEFAULT_GROUP')) {
                        $var[C('VAR_GROUP')]=   GROUP_NAME;
                    }
                }
                if(C('URL_CASE_INSENSITIVE') && isset($var[C('VAR_GROUP')])) {
                    $var[C('VAR_GROUP')]    =  strtolower($var[C('VAR_GROUP')]);
                }
            }
        }
    }

    if(C('URL_MODEL') == 0) { // ��ͨģʽURLת��
        $url        =   __APP__.'?'.http_build_query(array_reverse($var));
        if(!empty($vars)) {
            $vars   =   urldecode(http_build_query($vars));
            $url   .=   '&'.$vars;
        }
    }else{ // PATHINFOģʽ���߼���URLģʽ
        if(isset($route)) {
            $url    =   __APP__.'/'.rtrim($url,$depr);
        }else{
            $url    =   __APP__.'/'.implode($depr,array_reverse($var));
        }
        if(!empty($vars)) { // ��Ӳ���
            foreach ($vars as $var => $val){
                if('' !== trim($val))   $url .= $depr . $var . $depr . urlencode($val);
            }                
        }
        if($suffix) {
            $suffix   =  $suffix===true?C('URL_HTML_SUFFIX'):$suffix;
            if($pos = strpos($suffix, '|')){
                $suffix = substr($suffix, 0, $pos);
            }
            if($suffix && '/' != substr($url,-1)){
                $url  .=  '.'.ltrim($suffix,'.');
            }
        }
    }
    if(isset($anchor)){
        $url  .= '#'.$anchor;
    }
    if($domain) {
        $url   =  (is_ssl()?'https://':'http://').$domain.$url;
    }
    if($redirect) // ֱ����תURL
        redirect($url);
    else
        return $url;
}

/**
 * ��Ⱦ���Widget
 * @param string $name Widget����
 * @param array $data ����Ĳ���
 * @param boolean $return �Ƿ񷵻����� 
 * @param string $path Widget����·��
 * @return void
 */
function W($name, $data=array(), $return=false,$path='') {
    $class      =   $name . 'Widget';
    $path       =   empty($path) ? BASE_LIB_PATH : $path;
    require_cache($path . 'Widget/' . $class . '.class.php');
    if (!class_exists($class))
        throw_exception(L('_CLASS_NOT_EXIST_') . ':' . $class);
    $widget     =   Think::instance($class);
    $content    =   $widget->render($data);
    if ($return)
        return $content;
    else
        echo $content;
}

/**
 * ���������� ���ô�ֵ
 * @param string $name ����������
 * @param string $content Ҫ���˵�����
 * @return void
 */
function filter($name, &$content) {
    $class      =   $name . 'Filter';
    require_cache(BASE_LIB_PATH . 'Filter/' . $class . '.class.php');
    $filter     =   new $class();
    $content    =   $filter->run($content);
}

/**
 * �ж��Ƿ�SSLЭ��
 * @return boolean
 */
function is_ssl() {
    if(isset($_SERVER['HTTPS']) && ('1' == $_SERVER['HTTPS'] || 'on' == strtolower($_SERVER['HTTPS']))){
        return true;
    }elseif(isset($_SERVER['SERVER_PORT']) && ('443' == $_SERVER['SERVER_PORT'] )) {
        return true;
    }
    return false;
}

/**
 * URL�ض���
 * @param string $url �ض����URL��ַ
 * @param integer $time �ض���ĵȴ�ʱ�䣨�룩
 * @param string $msg �ض���ǰ����ʾ��Ϣ
 * @return void
 */
function redirect($url, $time=0, $msg='') {
    //����URL��ַ֧��
    $url        = str_replace(array("\n", "\r"), '', $url);
    if (empty($msg))
        $msg    = "ϵͳ����{$time}��֮���Զ���ת��{$url}��";
    if (!headers_sent()) {
        // redirect
        if (0 === $time) {
            header('Location: ' . $url);
        } else {
            header("refresh:{$time};url={$url}");
            echo($msg);
        }
        exit();
    } else {
        $str    = "<meta http-equiv='Refresh' content='{$time};URL={$url}'>";
        if ($time != 0)
            $str .= $msg;
        exit($str);
    }
}

/**
 * �������
 * @param mixed $name �������ƣ����Ϊ�����ʾ���л�������
 * @param mixed $value ����ֵ
 * @param mixed $options �������
 * @return mixed
 */
function S($name,$value='',$options=null) {
    static $cache   =   '';
    if(is_array($options) && empty($cache)){
        // ���������ͬʱ��ʼ��
        $type       =   isset($options['type'])?$options['type']:'';
        $cache      =   Cache::getInstance($type,$options);
    }elseif(is_array($name)) { // �����ʼ��
        $type       =   isset($name['type'])?$name['type']:'';
        $cache      =   Cache::getInstance($type,$name);
        return $cache;
    }elseif(empty($cache)) { // �Զ���ʼ��
        $cache      =   Cache::getInstance();
    }
    if(''=== $value){ // ��ȡ����
        return $cache->get($name);
    }elseif(is_null($value)) { // ɾ������
        return $cache->rm($name);
    }else { // ��������
        if(is_array($options)) {
            $expire     =   isset($options['expire'])?$options['expire']:NULL;
        }else{
            $expire     =   is_numeric($options)?$options:NULL;
        }
        return $cache->set($name, $value, $expire);
    }
}
// S�����ı��� �Ѿ��ϳ� ���ٽ���ʹ��
function cache($name,$value='',$options=null){
    return S($name,$value,$options);
}

/**
 * �����ļ����ݶ�ȡ�ͱ��� ��Լ��������� �ַ���������
 * @param string $name ��������
 * @param mixed $value ����ֵ
 * @param string $path ����·��
 * @return mixed
 */
function F($name, $value='', $path=DATA_PATH) {
    static $_cache  = array();
    $filename       = $path . $name . '.php';
    if ('' !== $value) {
        if (is_null($value)) {
            // ɾ������
            return false !== strpos($name,'*')?array_map("unlink", glob($filename)):unlink($filename);
        } else {
            // ��������
            $dir            =   dirname($filename);
            // Ŀ¼�������򴴽�
            if (!is_dir($dir))
                mkdir($dir,0755,true);
            $_cache[$name]  =   $value;
            return file_put_contents($filename, strip_whitespace("<?php\treturn " . var_export($value, true) . ";?>"));
        }
    }
    if (isset($_cache[$name]))
        return $_cache[$name];
    // ��ȡ��������
    if (is_file($filename)) {
        $value          =   include $filename;
        $_cache[$name]  =   $value;
    } else {
        $value          =   false;
    }
    return $value;
}

/**
 * ȡ�ö���ʵ�� ֧�ֵ�����ľ�̬����
 * @param string $name ����
 * @param string $method �����������Ϊ���򷵻�ʵ��������
 * @param array $args ���ò���
 * @return object
 */
function get_instance_of($name, $method='', $args=array()) {
    static $_instance = array();
    $identify = empty($args) ? $name . $method : $name . $method . to_guid_string($args);
    if (!isset($_instance[$identify])) {
        if (class_exists($name)) {
            $o = new $name();
            if (method_exists($o, $method)) {
                if (!empty($args)) {
                    $_instance[$identify] = call_user_func_array(array(&$o, $method), $args);
                } else {
                    $_instance[$identify] = $o->$method();
                }
            }
            else
                $_instance[$identify] = $o;
        }
        else
            halt(L('_CLASS_NOT_EXIST_') . ':' . $name);
    }
    return $_instance[$identify];
}

/**
 * ����PHP�������ͱ�������Ψһ��ʶ��
 * @param mixed $mix ����
 * @return string
 */
function to_guid_string($mix) {
    if (is_object($mix) && function_exists('spl_object_hash')) {
        return spl_object_hash($mix);
    } elseif (is_resource($mix)) {
        $mix = get_resource_type($mix) . strval($mix);
    } else {
        $mix = serialize($mix);
    }
    return md5($mix);
}

/**
 * XML����
 * @param mixed $data ����
 * @param string $root ���ڵ���
 * @param string $item �����������ӽڵ���
 * @param string $attr ���ڵ�����
 * @param string $id   ���������ӽڵ�keyת����������
 * @param string $encoding ���ݱ���
 * @return string
 */
function xml_encode($data, $root='think', $item='item', $attr='', $id='id', $encoding='utf-8') {
    if(is_array($attr)){
        $_attr = array();
        foreach ($attr as $key => $value) {
            $_attr[] = "{$key}=\"{$value}\"";
        }
        $attr = implode(' ', $_attr);
    }
    $attr   = trim($attr);
    $attr   = empty($attr) ? '' : " {$attr}";
    $xml    = "<?xml version=\"1.0\" encoding=\"{$encoding}\"?>";
    $xml   .= "<{$root}{$attr}>";
    $xml   .= data_to_xml($data, $item, $id);
    $xml   .= "</{$root}>";
    return $xml;
}

/**
 * ����XML����
 * @param mixed  $data ����
 * @param string $item ��������ʱ�Ľڵ�����
 * @param string $id   ��������keyת��Ϊ��������
 * @return string
 */
function data_to_xml($data, $item='item', $id='id') {
    $xml = $attr = '';
    foreach ($data as $key => $val) {
        if(is_numeric($key)){
            $id && $attr = " {$id}=\"{$key}\"";
            $key  = $item;
        }
        $xml    .=  "<{$key}{$attr}>";
        $xml    .=  (is_array($val) || is_object($val)) ? data_to_xml($val, $item, $id) : $val;
        $xml    .=  "</{$key}>";
    }
    return $xml;
}

/**
 * session������
 * @param string|array $name session���� ���Ϊ�������ʾ����session����
 * @param mixed $value sessionֵ
 * @return mixed
 */
function session($name,$value='') {
    $prefix   =  C('SESSION_PREFIX');
    if(is_array($name)) { // session��ʼ�� ��session_start ֮ǰ����
        if(isset($name['prefix'])) C('SESSION_PREFIX',$name['prefix']);
        if(C('VAR_SESSION_ID') && isset($_REQUEST[C('VAR_SESSION_ID')])){
            session_id($_REQUEST[C('VAR_SESSION_ID')]);
        }elseif(isset($name['id'])) {
            session_id($name['id']);
        }
        ini_set('session.auto_start', 0);
        if(isset($name['name']))            session_name($name['name']);
        if(isset($name['path']))            session_save_path($name['path']);
        if(isset($name['domain']))          ini_set('session.cookie_domain', $name['domain']);
        if(isset($name['expire']))          ini_set('session.gc_maxlifetime', $name['expire']);
        if(isset($name['use_trans_sid']))   ini_set('session.use_trans_sid', $name['use_trans_sid']?1:0);
        if(isset($name['use_cookies']))     ini_set('session.use_cookies', $name['use_cookies']?1:0);
        if(isset($name['cache_limiter']))   session_cache_limiter($name['cache_limiter']);
        if(isset($name['cache_expire']))    session_cache_expire($name['cache_expire']);
        if(isset($name['type']))            C('SESSION_TYPE',$name['type']);
        if(C('SESSION_TYPE')) { // ��ȡsession����
            $class      = 'Session'. ucwords(strtolower(C('SESSION_TYPE')));
            // ���������
            if(require_cache(EXTEND_PATH.'Driver/Session/'.$class.'.class.php')) {
                $hander = new $class();
                $hander->execute();
            }else {
                // ��û�ж���
                throw_exception(L('_CLASS_NOT_EXIST_').': ' . $class);
            }
        }
        // ����session
        if(C('SESSION_AUTO_START'))  session_start();
    }elseif('' === $value){ 
        if(0===strpos($name,'[')) { // session ����
            if('[pause]'==$name){ // ��ͣsession
                session_write_close();
            }elseif('[start]'==$name){ // ����session
                session_start();
            }elseif('[destroy]'==$name){ // ����session
                $_SESSION =  array();
                session_unset();
                session_destroy();
            }elseif('[regenerate]'==$name){ // ��������id
                session_regenerate_id();
            }
        }elseif(0===strpos($name,'?')){ // ���session
            $name   =  substr($name,1);
            if(strpos($name,'.')){ // ֧������
                list($name1,$name2) =   explode('.',$name);
                return $prefix?isset($_SESSION[$prefix][$name1][$name2]):isset($_SESSION[$name1][$name2]);
            }else{
                return $prefix?isset($_SESSION[$prefix][$name]):isset($_SESSION[$name]);
            }
        }elseif(is_null($name)){ // ���session
            if($prefix) {
                unset($_SESSION[$prefix]);
            }else{
                $_SESSION = array();
            }
        }elseif($prefix){ // ��ȡsession
            if(strpos($name,'.')){
                list($name1,$name2) =   explode('.',$name);
                return isset($_SESSION[$prefix][$name1][$name2])?$_SESSION[$prefix][$name1][$name2]:null;  
            }else{
                return isset($_SESSION[$prefix][$name])?$_SESSION[$prefix][$name]:null;                
            }            
        }else{
            if(strpos($name,'.')){
                list($name1,$name2) =   explode('.',$name);
                return isset($_SESSION[$name1][$name2])?$_SESSION[$name1][$name2]:null;  
            }else{
                return isset($_SESSION[$name])?$_SESSION[$name]:null;
            }            
        }
    }elseif(is_null($value)){ // ɾ��session
        if($prefix){
            unset($_SESSION[$prefix][$name]);
        }else{
            unset($_SESSION[$name]);
        }
    }else{ // ����session
        if($prefix){
            if (!is_array($_SESSION[$prefix])) {
                $_SESSION[$prefix] = array();
            }
            $_SESSION[$prefix][$name]   =  $value;
        }else{
            $_SESSION[$name]  =  $value;
        }
    }
}

/**
 * Cookie ���á���ȡ��ɾ��
 * @param string $name cookie����
 * @param mixed $value cookieֵ
 * @param mixed $options cookie����
 * @return mixed
 */
function cookie($name, $value='', $option=null) {
    // Ĭ������
    $config = array(
        'prefix'    =>  C('COOKIE_PREFIX'), // cookie ����ǰ׺
        'expire'    =>  C('COOKIE_EXPIRE'), // cookie ����ʱ��
        'path'      =>  C('COOKIE_PATH'), // cookie ����·��
        'domain'    =>  C('COOKIE_DOMAIN'), // cookie ��Ч����
    );
    // ��������(�Ḳ���a������)
    if (!is_null($option)) {
        if (is_numeric($option))
            $option = array('expire' => $option);
        elseif (is_string($option))
            parse_str($option, $option);
        $config     = array_merge($config, array_change_key_case($option));
    }
    // ���ָ��ǰ׺������cookie
    if (is_null($name)) {
        if (empty($_COOKIE))
            return;
        // Ҫɾ����cookieǰ׺����ָ����ɾ��config���õ�ָ��ǰ׺
        $prefix = empty($value) ? $config['prefix'] : $value;
        if (!empty($prefix)) {// ���ǰ׺Ϊ���ַ�������������ֱ�ӷ���
            foreach ($_COOKIE as $key => $val) {
                if (0 === stripos($key, $prefix)) {
                    setcookie($key, '', time() - 3600, $config['path'], $config['domain']);
                    unset($_COOKIE[$key]);
                }
            }
        }
        return;
    }
    $name = $config['prefix'] . $name;
    if ('' === $value) {
        if(isset($_COOKIE[$name])){
            $value =    $_COOKIE[$name];
            if(0===strpos($value,'think:')){
                $value  =   substr($value,6);
                return array_map('urldecode',json_decode(MAGIC_QUOTES_GPC?stripslashes($value):$value,true));
            }else{
                return $value;
            }
        }else{
            return null;
        }
    } else {
        if (is_null($value)) {
            setcookie($name, '', time() - 3600, $config['path'], $config['domain']);
            unset($_COOKIE[$name]); // ɾ��ָ��cookie
        } else {
            // ����cookie
            if(is_array($value)){
                $value  = 'think:'.json_encode(array_map('urlencode',$value));
            }
            $expire = !empty($config['expire']) ? time() + intval($config['expire']) : 0;
            setcookie($name, $value, $expire, $config['path'], $config['domain']);
            $_COOKIE[$name] = $value;
        }
    }
}

/**
 * ���ض�̬��չ�ļ�
 * @return void
 */
function load_ext_file() {
    // �����Զ����ⲿ�ļ�
    if(C('LOAD_EXT_FILE')) {
        $files      =  explode(',',C('LOAD_EXT_FILE'));
        foreach ($files as $file){
            $file   = COMMON_PATH.$file.'.php';
            if(is_file($file)) include $file;
        }
    }
    // �����Զ���Ķ�̬�����ļ�
    if(C('LOAD_EXT_CONFIG')) {
        $configs    =  C('LOAD_EXT_CONFIG');
        if(is_string($configs)) $configs =  explode(',',$configs);
        foreach ($configs as $key=>$config){
            $file   = CONF_PATH.$config.'.php';
            if(is_file($file)) {
                is_numeric($key)?C(include $file):C($key,include $file);
            }
        }
    }
}

/**
 * ��ȡ�ͻ���IP��ַ
 * @param integer $type �������� 0 ����IP��ַ 1 ����IPV4��ַ����
 * @return mixed
 */
function get_client_ip($type = 0) {
	$type       =  $type ? 1 : 0;
    static $ip  =   NULL;
    if ($ip !== NULL) return $ip[$type];
    if (isset($_SERVER['HTTP_X_FORWARDED_FOR'])) {
        $arr    =   explode(',', $_SERVER['HTTP_X_FORWARDED_FOR']);
        $pos    =   array_search('unknown',$arr);
        if(false !== $pos) unset($arr[$pos]);
        $ip     =   trim($arr[0]);
    }elseif (isset($_SERVER['HTTP_CLIENT_IP'])) {
        $ip     =   $_SERVER['HTTP_CLIENT_IP'];
    }elseif (isset($_SERVER['REMOTE_ADDR'])) {
        $ip     =   $_SERVER['REMOTE_ADDR'];
    }
    // IP��ַ�Ϸ���֤
    $long = sprintf("%u",ip2long($ip));
    $ip   = $long ? array($ip, $long) : array('0.0.0.0', 0);
    return $ip[$type];
}

/**
 * ����HTTP״̬
 * @param integer $code ״̬��
 * @return void
 */
function send_http_status($code) {
    static $_status = array(
        // Informational 1xx
        100 => 'Continue',
        101 => 'Switching Protocols',
        // Success 2xx
        200 => 'OK',
        201 => 'Created',
        202 => 'Accepted',
        203 => 'Non-Authoritative Information',
        204 => 'No Content',
        205 => 'Reset Content',
        206 => 'Partial Content',
        // Redirection 3xx
        300 => 'Multiple Choices',
        301 => 'Moved Permanently',
        302 => 'Moved Temporarily ', // 1.1
        303 => 'See Other',
        304 => 'Not Modified',
        305 => 'Use Proxy',
        // 306 is deprecated but reserved
        307 => 'Temporary Redirect',
        // Client Error 4xx
        400 => 'Bad Request',
        401 => 'Unauthorized',
        402 => 'Payment Required',
        403 => 'Forbidden',
        404 => 'Not Found',
        405 => 'Method Not Allowed',
        406 => 'Not Acceptable',
        407 => 'Proxy Authentication Required',
        408 => 'Request Timeout',
        409 => 'Conflict',
        410 => 'Gone',
        411 => 'Length Required',
        412 => 'Precondition Failed',
        413 => 'Request Entity Too Large',
        414 => 'Request-URI Too Long',
        415 => 'Unsupported Media Type',
        416 => 'Requested Range Not Satisfiable',
        417 => 'Expectation Failed',
        // Server Error 5xx
        500 => 'Internal Server Error',
        501 => 'Not Implemented',
        502 => 'Bad Gateway',
        503 => 'Service Unavailable',
        504 => 'Gateway Timeout',
        505 => 'HTTP Version Not Supported',
        509 => 'Bandwidth Limit Exceeded'
    );
    if(isset($_status[$code])) {
        header('HTTP/1.1 '.$code.' '.$_status[$code]);
        // ȷ��FastCGIģʽ������
        header('Status:'.$code.' '.$_status[$code]);
    }
}

// ���˱��еı��ʽ
function filter_exp(&$value){
    if (in_array(strtolower($value),array('exp','or'))){
        $value .= ' ';
    }
}
