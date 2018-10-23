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

        $pagenum = I('post.pagenum/d', 1);//每页显示条数
        $currentpage = I('get.p/d', 1);//当前页码
        $user_name = I('post.user_name')!==''?I('post.user_name'):(I('get.buser_name')!==''?I('get.buser_name'):'');//用户名
        $phone = I('post.phone')!==''?I('post.phone'):(I('get.bphone')!==''?I('get.bphone'):'');//电话
        $status = I('post.e_status')!==''?I('post.e_status'):(I('get.ee_status')!==''?I('get.ee_status'):'');//审核状态
        $map['e.etype'] = 2;//类型:提现
        $map['e.r_type'] = 'S';//角色:学生
        $map['b.audit_status'] = 'S';//银行卡审核状态通过
        if ($user_name != '') {
            $map['b.user_name'] = $user_name;
        }
        if ($phone != '') {
            $map['b.phone'] = $phone;
        }
        if ($status != '') {
            $map['e.e_status'] = $status;
        }
        //查询总条数
        $count = D('api_expense as e')->join('left join api_users as s on s.id=e.user_id')->join('left join api_bankcard as b on b.id=e.bankcard_id')->join('left join api_user as u on u.id=e.audit_userid')->where($map)->count();//查询满足要求的总记录数

        $list = D('api_expense as e')->join('left join api_users as s on s.id=e.user_id')->join('left join api_bankcard as b on b.id=e.bankcard_id')->join('left join api_user as u on u.id=e.audit_userid')->field('e.id,b.user_name,b.phone,s.balance,e.e_money,b.bank_name,b.bank_card,b.Acc_open,e.add_time,e.audit_time,u.username,e.e_status')->where($map)->order('e.id')->page($currentpage . ',' . $pagenum)->select();

        $Page = new \Think\Page($count, $pagenum);// 实例化分页类 传入总记录数和每页显示的记录数
        $Page->lastSuffix = false;//最后一页不显示为总页数
        $Page->setConfig('header', '<li class="disabled hwh-page-info"><a>共<em>%TOTAL_ROW%</em>条  <em>%NOW_PAGE%</em>/%TOTAL_PAGE%页</a></li>');
        $Page->setConfig('prev', '上一页');
        $Page->setConfig('next', '下一页');
        $Page->setConfig('last', '末页');
        $Page->setConfig('first', '首页');
        $Page->setConfig('theme', '%HEADER% %FIRST% %UP_PAGE% %LINK_PAGE% %DOWN_PAGE% %END%');
        //分页跳转的时候保证查询条件
        foreach ($map as $key => $val) {
            $key = implode(explode('.',$key));
            if($key=='_string'){

                $temp_arr = explode(' ',$map[$key]);
                foreach($temp_arr as $k=>$v){
                    $temp_arr[$key] = trim($v);
                }
                $key = implode(explode('.',$temp_arr['0']));
                $val = substr($temp_arr['2'],2,-2);

            }
            $Page->parameter[$key] = urlencode($val);

        }
        $show = $Page->show();// 分页显示输出
        $this->assign('list', $list);//查询到的数据
        $this->assign('page', $show);// 赋值分页输出
        $this->assign('user_name', $user_name);//查询姓名
        $this->assign('phone', $phone);// 查询手机号
        $this->assign('status', $status);//查询状态
        $this->display();
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