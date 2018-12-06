<?php
/**
 * 豆币
 * User: 李胜辉
 * Date: 2018/12/04
 * Time: 08:32
 */

namespace Admin\Controller;


class BeanController extends BaseController
{
    /**
     * 列表页
     * @author: 李胜辉
     * @time: 2018/12/04 08:32
     */
    public function index()
    {
        $this->display();
    }

    /**
     * ajax列表页
     * @author: 李胜辉
     * @time: 2018/12/04 17:32
     */
    public function ajaxGetIndex()
    {
        $getInfo = I('post.');
        $curr = $getInfo['curr'] ? $getInfo['curr'] : 1;//当前页
        $limit = $getInfo['limit'] ? $getInfo['limit'] : C('PAGENUM');//每页显示条数
        $start = ($curr - 1) * $limit;//开始
        $io_type = $getInfo['io_type'] ? $getInfo['io_type'] : '';//收支类型(SIGN:签到;READ:阅读;SHARE:分享;NOSIGN:未签到;PUB:发布;INVITE:邀请;SHOP:购物;PUBGET:发布所得;)
        $user_type = $getInfo['user_type'] ? $getInfo['user_type'] : '';//角色类型(STU:学生;TEA:老师;COM:机构)
        $date = $getInfo['add_time'] ? $getInfo['add_time'] : '';//日期
        $where = array();
        if ($io_type != '') {
            $where['io_type'] = $io_type;
        }
        if ($user_type != '') {
            $where['user_type'] = $user_type;
        }
        if($date != ''){
            $where['_string'] = 'FROM_UNIXTIME(add_time,"%Y-%m-%d")="' . $date . '"';
        }
        //查询总条数
        $total = D('api_bean_io')->where($where)->count();//查询满足要求的总记录数

        $info = D('api_bean_io')->field('id,num,status,order,io_type,user_type,explain,user_id,add_time')->where($where)->order('id desc')->limit($start, $limit)->select();
        foreach ($info as $keys => $values) {

            if ($values['user_type'] == 'STU') {
                $user_info = D('api_users')->where(array('id' => $values['user_id']))->field('user_name,phone')->find();

                $info[$keys]['user_name'] = $user_info['user_name'];
                $info[$keys]['phone'] = $user_info['phone'];
               /* print_r($info);die();*/
            } else {
                $user_info = D('api_ct_users')->where(array('id' => $values['user_id']))->field('user_name,phone')->find();
                $info[$keys]['user_name'] = $user_info['user_name'];
                $info[$keys]['phone'] = $user_info['phone'];
            }

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
     * 汇总
     * @author: 李胜辉
     * @time: 2018/12/04 08:32
     */
    public function total()
    {
        $this->display();
    }

    /**
     * ajax机构汇总列表页
     * @author: 李胜辉
     * @time: 2018/12/04 17:32
     */
    public function ajaxComTotal()
    {
        $getInfo = I('post.');
        $curr = $getInfo['curr'] ? $getInfo['curr'] : 1;//当前页
        $limit = $getInfo['limit'] ? $getInfo['limit'] : C('PAGENUM');//每页显示条数
        $start = ($curr - 1) * $limit;//开始
        $year = $getInfo['year'] ? $getInfo['year'] : '';//添加时间年

        $month = $getInfo['month'] ? $getInfo['month'] : '';//添加时间月
        $day = $getInfo['day'] ? $getInfo['day'] : '';//添加时间日
        $user_type = $getInfo['user_type'] ? $getInfo['user_type'] : 'COM';//角色类型(STU:学生;TEA:老师;COM:机构)
        $com_name = $getInfo['com_name'] ? $getInfo['com_name'] : '';
        $where = array();
        $where['c.audit_status'] = 'S';
        if($user_type != ''){
            $where['b.user_type'] = $user_type;//角色类型(STU:学生;TEA:老师;COM:机构)
        }
        if($com_name != ''){
            $where['c.com_name'] = array('like', '%'.$com_name.'%');//角色类型(STU:学生;TEA:老师;COM:机构)
        }

        if ($year != '') {
            $where['_string'] = 'FROM_UNIXTIME(b.add_time,"%Y")="' . $year . '"';
            if ($month != '') {
                $month = $year . '-' . $month;
                $where['_string'] = 'FROM_UNIXTIME(b.add_time,"%Y-%m")="' . $month . '"';
                if ($day != '') {
                    $day = $year . '-' . $month . '-' . $day;
                    $where['_string'] = 'FROM_UNIXTIME(b.add_time,"%Y-%m-%d")="' . $day . '"';
                }
            }
        }
        //查询总条数
        $total = D('api_ct_users as c')->join('left join api_bean_io as b on b.user_id=c.id')->where($where)->count();//查询满足要求的总记录数

        $info = D('api_ct_users as c')->join('left join api_bean_io as b on b.user_id=c.id')->field('c.id,c.user_name,c.com_name,c.phone,c.balance,c.bean_balance,b.id as bid,b.num,b.io_type,b.user_type,b.explain,b.add_time')->where($where)->order('c.id desc')->limit($start, $limit)->select();
        foreach ($info as $keys => $values) {
            //收支类型(SIGN:签到;READ:阅读;SHARE:分享;NOSIGN:未签到;PUB:发布;INVITE:邀请;SHOP:购物;PUBGET:发布所得;)
            $sign_total = D('api_bean_io')->where(array('user_type'=>$values['user_type'],'user_id'=>$values['id'],'io_type'=>'SIGN'))->sum('num');//签到所得总数

            $read_total = D('api_bean_io')->where(array('user_type'=>$values['user_type'],'user_id'=>$values['id'],'io_type'=>'READ'))->sum('num');//阅读
            $share_total = D('api_bean_io')->where(array('user_type'=>$values['user_type'],'user_id'=>$values['id'],'io_type'=>'SHARE'))->sum('num');//分享
            $pub_total = D('api_bean_io')->where(array('user_type'=>$values['user_type'],'user_id'=>$values['id'],'io_type'=>'PUB'))->sum('num');//发布
            $invite_total = D('api_bean_io')->where(array('user_type'=>$values['user_type'],'user_id'=>$values['id'],'io_type'=>'INVITE'))->sum('num');//邀请
            $shop_total = D('api_bean_io')->where(array('user_type'=>$values['user_type'],'user_id'=>$values['id'],'io_type'=>'SHOP'))->sum('num');//购物消费
            $pubget_total = D('api_bean_io')->where(array('user_type'=>$values['user_type'],'user_id'=>$values['id'],'io_type'=>'PUBGET'))->sum('num');//发布内容被阅读所得

            $expend_total = $read_total+$shop_total;//支出总和
            $income_total= $sign_total+$share_total+$pub_total+$invite_total+$pubget_total;//收入总和
            $info[$keys]['expend_total']= $expend_total;//
            $info[$keys]['income_total']= $income_total;
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


}