<?php
/**
 * 用户管理控制器
 * @since   2016-01-21
 * @author  zhaoxiang <zhaoxiang051405@outlook.com>
 */

namespace Admin\Controller;

class UserController extends BaseController
{

    public function index()
    {
        $listInfo = D('ApiUser')->select();
        $listInfo = D('ApiUser as u')->join('left join api_user_info as i on i.user_id=u.id')->join('left join api_auth_group_access as a on a.uid=u.id')->field('u.id,u.nickname,i.sex,i.phone,u.username,u.status')->order('u.id')->select();
        $userData = D('ApiUserData')->select();
        $userData = $this->buildArrByNewKey($userData, 'uid');
        if ($listInfo) {
            foreach ($listInfo as $key => $value) {
                $role = D('api_auth_group_access as a')->join('api_auth_group as g on g.id=a.groupId')->where(array('a.uid' => $value['id']))->getField('name');
                $listInfo[$key]['role'] = $role ? $role : '未分配';
                if (isAdministrator($value['id'])) {
                    $listInfo[$key]['role'] = '超级管理员';
                }
            }
            unset($key, $value);
        }
        $this->assign('list', $listInfo);
        $this->display();
    }

    public function add()
    {
        if (IS_POST) {
            $data = I('post.');
            $has = D('ApiUser')->where(array('username' => $data['username']))->count();
            if ($has) {
                $this->ajaxError('用户名已经存在，请重设！');
            }
            $data['password'] = user_md5($data['password']);
            $data['regIp'] = get_client_ip(1);
            $data['regTime'] = time();
            //去除多余的
            $info['phone'] = $data['phone'];
            $info['sex'] = $data['sex'];
            unset($data['phone'], $data['sex']);
            $res = D('ApiUser')->add($data);
            if ($res === false) {
                $this->ajaxError('操作失败');
            } else {
                $info['user_id'] = D('api_user')->where(array('username' => $data['username']))->getField('id');
                $res = D('api_user_info')->add($info);
                if ($res) {
                    $this->ajaxSuccess('添加成功');
                } else {
                    $this->ajaxError('操作失败');
                }

            }
        } else {
            $this->display();
        }
    }

    /**
     * 编辑用户信息
     * @author: 李胜辉
     * @time: 2018/11/01 10:32
     *
     */
    public function update()
    {
        if (IS_POST) {
            $data = I('post.');
            //去除多余的
            $info['phone'] = $data['phone'];
            $info['sex'] = $data['sex'];
            unset($data['phone'], $data['sex']);
            $res = D('ApiUser')->save($data);
            if ($res === false) {
                $this->ajaxError('操作失败');
            } else {
                $user_id = I('post.id');
                $res = D('api_user_info')->where(array('user_id' => $user_id))->save($info);
                $this->ajaxSuccess('编辑成功');
            }
        } else {
            $id = I('get.id');
            $detail = D('api_user as u')->join('api_user_info as i on i.user_id=u.id')->field('u.id,u.username,u.nickname,i.phone,i.sex')->where(array('u.id' => $id))->find();
            $this->assign('detail', $detail);
            $this->display('add');
        }
    }

    public function close()
    {
        $id = I('post.id');
        $isAdmin = isAdministrator($id);
        if ($isAdmin) {
            $this->ajaxError('超级管理员不可以被操作');
        }
        $res = D('ApiUser')->where(array('id' => $id))->save(array('status' => 0));
        if ($res === false) {
            $this->ajaxError('操作失败');
        } else {
            $this->ajaxSuccess('操作成功');
        }
    }

    public function open()
    {
        $id = I('post.id');
        $isAdmin = isAdministrator($id);
        if ($isAdmin) {
            $this->ajaxError('超级管理员不可以被操作');
        }
        $res = D('ApiUser')->where(array('id' => $id))->save(array('status' => 1));
        if ($res === false) {
            $this->ajaxError('操作失败');
        } else {
            $this->ajaxSuccess('操作成功');
        }
    }

    public function del()
    {
        $id = I('post.id');
        $isAdmin = isAdministrator($id);
        if ($isAdmin) {
            $this->ajaxError('超级管理员不可以被操作');
        }
        $res = D('ApiUser')->where(array('id' => $id))->delete();
        if ($res === false) {
            $this->ajaxError('操作失败');
        } else {
            $this->ajaxSuccess('操作成功');
        }
    }

    /**
     * 密码重置
     * @author: 李胜辉
     * @time: 2018/11/01 10:32
     *
     */
    public function resetPassword()
    {
        $id = I('post.id');
        $password = user_md5('123456');
        $data['password'] = $password;
        $res = D('api_user')->where(array('id' => $id))->save($data);
        if ($res === false) {
            $this->ajaxError('操作失败');
        } else {
            $this->ajaxSuccess('操作成功');
        }
    }

}