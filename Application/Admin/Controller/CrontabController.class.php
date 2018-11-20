<?php
/**
 * 定时任务
 * User: 李胜辉
 * Date: 2018/11/20
 * Time: 17:32
 */
namespace Admin\Controller;


class CrontabController extends BaseController {


    /**
     * 定时扣除没有签到的会员豆币
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


}