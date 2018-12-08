<?php
/**
 * 课程审核
 * User: 李胜辉
 * Date: 2018/12/08
 * Time: 17:32
 */

namespace Admin\Controller;


class CurriculumAuditController extends BaseController
{
    /**
     * 列表页
     * @author: 李胜辉
     * @time: 2018/10/29 08:32
     */
    public function index()
    {
        $this->display();
    }

    /**
     * ajax列表页
     * @author: 李胜辉
     * @time: 2018/10/25 17:32
     */
    public function ajaxGetIndex()
    {
        $getInfo = I('post.');
        $curr = $getInfo['curr'] ? $getInfo['curr'] : 1;//当前页
        $limit = $getInfo['limit'] ? $getInfo['limit'] : C('PAGENUM');//每页显示条数
        $start = ($curr - 1) * $limit;//开始
        $com_name = $getInfo['com_name'] ? $getInfo['com_name'] : '';//查询关键字
        $add_time = $getInfo['add_time'] ? strtotime($getInfo['add_time']) : '';//查询的时间
        $audit_status = $getInfo['audit_status'] ? $getInfo['audit_status'] : '';//查询的审核状态
        $where = array();
        if ($add_time != '') {
            $big_time = $add_time + 24 * 60 * 60;
            $where['p.pub_time'] = array(array('elt', $big_time), array('egt', $add_time));
        }
        if ($audit_status != '') {
            $where['p.audit_status'] = $audit_status;
        }
        if ($com_name != '') {
            $where['s.com_name'] = array('like', '%' . $com_name . '%');
        }
        /*var_dump($where);exit;*/
        //查询总条数
        $total = D('api_curriculum as p')->join('left join api_ct_users as s on s.id=p.add_id')->join('left join api_user as u on u.id=p.audit_userid')->where($where)->count();//查询满足要求的总记录数

        $info = D('api_curriculum as p')->join('left join api_ct_users as s on s.id=p.add_id')->join('left join api_user as u on u.id=p.audit_userid')->field('p.id,s.com_name,p.curriculum_name,p.intro,p.add_time,u.username,p.audit_time,p.audit_status')->where($where)->order('p.id desc')->limit($start, $limit)->select();
        foreach ($info as $keys => $values) {
            foreach ($values as $key => $value) {
                if ($values[$key] === null) {
                    $info[$keys][$key] = '';
                }
            }
        }
        if ($info) {
            $data = array(
                'limit' => $limit,
                'curr' => $curr,
                'status' => 'success',//查询状态:成功为success,失败为fail
                'total' => $total,
                'data' => $info
            );
        } else {
            $data = array(
                'limit' => $limit,
                'curr' => $curr,
                'status' => 'fail',
                'total' => $total,
                'data' => $info
            );
        }

        $this->ajaxReturn($data, 'json');
    }

    /**
     * 审核通过
     * @author: 李胜辉
     * @time: 2018/10/25 14:32
     */
    public function open()
    {
        $id = I('post.id');
        $arr['audit_status'] = 'S';
        $arr['audit_userid'] = session('uid');
        $arr['audit_time'] = time();
        $res = D('api_curriculum')->where(array('id' => $id))->save($arr);
        if ($res === false) {
            $this->ajaxError('操作失败');
        } else {
            $this->ajaxSuccess('操作成功');
        }
    }

    /**
     * 拒绝通过
     * @author: 李胜辉
     * @time: 2018/10/23 09:32
     */
    public function close()
    {
        $id = I('post.id');
        $arr['audit_status'] = 'R';
        $arr['audit_userid'] = session('uid');
        $arr['audit_time'] = time();
        $res = D('api_curriculum')->where(array('id' => $id))->save($arr);
        if ($res === false) {
            $this->ajaxError('操作失败');
        } else {
            $this->ajaxSuccess('添加成功');
        }
    }

    /**
     * 查看
     * @author: 李胜辉
     * @time: 2018/10/25 09:32
     */
    public function look()
    {
        $getInfo = I('get.');
        $id = $getInfo['id'];//发布课程id
        $detail = D('api_curriculum')->where(array('id'=>$id))->find();
        $detail['pub_name'] = D('api_ct_users')->where(array('id'=>$detail['add_id']))->getField('com_name');
        $detail['province'] = D('api_provinces')->where(array('id'=>$detail['province_id']))->getField('province');
        $detail['city'] = D('api_cities')->where(array('id'=>$detail['city_id']))->getField('city');
        $detail['county'] = D('api_areas')->where(array('id'=>$detail['county_id']))->getField('area');
        $detail['audit_name'] = D('api_user')->where(array('id'=>$detail['audit_userid']))->getField('username');
        $this->assign('detail', $detail);//发布内容信息
        $this->display();
    }

}