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
        $common = new Common();
        $cover = $common->uploads(array('path'=>'goods/img'));
        $data['curriculum_name'] = $param['curriculum_name']; //课程名称
        $data['price'] = $param['price'];//价格
        $data['intro'] = $param['intro']?$param['intro']:'';//简介
        $data['content'] = $param['content']?$param['content']:'';//详情
        $data['cover'] = $cover;//封面
        $data['category_id'] = $param['category_id']?$param['category_id']:'';//分类id
        $data['user_type'] = $param['user_type']?$param['user_type']:''; //用户类型(COM:机构;TEA:老师;STU:学生)
        $data['curriculum_start_time'] = $param['curriculum_start_time']?$param['curriculum_start_time']:'';//课程开始时间
        $data['curriculum_end_time'] = $param['curriculum_end_time']?$param['curriculum_end_time']:'';//课程结束时间
        $data['lesson_time'] = $param['lesson_time']?$param['lesson_time']:'';//每天上课时间
        $data['add_id'] = $param['add_id'];//添加人id
        $data['add_time'] = time();//添加时间
        $res = D('api_curriculum')->add($data);
        if ($res) {
            return array('response_status' => 'success','res_msg'=>'成功');//success:成功;fail:失败
        } else {
            return array('response_status' => 'fail','res_msg'=>'失败');//success:成功;fail:失败
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
        $category_id = $param['category_id']?$param['category_id']:'';//分类id
        $where = array();
        if($category_id!=''){
            $where['category_id'] = $category_id;
        }
        $res['datas'] = D('api_curriculum')->field('id,curriculum_name,price,intro,cover,add_time,add_id')->where($where)->limit($start,$limit)->select();
        if ($res['datas']) {
            $res['response_status'] = 'success';//success:成功;fail:失败
            $res['res_msg'] = '成功';
            return $res;
        } else {
            $res['response_status'] = 'fail';//success:成功;fail:失败
            $res['res_msg'] = '失败';
            return $res;
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
        $res = D('api_curriculum')->field('id,curriculum_name,price,intro,cover,add_time,add_id,content,category_id,user_type,curriculum_start_time,curriculum_end_time,lesson_time,inventory_num')->where(array('id'=>$id))->find();
        if ($res) {
            $res['response_status'] = 'success';//success:成功;fail:失败
            $res['res_msg'] = '成功';
            return $res;
        } else {
            $res['response_status'] = 'fail';//success:成功;fail:失败
            $res['res_msg'] = '失败';
            return $res;
        }
    }

}