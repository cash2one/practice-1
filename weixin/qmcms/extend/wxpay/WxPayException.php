<?php
namespace wxpay;
/**
 * 微信支付API异常类
 *
 * Class WxPayException
 * @package wxpay
 * @author wlcmgg@qq.com
 */
class WxPayException extends \Exception
{
    public function errorMessage()
    {
        return $this->getMessage();
    }
}