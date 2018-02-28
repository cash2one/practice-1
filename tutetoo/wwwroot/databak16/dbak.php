<?php
function ExecTime(){
    $time = explode(" ", microtime());
    $usec = (double)$time[0];
    $sec = (double)$time[1];
    return $sec + $usec;
}
$t1=ExecTime();	
class DbManage {
    var $db; // 数据库连接
    var $database; // 所用数据库
    var $sqldir; // 数据库备份文件夹
    // 换行符
    private $ds = "\n";
    // 存储SQL的变量
    public $sqlContent = "";
    // 每条sql语句的结尾符
    public $sqlEnd = ";";
 
    function __construct($host = 'localhost', $username = 'root', $password = '', $database = '', $charset = 'utf8') {
        $this->host = $host;
        $this->username = $username;
        $this->password = $password;
        $this->database = $database;
        $this->charset = $charset;
        set_time_limit(0);//无时间限制
@ob_end_flush();
        // 连接数据库
			$this->db = @mysql_connect ( $this->host, $this->username, $this->password ) or die( '<p class="dbDebug"><span class="err">Mysql Connect Error : </span>'.mysql_error().'</p>');
			// 选择使用哪个数据库
			mysql_select_db ( $this->database, $this->db ) or die('<p class="dbDebug"><span class="err">Mysql Connect Error:</span>'.mysql_error().'</p>');
			// 数据库编码方式
			mysql_query ( 'SET NAMES ' . $this->charset, $this->db );

    }
 
    function getTables() {
        $res = mysql_query ( "SHOW TABLES" );
        $tables = array ();
        while ( $row = mysql_fetch_array ( $res ) ) {
            $tables [] = $row [0];
        }
        return $tables;
    }
 
    function backup($tablename = '', $dir, $size) {
        $dir = $dir ? $dir : './backup/'.date('y-m-d').'/'.$this->database.'/';
        // 创建目录
        if (! is_dir ( $dir )) {
            mkdir ( $dir, 0777, true ) or die ( '创建文件夹失败' );
        }
        $size = $size ? $size : 20480;
        $sql = '';
        // 只备份某个表
        if (! empty ( $tablename )) {
            if(@mysql_num_rows(mysql_query("SHOW TABLES LIKE '".$tablename."'")) == 1) {
             } else {
                $this->_showMsg('表-<b>' . $tablename .'</b>-不存在，请检查！',true);
                die();
            }
            $this->_showMsg('正在备份表 <span class="imp">' . $tablename.'</span>');
            // 插入dump信息
            $sql = $this->_retrieve ();
            // 插入表结构信息
            $sql .= $this->_insert_table_structure ( $tablename );
            // 插入数据
            $data = mysql_query ( "select * from " . $tablename );
            // 文件名前面部分
            $filename = date ( 'YmdHis' ) . "_" . $tablename;
            // 字段数量
            $num_fields = mysql_num_fields ( $data );
            // 第几分卷
            $p = 1;
            // 循环每条记录
            while ( $record = mysql_fetch_array ( $data ) ) {
                // 单条记录
                $sql .= $this->_insert_record ( $tablename, $num_fields, $record );
                // 如果大于分卷大小，则写入文件
                if (strlen ( $sql ) >= $size * 1024) {
                    $file = $filename . "_v" . $p . ".sql";
                    if ($this->_write_file ( $sql, $file, $dir )) {
                        $this->_showMsg("表-<b>" . $tablename . "</b>-卷-<b>" . $p . "</b>-数据备份完成,备份文件 [ <span class='imp'>" .$dir ."</span> ]");
                    } else {
                        $this->_showMsg("备份表 -<b>" . $tablename . "</b>- 失败",true);
                        return false;
                    }
                    // 下一个分卷
                    $p ++;
                    // 重置$sql变量为空，重新计算该变量大小
                    $sql = "";
                }
            }
            unset($data,$record);
            if ($sql != "") {
                $filename .= "_v" . $p . ".sql";
                if ($this->_write_file ( $sql, $filename, $dir )) {
                    $this->_showMsg( "表-<b>" . $tablename . "</b>-卷-<b>" . $p . "</b>-数据备份完成,备份文件 [ <span class='imp'>" .$dir ."</span> ]");
                } else {
                    $this->_showMsg("备份卷-<b>" . $p . "</b>-失败<br />");
                    return false;
                }
            }
            $this->_showMsg("恭喜您! <span class='imp'>备份成功</span>");
        } else {
            $this->_showMsg('正在备份');
            if ($tables = mysql_query ( "show table status from " . $this->database )) {
                $this->_showMsg("读取数据库结构成功！");
            } else {
                $this->_showMsg("读取数据库结构失败！");
				return false;
            }
            $sql .= $this->_retrieve ();
            $filename = date ( 'YmdHis' ) . "_all";
            $tables = mysql_query ( 'SHOW TABLES' );
            $p = 1;
            while ( $table = mysql_fetch_array ( $tables ) ) {
                $tablename = $table [0];
                $sql .= $this->_insert_table_structure ( $tablename );
                $data = mysql_query ( "select * from " . $tablename );
                $num_fields = mysql_num_fields ( $data );
 
                while ( $record = mysql_fetch_array ( $data ) ) {
                    $sql .= $this->_insert_record ( $tablename, $num_fields, $record );
                    if (strlen ( $sql ) >= $size * 1000) { 
                        $file = $filename . "_v" . $p . ".sql";
                        if ($this->_write_file ( $sql, $file, $dir )) {
                            $this->_showMsg("-卷-<b>" . $p . "</b>-数据备份完成,备份文件 [ <span class='imp'>".$dir."</span> ]");
                        } else {
                            $this->_showMsg("卷-<b>" . $p . "</b>-备份失败!",true);
                            return false;
                        }
                        $p ++;
                        $sql = "";
                    }
                }
            }
            if ($sql != "") {
                $filename .= "_v" . $p . ".sql";
                if ($this->_write_file ( $sql, $filename, $dir )) {
                    $this->_showMsg("-卷-<b>" . $p . "</b>-数据备份完成,备份文件 [ <span class='imp'>".$dir."</span> ]");
                } else {
                    $this->_showMsg("卷-<b>" . $p . "</b>-备份失败",true);
                    return false;
                }
            }
            $this->_showMsg("恭喜您! <span class='imp'>备份成功</span>");
        }
    }
 
    private function _showMsg($msg,$err=false){
        $err = $err ? "<span class='err'>ERROR:</span>" : '' ;
        echo "<p class='dbDebug'>".$err . $msg."</p>";
        flush();
 
    }
 
    private function _retrieve() {
        $value = '';
        $value .= '--' . $this->ds;
        $value .= '-- MySQL database dump' . $this->ds;
        $value .= '-- Created by wifiguanjia class, Power By quanmei. ' . $this->ds;
        $value .= '-- http://www.wifiguanjia.com ' . $this->ds;
        $value .= '--' . $this->ds;
        $value .= '-- 主机: ' . $this->host . $this->ds;
        $value .= '-- 生成日期: ' . date ( 'Y' ) . ' 年  ' . date ( 'm' ) . ' 月 ' . date ( 'd' ) . ' 日 ' . date ( 'H:i' ) . $this->ds;
        $value .= '-- MySQL版本: ' . mysql_get_server_info () . $this->ds;
        $value .= '-- PHP 版本: ' . phpversion () . $this->ds;
        $value .= $this->ds;
        $value .= '--' . $this->ds;
        $value .= '-- 数据库: `' . $this->database . '`' . $this->ds;
        $value .= '--' . $this->ds . $this->ds;
        $value .= '-- -------------------------------------------------------';
        $value .= $this->ds . $this->ds;
        return $value;
    }

    private function _insert_table_structure($table) {
        $sql = '';
        $sql .= "--" . $this->ds;
        $sql .= "-- 表的结构" . $table . $this->ds;
        $sql .= "--" . $this->ds . $this->ds;

        $sql .= "DROP TABLE IF EXISTS `" . $table . '`' . $this->sqlEnd . $this->ds;
        $res = mysql_query ( 'SHOW CREATE TABLE `' . $table . '`' );
        $row = mysql_fetch_array ( $res );
        $sql .= $row [1];
        $sql .= $this->sqlEnd . $this->ds;
        $sql .= $this->ds;
        $sql .= "--" . $this->ds;
        $sql .= "-- 转存表中的数据 " . $table . $this->ds;
        $sql .= "--" . $this->ds;
        $sql .= $this->ds;
        return $sql;
    }
 
    private function _insert_record($table, $num_fields, $record) {
        $insert = '';
        $comma = "";
        $insert .= "INSERT INTO `" . $table . "` VALUES(";
        for($i = 0; $i < $num_fields; $i ++) {
            $insert .= ($comma . "'" . mysql_escape_string ( $record [$i] ) . "'");
            $comma = ",";
        }
        $insert .= ");" . $this->ds;
        return $insert;
    }
 
    private function _write_file($sql, $filename, $dir) {
        $dir = $dir ? $dir : './backup/'.date('y-m-d').'/'.$this->database.'/';
		define('ROOTPATH',dirname ( __FILE__ ));
		$dir2 = ROOTPATH.'/backup/'.date('y-m-d').'/'.$this->database.'/';
        if (! is_dir ( $dir )) {
            mkdir ( $dir, 0777, true );
        }
        $re = true;
        if (! @$fp = fopen ( $dir . $filename, "w+" )) {
            $re = false;
            $this->_showMsg("打开sql文件失败！",true);
        }
        if (! @fwrite ( $fp, $sql )) {
            $re = false;
            $this->_showMsg("写入sql文件失败，请文件是否可写",true);
        }
        if (! @fclose ( $fp )) {
            $re = false;
            $this->_showMsg("关闭sql文件失败！",true);
        }
		
		
		$files_to_zip = array( 
			$dir2 . $filename
		); 
        return $re;
    }
 

    function restore($sqlfile) {
        if (! file_exists ( $sqlfile )) {
            $this->_showMsg("sql文件不存在！请检查",true);
            exit ();
        }
        $this->lock ( $this->database );
        $sqlpath = pathinfo ( $sqlfile );
        $this->sqldir = $sqlpath ['dirname'];
     
        $volume = explode ( "_v", $sqlfile );
        $volume_path = $volume [0];
        $this->_showMsg("请勿刷新及关闭浏览器以防止程序被中止，如有不慎！将导致数据库结构受损");
        $this->_showMsg("正在导入备份数据，请稍等！");
        if (empty ( $volume [1] )) {
            $this->_showMsg ( "正在导入sql：<span class='imp'>" . $sqlfile . '</span>');
            if ($this->_import ( $sqlfile )) {
                $this->_showMsg( "数据库导入成功！");
            } else {
                 $this->_showMsg('数据库导入失败！',true);
                exit ();
            }
        } else {
            $volume_id = explode ( ".sq", $volume [1] );
            $volume_id = intval ( $volume_id [0] );
            while ( $volume_id ) {
                $tmpfile = $volume_path . "_v" . $volume_id . ".sql";
                if (file_exists ( $tmpfile )) {
                    $this->msg .= "正在导入分卷 $volume_id <br />";
                    if ($this->_import ( $tmpfile )) {
 
                    } else {
                        $volume_id = $volume_id ? $volume_id :1;
                        exit ( "导入分卷：失败！可能是数据库结构已损坏！请尝试从分卷1开始导入" );
                    }
                } else {
                    $this->msg .= "此分卷备份全部导入成功！<br />";
                    return;
                }
                $volume_id ++;
            }
        }if (empty ( $volume [1] )) {
            $this->_showMsg ( "正在导入sql：<span class='imp'>" . $sqlfile . '</span>');
            if ($this->_import ( $sqlfile )) {
                $this->_showMsg( "数据库导入成功！");
            } else {
                 $this->_showMsg('数据库导入失败！',true);
                exit ();
            }
        } else {
            $volume_id = explode ( ".sq", $volume [1] );
            $volume_id = intval ( $volume_id [0] );
            while ( $volume_id ) {
                $tmpfile = $volume_path . "_v" . $volume_id . ".sql";
                if (file_exists ( $tmpfile )) {
                    $this->msg .= "正在导入分卷 $volume_id <br />";
                    if ($this->_import ( $tmpfile )) { } else {
                        $volume_id = $volume_id ? $volume_id :1;
                        exit ( "导入分卷失败！可能是数据库结构已损坏！请尝试从分卷1开始导入" );
                    }
                } else {
                    $this->msg .= "此分卷备份全部导入成功！<br />";
                    return;
                }
                $volume_id ++;
            }
        }
    }
 
    private function _import($sqlfile) {
        $sqls = array ();
        $f = fopen ( $sqlfile, "rb" );
        $create_table = '';
        while ( ! feof ( $f ) ) {

            $line = fgets ( $f );
            if (! preg_match ( '/;/', $line ) || preg_match ( '/ENGINE=/', $line )) {
                $create_table .= $line;
                if (preg_match ( '/ENGINE=/', $create_table)) {
                    $this->_insert_into($create_table);
                    $create_table = '';
                }
                continue;
            }
            $this->_insert_into($line);
        }
        fclose ( $f );
        return true;
    }
 
    private function _insert_into($sql){
        if (! mysql_query ( trim ( $sql ) )) {
            $this->msg .= mysql_error ();
            return false;
        }
    }
 
    private function close() {
        mysql_close ( $this->db );
    }
    private function lock($tablename, $op = "WRITE") {
        if (mysql_query ( "lock tables " . $tablename . " " . $op ))
            return true;
        else
            return false;
    }
    private function unlock() {
        if (mysql_query ( "unlock tables" ))
            return true;
        else
            return false;
    }
    function __destruct() {
        if($this->db){
            mysql_query ( "unlock tables", $this->db );
            mysql_close ( $this->db );
        }
    }
 
}

ini_set("error_reporting","E_ALL & ~E_NOTICE");
header("Content-Type:text/html;charset=utf-8");
$dbarry=include("../config.php");
	
$sq_charset='utf8';
$sq_name=$dbarry['DB_HOST'];
$sq_username=$dbarry['DB_USER'];
$sq_password=$dbarry['DB_PWD'];
$sq_database=$dbarry['DB_NAME'];

//备份
$db = new DBManage ($sq_name,$sq_username,$sq_password,$sq_database,$sq_charset);
$db->backup();
echo '<br />databak ok';
?>