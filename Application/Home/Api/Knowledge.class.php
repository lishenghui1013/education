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
        $list['datas'] = D('api_article_publish')->field('id,title,content,collect_num,read_num,share_num')->where($where)->order('id desc')->limit($start, $limit)->select();
        if ($list['datas']) {
            $list['response_status'] = 'success';//success:成功;fail:失败
            $list['res_msg'] = '成功';
            return $list;
        } else {
            $list['response_status'] = 'fail';//success:成功;fail:失败
            $list['res_msg'] = '失败';
            return $list;
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
        $id = $param['id'] ? $param['id'] : '';//id
        $where = array();
        $where['show_status'] = 1;//显示状态(1,上线;2,下线)
        if ($id !== '') {
            $where['id'] = $id;
            $detail = D('api_article_publish')->field('id,title,content,read_num,collect_num,share_num,pub_time')->where($where)->find();
            if ($detail) {
                $detail['response_status'] = 'success';//success:成功;fail:失败
                $detail['res_msg'] = '成功';
                return $detail;
            } else {
                $detail['response_status'] = 'fail';//success:成功;fail:失败
                $detail['res_msg'] = '失败';
                return $detail;
            }
        } else {
            $detail['response_status'] = 'lack';//缺少参数
            $detail['res_msg'] = '缺少参数';
            return $detail;
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
        $list['datas'] = D('api_textbook')->field('id,title,cover')->where($where)->order('id desc')->limit($start, $limit)->select();
        if ($list['datas']) {
            $list['response_status'] = 'success';//success:成功;fail:失败
            $list['res_msg'] = '成功';
            return $list;
        } else {
            $list['response_status'] = 'fail';//success:成功;fail:失败
            $list['res_msg'] = '失败';
            return $list;
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
            $detail = D('api_textbook')->field('title,cover,intro,read_num,collect_num,share_num,pub_time')->where($where)->find();
            if ($detail) {
                $detail['response_status'] = 'success';//success:成功;fail:失败
                $detail['res_msg'] = '成功';

            } else {
                $detail['response_status'] = 'fail';//success:成功;fail:失败
                $detail['res_msg'] = '失败';
            }
        } else {
            $detail['response_status'] = 'lack';//缺少参数
            $detail['res_msg'] = '缺少参数';
        }
        return $detail;
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
            $list['datas'] = D('api_textbook_content')->field('id,title')->where($where)->order('sort asc')->limit($start, $limit)->select();
            if ($list['datas']) {
                $list['response_status'] = 'success';//success:成功;fail:失败
                $list['res_msg'] = '成功';
                return $list;
            } else {
                $list['response_status'] = 'fail';//success:成功;fail:失败
                $list['res_msg'] = '失败';
                return $list;
            }
        } else {
            $list['response_status'] = 'lack';//缺少参数
            $list['res_msg'] = '缺少参数';
            return $list;
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
        $id = $param['id'] ? $param['id'] : '';//课本目录id
        $where = array();
        $where['show_status'] = 1;//显示状态(1,上线;2,下线)
        if ($id !== '') {
            $where['id'] = $id;
            $detail = D('api_textbook_content')->field('id,title,content,price,read_num,collect_num,share_num,pub_time')->where($where)->find();
            if ($detail) {
                $detail['response_status'] = 'success';//success:成功;fail:失败
                $detail['res_msg'] = '成功';
                return $detail;
            } else {
                $detail['response_status'] = 'fail';//success:成功;fail:失败
                $detail['res_msg'] = '失败';
            }
        } else {
            $detail['response_status'] = 'lack';//缺少参数
            $detail['res_msg'] = '缺少参数';
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
        $list['datas'] = D('api_video')->field('id,title,intro,cover,collect_num,read_num,share_num,pub_time')->where($where)->order('id desc')->limit($start, $limit)->select();
        if ($list['datas']) {
            $list['response_status'] = 'success';//success:成功;fail:失败
            $list['res_msg'] = '成功';
            return $list;
        } else {
            $list['response_status'] = 'fail';//success:成功;fail:失败
            $list['res_msg'] = '失败';
            return $list;
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
        $video_id = $param['video_id'] ? $param['video_id'] : '';//视频id
        $where = array();
        $where['show_status'] = 1;//显示状态(1,上线;2,下线)
        if ($video_id !== '') {
            $where['id'] = $video_id;
            $detail = D('api_video')->field('id,title,cover,intro,read_num,collect_num,share_num,pub_time')->where($where)->find();
            if ($detail) {
                $detail['response_status'] = 'success';//success:成功;fail:失败
                $detail['res_msg'] = '成功';

            } else {
                $detail['response_status'] = 'fail';//success:成功;fail:失败
                $detail['res_msg'] = '失败';
            }
        } else {
            $detail['response_status'] = 'lack';//缺少参数
            $detail['res_msg'] = '缺少参数';
        }
        return $detail;
    }

    /**
     * 后台发布视频目录列表
     * @author: 李胜辉
     * @time: 2018/11/05 09:34
     *
     */
    public function videoCatalogList($param)
    {
        $video_id = $param['video_id'] ? $param['video_id'] : '';//视频id
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
            $list['datas'] = D('api_video_content')->field('id,title')->where($where)->order('sort asc')->limit($start, $limit)->select();
            if ($list['datas']) {
                $list['response_status'] = 'success';//success:成功;fail:失败
                $list['res_msg'] = '成功';
                return $list;
            } else {
                $list['response_status'] = 'fail';//success:成功;fail:失败
                $list['res_msg'] = '失败';
                return $list;
            }
        } else {
            $list['response_status'] = 'lack';//缺少参数
            $list['res_msg'] = '缺少参数';
            return $list;
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
        $id = $param['id'] ? $param['id'] : '';//视频目录详情id
        $where = array();
        $where['show_status'] = 1;//显示状态(1,上线;2,下线)
        if ($id !== '') {
            $where['id'] = $id;
            $detail = D('api_video_content')->field('id,title,video_id,video_url,sort,price,read_num,collect_num,share_num,pub_time')->where($where)->find();
            if ($detail) {
                $detail['response_status'] = 'success';//success:成功;fail:失败
                $detail['res_msg'] = '成功';
                return $detail;
            } else {
                $detail['response_status'] = 'fail';//success:成功;fail:失败
                $detail['res_msg'] = '失败';
                return $detail;
            }
        } else {
            $detail['response_status'] = 'lack';//缺少参数
            $detail['res_msg'] = '缺少参数';
            return $detail;
        }
    }

    /*******************************************************************************************后台发布视频 结束*******************************************************/



}