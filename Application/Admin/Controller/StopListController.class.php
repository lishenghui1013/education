<?php
/**
 * 禁用名单
 * User: 李胜辉
 * Date: 2018/10/17
 * Time: 17:32
 */
namespace Admin\Controller;


class StopListController extends BaseController {
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
     * ajax列表页
     * @author: 李胜辉
     * @time: 2018/10/22 17:32
     */
    public function ajaxGetIndex()
    {
        $getInfo = I('post.');
        $curr = $getInfo['curr'] ? $getInfo['curr'] : 1;//当前页
        $limit = $getInfo['limit'] ? $getInfo['limit'] : C('PAGENUM');//每页显示条数
        $start = ($curr - 1) * $limit;//开始
        $user_name = $getInfo['user_name'] ? $getInfo['user_name'] : '';//查询关键字
        $phone = $getInfo['phone'] ? $getInfo['phone']: '';//查询手机号

        $where['use_status'] = 2;//禁用状态
        if ($user_name != '') {
            $where['user_name'] = $user_name;
        }
        if ($phone != '') {
            $where['phone'] = $phone;
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


}