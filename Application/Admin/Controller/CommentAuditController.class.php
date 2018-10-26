<?php
/**
 * 评论审核
 * User: 李胜辉
 * Date: 2018/10/17
 * Time: 17:32
 */
namespace Admin\Controller;


class CommentAuditController extends BaseController {
    /**
     * 列表页
     * @author: 李胜辉
     * @time: 2018/10/17 17:32
     */
    public function index()
    {
        $this->display();
    }

    /**
     * 列表页
     * @author: 李胜辉
     * @time: 2018/10/26 10:32
     */
    public function ajaxGetIndex()
    {
        $getInfo = I('post.');
        $curr = $getInfo['curr'] ? $getInfo['curr'] : 1;//当前页
        $limit = $getInfo['limit'] ? $getInfo['limit'] : 1;//每页显示条数
        $start = ($curr-1) * $limit;//开始

        $add_time = $getInfo['add_time'] ? strtotime($getInfo['add_time']) : '';//查询的时间
        $audit_status = $getInfo['audit_status'] ? $getInfo['audit_status'] : '';//查询的审核状态
        $title = $getInfo['title'] ? $getInfo['title'] : '';//查询关键字
        $where = array();
        if ($add_time != '') {
            $big_time = $add_time + 24 * 60 * 60;
            $where['c.add_time'] = array(array('elt', $big_time),array('egt', $add_time));
        }
        if ($audit_status != '') {
            $where['c.audit_status'] = $audit_status;
        }
        if ($title != '') {
            $where['p.title'] = array('like','%'.$title.'%');
        }
        /*var_dump($where);exit;*/
        //查询总条数
        $total = D('api_comment as c')->join('left join api_publish as p on p.id=c.item_id')->join('left join api_users as s on s.id=c.user_id')->join('left join api_user as u on u.id=c.audit_id')->where($where)->count();//查询满足要求的总记录数

        $info = D('api_comment as c')->join('left join api_publish as p on p.id=c.item_id')->join('left join api_users as s on s.id=c.user_id')->join('left join api_user as u on u.id=c.audit_id')->field('c.id,c.content,p.title,c.add_time,s.user_name,u.username,c.audit_time,c.audit_status')->where($where)->order('c.id')->limit($start, $limit)->select();
        foreach($info as $keys=>$values){

            foreach($values as $key=>$value){

                if($values[$key]===null){
                    $info[$keys][$key] = '';

                }
            }

        }
        if($info){
            $data = array(
                'limit'=>$limit,
                'curr'=>$curr,
                'add_time'=>$getInfo['add_time'],
                'audit_status'=>$audit_status,
                'status'=>'success',
                'total' => $total,
                'data' => $info
            );
        }else{
            $data = array(
                'limit'=>$limit,
                'curr'=>$curr,
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
        $res = D('api_comment')->where(array('id' => $id))->save($arr);
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
        $res = D('api_comment')->where(array('id' => $id))->save($arr);
        if ($res === false) {
            $this->ajaxError('操作失败');
        } else {
            $this->ajaxSuccess('添加成功');
        }
    }
    /**
     * 删除
     * @author: 李胜辉
     * @time: 2018/10/26 09:32
     */
    public function delete()
    {
        $id = I('post.id');
        $res = D('api_comment')->where(array('id' => $id))->delete();
        if ($res === false) {
            $this->ajaxError('操作失败');
        } else {
            $this->ajaxSuccess('添加成功');
        }
    }

}