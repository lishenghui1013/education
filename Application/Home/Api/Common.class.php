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
            $list['response_status'] = 'success';//success:成功;fail:失败
            return $list;
        } else {
            $list['response_status'] = 'fail';//success:成功;fail:失败
            return $list;
        }
    }

    /**
     * 级别列表
     * @author: 李胜辉
     * @time: 2018/11/05 09:34
     *
     */
    public function classList()
    {
        $list = D('api_class')->field('id,class_name')->select();
        if ($list) {
            $list['response_status'] = 'success';//success:成功;fail:失败
            return $list;
        } else {
            $list['response_status'] = 'fail';//success:成功;fail:失败
            return $list;
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
            $list['response_status'] = 'success';//success:成功;fail:失败
            return $list;
        } else {
            $list['response_status'] = 'fail';//success:成功;fail:失败
            return $list;
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
     * @param: $param['item_id'] 收藏表id
     * @param: $param['user_id'] 用户id
     */
    public function addCollect($param)
    {
        $param['add_time'] = time();
        $res = D('api_collect')->add($param);
        if ($res) {
            return array('response_status' => 'success');//success:成功;fail:失败
        } else {
            return array('response_status' => 'fail');//success:成功;fail:失败
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
            return array('response_status' => 'success');//success:成功;fail:失败
        } else {
            return array('response_status' => 'fail');//success:成功;fail:失败
        }
    }


    /*******************************************************************************************翻译 开始*******************************************************/

    const CURL_TIMEOUT = 20;
    const URL = 'http://openapi.youdao.com/api';
    const APP_KEY = '1baeb55ce326cf32';  //替换为您的应用ID
    const SEC_KEY = 'mGsITpcCqpGicOm0Xr0jmafvzAUpQgnq';  //替换为您的密钥

    /**
     * 翻译入口
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
        $args = array(
            'q' => $query,
            'appKey' => self::APP_KEY,
            'salt' => rand(10000, 99999),
            'from' => $from,
            'to' => $to,

        );
        $args['sign'] = $this->buildSign(self::APP_KEY, $query, $args['salt'], self::SEC_KEY);
        $ret = $this->call(self::URL, $args);
        $ret = json_decode($ret, true);
        return $ret;
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
        $temp[] = $param['basic'];//翻译,音标
        $temp[] = $param['speakUrl'];//发音地址
        $data['translate'] = json_encode($temp);
        $data['words_type'] = $param['words_type'];//生词类型(SPACE:学习空间的;OTHER:其他的)
        $data['source'] = $param['source'];//生词来源
        $data['subject_id'] = $param['subject_id'];//所属科目
        $data['user_type'] = $param['user_type'];//用户类型(COM:机构;TEA:老师;STU:学生)
        $data['add_userid'] = $param['add_userid'];//添加生词的用户id
        $data['add_time'] = time();//添加时间
        $res = D('api_new_words')->data($data)->add();
        if ($res) {
            return array('response_status' => 'success');//success:成功;fail:失败
        } else {
            return array('response_status' => 'fail');//success:成功;fail:失败
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
            return array('response_status' => 'success');//success:成功;fail:失败
        } else {
            return array('response_status' => 'fail');//success:成功;fail:失败
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
            $list = D('api_new_words')->field('id,new_words,translate,source,add_time')->where($where)->order('id desc')->limit($start, $limit)->select();
            if ($list) {
                $list['response_status'] = 'success';//success:成功;fail:失败
                return $list;
            } else {
                $list['response_status'] = 'fail';//success:成功;fail:失败
                return $list;
            }
        } else {
            $list['response_status'] = 'lack';//缺少参数
            return $list;
        }
    }


    /*******************************************************************************************生词 结束*******************************************************/

}