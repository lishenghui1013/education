<?php
/**
 * 订单管理
 * User: 李胜辉
 * Date: 2018/12/04
 * Time: 17:32
 */
namespace Admin\Controller;


class OrderController extends BaseController {
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
        $com_name = $getInfo['com_name'] ? $getInfo['com_name'] : '';//查询关键字
        $date = $getInfo['date'] ? $getInfo['date'] : '';//日期
        $order_status = $getInfo['order_status'] ? $getInfo['order_status'] : '';
        $where = array();
        if ($com_name != '') {
            $where['u.com_name'] = array('like', '%' . $com_name . '%');
        }
        if ($date != '') {
            $where['_string'] = 'FROM_UNIXTIME(o.add_time,"%Y-%m-%d")="' . $date . '"';
        }
        if ($order_status != '') {
            $where['o.order_status'] = $order_status;
        }
        //查询总条数
        $total = D('api_order as o')->join('left join api_curriculum as c on c.id=o.goods_id')->join('left join api_ct_users as u on u.id=c.add_id')->where($where)->count();//查询满足要求的总记录数
        $info = D('api_order as o')->join('left join api_curriculum as c on c.id=o.goods_id')->join('left join api_ct_users as u on u.id=c.add_id')->field('o.*,c.curriculum_name,c.user_type as seller_user_type,u.com_name as seller_name,u.phone as seller_phone')->where($where)->order('o.id desc')->limit($start, $limit)->select();
        foreach ($info as $keys => $values) {

            if($values['user_type']=='STU'){
                $user_info= D('api_users')->field('user_name,phone')->where(array('id'=>$values['add_id']))->find();
                $info[$keys]['purchaser_name'] = $user_info['user_name'];
                $info[$keys]['purchaser_phone'] = $user_info['phone'];
            }else{
                $user_info= D('api_ct_users')->field('user_name,com_name,phone')->where(array('id'=>$values['add_id']))->find();
                $info[$keys]['purchaser_name'] = $user_info['com_name'];
                $info[$keys]['purchaser_phone'] = $user_info['phone'];
            }

            $card_info = D('api_bankcard as b')->join('left join api_bankname as n on n.id=b.bank_id')->field('b.phone,b.user_name,b.bank_card,n.bank_name')->where(array('b.default'=>'Y','b.user_type'=>$goods_info['user_type'],'b.user_id'=>$goods_info['add_id']))->find();
            $info[$keys]['bank_phone'] = $card_info['phone'];
            $info[$keys]['true_name'] = $card_info['user_name'];
            $info[$keys]['bank_name'] = $card_info['bank_name'];
            $info[$keys]['bank_card'] = $card_info['bank_card'];

        }
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
    public function rimitIndex()
    {
        $rake_ratio = D('api_ratio')->where(array('ratio_type'=>'RAKE'))->getField('ratio');
        $this->assign('rake_ratio',$rake_ratio);
        $this->display();
    }
    /**
     * ajax打款列表页
     * @author: 李胜辉
     * @time: 2018/12/05 17:32
     */
    public function ajaxGetRimitIndex()
    {
        $getInfo = I('post.');
        $curr = $getInfo['curr'] ? $getInfo['curr'] : 1;//当前页
        $limit = $getInfo['limit'] ? $getInfo['limit'] : C('PAGENUM');//每页显示条数
        $start = ($curr - 1) * $limit;//开始
        $com_name = $getInfo['com_name'] ? $getInfo['com_name'] : '';//查询关键字
        $date = $getInfo['date'] ? $getInfo['date'] : '';//日期
        $rimit_status = $getInfo['rimit_status'] ? $getInfo['rimit_status'] : '';
        $where = array();
        $where['o.order_type'] = 'CUR';//订单类型为课程
        $where['o.order_status'] = 'Y';//已付款
         if ($com_name != '') {
             $where['u.com_name'] = array('like', '%' . $com_name . '%');
         }
        if ($date != '') {
            $where['_string'] = 'FROM_UNIXTIME(o.payment_time,"%Y-%m-%d")="' . $date . '"';
        }
        if ($rimit_status != '') {
            $where['o.pay_to_com'] = $rimit_status;
        }
        //查询总条数
        $total = D('api_order as o')->join('left join api_curriculum as c on c.id=o.goods_id')->join('left join api_ct_users as u on u.id=c.add_id')->where($where)->count();//查询满足要求的总记录数
        $info = D('api_order as o')->join('left join api_curriculum as c on c.id=o.goods_id')->join('left join api_ct_users as u on u.id=c.add_id')->field('o.*,c.curriculum_name,c.user_type as seller_user_type,u.com_name as seller_name,u.phone as seller_phone')->where($where)->order('o.id desc')->limit($start, $limit)->select();
        foreach ($info as $keys => $values) {

            if($values['user_type']=='STU'){
                $user_info= D('api_users')->field('user_name,phone')->where(array('id'=>$values['add_id']))->find();
                $info[$keys]['purchaser_name'] = $user_info['user_name'];
                $info[$keys]['purchaser_phone'] = $user_info['phone'];
            }else{
                $user_info= D('api_ct_users')->field('user_name,com_name,phone')->where(array('id'=>$values['add_id']))->find();
                $info[$keys]['purchaser_name'] = $user_info['com_name'];
                $info[$keys]['purchaser_phone'] = $user_info['phone'];
            }

            $card_info = D('api_bankcard as b')->join('left join api_bankname as n on n.id=b.bank_id')->field('b.phone,b.user_name,b.bank_card,n.bank_name')->where(array('b.default'=>'Y','b.user_type'=>$goods_info['user_type'],'b.user_id'=>$goods_info['add_id']))->find();
            $info[$keys]['bank_phone'] = $card_info['phone'];
            $info[$keys]['true_name'] = $card_info['user_name'];
            $info[$keys]['bank_name'] = $card_info['bank_name'];
            $info[$keys]['bank_card'] = $card_info['bank_card'];

        }
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
     * 打款
     * @author: 李胜辉
     * @time: 2018/12/05 09:32
     */
    public function rimit()
    {
            $id = I('post.id');
            $data = array('pay_to_com'=>'Y','pay_to_time'=>time());
            $res = D('api_order')->where(array('id' => $id))->save($data);
            if ($res === false) {
                $this->ajaxError('操作失败');
            } else {
                $this->ajaxSuccess('编辑成功');
            }

    }
    /**
     * 取消打款
     * @author: 李胜辉
     * @time: 2018/12/05 09:32
     */
    public function unRimit()
    {
        $id = I('post.id');
        $data = array('pay_to_com'=>'N','pay_to_time'=>'');
        $res = D('api_order')->where(array('id' => $id))->save($data);
        if ($res === false) {
            $this->ajaxError('操作失败');
        } else {
            $this->ajaxSuccess('编辑成功');
        }

    }


}