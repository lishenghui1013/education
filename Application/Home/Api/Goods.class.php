<?php

/**
 * 商品相关
 * @since   2018/11/14 创建
 * @author  李胜辉
 */

namespace Home\Api;

use Admin\Model\ApiAppModel;
use Home\ORG\ApiLog;
use Home\ORG\Crypt;
use Home\ORG\Response;
use Home\ORG\ReturnCode;
use Home\Api\Common;
use Home\Api\Store;

class Goods extends Base
{
    /**
     * 发布课程
     * @author: 李胜辉
     * @time: 2018/11/14 09:34
     *
     */
    public function publishCurriculum($param)
    {
        $url = $this->uploads('goods/img');
        $data['curriculum_name'] = $param['curriculum_name']; //课程名称
        $data['price'] = $param['price'];//价格
        $data['intro'] = $param['intro'] ? $param['intro'] : '';//简介
        $data['content'] = $url['content'] ? $url['content'] : '';//详情
        $data['cover'] = $url['cover'] ? $url['cover'] : '';//封面
        $data['category_id'] = $param['category_id'] ? $param['category_id'] : '';//分类id
        $data['user_type'] = $param['user_type'] ? $param['user_type'] : ''; //用户类型(COM:机构;TEA:老师;STU:学生)
        $data['curriculum_start_time'] = $param['curriculum_start_time'] ? strtotime($param['curriculum_start_time']) : '';//课程开始时间
        $data['curriculum_end_time'] = $param['curriculum_end_time'] ? strtotime($param['curriculum_end_time']) : '';//课程结束时间
        $data['lesson_time'] = $param['lesson_time'] ? $param['lesson_time'] : '';//每天上课时间
        $data['add_id'] = $param['add_id'];//添加人id
        $data['add_time'] = time();//添加时间
        $res = D('api_curriculum')->add($data);
        if ($res) {
            Response::success(array('id' => $res));
        } else {
            Response::error(-1, '发布失败');
        }
    }

    /**
     * 课程列表
     * @author: 李胜辉
     * @time: 2018/11/14 09:34
     *
     */
    public function curriculumList($param)
    {
        $pagenum = $param['pagenum'] ? $param['pagenum'] : 1;//当前页
        $limit = $param['limit'] ? $param['limit'] : 10;//每页显示条数
        $start = ($pagenum - 1) * $limit;
        $data['user_type'] = $param['user_type']; //用户类型(COM:机构;TEA:老师;STU:学生)
        $category_id = $param['category_id'] ? $param['category_id'] : '';//分类id
        $where = array();
        $where['c.audit_status'] = 'S';
        if ($category_id != '') {
            $where['c.category_id'] = $category_id;
        }
        $res = D('api_curriculum as c')->join('left join api_ct_users as u on u.id=c.add_id')->field('c.id,c.curriculum_name,c.price,c.intro,c.cover,FROM_UNIXTIME(c.add_time,"%Y-%m-%d") as add_time,c.add_id,FROM_UNIXTIME(c.curriculum_start_time,"%Y-%m-%d") as curriculum_start_time,FROM_UNIXTIME(c.curriculum_end_time,"%Y-%m-%d") as curriculum_end_time,c.lesson_time,u.icon,u.com_name')->where($where)->limit($start, $limit)->select();
        if ($res) {
            Response::success($res);
        } else {
            Response::error(-1, '暂无数据');
        }
    }

    /**
     * 课程详情
     * @author: 李胜辉
     * @time: 2018/11/23 09:34
     *
     */
    public function curriculumDetail($param)
    {
        $id = $param['id'];//课程id
        $res = D('api_curriculum')->field('id,curriculum_name,price,intro,cover,FROM_UNIXTIME(add_time,"%Y-%m-%d") as add_time,add_id,content,category_id,user_type,FROM_UNIXTIME(curriculum_start_time,"%Y-%m-%d") as curriculum_start_time,FROM_UNIXTIME(curriculum_end_time,"%Y-%m-%d") as curriculum_end_time,lesson_time,inventory_num')->where(array('id' => $id))->find();
        if ($res) {
            Response::success($res);
        } else {
            Response::error(-1, '暂无数据');
        }
    }

    /**
     * 文件上传方法
     * @author: 李胜辉
     * @time: 2018/11/07 16:34
     * @param: $files  $_FILES
     * @param: $path string 路径
     */
    public function uploads($path)
    {
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
        $return = array();

        if ($_FILES) {

            foreach ($_FILES as $key => $value) {
                $temp = array();
                $temp[$key] = $_FILES[$key];
                $res_info = $upload->upload($temp);
                if ($res_info) {
                    $info = '';
                    foreach ($res_info as $keys => $tepimg) {
                        $info .= $url . preg_replace('/^..\//', '', $tepimg['savepath']) . $tepimg['savename'] . ';';//拼接图片地址
                    }
                    unset($keys, $tepimg);
                    $info = substr($info, 0, -1);
                    $return[$key] = $info;
                }
            }
            unset($key, $value);

        }
        return $return;
    }

}