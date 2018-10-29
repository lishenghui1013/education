<?php
/**
 * 学生列表
 * User: 李胜辉
 * Date: 2018/10/17
 * Time: 17:32
 */
namespace Admin\Controller;
class StudentController extends BaseController {
    /**
     * 列表页
     * @author: 李胜辉
     * @time: 2018/10/22 17:32
     */
    public function index()
    {
        $this->display();
    }
    /**
     * 列表页
     * @author: 李胜辉
     * @time: 2018/10/22 17:32
     */
    public function ajaxGetIndex()
    {
        $getInfo = I('post.');
        $curr = $getInfo['curr'] ? $getInfo['curr'] : 1;//当前页
        $limit = $getInfo['limit'] ? $getInfo['limit'] : 1;//每页显示条数
        $start = ($curr - 1) * $limit;//开始
        $user_name = $getInfo['user_name'] ? $getInfo['user_name'] : '';//用户名
        $phone = $getInfo['phone'] ? $getInfo['phone'] : '';//电话
        $where = array('use_status'=>1);
        if ($phone != '') {
            $where['phone'] = $phone;
        }
        if ($user_name != '') {
            $where['user_name'] = $user_name;
        }

        //查询总条数
        $total = D('api_users')->where($where)->count();//查询满足要求的总记录数
        $info = D('api_users')->field('id,user_name,phone,balance,add_time,use_status')->where($where)->order('id')->limit($start, $limit)->select();
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
                'add_time' => $getInfo['add_time'],
                'status' => 'success',//查询状态:成功为success,失败为fail
                'total' => $total,
                'data' => $info
            );
        } else {
            $data = array(
                'limit' => $limit,
                'curr' => $curr,
                'add_time' => $getInfo['add_time'],
                'status' => 'fail',
                'total' => $total,
                'data' => $info
            );
        }

        $this->ajaxReturn($data, 'json');
    }

    /**
     * 正常
     * @author: 李胜辉
     * @time: 2018/10/19 09:32
     */
    public function open()
    {
        $id = I('post.id');
        $res = D('api_users')->where(array('id' => $id))->save(array('use_status' => 1));
        if ($res === false) {
            $this->ajaxError('操作失败');
        } else {
            $this->ajaxSuccess('添加成功');
        }
    }

    /**
     * 禁用
     * @author: 李胜辉
     * @time: 2018/10/19 09:32
     */
    public function close()
    {
        $id = I('post.id');
        $res = D('api_users')->where(array('id' => $id))->save(array('use_status' => 2));
        if ($res === false) {
            $this->ajaxError('操作失败');
        } else {
            $this->ajaxSuccess('添加成功');
        }
    }
    /**
     * 通知列表页
     * @author: 李胜辉
     * @time: 2018/10/22 17:32
     */
    public function noticeList()
    {
        $user_id = I('get.user_id');
        $list = D('api_users')->where(array('id'=>$user_id))->getField('user_name');
        $this->assign('user_name',$list);
        $this->display();
    }
    /**
     * ajax获取通知列表页
     * @author: 李胜辉
     * @time: 2018/10/22 17:32
     */
    public function ajaxNoticeList()
    {
        $getInfo = I('post.');
        $curr = $getInfo['curr'] ? $getInfo['curr'] : 1;//当前页
        $limit = $getInfo['limit'] ? $getInfo['limit'] : 1;//每页显示条数
        $start = ($curr - 1) * $limit;//开始
        $add_time = $getInfo['add_time'] ? strtotime($getInfo['add_time']) : '';//查询的时间
        $read_status = $getInfo['read_status'] ? $getInfo['read_status'] : '';//查询的阅读状态

        $where = array('to_userid'=>I('post.user_id'));
        if ($add_time != '') {
            $big_time = $add_time + 24 * 60 * 60;
            $where['n.add_time'] = array(array('elt', $big_time),array('egt', $add_time));
        }
        if ($read_status != '') {
            $where['n.read_status'] = $read_status;
        }

        //查询总条数
        $total = D('api_notice as n')->join('left join api_users as u on u.id=n.to_userid')->join('left join api_user as a on a.id=n.send_userid')->where($where)->count();//查询满足要求的总记录数
        $info = D('api_notice as n')->join('left join api_users as u on u.id=n.to_userid')->join('left join api_user as a on a.id=n.send_userid')->field('n.id,u.user_name,n.to_userid,n.title,n.content,n.del_status,n.read_status,n.read_time,n.send_userid,n.add_time,a.username')->where($where)->order('id desc')->order('n.id')->limit($start, $limit)->select();
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
                'add_time' => $getInfo['add_time'],
                'status' => 'success',//查询状态:成功为success,失败为fail
                'total' => $total,
                'data' => $info
            );
        } else {
            $data = array(
                'limit' => $limit,
                'curr' => $curr,
                'add_time' => $getInfo['add_time'],
                'status' => 'fail',
                'total' => $total,
                'data' => $info
            );
        }

        $this->ajaxReturn($data, 'json');
    }





    /**
     * 发送站内通知
     * @author: 李胜辉
     * @time: 2018/10/22 17:32
     */
    public function addNotice()
    {
        if (IS_POST) {
            $data = I('post.');
            $data['send_userid'] = session('uid');
            $data['add_time'] = time();
            $res = D('api_notice')->add($data);
            if ($res === false) {
                $this->ajaxError('操作失败', 0);
            } else {
                $this->ajaxSuccess('添加成功');
            }
        } else {
            $to_userid = I('get.user_id');
            $user_name = D('api_users')->where('id='.$to_userid)->getField('user_name');
            $this->assign('to_userid', $to_userid);
            $this->assign('user_name', $user_name);
            $this->display();
        }
    }

    /**
     * 修改站内通知
     * @author: 李胜辉
     * @time: 2018/10/22 17:32
     */
    public function updateNotice()
    {
        if (IS_GET) {
            $id = I('get.id');
            $subject_list = D('api_notice as n')->join('left join api_users as u on u.id=n.to_userid')->field('n.id,n.title,n.content,n.to_userid,u.user_name')->where('n.id='.$id)->find();

            $this->assign('detail', $subject_list);
            $this->assign('user_name', $subject_list['user_name']);
            $this->display('addNotice');
        } elseif (IS_POST) {
            $postData = I('post.');
            $res = D('api_notice')->where(array('id' => $postData['id']))->save($postData);
            if ($res === false) {
                $this->ajaxError('操作失败');
            } else {
                $this->ajaxSuccess('编辑成功');
            }
        }
    }


    /**
     * 删除通知
     * @author: 李胜辉
     * @time: 2018/10/22 17:32
     */
    public function delete()
    {
        $id = I('post.id');
        $res = D('api_notice')->where(array('id' => $id))->save(array('del_status' => 1));
        if ($res === false) {
            $this->ajaxError('操作失败');
        } else {
            $this->ajaxSuccess('添加成功');
        }
    }

}