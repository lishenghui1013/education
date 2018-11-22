<?php
/**
 * 定时任务
 * User: 李胜辉
 * Date: 2018/11/20
 * Time: 17:32
 */

namespace Admin\Controller;

use Home\Api\Common;


class CrontabController extends BaseController
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
        $crontab_name = $getInfo['crontab_name'] ? $getInfo['crontab_name'] : '';//查询关键字
        $where = array();
        if ($crontab_name != '') {
            $where['c.crontab_name'] = array('like', '%' . $crontab_name . '%');
        }
        //查询总条数
        $total = D('api_crontab as c')->join('left join api_user as u on u.id=c.add_id')->where($where)->count();//查询满足要求的总记录数

        $info = D('api_crontab as c')->join('left join api_user as u on u.id=c.add_id')->field('c.id,c.crontab_name,c.start_time,c.interval,c.use_status,u.username,c.add_time')->where($where)->order('c.id')->limit($start, $limit)->select();
        foreach ($info as $keys => $values) {
            $interval = explode(':',$values['interval']);
            $info[$keys]['interval'] = $interval[0].'时'.$interval[1].'分'.$interval[2].'秒';
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
     * @time: 2018/10/29 09:32
     */
    public function delete()
    {
        $id = I('post.id');
        $res = D('api_crontab')->where(array('id' => $id))->delete();
        if ($res === false) {
            $this->ajaxError('删除失败');
        } else {
            $this->ajaxSuccess('删除成功');
        }
    }

    /**
     * 添加定时
     * @author: 李胜辉
     * @time: 2018/10/29 09:32
     */
    public function add()
    {
        if (IS_POST) {
            $data_info = I('post.');

            $data['add_id'] = session('uid');
            $data['crontab_name']= $data_info['crontab_name'];
            $data['start_time']= strtotime($data_info['start_time']);
            $data['interval']= $data_info['hour'].':'.$data_info['minute'].':'.$data_info['second'];
            $data['add_time'] = time();
            $res = D('api_crontab')->add($data);
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
     * 编辑定时
     * @author: 李胜辉
     * @time: 2018/10/29 09:32
     */
    public function update()
    {
        if (IS_GET) {
            $id = I('get.id');
            $listInfo = D('api_crontab')->where(array('id' => $id))->find();
            $interval = explode(':',$listInfo['interval']);
            $listInfo['hour'] = $interval[0];
            $listInfo['minute'] = $interval[1];
            $listInfo['second'] = $interval[2];
            $this->assign('detail', $listInfo);
            $this->display('add');
        } elseif (IS_POST) {
            $data_info = I('post.');
            $data['crontab_name']= $data_info['crontab_name'];
            $data['start_time']= strtotime($data_info['start_time']);
            $data['interval']= $data_info['hour'].':'.$data_info['minute'].':'.$data_info['second'];
            $res = D('api_crontab')->where(array('id' => $data_info['id']))->save($data);
            if ($res === false) {
                $this->ajaxError('操作失败');
            } else {
                $this->ajaxSuccess('编辑成功');
            }
        }
    }
    /**
     * 定时任务开始执行时间
     * @author: 李胜辉
     * @time: 2018/11/22 09:32
     */
    public function startCrontab()
    {
        $id = I('post.id');
        $use_status = I('post.use_status');
        $start_time = D('api_crontab')->where(array('id' => $id))->getField('start_time');
        $use_status = $use_status;
        $arr['use_status'] = intval($use_status);
        $res = D('api_crontab')->where(array('id' => $id))->save($arr);
        if($res){
            $this->ajaxSuccess('操作成功');
            $stop = time();
            while($start_time >= $stop){
                if($start_time == $stop){
                    $stop = open($id);
                }else{
                    $stop = time();
                }
            }
        }else{
            $this->ajaxError('操作失败');

        }

    }

    /**
     * 开始执行定时任务
     * @author: 李胜辉
     * @time: 2018/11/22 09:32
     */
    public function open($id)
    {
        $id = $id;
        $crontab_info = D('api_crontab')->where(array('id' => $id))->find();
        $common = new Common();
        if ($crontab_info['use_status'] == 0) {
            return time();
        } else {
            do {
                $timing = M('api_crontab')->where(array('id' => $id))->find();//通过后台控制数据库的数据 来控制此循环
                ignore_user_abort();//关掉浏览器，PHP脚本也可以继续执行.
                set_time_limit(0);// 通过set_time_limit(0)可以让程序无限制的执行下去
                $interval = $crontab_info['interval'];// 每隔24小时运行
                //每天没有签到的会员,豆币金额减去相应数额
                $deduct_num = D('api_award')->where(array('award_type' => 'NOSIGN'))->getField('award_num');
                $one_day = 60 * 60 * 24;
                $time = time() - $one_day;
                $date = date('Y-m-d', $time);//日期
                $where = array('b.user_type' => 'STU', 'io_type' => 'SIGN');
                $where['_string'] = 'FROM_UNIXTIME(add_time,"%Y-%m-%d")="' . $date . '"';
                $student_ids = D('api_bean_io')->where($where)->getField('id', true);
                if ($student_ids) {
                    $student_ids = implode(',', $student_ids);
                    $modul = new \Think\Model();
                    $sql = 'update api_users set bean_balance=beanbalance-' . $deduct_num . ' where id not in (' . $student_ids . ')';
                    $update = $modul->execute($sql);
                    if ($update) {
                        $data = array();
                        $all_data = array();
                        foreach ($student_ids as $key => $value) {
                            $microtime = $common->getMicrotime();
                            $data['num'] = $deduct_num;
                            $data['io_type'] = 'NOSIGN';
                            $data['order'] = $microtime . mt_rand(1000, 9999);//订单号;
                            $data['explain'] = '未签到';
                            $data['user_type'] = 'STU';
                            $data['user_id'] = $value;
                            $data['add_time'] = time();
                            $all_data[] = $data;
                        }
                        unset($key, $value);
                        D('api_bean_io')->addAll($all_data);
                    }
                }
                $wheres = array('b.user_type' => array('neq', 'STU'), 'io_type' => 'SIGN');
                $wheres['_string'] = 'FROM_UNIXTIME(add_time,"%Y-%m-%d")="' . $date . '"';
                $com_ids = D('api_bean_io')->where($wheres)->getField('id', true);
                if ($com_ids) {
                    $com_ids = implode(',', $com_ids);
                    $moduls = new \Think\Model();
                    $sql = 'update api_ct_users set bean_balance=beanbalance-' . $deduct_num . ' where id not in (' . $com_ids . ')';
                    $updates = $moduls->execute($sql);
                    if ($updates) {
                        $values = '';
                        $data = array();
                        $all_data = array();
                        foreach ($student_ids as $key => $value) {
                            $microtime = $common->getMicrotime();
                            $data['num'] = $deduct_num;
                            $data['io_type'] = 'NOSIGN';
                            $data['order'] = $microtime . mt_rand(1000, 9999);//订单号;
                            $data['explain'] = '未签到';
                            $data['user_type'] = D('api_ct_users')->where(array('id' => $value))->getField('user_type');
                            $data['user_id'] = $value;
                            $data['add_time'] = time();
                            $all_data[] = $data;
                        }
                        unset($key, $value);
                        D('api_bean_io')->addAll($all_data);
                    }
                }
                sleep($interval);
            } while ($timing['use_staus'] == 1);//当为true时  无限循环
            return time();
        }
    }

    /**
     * 停止定时任务
     * @author: 李胜辉
     * @time: 2018/11/22 09:32
     */
    public function close()
    {
        $id = I('post.id');
        $use_status = I('post.use_status');
        $arr['use_status'] = intval($use_status);
        $res = D('api_crontab')->where(array('id' => $id))->save($arr);
        if ($res === false) {
            $this->ajaxError('操作失败');
        } else {
            $this->ajaxSuccess('操作成功');
        }
    }


}