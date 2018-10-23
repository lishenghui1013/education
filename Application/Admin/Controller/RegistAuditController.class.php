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
        $this->display();
    }

    /**
     * 列表页
     * @author: 李胜辉
     * @time: 2018/10/23 17:32
     */
    public function ajaxGetIndex()
    {
        $postData = I('post.');
        $start = $postData['start'] ? $postData['start'] : 0;
        $limit = $postData['length'] ? $postData['length'] : 20;
        $draw = $postData['draw'];
        $where = array();
        $getInfo = I('get.');
        $date = $getInfo['date'] ? $getInfo['date'] : '';
        $del_status = $getInfo['del_status'] ? $getInfo['del_status'] : '';
        if ($date != '') {
            $big_time = $date + 24 * 60 * 60;
            $where['s.add_time'] = array('elt', $big_time);
            $where['s.add_time'] = array('egt', $date);
        }
        if ($del_status != '') {
            $where['s.del_status'] = $del_status;
        }

        //查询总条数
        $total = D('api_ct_users as s')->join('left join api_provinces as p on p.id=s.province_id')->join('left join api_cities as c on c.id=s.city_id')->join('left join api_areas as a on a.id=s.area_id')->join('left join api_user as u on u.id=s.audit_id')->where($where)->count();//查询满足要求的总记录数

        $info = D('api_ct_users as s')->join('left join api_provinces as p on p.id=s.province_id')->join('left join api_cities as c on c.id=s.city_id')->join('left join api_areas as a on a.id=s.area_id')->join('left join api_user as u on u.id=s.audit_id')->field('s.id,s.user_name,s.phone,s.com_name,s.address,p.province,c.city,a.area,s.add_time,u.username,s.audit_time,s.audit_status')->where($where)->order('e.id')->limit($start, $limit)->select();

        $data = array(
            'draw'            => $draw,
            'recordsTotal'    => $total,
            'recordsFiltered' => $total,
            'data'            => $info
        );
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
        $arr['e_status'] = 'S';
        $arr['audit_userid'] = session('uid');
        $arr['audit_time'] = time();

        $res = D('api_expense')->where(array('id' => $id))->save($arr);
        if ($res === false) {
            $this->ajaxError('操作失败');
        } else {
            $this->ajaxSuccess('添加成功');
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
        $arr['e_status'] = 'F';
        $arr['audit_userid'] = session('uid');
        $arr['audit_time'] = time();
        $res = D('api_expense')->where(array('id' => $id))->save($arr);
        if ($res === false) {
            $this->ajaxError('操作失败');
        } else {
            $this->ajaxSuccess('添加成功');
        }
    }


}