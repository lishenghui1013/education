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

        $pagenum = I('post.pagenum/d', 1);//每页显示条数
        $currentpage = I('get.p/d', 1);//当前页码
        $user_name = I('post.user_name')!==''?I('post.user_name'):(I('get.user_name')!==''?I('get.user_name'):'');//用户名
        $phone = I('post.phone')!==''?I('post.phone'):(I('get.phone')!==''?I('get.phone'):'');//电话
        $map['use_status'] = 1;
        if ($user_name != '') {
            $map['user_name'] = $user_name;
        }
        if ($phone != '') {
            $map['phone'] = $phone;
        }
        //查询总条数
        $count = D('api_users')->where($map)->count();//查询满足要求的总记录数

        $list = D('api_users')->field('id,user_name,phone,balance,add_time,use_status')->where($map)->order('id')->page($currentpage . ',' . $pagenum)->select();

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
        $this->display();
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

        $pagenum = I('post.pagenum/d', 1);//每页显示条数
        $currentpage = I('get.p/d', 1);//当前页码
        $map['n.to_userid'] = I('get.user_id');
        $map['n.del_status'] = 2;

        //查询总条数
        $count = D('api_notice as n')->join('left join api_users as u on u.id=n.to_userid')->join('left join api_user as a on a.id=n.send_userid')->where($map)->count();//查询满足要求的总记录数

        $list = D('api_notice as n')->join('left join api_users as u on u.id=n.to_userid')->join('left join api_user as a on a.id=n.send_userid')->field('n.id,u.user_name,n.to_userid,n.title,n.content,n.del_status,n.read_status,n.read_time,n.send_userid,n.add_time,a.username')->where($map)->order('id desc')->page($currentpage . ',' . $pagenum)->select();

        $Page = new \Think\Page($count, $pagenum);// 实例化分页类 传入总记录数和每页显示的记录数
        $Page->lastSuffix = false;//最后一页不显示为总页数
        $Page->setConfig('header', '<li class="disabled hwh-page-info"><a>共<em>%TOTAL_ROW%</em>条  <em>%NOW_PAGE%</em>/%TOTAL_PAGE%页</a></li>');
        $Page->setConfig('prev', '上一页');
        $Page->setConfig('next', '下一页');
        $Page->setConfig('last', '末页');
        $Page->setConfig('first', '首页');
        $Page->setConfig('theme', '%HEADER% %FIRST% %UP_PAGE% %LINK_PAGE% %DOWN_PAGE% %END%');

        $show = $Page->show();// 分页显示输出
        $this->assign('list', $list);//查询到的数据
        $this->assign('page', $show);// 赋值分页输出
        $this->display();
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