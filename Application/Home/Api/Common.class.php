<?php

/**
 * 公共接口
 * @since   2018/11/06 创建
 * @author  李胜辉
 */

namespace Home\Api;

use Admin\Model\ApiAppModel;
use Home\ORG\ApiLog;
use Home\ORG\Crypt;
use Home\ORG\Response;
use Home\ORG\ReturnCode;
use Home\Api\SmsDemo;

class Common extends Base
{
    /**
     * 科目列表
     * @author: 李胜辉
     * @time: 2018/11/05 09:34
     *
     */
    public function subjectList()
    {
        $list = D('api_subject')->field('id,subject_name')->select();
        if ($list) {
            Response::success($list);
        } else {
            Response::error(-1, '暂无数据');
        }
    }

    /**
     * 级别列表
     * @author: 李胜辉
     * @time: 2018/11/05 09:34
     *
     */
    public function classList($param)
    {
        $class_type = $param['class_type'] ? $param['class_type'] : '';//年级分类(SMALL:小学;JUN:初中;HIGHT:高中;UNI:大学;COLL:专科;GRAD:研究生;)
        $where = array();
        $data = array();
        $types = array('SMALL', 'JUN', 'HIGHT', 'UNI', 'COLL', 'GRAD');
        if ($types) {
            foreach ($types as $key => $value) {
                $where['class_type'] = $value;
                $data[$value] = D('api_class')->field('id,class_name,class_type')->where($where)->select();
            }
            unset($key, $value);
        }

        if ($data) {
            Response::success($data);
        } else {
            Response::error(-1, '暂无数据');
        }
    }

    /**
     * 版本列表
     * @author: 李胜辉
     * @time: 2018/11/05 09:34
     *
     */
    public function versionsList()
    {
        $list = D('api_versions')->field('id,versions_name')->select();
        if ($list) {
            Response::success($list);
        } else {
            Response::error(-1, '暂无数据');
        }
    }

    /**
     * 添加收藏
     * @author: 李胜辉
     * @time: 2018/11/05 09:34
     * @param: $param['item_type'] 收藏项目的类型(STORE:商城;GOODS:商品;KAP:知识;EXE:习题;WOR:试题;RADIO:广播;LIB:图书馆
     * @param: $param['item_category'] 项目分类(ART:知识点,句子,阅读文章,词组;VID:视频;TEX:课本;OTHER:其他的)
     * @param: $param['pub_type'] 发布人的类型(COM:机构;TEA:老师;STU:学生;ADM:后台)
     * @param: $param['is_catalog'] 是否目录详情(Y:是;N:否)
     * @param: $param['item_id'] 收藏项目id
     * @param: $param['user_id'] 用户id
     * @param: $param['user_type'] 收藏人的类型(COM:机构;TEA:老师;STU:学生;ADM:后台)
     */
    public function addCollect($param)
    {
        $data['item_type'] = $param['item_type'];
        $data['item_category'] = $param['item_category'];
        $data['pub_type'] = $param['pub_type'];
        $data['item_id'] = $param['item_id'];
        $data['user_id'] = $param['user_id'];
        $data['is_catalog'] = $param['is_catalog'];
        $data['user_type'] = $param['user_type'];
        $data['add_time'] = time();
        $res = D('api_collect')->add($data);
        if ($res) {
            $info = D("api_collect")->where(array('id'=>$res))->find();
            switch ($info['item_category']) {
                case 'STORE'://商城
                    $collect_num = D('api_publish_content')->where(array('id'=>$info['item_id']))->getField('collect_num');
                    $collect_num = $collect_num+1;
                    $update = D('api_publish_content')->where(array('id'=>$info['item_id']))->save(array('collect_num'=>$collect_num));
                    break;
                case 'GOODS'://商品
                    $collect_num = D('api_curriculum')->where(array('id'=>$info['item_id']))->getField('collect_num');
                    $collect_num = $collect_num+1;
                    $update = D('api_curriculum')->where(array('id'=>$info['item_id']))->save(array('collect_num'=>$collect_num));
                    break;
                case 'KAP'://知识
                    switch ($info['item_type']) {
                        case 'ART'://知识点,句子,阅读文章,词组
                            $collect_num = D('api_article_publish')->where(array('id' => $info['item_id']))->getField('collect_num');
                            $collect_num = $collect_num + 1;
                            $update = D('api_article_publish')->where(array('id' => $info['item_id']))->save(array('collect_num' => $collect_num));
                            break;
                        case 'VID'://视频
                            $collect_num = D('api_video_content')->where(array('id' => $info['item_id']))->getField('collect_num');
                            $collect_num = $collect_num + 1;
                            $update = D('api_video_content')->where(array('id' => $info['item_id']))->save(array('collect_num' => $collect_num));
                            break;
                        case 'TEX'://课本
                            $collect_num = D('api_textbook_content')->where(array('id' => $info['item_id']))->getField('collect_num');
                            $collect_num = $collect_num + 1;
                            $update = D('api_textbook_content')->where(array('id' => $info['item_id']))->save(array('collect_num' => $collect_num));
                            break;
                        case 'OTHER'://其他的
                            break;
                        default :
                            break;
                    }
                    break;
                case 'EXE'://习题

                    break;
                case 'WOR'://试题

                    break;
                case 'RADIO'://广播

                    break;
                case 'LIB'://图书馆

                    break;
                default :
                    break;
            }
            Response::setSuccessMsg('收藏成功');
            Response::success(array());
        } else {
            Response::error(-1, '收藏失败');
        }
    }
    /**
     * 判断收藏状态
     * @author: 李胜辉
     * @time: 2018/11/05 09:34
     * @param: $param['item_type'] 收藏项目的类型(STORE:商城;GOODS:商品;KAP:知识;EXE:习题;WOR:试题;RADIO:广播;LIB:图书馆
     * @param: $param['item_category'] 项目分类(ART:知识点,句子,阅读文章,词组;VID:视频;TEX:课本;OTHER:其他的)
     * @param: $param['pub_type'] 发布人的类型(COM:机构;TEA:老师;STU:学生;ADM:后台)
     * @param: $param['is_catalog'] 是否目录详情(Y:是;N:否)
     * @param: $param['item_id'] 收藏表id
     * @param: $param['user_type'] 收藏人类型(COM:机构;TEA:老师;STU:学生;)
     * @param: $param['user_id'] 用户id
     */
    public function isCollect($param)
    {
        $where = $param;
        $res = D('api_collect')->where($where)->getField('id');
        if ($res) {
            Response::setSuccessMsg('已收藏');
            Response::success(array('id'=>$res));//已收藏
        } else {
            Response::error(-1, '未收藏',array('id'=>''));//未收藏
        }
    }

    /**
     * 添加评论
     * @author: 李胜辉
     * @time: 2018/11/05 09:34
     */
    public function addComment($param)
    {
        $data['content'] = $param['content'];//评论内容
        $data['pub_type'] = $param['pub_type'] ? $param['pub_type'] : 'COM';//发布人的类型(COM:机构;TEA:老师;STU:学生)
        $data['item_id'] = $param['item_id'];//评论标题id
        $data['is_catalog'] = $param['is_catalog'] ? $param['is_catalog'] : 'Y';//是否评论的详情(Y:是;N:否)
        $data['add_time'] = time();//评论时间
        $data['user_id'] = $param['user_id'];//评论人id
        $data['user_type'] = $param['user_type'];//评论人类型(COM:机构;TEA:老师;STU:学生)

        $res = D('api_comment')->add($data);
        if ($res) {
            Response::success(array());
        } else {
            Response::error(-1, '评论失败');
        }
    }

    /**
     * 判断是否已经加入生词本
     * @author: 李胜辉
     * @time: 2018/11/05 09:34
     */
    public function judgeIsHaveInCodes($param)
    {
        $where['add_userid'] = $param['add_userid'];//用户id
        $where['new_words'] = $param['words'];//单词
        $where['words_type'] = $param['words_type'];//生词类型(SPACE:学习空间的;OTHER:其他的)
        $is_have = D('api_new_words')->where($where)->getField('id');
        if($is_have){
            Response::setSuccessMsg('已加入生词本');
            Response::success(array());
        }else{
            Response::error(-1,'尚未添加');
        }
    }
    /*******************************************************************************************翻译 开始*******************************************************/

    const CURL_TIMEOUT = 20;
    const URL = 'http://openapi.youdao.com/api';
    const APP_KEY = '2a1128aef8894bd4';  //替换为您的应用ID
    const SEC_KEY = 'wTbAYO7cwFnK2ACoYjmz3WX8V1sJNbNo';  //替换为您的密钥

    /**
     * 有道智云 公共翻译入口
     * @author: 李胜辉
     * @time: 2018/11/24 09:34
     * @param: $query 查询内容
     * @param: $from 要翻译的语言
     * @param: $to 翻译成什么语言
     */
    public function commonTranslate($param)
    {
        $query = $param['query'];//查询内容
        $from = $param['from'] ? $param['from'] : 'EN';//要翻译的语言
        $to = $param['to'] ? $param['to'] : 'zh-CHS';//翻译成什么语言
        $args = array(
            'q' => $query,
            'appKey' => self::APP_KEY,
            'salt' => rand(10000, 99999),
            'from' => $from,
            'to' => $to
        );
        $args['sign'] = $this->buildSign(self::APP_KEY, $query, $args['salt'], self::SEC_KEY);
        $ret = $this->call(self::URL, $args);
        $arr_ret['translate'] = json_decode($ret,true);
        /************修改************/
        $return['us-phonetic'] = $arr_ret['translate']['basic']['us-phonetic'];//音标
        $usphonetic = $arr_ret['translate']['basic']['explains'];
        $str_us = '';
        if($usphonetic){
            foreach($usphonetic as $key=>$value){
                $str_us .= $value . ' ';
            }
            unset($key,$value);
            $str_us = substr($str_us,0,-1);

        }
        $return['explains'] = $str_us?$str_us:'';//翻译
        $return['uk-speech'] = $arr_ret['translate']['basic']['uk-speech'];//发音
        /****************修改结束************/
        if ($return) {
            Response::success($return);
        } else {
            Response::error(-1, '未查到数据');
        }

    }

    /**
     * 有道智云 生词翻译入口
     * @author: 李胜辉
     * @time: 2018/11/05 09:34
     * @param: $query 查询内容
     * @param: $from 要翻译的语言
     * @param: $to 翻译成什么语言
     */
    public function translate($param)
    {
        $query = $param['query'];//查询内容
        $from = $param['from'] ? $param['from'] : 'EN';//要翻译的语言
        $to = $param['to'] ? $param['to'] : 'zh-CHS';//翻译成什么语言
        $where = array();
        if ($param['add_userid'] != '') {
            $where['add_userid'] = $param['add_userid'];//用户id
            $where['new_words'] = $query;//单词
        }
        if ($param['user_type'] != '') {
            $where['user_type'] = $param['user_type'];//生词类型(SPACE:学习空间的;OTHER:其他的)
        }
        if ($param['words_type'] != '') {
            $where['words_type'] = $param['words_type'];//用户类型(COM:机构;TEA:老师;STU:学生)
        }
        $args = array(
            'q' => $query,
            'appKey' => self::APP_KEY,
            'salt' => rand(10000, 99999),
            'from' => $from,
            'to' => $to
        );
        $args['sign'] = $this->buildSign(self::APP_KEY, $query, $args['salt'], self::SEC_KEY);
        $ret = $this->call(self::URL, $args);
       $arr_ret['translate'] = json_decode($ret,true);
        /************修改************/
        $return['us-phonetic'] = $arr_ret['translate']['basic']['us-phonetic'];//音标
        $usphonetic = $arr_ret['translate']['basic']['explains'];
        $str_us = '';
        if($usphonetic){
            foreach($usphonetic as $key=>$value){
                $str_us .= $value . ' ';
            }
            unset($key,$value);
            $str_us = substr($str_us,0,-1);

        }
        $return['explains'] = $str_us?$str_us:'';//翻译
        $return['uk-speech'] = $arr_ret['translate']['basic']['uk-speech'];//发音
        /****************修改结束************/
        if ($return) {
            $is_have = D('api_new_words')->where($where)->getField('id');
            if ($is_have) {
                $return['add_status'] = 'Y';
                /*$arr_ret['add_status'] = 'Y';//已经添加*/
            } else {
                $return['add_status'] = 'N';
                /*$arr_ret['add_status'] = 'N';//已经添加*/
            }
            Response::success($return);
        } else {
            Response::error(-1, '未查到数据');
        }
    }


    /**
     * 加密
     * @author: 李胜辉
     * @time: 2018/11/05 09:34
     */
    public function buildSign($appKey, $query, $salt, $secKey)
    {
        $str = $appKey . $query . $salt . $secKey;
        $ret = md5($str);
        return $ret;
    }


    /**
     * 发起网络请求
     * @author: 李胜辉
     * @time: 2018/11/05 09:34
     */
    public function call($url, $args = null, $method = "post", $testflag = 0, $timeout = self::CURL_TIMEOUT, $headers = array())
    {
        $ret = false;
        $i = 0;
        while ($ret === false) {
            if ($i > 1)
                break;
            if ($i > 0) {
                sleep(1);
            }
            $ret = $this->callOnce($url, $args, $method, false, $timeout, $headers);
            $i++;
        }
        return $ret;
    }

    /**
     * 发送一次网络请求
     * @author: 李胜辉
     * @time: 2018/11/05 09:34
     */
    public function callOnce($url, $args = null, $method = "post", $withCookie = false, $timeout = self::CURL_TIMEOUT, $headers = array())
    {
        $ch = curl_init();
        if ($method == "post") {
            $data = $this->convert($args);
            curl_setopt($ch, CURLOPT_POSTFIELDS, $data);
            curl_setopt($ch, CURLOPT_POST, 1);
        } else {
            $data = $this->convert($args);
            if ($data) {
                if (stripos($url, "?") > 0) {
                    $url .= "&$data";
                } else {
                    $url .= "?$data";
                }
            }
        }
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_TIMEOUT, $timeout);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        if (!empty($headers)) {
            curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
        }
        if ($withCookie) {
            curl_setopt($ch, CURLOPT_COOKIEJAR, $_COOKIE);
        }
        $r = curl_exec($ch);
        curl_close($ch);
        return $r;
    }

    /**
     * 拼接参数
     * @author: 李胜辉
     * @time: 2018/11/05 09:34
     */
    public function convert(&$args)
    {
        $data = '';
        if (is_array($args)) {
            foreach ($args as $key => $val) {
                if (is_array($val)) {
                    foreach ($val as $k => $v) {
                        $data .= $key . '[' . $k . ']=' . rawurlencode($v) . '&';
                    }
                } else {
                    $data .= "$key=" . rawurlencode($val) . "&";
                }
            }
            return trim($data, "&");
        }
        return $args;
    }





    /*******************************************************************************************翻译 结束*******************************************************/
    /*******************************************************************************************生词 开始*******************************************************/
    /**
     * 添加生词
     * @author: 李胜辉
     * @time: 2018/11/06 09:34
     */
    public function addNewWords($param)
    {
        $data['new_words'] = $param['new_words'];//生词
        $basic = htmlspecialchars_decode($param['basic'],ENT_QUOTES);//翻译,音标

        /*$arr_basic = json_decode($basic,true);
        $temp = array();
        $temp['us-phonetic'] = $arr_basic['us-phonetic'];//音标
        $explains = '';
        if($arr_basic['explains']){
            foreach($arr_basic['explains'] as $key=>$value){
                $explains .= $value . ' ';
            }
            unset($key,$value);
            $explains = substr($explains,0,-1);
        }
        $temp['explains'] = $explains;//翻译
        /*$temp['basic'] = json_decode($basic,true);*/
        /*$temp['speakUrl'] = $param['speakUrl'];//发音地址
        $data['translate'] = json_encode($temp);*/
        $data['translate'] = $param['basic'];
        $data['words_type'] = $param['words_type'];//生词类型(SPACE:学习空间的;OTHER:其他的)
        $data['source'] = $param['source']?$param['source']:'';//生词来源
        $data['subject_id'] = $param['subject_id'];//所属科目
        $data['user_type'] = $param['user_type'];//用户类型(COM:机构;TEA:老师;STU:学生)
        $data['add_userid'] = $param['add_userid'];//添加生词的用户id
        $data['add_time'] = time();//添加时间
        $res = D('api_new_words')->data($data)->add();

        if ($res) {
            Response::success(array('id' => $res));
        } else {
            Response::error(-1, '添加失败');
        }
    }

    /**
     * 删除生词
     * @author: 李胜辉
     * @time: 2018/11/06 09:34
     */
    public function deleteNewWords($param)
    {
        $id = $param['id'];//生词id
        $res = D('api_new_words')->where(array('id' => $id))->delete();
        if ($res) {
            Response::success(array('del_num' => $res));
        } else {
            Response::error(-1, '删除失败');
        }
    }

    /**
     * 生词列表
     * @author: 李胜辉
     * @time: 2018/11/06 09:34
     *
     */
    public function newWordsList($param)
    {
        $user_id = $param['user_id'] ? $param['user_id'] : '';//用户id
        $pagenum = $param['pagenum'] ? $param['pagenum'] : 1;//当前页
        $limit = $param['limit'] ? $param['limit'] : 10;//每页显示条数
        $start = ($pagenum - 1) * $limit;
        $words_type = $param['words_type'] ? $param['words_type'] : '';//生词类型(SPACE:学习空间的;OTHER:其他的)
        $user_type = $param['user_type'] ? $param['user_type'] : '';//用户类型(COM:机构;TEA:老师;STU:学生)
        $subject_id = $param['subject_id'] ? $param['subject_id'] : '';//科目id
        $moth = $param['moth'] ? $param['moth'] : '';//添加生词的月份时间戳
        $day = $param['day'] ? $param['day'] : '';//添加生词日期时间戳
        $where = array();
        if ($words_type !== '') {
            $where['words_type'] = $words_type;
        }
        if ($user_type !== '') {
            $where['user_type'] = $user_type;
        }
        if ($subject_id !== '') {
            $where['subject_id'] = $subject_id;
        }
        if ($day !== '') {
            $year = date('Y', $day);//年份
            $moth = date('m', $day);//月份
            $date = date('d', $day);//日期
            $where['_string'] = 'year(FROM_UNIXTIME(add_time,"%Y-%m-%d"))="' . $year . '" and month(FROM_UNIXTIME(add_time,"%Y-%m-%d"))="' . $moth . '" and dayofmonth(FROM_UNIXTIME(add_time,"%Y-%m-%d"))="' . $date . '"';
        } else if ($moth !== '') {
            $year = date('Y', $moth);//年份
            $moth = date('m', $moth);//月份
            $where['_string'] = 'year(FROM_UNIXTIME(add_time,"%Y-%m-%d"))="' . $year . '" and month(FROM_UNIXTIME(add_time,"%Y-%m-%d"))="' . $moth . '"';
        }
        if ($user_id !== '') {
            $where['add_suerid'] = $user_id;
            $list = D('api_new_words')->field('id,new_words,translate,source,FROM_UNIXTIME(add_time,"%Y-%m-%d") as add_time')->where($where)->order('id desc')->limit($start, $limit)->select();
            if ($list) {
                foreach($list as $key=>$value){
                    $list[$key]['translate'] = json_decode($value['translate']);
                }
                unset($key,$value);
                Response::success($list);
            } else {
                Response::error(-1, '暂无数据');
            }
        } else {
            Response::error(-2, '缺少参数userid');
        }
    }


    /*******************************************************************************************生词 结束*******************************************************/
    /*******************************************************************************************文件上传 开始*******************************************************/
    /**
     * 文件上传方法
     * @author: 李胜辉
     * @time: 2018/11/07 16:34
     * @param: $files  $_FILES
     * @param: $path string 路径
     */
    public function uploads($param)
    {
        $path = $param['path'];//子文件夹路径
        //获取网站根目录地址$url
        $PHP_SELF = $_SERVER['PHP_SELF'] ? $_SERVER['PHP_SELF'] : $_SERVER['SCRIPT_NAME'];
        $str = substr($PHP_SELF, 1);
        $url = 'http://' . $_SERVER['HTTP_HOST'] . '/' . substr($str, 0, strpos($str, '/') + 1);
        Response::debug($url);
        $upload = new \Think\Upload();   // 实例化上传类
        $upload->maxSize = 314572800000;    // 设置附件上传大小
        /*$upload->exts = array('jpg', 'gif', 'png', 'jpeg'); // 设置附件上传类型*/
        $upload->rootPath = THINK_PATH;          // 设置附件上传根目录
        $upload->savePath = '../Public/uploads/';    // 设置附件上传（子）目录
        $upload->subName = $path;  //子文件夹
        $upload->replace = true;  //同名文件是否覆盖
        // 上传文件
        $res_info = $upload->upload();
        $info = '';
        if ($res_info) {
            foreach ($res_info as $key => $tepimg) {
                $info .= $url . preg_replace('/^..\//', '', $tepimg['savepath']) . $tepimg['savename'] . ';';//拼接图片地址
            }
            unset($key, $tepimg);
            $info = substr($info, 0, -1);
            return $info;
        } else {
            return $info;
        }
    }

    /*******************************************************************************************文件上传 结束*******************************************************/

    /*******************************************************************************************发送手机验证码 开始*******************************************************/

    /**
     * 发送验证码
     * @author: 李胜辉
     * @time: 2018/11/06 09:34
     */
    public function sendCodes($param)
    {
        $phone = $param['phone'] ? $param['phone'] : '';//手机号
        $code = $this->buildCodes();//验证码
        session('code', $code);
        $res = SmsDemo::sendSms($phone, $code);
        if ($res['Message'] == 'OK') {
            $data['code'] = $code;
            $data['phone'] = $phone;
            $data['add_time'] = time();
            $add = D('api_phone_code')->add($data);
            if($add){
                Response::success(array());
            }else{
                Response::error(-2, '发生错误');
            }
        } else {
            $msg = '发送失败';
            switch($res['Code']){
                case 'isp.RAM_PERMISSION_DENY':
                    $msg = '子账号未未授权';
                    break;
                case 'isv.OUT_OF_SERVICE':
                    $msg = '余额不足';
                    break;
                case 'isv.PRODUCT_UN_SUBSCRIPT':
                    $msg = '未开通阿里云';
                    break;
                case 'isv.PRODUCT_UNSUBSCRIBE':
                    $msg = '未开通云通信';
                    break;
                case 'isv.ACCOUNT_NOT_EXISTS':
                    $msg = '云通信账户不存在';
                    break;
                case 'isv.ACCOUNT_ABNORMAL':
                    $msg = '云通信账户异常';
                    break;
                case 'isv.SMS_TEMPLATE_ILLEGAL':
                    $msg = '短信模版不合法';
                    break;
                case 'isv.SMS_SIGNATURE_ILLEGAL':
                $msg = '短信签名不合法';
                break;
                case 'isv.INVALID_PARAMETERS':
                    $msg = '参数异常	';
                    break;
                case 'isp.SYSTEM_ERROR':
                    $msg = '请重新发送';
                    break;
                case 'isv.MOBILE_NUMBER_ILLEGAL':
                    $msg = '非法手机号';
                    break;
                case 'isv.MOBILE_COUNT_OVER_LIMIT':
                    $msg = '批量上传超限';
                    break;
                case 'isv.TEMPLATE_MISSING_PARAMETERS':
                    $msg = '缺少参数';
                    break;
                case 'isv.BUSINESS_LIMIT_CONTROL':
                    $msg = '请等会再发送';
                    break;
                case 'isv.INVALID_JSON_PARAM':
                    $msg = '参数不合法';
                    break;
                case 'isv.BLACK_KEY_CONTROL_LIMIT':
                    $msg = '黑名单管控';
                    break;
                case 'isv.PARAM_LENGTH_LIMIT':
                    $msg = '参数超出长度限制';
                    break;
                case 'isv.PARAM_NOT_SUPPORT_URL':
                    $msg = '不支持URL';
                    break;
                case 'isv.AMOUNT_NOT_ENOUGH':
                    $msg = '账户余额不足';
                    break;
                case 'isv.TEMPLATE_PARAMS_ILLEGAL':
                    $msg = '含非法关键字';
                    break;
                case 'SignatureDoesNotMatch':
                    $msg = '加密错误';
                    break;
                case 'InvalidTimeStamp.Expired':
                    $msg = '时间戳错误';
                    break;
                case 'SignatureNonceUsed':
                    $msg = '随机数重复';
                    break;
                case 'InvalidVersion':
                    $msg = '版本号错误';
                    break;
                case 'InvalidAction.NotFound':
                    $msg = '接口名错误';
                    break;
                default:
                    $msg = '发送失败';
                    break;
            }
            Response::error(-1, $msg);
        }
    }

    /**
     * 验证码生成
     * @author: 李胜辉
     * @time: 2018/11/06 09:34
     */
    public function buildCodes()
    {
        $code = '';
        for ($i = 0; $i < 4; $i++) {
            $code .= mt_rand(0, 9);
        }
        return $code;

    }


    /*******************************************************************************************发送手机验证码 结束*******************************************************/
    /**
     * 获取微妙级时间戳
     * @author: 李胜辉
     * @time: 2018/11/12 09:34
     */
    public function getMicrotime()
    {
        $arr_microtime = explode(" ", microtime());
        $str_microtime = intval($arr_microtime[1]) . intval($arr_microtime[0] * 1000000);
        return $str_microtime;
    }
    /*******************************************************************************************地址 结束*******************************************************/
    /**
     * 获取省份列表
     * @author: 李胜辉
     * @time: 2018/11/12 09:34
     */
    public function provinceList()
    {
        $listInfo = D('api_provinces')->select();
        ApiLog::setApiInfo($listInfo);
        if (empty($listInfo)) {
            Response::error(-1, '暂无数据');
        } else {
            Response::success($listInfo);
        }
    }

    /**
     * 城市列表
     * @author: 李胜辉
     * @time: 2018/11/12 09:34
     */
    public function cityList($param)
    {
        $province_num = $param['province_num'];//省份编号
        $listInfo = D('api_cities')->where(array('provinceid' => $province_num))->select();
        ApiLog::setApiInfo($listInfo);
        if (empty($listInfo)) {
            Response::error(-1, '暂无数据');
        } else {
            Response::success($listInfo);
        }
    }

    /**
     * 县区列表
     * @author: 李胜辉
     * @time: 2018/11/12 09:34
     */
    public function countyList($param)
    {
        $city_num = $param['city_num'];//城市编号
        $listInfo = D('api_areas')->where(array('cityid' => $city_num))->select();
        ApiLog::setApiInfo($listInfo);
        if (empty($listInfo)) {
            Response::error(-1, '暂无数据');
        } else {
            Response::success($listInfo);
        }
    }


    /*******************************************************************************************地址 结束*******************************************************/
    /**
     * 查询用户信息
     * @author: 李胜辉
     * @time: 2018/11/06 09:34
     */
    public function getUserInfo($param)
    {
        $user_type = $param['user_type'];//用户类型(STU:学生;TEA:老师;COM:机构;)
        $user_id = $param['user_id'];//用户id
        if($user_type=='STU'){
            $user_info = D('api_users')->where(array('id'=>$user_id))->find();
            if($user_info){
                return $user_info;
            }else{
                Response::error(-1,'暂无数据');
            }

        }else{
            $user_info = D('api_ct_users')->where(array('id'=>$user_id))->find();
            if($user_info){
                return $user_info;
            }else{
                Response::error(-1,'暂无数据');
            }
        }
    }

}