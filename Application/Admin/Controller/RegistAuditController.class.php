<?php
/**
 * 注册审核
 * User: 李胜辉
 * Date: 2018/10/17
 * Time: 17:32
 */

namespace Admin\Controller;
class RegistAuditController extends BaseController
{
    public function index()
    {
        $this->assign('count',5);
        $this->display();
    }

    /**
     * 列表页
     * @author: 李胜辉
     * @time: 2018/10/23 17:32
     */
    public function ajaxGetIndex()
    {
        $getInfo = I('post.');
        $start = $getInfo['start'] ? $getInfo['start'] : 0;
        $limit = $getInfo['length'] ? $getInfo['length'] : 1;
        $add_time = $getInfo['add_time'] ? strtotime($getInfo['add_time']) : '';//查询的时间
        $audit_status = $getInfo['audit_status'] ? $getInfo['audit_status'] : '';//查询的审核状态
        $where = array();
        if ($add_time != '') {
            $big_time = $add_time + 24 * 60 * 60;
            $where['s.add_time'] = array(array('elt', $big_time),array('egt', $add_time));
        }
        if ($audit_status != '') {
            $where['s.audit_status'] = $audit_status;
        }
        /*var_dump($where);exit;*/
        //查询总条数
        $total = D('api_ct_users as s')->join('left join api_provinces as p on p.id=s.province_id')->join('left join api_cities as c on c.id=s.city_id')->join('left join api_areas as a on a.id=s.area_id')->join('left join api_user as u on u.id=s.audit_id')->where($where)->count();//查询满足要求的总记录数

        $info = D('api_ct_users as s')->join('left join api_provinces as p on p.id=s.province_id')->join('left join api_cities as c on c.id=s.city_id')->join('left join api_areas as a on a.id=s.area_id')->join('left join api_user as u on u.id=s.audit_id')->field('s.id,s.user_name,s.phone,s.com_name,s.address,p.province,c.city,a.area,s.add_time,u.username,s.audit_time,s.audit_status')->where($where)->order('s.id')->limit($start, $limit)->select();
        foreach($info as $keys=>$values){

            foreach($values as $key=>$value){

                if($values[$key]===null){
                    $info[$keys][$key] = '';

                }
            }

        }
        if($info){
            $data = array(
                'add_time'=>$getInfo['add_time'],
                'audit_status'=>$audit_status,
                'status'=>'success',
                'total' => $total,
                'data' => $info
            );
        }else{
            $data = array(
                'add_time'=>$getInfo['add_time'],
                'audit_status'=>$audit_status,
                'status'=>'fail',
                'total' => $total,
                'data' => $info
            );
        }

        $this->ajaxReturn($data, 'json');
    }

    /**
     * 审核通过
     * @author: 李胜辉
     * @time: 2018/10/23 09:32
     */
    public function open()
    {
        $id = I('post.id');
        $arr['audit_status'] = 'S';
        $arr['audit_id'] = session('uid');
        $arr['audit_time'] = time();
        $res = D('api_ct_users')->where(array('id' => $id))->save($arr);
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
        $arr['audit_status'] = 'F';
        $arr['audit_id'] = session('uid');
        $arr['audit_time'] = time();
        $res = D('api_ct_users')->where(array('id' => $id))->save($arr);
        if ($res === false) {
            $this->ajaxError('操作失败');
        } else {
            $this->ajaxSuccess('添加成功');
        }
    }


}