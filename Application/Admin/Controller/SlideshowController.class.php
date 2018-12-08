<?php
/**
 * 商城轮播
 * User: 李胜辉
 * Date: 2018/11/02
 * Time: 10:32
 */

namespace Admin\Controller;


class SlideshowController extends BaseController
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

        //查询总条数
        $total = D('api_slideshow as s')->join('left join api_user as u on u.id=s.add_id')->join('left join api_publish as p on p.id=s.publish_id')->join('left join api_ct_users as c on c.id=p.pub_userid')->where($where)->count();//查询满足要求的总记录数

        $info = D('api_slideshow as s')->join('left join api_user as u on u.id=s.add_id')->join('left join api_publish as p on p.id=s.publish_id')->join('left join api_ct_users as c on c.id=p.pub_userid')->field('s.id,p.title,p.cover,c.com_name,p.user_type,p.item_type,p.pub_time,u.username,s.add_time')->where($where)->order('s.id desc')->limit($start, $limit)->select();
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
            $update = D('api_publish')->where(array('id' => $publish_id))->save(array('slideshow_status' => 'N'));
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
            $update = D('api_publish')->where(array('id' => $id))->save(array('slideshow_status' => 'N'));
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
        $data['pic_type'] = D('api_publish')->where(array('id' => $id))->getField('user_type');
        $data['publish_id'] = $id;
        $data['add_id'] = session('uid');
        $data['add_time'] = time();
        $res = D('api_slideshow')->add($data);
        if ($res === false) {
            $this->ajaxError('操作失败', 0);
        } else {
            $update = D('api_publish')->where(array('id' => $id))->save(array('slideshow_status' => 'Y'));
            if($update){
                $this->ajaxSuccess('添加成功');
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
        $com_name = $getInfo['com_name'] ? $getInfo['com_name'] : '';//查询关键字
        $add_time = $getInfo['add_time'] ? strtotime($getInfo['add_time']) : '';//查询的时间
       //发布人类型
        $user_type = $getInfo['user_type'] ? $getInfo['user_type'] : '';
        //内容类型
        $item_type = $getInfo['item_type'] ? $getInfo['item_type'] : '';
        $where = array();
        $where['p.audit_status'] = 'S';
        $where['p.del_status'] = 2;
        if ($add_time != '') {
            $big_time = $add_time + 24 * 60 * 60;
            $where['p.pub_time'] = array(array('elt', $big_time), array('egt', $add_time));
        }
        if ($com_name != '') {
            $where['s.com_name'] = array('like', '%' . $com_name . '%');
        }
        if ($user_type != '') {
            $where['p.user_type'] = $user_type;
        }
        if ($item_type != '') {
            $where['p.item_type'] = $item_type;
        }

        //查询总条数
        $total = D('api_publish as p')->join('left join api_ct_users as s on s.id=p.pub_userid')->where($where)->count();//查询满足要求的总记录数

        $info = D('api_publish as p')->join('left join api_ct_users as s on s.id=p.pub_userid')->field('p.id,s.com_name,p.title,p.intro,p.pub_time,p.cover,p.user_type,p.item_type,p.slideshow_status')->where($where)->order('p.id')->limit($start, $limit)->select();
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