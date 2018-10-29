<?php
/**
 * 提现审核
 * User: 李胜辉
 * Date: 2018/10/17
 * Time: 17:32
 */
namespace Admin\Controller;


class WithdrawalAuditController extends BaseController {
    /**
     * 列表页
     * @author: 李胜辉
     * @time: 2018/10/23 17:32
     */
    public function index()
    {
        $this->display();
    }
    /**
     * ajax列表页
     * @author: 李胜辉
     * @time: 2018/10/23 17:32
     */
    public function ajaxGetIndex()
    {
        $getInfo = I('post.');
        $curr = $getInfo['curr'] ? $getInfo['curr'] : 1;//当前页
        $limit = $getInfo['limit'] ? $getInfo['limit'] : 1;//每页显示条数
        $start = ($curr-1) * $limit;//开始
        $user_name = $getInfo['user_name'] ? $getInfo['user_name'] : '';//查询的审核状态
        $phone = $getInfo['phone'] ? $getInfo['phone'] : '';//查询的审核状态
        $e_status = $getInfo['e_status'] ? $getInfo['e_status'] : '';//查询的审核状态
        $where = array();

        if ($user_name != '') {
            $where['b.user_name'] = $user_name;
        }
        if ($phone != '') {
            $where['b.phone'] = $phone;
        }
        if ($e_status != '') {
            $where['e.e_status'] = $e_status;
        }
        //查询总条数
        $total = D('api_expense as e')->join('left join api_users as s on s.id=e.user_id')->join('left join api_bankcard as b on b.id=e.bankcard_id')->join('left join api_user as u on u.id=e.audit_userid')->where($where)->count();//查询满足要求的总记录数

        $info = D('api_expense as e')->join('left join api_users as s on s.id=e.user_id')->join('left join api_bankcard as b on b.id=e.bankcard_id')->join('left join api_user as u on u.id=e.audit_userid')->field('e.id,b.user_name,b.phone,s.balance,e.e_money,b.bank_name,b.bank_card,b.Acc_open,e.add_time,e.audit_time,u.username,e.e_status')->where($where)->order('e.id')->limit($start, $limit)->select();
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
                'status'=>'success',
                'total' => $total,
                'data' => $info
            );
        }else{
            $data = array(
                'limit'=>$limit,
                'curr'=>$curr,
                'add_time'=>$getInfo['add_time'],
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