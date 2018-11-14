<?php
/**
 * 奖励管理
 * User: 李胜辉
 * Date: 2018/11/13
 * Time: 10:32
 */
namespace Admin\Controller;


class AwardController extends BaseController {
    /**
     * 列表页
     * @author: 李胜辉
     * @time: 2018/11/13 17:32
     */
    public function index()
    {
        $this->display();
    }

    /**
     * ajax列表页
     * @author: 李胜辉
     * @time: 2018/11/13 17:32
     */
    public function ajaxGetIndex()
    {
        $getInfo = I('post.');
        $curr = $getInfo['curr'] ? $getInfo['curr'] : 1;//当前页
        $limit = $getInfo['limit'] ? $getInfo['limit'] : 1;//每页显示条数
        $start = ($curr - 1) * $limit;//开始
        //查询总条数
        $total = D('api_award as c')->join('left join api_user as u on u.id=c.add_id')->count();//查询满足要求的总记录数
        $info = D('api_award as c')->join('left join api_user as u on u.id=c.add_id')->field('c.id,c.award_type,c.award_num,c.limit,c.serial_days,u.username,c.add_time')->order('c.id')->limit($start, $limit)->select();
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
     * 删除记录
     * @author: 李胜辉
     * @time: 2018/11/13 17:32
     */
    public function delete()
    {
        $id = I('post.id');
        $res = D('api_award')->where(array('id' => $id))->delete();
        if ($res === false) {
            $this->ajaxError('删除失败');
        } else {
            $this->ajaxSuccess('删除成功');
        }
    }
    /**
     * 添加奖励
     * @author: 李胜辉
     * @time: 2018/11/13 17:32
     */
    public function add()
    {
        if (IS_POST) {
            $data = I('post.');
            $data['add_id'] = session('uid');
            $data['add_time'] = time();
            $res = D('api_award')->add($data);
            if ($res === false) {
                $this->ajaxError('操作失败', 0);
            } else {
                $this->ajaxSuccess('添加成功');
            }
        } else {
            $this->display();
        }
    }
    /**
     * 编辑奖励
     * @author: 李胜辉
     * @time: 2018/11/13 17:32
     */
    public function update()
    {
        if (IS_GET) {
            $id = I('get.id');
            $listInfo = D('api_award')->where(array('id'=>$id))->find();
            $this->assign('detail', $listInfo);
            $this->display('add');
        } elseif (IS_POST) {
            $postData = I('post.');
            $res = D('api_award')->where(array('id' => $postData['id']))->save($postData);
            if ($res === false) {
                $this->ajaxError('操作失败');
            } else {
                $this->ajaxSuccess('编辑成功');
            }
        }
    }



}