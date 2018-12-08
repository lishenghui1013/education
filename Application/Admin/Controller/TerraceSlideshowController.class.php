<?php
/**
 * 平台轮播
 * User: 李胜辉
 * Date: 2018/11/02
 * Time: 10:32
 */

namespace Admin\Controller;


class TerraceSlideshowController extends BaseController
{
    /**
     * 列表页
     * @author: 李胜辉
     * @time: 2018/11/02 10:32
     */
    public function index()
    {
        $this->display();
    }

    /**
     * ajax列表页
     * @author: 李胜辉
     * @time: 2018/11/02 10:32
     */
    public function ajaxGetIndex()
    {

        $getInfo = I('post.');
        $curr = $getInfo['curr'] ? $getInfo['curr'] : 1;//当前页
        $limit = $getInfo['limit'] ? $getInfo['limit'] : C('PAGENUM');//每页显示条数
        $start = ($curr - 1) * $limit;//开始
        $where = array();
        $where['s.pic_type']='STOR';

        //查询总条数
        $total = D('api_slideshow as s')->join('left join api_user as u on u.id=s.add_id')->join('left join api_curriculum as p on p.id=s.publish_id')->join('left join api_ct_users as c on c.id=p.add_id')->where($where)->count();//查询满足要求的总记录数

        $info = D('api_slideshow as s')->join('left join api_user as u on u.id=s.add_id')->join('left join api_curriculum as p on p.id=s.publish_id')->join('left join api_ct_users as c on c.id=p.add_id')->field('s.id,p.curriculum_name,p.cover,c.com_name,p.user_type,u.username,s.add_time')->where($where)->order('s.id desc')->limit($start, $limit)->select();
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
     * 删除记录
     * @author: 李胜辉
     * @time: 2018/11/02 10:32
     */
    public function delete()
    {
        $id = I('post.id');
        $publish_id = D('api_slideshow')->where(array('id'=>$id))->getField('publish_id');
        $res = D('api_slideshow')->where(array('id' => $id))->delete();
        if ($res === false) {
            $this->ajaxError('删除失败');
        } else {
            $update = D('api_curriculum')->where(array('id' => $publish_id))->save(array('slideshow_status' => 'N'));
            if($update){
                $this->ajaxSuccess('删除成功');
            }else{
                $this->ajaxError('操作失败', 0);
            }
        }
    }
    /**
     * 取消轮播
     * @author: 李胜辉
     * @time: 2018/11/16 10:32
     */
    public function cancel()
    {
        $id = I('post.id');
        $res = D('api_slideshow')->where(array('publish_id' => $id))->delete();
        if ($res === false) {
            $this->ajaxError('删除失败');
        } else {
            $update = D('api_curriculum')->where(array('id' => $id))->save(array('slideshow_status' => 'N'));
            if($update){
                $this->ajaxSuccess('删除成功');
            }else{
                $this->ajaxError('操作失败', 0);
            }
        }
    }

    /**
     * 添加轮播图
     * @author: 李胜辉
     * @time: 2018/11/02 10:32
     */
    public function add()
    {

        $id = I('post.id');
        $data['pic_type'] = 'STOR';
        $data['publish_id'] = $id;
        $data['add_id'] = session('uid');
        $data['add_time'] = time();
        $res = D('api_slideshow')->add($data);
        if ($res === false) {
            $this->ajaxError('操作失败', 0);
        } else {
            $update = D('api_curriculum')->where(array('id' => $id))->save(array('slideshow_status' => 'Y'));
            if($update){
                $this->ajaxSuccess('添加成功',1);
            }else{
                $this->ajaxError('操作失败', 0);
            }

        }

    }
    /**
     * 备选添加列表
     * @author: 李胜辉
     * @time: 2018/11/02 10:32
     */
    public function addIndex()
    {
        $this->display();
    }
    /**
     * 备选添加列表
     * @author: 李胜辉
     * @time: 2018/11/02 10:32
     */
    public function ajaxAddIndex()
    {
        $getInfo = I('post.');
        $curr = $getInfo['curr'] ? $getInfo['curr'] : 1;//当前页
        $limit = $getInfo['limit'] ? $getInfo['limit'] : C('PAGENUM');//每页显示条数
        $start = ($curr - 1) * $limit;//开始
        $curriculum_name = $getInfo['curriculum_name'] ? $getInfo['curriculum_name'] : '';//查询关键字
        $where = array();
        $where['p.audit_status'] = 'S';
        if ($curriculum_name != '') {
            $where['s.com_name'] = array('like', '%' . $curriculum_name . '%');
        }

        //查询总条数
        $total = D('api_curriculum as p')->join('left join api_ct_users as s on s.id=p.add_id')->where($where)->count();//查询满足要求的总记录数

        $info = D('api_curriculum as p')->join('left join api_ct_users as s on s.id=p.add_id')->field('p.id,p.curriculum_name,s.com_name,p.intro,p.add_time,p.cover,p.user_type,p.slideshow_status')->where($where)->order('p.id desc')->limit($start, $limit)->select();
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


}