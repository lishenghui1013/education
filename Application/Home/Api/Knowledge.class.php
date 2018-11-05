<?php

/**
 * 学习空间/知识
 * @since   2018/11/05 创建
 * @author  李胜辉
 */

namespace Home\Api;

use Admin\Model\ApiAppModel;
use Home\ORG\ApiLog;
use Home\ORG\Crypt;
use Home\ORG\Response;
use Home\ORG\ReturnCode;

class Knowledge extends Base
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
        }
    }

    /*******************************************************************************************知识点,句子,阅读文章,词组 开始*******************************************************/
    /**
     * 知识点,句子,阅读文章,词组列表
     * @author: 李胜辉
     * @time: 2018/11/05 09:34
     *
     */
    public function knowledgeList($param)
    {
        $pagenum = $param['pagenum'] ? $param['pagenum'] : 1;//当前页
        $limit = $param['limit'] ? $param['limit'] : 10;//每页显示条数
        $start = ($pagenum - 1) * $limit;
        $class_id = $param['class_id'] ? $param['class_id'] : '';//级别id
        $subject_id = $param['subject_id'] ? $param['subject_id'] : '';//科目id
        $versions_id = $param['versions_id'] ? $param['versions_id'] : '';//版本id
        $article_type = $param['article_type'] ? $param['article_type'] : '';//内容类型(POINT:知识点;WT:词组;SENTENCE:句子;ARTICLE:文章;)
        $where = array();
        $where['show_status'] = 1;//显示状态(1,上线;2,下线)
        if ($class_id !== '') {
            $where['class_id'] = $class_id;
        }
        if ($subject_id !== '') {
            $where['subject_id'] = $subject_id;
        }
        if ($versions_id !== '') {
            $where['versions_id'] = $versions_id;
        }
        if ($article_type !== '') {
            $where['article_type'] = $article_type;
        }
        $list = D('api_article_publish')->field('id,title,content,collect_num,read_num,share_num')->where($where)->order('id desc')->limit($start, $limit)->select();
        if ($list) {
            $list['response_status'] = 'success';//success:成功;fail:失败
            return $list;
        } else {
            $list['response_status'] = 'fail';//success:成功;fail:失败
        }
    }

    /**
     * 知识点,句子,阅读文章,词组详情
     * @author: 李胜辉
     * @time: 2018/11/05 09:34
     *
     */
    public function knowledgeDetail($param)
    {
        $id = $param['id'] ? $param['id'] : '';//课本id
        $where = array();
        $where['show_status'] = 1;//显示状态(1,上线;2,下线)
        if ($id !== '') {
            $where['id'] = $id;
            $detail = D('api_article_publish')->feild('id,title,content,read_num,collect_num,share_num,pub_time')->where($where)->find();
            if ($detail) {
                $detail['response_status'] = 'success';//success:成功;fail:失败
                return $detail;
            } else {
                $detail['response_status'] = 'fail';//success:成功;fail:失败
            }
        } else {
            $detail['response_status'] = 'lack';//缺少参数
        }
    }


    /*******************************************************************************************知识点,句子,阅读文章,词组 结束*******************************************************/
    /*******************************************************************************************后台发布课本 开始*******************************************************/
    /**
     * 后台发布课本列表
     * @author: 李胜辉
     * @time: 2018/11/05 09:34
     *
     */
    public function textbookList($param)
    {
        $pagenum = $param['pagenum'] ? $param['pagenum'] : 1;//当前页
        $limit = $param['limit'] ? $param['limit'] : 10;//每页显示条数
        $start = ($pagenum - 1) * $limit;
        $class_id = $param['class_id'] ? $param['class_id'] : '';//级别id
        $subject_id = $param['subject_id'] ? $param['subject_id'] : '';//科目id
        $versions_id = $param['versions_id'] ? $param['versions_id'] : '';//版本id
        $where = array();
        $where['show_status'] = 1;//显示状态(1,上线;2,下线)
        if ($class_id !== '') {
            $where['class_id'] = $class_id;
        }
        if ($subject_id !== '') {
            $where['subject_id'] = $subject_id;
        }
        if ($versions_id !== '') {
            $where['versions_id'] = $versions_id;
        }
        $list = D('api_textbook')->field('id,title,cover')->where($where)->order('id desc')->limit($start, $limit)->select();
        if ($list) {
            $list['response_status'] = 'success';//success:成功;fail:失败
            return $list;
        } else {
            $list['response_status'] = 'fail';//success:成功;fail:失败
        }
    }

    /**
     * 课本详情
     * @author: 李胜辉
     * @time: 2018/11/05 09:34
     *
     */
    public function textbookDetail($param)
    {
        $textbook_id = $param['textbook_id'] ? $param['textbook_id'] : '';//课本id
        $where = array();
        $where['show_status'] = 1;//显示状态(1,上线;2,下线)
        if ($textbook_id !== '') {
            $where['id'] = $textbook_id;
            $detail = D('api_textbook')->feild('title,cover,intro,read_num,collect_num,share_num,pub_time')->where($where)->find();
            if ($detail) {
                $detail['response_status'] = 'success';//success:成功;fail:失败
                return $detail;
            } else {
                $detail['response_status'] = 'fail';//success:成功;fail:失败
            }
        } else {
            $detail['response_status'] = 'lack';//缺少参数
        }
    }

    /**
     * 后台发布课本目录列表
     * @author: 李胜辉
     * @time: 2018/11/05 09:34
     *
     */
    public function textbookCatalogList($param)
    {
        $textbook_id = $param['textbook_id'] ? $param['textbook_id'] : '';//课本id
        $pagenum = $param['pagenum'] ? $param['pagenum'] : 1;//当前页
        $limit = $param['limit'] ? $param['limit'] : 10;//每页显示条数
        $start = ($pagenum - 1) * $limit;
        $class_id = $param['class_id'] ? $param['class_id'] : '';//级别id
        $subject_id = $param['subject_id'] ? $param['subject_id'] : '';//科目id
        $versions_id = $param['versions_id'] ? $param['versions_id'] : '';//版本id
        $where = array();
        $where['show_status'] = 1;//显示状态(1,上线;2,下线)
        if ($class_id !== '') {
            $where['class_id'] = $class_id;
        }
        if ($subject_id !== '') {
            $where['subject_id'] = $subject_id;
        }
        if ($versions_id !== '') {
            $where['versions_id'] = $versions_id;
        }
        if ($textbook_id !== '') {
            $where['textbook_id'] = $textbook_id;
            $list = D('api_textbook_content')->field('id,title')->where($where)->order('sort asc')->limit($start, $limit)->select();
            if ($list) {
                $list['response_status'] = 'success';//success:成功;fail:失败
                return $list;
            } else {
                $list['response_status'] = 'fail';//success:成功;fail:失败
            }
        } else {
            $list['response_status'] = 'lack';//缺少参数
        }
    }

    /**
     * 课本目录内容详情
     * @author: 李胜辉
     * @time: 2018/11/05 09:34
     *
     */
    public function textbookCatalogDetail($param)
    {
        $id = $param['id'] ? $param['id'] : '';//课本id
        $where = array();
        $where['show_status'] = 1;//显示状态(1,上线;2,下线)
        if ($id !== '') {
            $where['id'] = $id;
            $detail = D('api_textbook_content')->feild('id,title,content,price,read_num,collect_num,share_num,pub_time')->where($where)->find();
            if ($detail) {
                $detail['response_status'] = 'success';//success:成功;fail:失败
                return $detail;
            } else {
                $detail['response_status'] = 'fail';//success:成功;fail:失败
            }
        } else {
            $detail['response_status'] = 'lack';//缺少参数
        }
    }
    /*******************************************************************************************后台发布课本 结束*******************************************************/
    /*******************************************************************************************后台发布视频 开始*******************************************************/
    /**
     * 后台发布视频列表
     * @author: 李胜辉
     * @time: 2018/11/05 09:34
     *
     */
    public function videoList($param)
    {
        $pagenum = $param['pagenum'] ? $param['pagenum'] : 1;//当前页
        $limit = $param['limit'] ? $param['limit'] : 10;//每页显示条数
        $start = ($pagenum - 1) * $limit;
        $class_id = $param['class_id'] ? $param['class_id'] : '';//级别id
        $subject_id = $param['subject_id'] ? $param['subject_id'] : '';//科目id
        $versions_id = $param['versions_id'] ? $param['versions_id'] : '';//版本id
        $where = array();
        $where['show_status'] = 1;//显示状态(1,上线;2,下线)
        if ($class_id !== '') {
            $where['class_id'] = $class_id;
        }
        if ($subject_id !== '') {
            $where['subject_id'] = $subject_id;
        }
        if ($versions_id !== '') {
            $where['versions_id'] = $versions_id;
        }
        $list = D('api_video')->field('id,title,intro,cover,collect_num,read_num,share_num,pub_time')->where($where)->order('id desc')->limit($start, $limit)->select();
        if ($list) {
            $list['response_status'] = 'success';//success:成功;fail:失败
            return $list;
        } else {
            $list['response_status'] = 'fail';//success:成功;fail:失败
        }
    }

    /**
     * 视频详情
     * @author: 李胜辉
     * @time: 2018/11/05 09:34
     *
     */
    public function videoDetail($param)
    {
        $video_id = $param['video_id'] ? $param['video_id'] : '';//课本id
        $where = array();
        $where['show_status'] = 1;//显示状态(1,上线;2,下线)
        if ($video_id !== '') {
            $where['id'] = $video_id;
            $detail = D('api_video')->feild('id,title,cover,intro,read_num,collect_num,share_num,pub_time')->where($where)->find();
            if ($detail) {
                $detail['response_status'] = 'success';//success:成功;fail:失败
                return $detail;
            } else {
                $detail['response_status'] = 'fail';//success:成功;fail:失败
            }
        } else {
            $detail['response_status'] = 'lack';//缺少参数
        }
    }

    /**
     * 后台发布视频目录列表
     * @author: 李胜辉
     * @time: 2018/11/05 09:34
     *
     */
    public function videoCatalogList($param)
    {
        $video_id = $param['video_id'] ? $param['video_id'] : '';//课本id
        $pagenum = $param['pagenum'] ? $param['pagenum'] : 1;//当前页
        $limit = $param['limit'] ? $param['limit'] : 10;//每页显示条数
        $start = ($pagenum - 1) * $limit;
        $class_id = $param['class_id'] ? $param['class_id'] : '';//级别id
        $subject_id = $param['subject_id'] ? $param['subject_id'] : '';//科目id
        $versions_id = $param['versions_id'] ? $param['versions_id'] : '';//版本id
        $where = array();
        $where['show_status'] = 1;//显示状态(1,上线;2,下线)
        if ($class_id !== '') {
            $where['class_id'] = $class_id;
        }
        if ($subject_id !== '') {
            $where['subject_id'] = $subject_id;
        }
        if ($versions_id !== '') {
            $where['versions_id'] = $versions_id;
        }
        if ($video_id !== '') {
            $where['video_id'] = $video_id;
            $list = D('api_video_content')->field('id,title')->where($where)->order('sort asc')->limit($start, $limit)->select();
            if ($list) {
                $list['response_status'] = 'success';//success:成功;fail:失败
                return $list;
            } else {
                $list['response_status'] = 'fail';//success:成功;fail:失败
            }
        } else {
            $list['response_status'] = 'lack';//缺少参数
        }
    }

    /**
     * 视频目录内容详情
     * @author: 李胜辉
     * @time: 2018/11/05 09:34
     *
     */
    public function videoCatalogDetail($param)
    {
        $id = $param['id'] ? $param['id'] : '';//课本id
        $where = array();
        $where['show_status'] = 1;//显示状态(1,上线;2,下线)
        if ($id !== '') {
            $where['id'] = $id;
            $detail = D('api_video_content')->feild('id,title,content,price,read_num,collect_num,share_num,pub_time')->where($where)->find();
            if ($detail) {
                $detail['response_status'] = 'success';//success:成功;fail:失败
                return $detail;
            } else {
                $detail['response_status'] = 'fail';//success:成功;fail:失败
            }
        } else {
            $detail['response_status'] = 'lack';//缺少参数
        }
    }

    /*******************************************************************************************后台发布视频 结束*******************************************************/
    /*******************************************************************************************收藏 开始*******************************************************/
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
     * 取消收藏
     * @author: 李胜辉
     * @time: 2018/11/05 09:34
     */
    public function deleteCollect($param)
    {
        $id = $param['id'];
        $res = D('api_collect')->where(array('id' => $id))->delete();
        if ($res) {
            return array('response_status' => 'success');//success:成功;fail:失败
        } else {
            return array('response_status' => 'fail');//success:成功;fail:失败
        }
    }


    /**
     * 收藏列表
     * @author: 李胜辉
     * @time: 2018/11/05 09:34
     */
    public function collectList($param)
    {
        $pagenum = $param['pagenum'] ? $param['pagenum'] : 1;//当前页
        $limit = $param['limit'] ? $param['limit'] : 10;//每页显示条数
        $start = ($pagenum - 1) * $limit;
        $item_type = $param['item_type'] ? $param['item_type'] : '';//收藏项目的类型(STORE:商城;GOODS:商品;KAP:知识;EXE:习题;WOR:试题;RADIO:广播;LIB:图书馆
        $user_id = $param['user_id'] ? $param['user_id'] : '';//用户id
        $where = array();

        if ($user_id !== '') {
            if ($item_type !== '') {
                $where['item_type'] = $item_type;
            }
            $where['user_id'] = $user_id;
            $list = D('api_collect')->field('id,item_type,item_category,pub_type,is_catalog,item_id,add_time')->where($where)->order('id desc')->limit($start, $limit)->select();
            if ($list) {
                switch ($item_type) {
                    case 'STORE':
                        //查询商城信息
                        foreach ($list as $key => $value) { //循环 压入数据
                            if ($value['is_catalog'] == 'N') { //收藏的是大标题
                                $temp = D('api_publish')->field('id as ids,title')->where(array('id' => $value['item_id']))->find();
                                $value['ids'] = $temp['ids'];
                                $value['title'] = $temp['title'];
                            } else {  //收藏的是目录详情页内容
                                $temp = D('api_publish_content')->field('id as ids,title')->where(array('id' => $value['item_id']))->find();
                                $value['ids'] = $temp['ids'];
                                $value['title'] = $temp['title'];
                            }
                        }

                        break;
                    case 'GOODS': //商品

                        break;
                    case 'KAP':  //知识
                        //知识
                        foreach ($list as $key => $value) { //循环 压入数据
                            switch ($value['item_category']) { //项目分类(ART:知识点,句子,阅读文章,词组;VID:视频;TEX:课本;OTHER:其他的)
                                case 'ART':
                                    $temp = D('api_article_publish')->field('id as ids,title')->where(array('id' => $value['item_id']))->find();
                                    $value['ids'] = $temp['ids'];
                                    $value['title'] = $temp['title'];
                                    break;
                                case 'VID':
                                    if ($value['is_catalog'] == 'N') { //收藏的是大标题
                                        $temp = D('api_video')->field('id as ids,title')->where(array('id' => $value['item_id']))->find();
                                        $value['ids'] = $temp['ids'];
                                        $value['title'] = $temp['title'];
                                    } else {  //收藏的是目录详情页内容
                                        $temp = D('api_video_content')->field('id as ids,title')->where(array('id' => $value['item_id']))->find();
                                        $value['ids'] = $temp['ids'];
                                        $value['title'] = $temp['title'];
                                    }
                                    break;
                                case 'TEX':
                                    if ($value['is_catalog'] == 'N') { //收藏的是大标题
                                        $temp = D('api_textbook')->field('id as ids,title')->where(array('id' => $value['item_id']))->find();
                                        $value['ids'] = $temp['ids'];
                                        $value['title'] = $temp['title'];
                                    } else {  //收藏的是目录详情页内容
                                        $temp = D('api_textbook_content')->field('id as ids,title')->where(array('id' => $value['item_id']))->find();
                                        $value['ids'] = $temp['ids'];
                                        $value['title'] = $temp['title'];
                                    }
                                    break;
                                default:
                                    break;
                            }
                        }

                        break;
                    case 'EXE': //练习

                        break;
                    case 'WOR': //试题

                        break;
                    case 'RADIO': //广播

                        break;
                    case 'LIB': //图书馆

                        break;
                    default:
                        //分页
                        foreach ($list as $key => $value) { //循环 压入数据
                            switch ($value['item_type']) {
                                case 'STORE':
                                    //查询商城信息
                                    if ($value['is_catalog'] == 'N') { //收藏的是大标题
                                        $temp = D('api_publish')->field('id as ids,title')->where(array('id' => $value['item_id']))->find();
                                        $value['ids'] = $temp['ids'];
                                        $value['title'] = $temp['title'];
                                    } else {  //收藏的是目录详情页内容
                                        $temp = D('api_publish_content')->field('id as ids,title')->where(array('id' => $value['item_id']))->find();
                                        $value['ids'] = $temp['ids'];
                                        $value['title'] = $temp['title'];
                                    }
                                    break;
                                case 'GOODS': //商品

                                    break;
                                case 'KAP': //知识
                                    switch ($value['item_category']) { //项目分类(ART:知识点,句子,阅读文章,词组;VID:视频;TEX:课本;OTHER:其他的)
                                        case 'ART':
                                            $temp = D('api_article_publish')->field('id as ids,title')->where(array('id' => $value['item_id']))->find();
                                            $value['ids'] = $temp['ids'];
                                            $value['title'] = $temp['title'];
                                            break;
                                        case 'VID':
                                            if ($value['is_catalog'] == 'N') { //收藏的是大标题
                                                $temp = D('api_video')->field('id as ids,title')->where(array('id' => $value['item_id']))->find();
                                                $value['ids'] = $temp['ids'];
                                                $value['title'] = $temp['title'];
                                            } else {  //收藏的是目录详情页内容
                                                $temp = D('api_video_content')->field('id as ids,title')->where(array('id' => $value['item_id']))->find();
                                                $value['ids'] = $temp['ids'];
                                                $value['title'] = $temp['title'];
                                            }
                                            break;
                                        case 'TEX':
                                            if ($value['is_catalog'] == 'N') { //收藏的是大标题
                                                $temp = D('api_textbook')->field('id as ids,title')->where(array('id' => $value['item_id']))->find();
                                                $value['ids'] = $temp['ids'];
                                                $value['title'] = $temp['title'];
                                            } else {  //收藏的是目录详情页内容
                                                $temp = D('api_textbook_content')->field('id as ids,title')->where(array('id' => $value['item_id']))->find();
                                                $value['ids'] = $temp['ids'];
                                                $value['title'] = $temp['title'];
                                            }
                                            break;
                                        default:
                                            break;
                                    }

                                    break;
                                case 'EXE': //练习

                                    break;
                                case 'WOR': //试题

                                    break;
                                case 'RADIO': //校园广播

                                    break;
                                case 'LIB':  //图书馆

                                    break;
                                default:
                            }


                        }
                        unset($key, $value);
                        break;
                }
                $list['response_status'] = 'success';//success:成功;fail:失败
            } else {
                $list['response_status'] = 'no';//暂无数据
            }
            return $list;
        } else {
            $list['response_status'] = 'lack';//缺少参数
            return $list;
        }
    }

    /*******************************************************************************************收藏 结束*******************************************************/
    /*******************************************************************************************翻译 开始*******************************************************/

    const CURL_TIMEOUT =20;
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
        $query = $param['query'];
        $from = $param['from'];
        $to = $param['to'];
        $args = array(
            'q' => $query,
            'appKey' => APP_KEY,
            'salt' => rand(10000,99999),
            'from' => $from,
            'to' => $to,

        );
        $args['sign'] = $this->buildSign(APP_KEY, $query, $args['salt'], SEC_KEY);
        $ret = $this->call(URL, $args);
        echo $ret;
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
    public function call($url, $args=null, $method="post", $testflag = 0, $timeout = CURL_TIMEOUT, $headers=array())
    {
        $ret = false;
        $i = 0;
        while($ret === false)
        {
            if($i > 1)
                break;
            if($i > 0)
            {
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
    public function callOnce($url, $args=null, $method="post", $withCookie = false, $timeout = CURL_TIMEOUT, $headers=array())
    {
        $ch = curl_init();
        if($method == "post")
        {
            $data = $this->convert($args);
            curl_setopt($ch, CURLOPT_POSTFIELDS, $data);
            curl_setopt($ch, CURLOPT_POST, 1);
        }
        else
        {
            $data = $this->convert($args);
            if($data)
            {
                if(stripos($url, "?") > 0)
                {
                    $url .= "&$data";
                }
                else
                {
                    $url .= "?$data";
                }
            }
        }
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_TIMEOUT, $timeout);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        if(!empty($headers))
        {
            curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
        }
        if($withCookie)
        {
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
        if (is_array($args))
        {
            foreach ($args as $key=>$val)
            {
                if (is_array($val))
                {
                    foreach ($val as $k=>$v)
                    {
                        $data .= $key.'['.$k.']='.rawurlencode($v).'&';
                    }
                }
                else
                {
                    $data .="$key=".rawurlencode($val)."&";
                }
            }
            return trim($data, "&");
        }
        return $args;
    }





    /*******************************************************************************************翻译 结束*******************************************************/

}