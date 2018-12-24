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
use Home\Api\Common;

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
        $list = D('api_article_publish')->field('id,title,content,collect_num,read_num,share_num,from_unixtime(pub_time,"%Y-%m-%d") as pub_time')->where($where)->order('id desc')->limit($start, $limit)->select();
        if ($list) {
            foreach($list as $key=>$value){
                $list[$key]['content'] = htmlspecialchars_decode($value['content'],ENT_QUOTES);

            }
            Response::success($list);
        } else {
           Response::error(-1,'暂无数据');
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
            $detail = D('api_article_publish')->field('id,title,content,translate_content,read_num,collect_num,share_num,FROM_UNIXTIME(pub_time,"%Y-%m-%d") as pub_time')->where($where)->find();
            if ($detail) {
                $detail['content'] = htmlspecialchars_decode($detail['content'],ENT_QUOTES);
                $detail['translate_content'] = htmlspecialchars_decode($detail['translate_content'],ENT_QUOTES);
                Response::success($detail);
            } else {
                Response::error(-1,'暂无数据');
            }
        } else {
            Response::error(-2,'缺少参数id');
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
            Response::success($list);
        } else {
            Response::error(-1,'暂无数据');
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
            $detail = D('api_textbook')->field('title,cover,intro,read_num,collect_num,share_num,FROM_UNIXTIME(pub_time,"%Y-%m-%d") as pub_time')->where($where)->find();
            if ($detail) {
                $detail['intro'] = htmlspecialchars_decode($detail['intro'],ENT_QUOTES);
                Response::success($detail);

            } else {
                Response::error(-1,'暂无数据');
            }
        } else {
            Response::error(-2,'缺少参数');
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
               Response::success($list);
            } else {
                Response::error(-1,'暂无数据');
            }
        } else {
            Response::error(-2,'缺少参数');
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
            $detail = D('api_textbook_content')->field('id,title,content,price,read_num,collect_num,share_num,FROM_UNIXTIME(pub_time,"%Y-%m-%d") as pub_time')->where($where)->find();
            if ($detail) {
                $detail['content'] = htmlspecialchars_decode($detail['content'],ENT_QUOTES);
                Response::success($detail);
            } else {
                Response::error(-1,'暂无数据');
            }
        } else {
            Response::error(-2,'缺少参数id');
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
        $list = D('api_video')->field('id,title,intro,cover,collect_num,read_num,share_num,FROM_UNIXTIME(pub_time,"%Y-%m-%d") as pub_time')->where($where)->order('id desc')->limit($start, $limit)->select();
        if ($list) {
            foreach($list as $key=>$value){
                $list[$key]['intro'] = htmlspecialchars_decode($value['intro'],ENT_QUOTES);
            }
            Response::success($list);
        } else {
            Response::error(-1,'暂无数据');
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
            $detail = D('api_video')->field('id,title,cover,intro,read_num,collect_num,share_num,FROM_UNIXTIME(pub_time,"%Y-%m-%d") as pub_time')->where($where)->find();
            if ($detail) {
                $detail['intro'] = htmlspecialchars_decode($detail['intro'],ENT_QUOTES);
                Response::success($detail);
            } else {
                Response::error(-1,'暂无数据');
            }
        } else {
            Response::error(-2,'缺少参数');
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
            $list = D('api_video_content')->field('id,title')->where($where)->order('sort asc')->limit($start, $limit)->select();
            if ($list) {
                Response::success($list);
            } else {
                Response::error(-1,'暂无数据');
            }
        } else {
            Response::error(-2,'缺少参数');
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
            $detail = D('api_video_content')->field('id,title,video_id,video_url,sort,price,read_num,collect_num,share_num,FROM_UNIXTIME(pub_time,"%Y-%m-%d") as pub_time')->where($where)->find();
            if ($detail) {
                Response::success($detail);
            } else {
                Response::error(-1,'暂无数据');
            }
        } else {
            Response::error(-2,'缺少参数');
        }
    }

    /*******************************************************************************************后台发布视频 结束*******************************************************/



}