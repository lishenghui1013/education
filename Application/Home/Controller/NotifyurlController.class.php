<?php
/**
 * 回调
 * User: 李胜辉
 * Date: 2018/11/9
 * Time: 10:24
 */

namespace Home\Controller;

use Admin\Model\ApiAppModel;
use Home\ORG\ApiLog;
use Think\Controller;
use Home\Api\Wxpay;


class NotifyurlController extends BaseController
{
    /**
     *支付宝支付回调
     */
    public function index()
    {

        vendor('alipay.AopSdk');// 加载类库
        $aop = new \AopClient;
        $aop->alipayrsaPublicKey = 'MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAheyVuwYyZy3UaLSUsgX5ZpcqgG4D9M6YvyBq/RlnZpWYUmIXFGKjUEgX7VkttbDgWB0q3hyPQydJED4WkcVx96FXYq/RALIbJ21+fd35ibBaeUsKQcKxEwBUK2Bs2bwR/G3x4T19yTLkELU0Zgi4eUe/+6ELu/wQEet7Aj5DrI1pbtSKi64LZDxoXAHePK3CtzFcDoNcCE1FH0C5GvyQO5oYna2VSZFX55wDw559EMpHXxRGPs8TR9VRqCuxWMZrBt/tYj57zOU81i3U9IwvijwxuVo45kr4fN/3MU5qEUEQwRcdtAuIHsfJ0dR1bOOk8OeWZ9pg/da/oR6iUUAkzQIDAQAB';
        $flag = $aop->rsaCheckV1($_POST, NULL, "RSA2");
        if ($flag) {
            if ($_POST['trade_status'] == 'TRADE_SUCCESS') {
                $out_trade_no = $_POST['out_trade_no'];    //商户订单号
                $trade_status = $_POST['trade_status'];    //支付状态
                $data['status'] = 1;
                $have = D('api_recharge')->where(array('order' => $out_trade_no, 'status' => 2))->find();
                $res = D('api_recharge')->where(array('order' => $out_trade_no))->save($data);
                if ($res) {
                    if ($have) {
                        $list = D('api_recharge')->where(array('order' => $out_trade_no, 'status' => 1))->find();
                        $user = D('api_users')->where(array('id' => $list['user_id']))->find();
                        $data1['balance'] = floatval(round($user['blance'], 2) + round($list['gold_num'], 2));
                        $res = D('api_users')->where(array('id' => $list['user_id']))->save($data1);//修改用户账号金币
                        echo $res ? 'success' : 'fail';
                    } else {
                        echo 'fail';
                    }

                } else {

                    echo 'fail';
                }

            }
        } else {
            echo 'fail';
        }


    }

    /**
     *微信支付回调
     */
    public function notify()
    {
        //接受微信返回的数据,返回的xml格式
        $xml = file_get_contents('php://input');
        //将xml格式转为数组
        $wxpay = new Wxpay();
        $arr = $wxpay->xmlToArray($xml);
        ApiLog::setApiInfo($arr);
        //为了防止假数据,验证签名是否和返回的一样.
        //记录一下,返回回来的签名,生成签名的时候,必须剔除sign字段
        $sign = $arr['sign'];
        unset($arr['sign']);

        if ($sign == $wxpay->getSign($arr)) {
            //根据返回的订单号做业务逻辑
            if ($arr['result_code'] == 'SUCCESS') {

//            校验返回的订单金额是否与商户侧的订单金额一致。修改订单表中的支付状态。
                $out_trade_no = $arr['out_trade_no'];    //商户订单号
                ApiLog::setApiInfo($out_trade_no);
                $data['status'] = 1;
                $have = D('api_recharge')->where(array('order' => $out_trade_no, 'status' => 2))->find();
                $res = D('api_recharge')->where(array('order' => $out_trade_no, 'status' => 2))->save($data);

                if ($res) {
                    if ($have) {
                        $list = D('api_recharge')->where(array('order' => $out_trade_no, 'status' => 1))->find();
                        $user = D('api_users')->where(array('id' => $list['user_id']))->find();
                        $data1['balance'] = floatval(round($user['balance'], 2) + round($list['gold_num'], 2));
                        $ress = D('api_users')->where(array('id' => $list['user_id']))->save($data1);//修改用户账号金币

                        echo $ress ? 'success' : 'fail';
                    } else {
                        echo 'fail';
                    }

                } else {

                    echo 'fail';
                }
            } else {
                echo 'fail';
            }
        } else {
            echo 'fail';
        }

    }

  /*  public function wxnotify()
    {
        require_once 'WxpayAPI_php_v3.0.1/lib/WxPay.Data.php'; //引入相关的文件
        require_once "WxpayAPI_php_v3.0.1/lib/WxPay.Config.php";
        $new = new WxPayDataBase();
        $config = new WxPayConfig();
        //接收传送的数据
        $fileContent = file_get_contents("php://input");
        // $fileContent = file_get_contents("./info.txt");
        if (!$fileContent) {
            exit;
        }
        //转换为simplexml对象
        $xmlResult = simplexml_load_string($fileContent);
        //XML数据的存储
        $newxml = $xmlResult->asXML(); //标准化 XML数据
        $wxarr = $new->FromXml($newxml);
        $key = $config::KEY;
        $sign = $new->MakeSign($wxarr, $key);
        //签名验证
        if (!$sign == $wxarr['sign']) {
            $fail = $this->ToXml(array('return_code' => "FAIL", "return_msg" => "签名验证失败"));
            echo $fail;
            exit;
        } //其实在这之前的代码都是固定不变的，微信那边已经帮我们处理好了，我们只需要复制粘贴哈哈
        if ($wxarr['result_code'] == 'SUCCESS' and $wxarr['return_code'] == 'SUCCESS') {
            //处理业务,具体返回参数可以看微信商户平台的参数实例(取得订单编号(out_trade_no)，微信支付编号(transaction_id))这个doPay方法就是处理完成支付后的逻辑，例如修改一下订单状态那些
            $final = $this->doPay($wxarr['out_trade_no'], $wxarr['transaction_id']);
            if ($final) {
                $success = $new->ToXml(array('return_code' => "SUCCESS", "return_msg" => "OK"));
                echo $success;
                exit;
            } else {
                $defeat = $new->ToXml(array('return_code' => "FAIL"));
                echo $defeat;
                exit;
            }
        }
    }*/
    /**
     *支付宝支付回调(课程用)
     */
    public function curriculum()
    {

        vendor('alipay.AopSdk');// 加载类库
        $aop = new \AopClient;
        $aop->alipayrsaPublicKey = 'MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAheyVuwYyZy3UaLSUsgX5ZpcqgG4D9M6YvyBq/RlnZpWYUmIXFGKjUEgX7VkttbDgWB0q3hyPQydJED4WkcVx96FXYq/RALIbJ21+fd35ibBaeUsKQcKxEwBUK2Bs2bwR/G3x4T19yTLkELU0Zgi4eUe/+6ELu/wQEet7Aj5DrI1pbtSKi64LZDxoXAHePK3CtzFcDoNcCE1FH0C5GvyQO5oYna2VSZFX55wDw559EMpHXxRGPs8TR9VRqCuxWMZrBt/tYj57zOU81i3U9IwvijwxuVo45kr4fN/3MU5qEUEQwRcdtAuIHsfJ0dR1bOOk8OeWZ9pg/da/oR6iUUAkzQIDAQAB';
        $flag = $aop->rsaCheckV1($_POST, NULL, "RSA2");
        if ($flag) {
            if ($_POST['trade_status'] == 'TRADE_SUCCESS') {
                $out_trade_no = $_POST['out_trade_no'];    //商户订单号
                $trade_status = $_POST['trade_status'];    //支付状态
                $data['status'] = 'Y';
                $have = D('api_order')->where(array('order_no' => $out_trade_no, 'order_status' => 'W'))->find();
                $res = D('api_order')->where(array('order_no' => $out_trade_no))->save($data);
                if ($res) {
                    if ($have) {
                        $list = D('api_order')->where(array('order_no' => $out_trade_no, 'order_status' => 'Y'))->find();
                        $inventory_num = D('api_curriculum')->where(array('id'=>$list['goods_id']))->getField('inventory_num');
                        $data1['inventory_num'] = $inventory_num-$list['goods_num'];
                        $res = D('api_curriculum')->where(array('id' => $list['goods_id']))->save($data1);//减库存
                        echo $res ? 'success' : 'fail';
                    } else {
                        echo 'fail';
                    }

                } else {

                    echo 'fail';
                }

            }
        } else {
            echo 'fail';
        }


    }

    /**
     *微信支付回调(课程用)
     */
    public function cnotify()
    {
        //接受微信返回的数据,返回的xml格式
        $xml = file_get_contents('php://input');
        //将xml格式转为数组
        $wxpay = new Wxpay();
        $arr = $wxpay->xmlToArray($xml);
        ApiLog::setApiInfo($arr);
        //为了防止假数据,验证签名是否和返回的一样.
        //记录一下,返回回来的签名,生成签名的时候,必须剔除sign字段
        $sign = $arr['sign'];
        unset($arr['sign']);

        if ($sign == $wxpay->getSign($arr)) {
            //根据返回的订单号做业务逻辑
            if ($arr['result_code'] == 'SUCCESS') {

//            校验返回的订单金额是否与商户侧的订单金额一致。修改订单表中的支付状态。
                $out_trade_no = $arr['out_trade_no'];    //商户订单号
                ApiLog::setApiInfo($out_trade_no);
                $data['status'] = 'Y';
                $have = D('api_order')->where(array('order_no' => $out_trade_no, 'order_status' => 'W'))->find();
                $res = D('api_order')->where(array('order_no' => $out_trade_no, 'order_status' => 'W'))->save($data);

                if ($res) {
                    if ($have) {
                        $list = D('api_order')->where(array('order_no' => $out_trade_no, 'order_status' => 'Y'))->find();
                        $inventory_num = D('api_curriculum')->where(array('id'=>$list['goods_id']))->getField('inventory_num');
                        $data1['inventory_num'] = $inventory_num-$list['goods_num'];
                        $ress = D('api_curriculum')->where(array('id' => $list['goods_id']))->save($data1);//减库存
                        echo $ress ? 'success' : 'fail';
                    } else {
                        echo 'fail';
                    }

                } else {

                    echo 'fail';
                }
            } else {
                echo 'fail';
            }
        } else {
            echo 'fail';
        }

    }

    // 接收post数据
    /*
    *  微信是用$GLOBALS['HTTP_RAW_POST_DATA'];这个函数接收post数据的
    */
    public function postdata()
    {
        $receipt = $_REQUEST;
        if ($receipt == null) {
            $receipt = file_get_contents("php://input");
            if ($receipt == null) {
                $receipt = $GLOBALS['HTTP_RAW_POST_DATA'];
            }
        }
        return $receipt;
    }

    //把对象转成数组
    public function object2array($array)
    {
        if (is_object($array)) {
            $array = (array)$array;
        }
        if (is_array($array)) {
            foreach ($array as $key => $value) {
                $array[$key] = object2array($value);
            }
        }
        return $array;
    }


}


