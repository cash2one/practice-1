<?php
$token_name=md5('quanmei'.date('ymd').'1w2f');
$tbq="qm_";
return array(
	'URL_CASE_INSENSITIVE'  => true,
	'DB_TYPE'   => 'mysql',
	'DB_HOST'   => 'localhost',
	'DB_NAME'   => 'tutetoo',
	'DB_USER'   => 'tutetoo',
	'DB_PWD'    => 'j3T5B2R3',
	'DB_PORT'               => 3306,
	'TMPL_PARSE_STRING'     => array('__PUBLIC__' => '/pub'),
	'DB_PREFIX'             => $tbq,
    'DB_FIELDTYPE_CHECK'    => false,
    'DB_FIELDS_CACHE'       => false,
	'APP_DEBUG'             => true,  
	'VAR_PAGE'              => 'p',                   
    'URL_MODEL'             => 0, 
	'URL_HTML_SUFFIX'       => 'shtml',
	'TOKEN_ON'              =>true,  		// 是否开启令牌验证
	'TOKEN_NAME'            =>$token_name,    // 令牌验证的表单隐藏字段名称
	'TOKEN_TYPE'            =>'md5',  //令牌哈希验证规则 默认为MD5
	'TOKEN_RESET'           =>true,  //令牌验证出错后是否重置令牌 默认为true
	//微信接口参数
	'APPID'                 => 'wx8eb3459c843ac1ed',
	'APPSECRET'             => '76a31daab51b313e95fe19e340c5b531',
	'HOME'                  => 'http://www.tutetoo.com/',
	'APIURL'                => 'https://api.weixin.qq.com/',
	'WXH'                   => 'jinshuosunshine',
	'TOKEN'                 => 'jinshuosunshine',
	//支付宝接口参数
	'payment_type'          => 1,  //支付方式 担保交易2 即时到账1 双向0
	'pay_user'              => 'tutetoo@126.com',//账号
	'pay_code'              => '6pqt3qg14bvt4dknr1u6gwhnhuum6dmu',//密钥 
	'pay_id'                => '2088421355556965',//签名ID
	'show_url'              => 'http://www.tutetoo.com/activity/',
	'DEFAULT_FILTER' => 'htmlspecialchars,stripslashes,trim',
);

