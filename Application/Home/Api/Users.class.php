<?php

/**
 * 用户的相关操作
 * @since   2018/11/03 创建
 * @author  李胜辉
 */

namespace Home\Api;

use Admin\Model\ApiAppModel;
use Home\ORG\ApiLog;
use Home\ORG\Crypt;
use Home\ORG\Response;
use Home\ORG\ReturnCode;

class Users extends Base
{
    /**
     * 账号注册
     * @author: 李胜辉
     * @time: 2018/11/08 11:34
     *
     */
    public function register($param)
    {
        $data['phone'] = $param['phone'];//电话
        $data['password'] = md5($param['password']);//密码
        $data['add_time'] = time();//添加时间
        $input_code = $param['input_code'];//用户填写的验证码
        $send_code = $param['send_code'];//系统发送验证码
        $user_type = $param['user_type'];//用户类型(STU:学生;TEA:老师;COM:机构)
        $preg = '/^1[3456789]\d{9}$/';
        $preg_pass = '/^[\da-zA-Z]{6,20}$/';
        if (!$param['phone']) {
            Response::error(-2, '手机号不能为空');
        }
        if (!preg_match_all($preg, $param['phone'])) {
            Response::error(-3, '手机号格式不正确');
        }
        if (!$param['password']) {
            Response::error(-4, '密码不能为空');
        }
        if (!preg_match_all($preg_pass, $param['password'])) {
            Response::error(-5, '密码格式不正确');
        }
        if (!$user_type) {
            Response::error(-6, '注册类型不能为空');
        }
        if ($input_code === '' || $send_code === '') {
            Response::error(-7, '验证码不能为空');
        }
        if ($input_code != $send_code) {
            Response::error(-8, '输入验证码不正确');
        }

        if ($user_type == 'STU') {
            $is_phone = D('api_users')->field('id')->where(array('phone' => $param['phone']))->select();
            $is_ct_phone = D('api_ct_users')->field('id')->where(array('phone' => $param['phone']))->select();
            if ($is_phone || $is_ct_phone) {
                Response::error(-9, '手机号已经注册');
            }
            $insert = D('api_users')->add($data);
            if ($insert) {
                Response::success(array('id' => $insert));
            } else {
                Response::error(-1, '注册失败');
            }

        } else {
            $is_phone = D('api_ct_users')->field('id')->where(array('phone' => $param['phone']))->select();
            $is_ct_phone = D('api_ct_users')->field('id')->where(array('phone' => $param['phone']))->select();
            if ($is_phone || $is_ct_phone) {
                Response::error(-9, '手机号已经注册');
            }
            $data['user_type'] = $user_type;
            $insert = D('api_ct_users')->add($data);
            if ($insert) {
                Response::success(array('id' => $insert));
            } else {
                Response::error(-1, '注册失败');
            }
        }
    }

    /**
     * 手机号注册账号
     * @author: 李胜辉
     * @time: 2018/11/08 11:34
     *
     */
   /* public function phoneRegister($param)
    {
        $data['phone'] = $param['phone'];//用户手机号
        $data['password'] = md5($param['password']);//用户密码
        $data['add_time'] = time();//注册时间
        $user_type = $param['user_type'];//用户类型(STU:学生;TEA:老师;COM:机构)
        $input_code = $param['input_code'];//用户填写的验证码
        $send_code = $param['send_code'];//系统发送验证码
        $preg = '/^1[3456789]\d{9}$/';
        $preg_pass = '/^[\da-zA-Z]{6,20}$/';
        if (!$param['phone']) {
            return array('response_status' => 'nophone', 'res_msg' => '手机号不能为空');//手机号不能为空
        }
        if (!preg_match_all($preg, $param['phone'])) {
            return array('response_status' => 'pherror', 'res_msg' => '手机号格式不正确');//手机号格式不正确
        }
        if (!$param['password']) {
            return array('response_status' => 'nopass', 'res_msg' => '密码不能为空');//密码不能为空
        }
        if (!preg_match_all($preg_pass, $param['password'])) {
            return array('response_status' => 'perror', 'res_msg' => '密码格式不正确');//密码格式不正确
        }
        if ($input_code === '' || $send_code === '') {
            return array('response_status' => 'nocode', 'res_msg' => '验证码为空');//验证码为空
        }
        if ($input_code != $send_code) {
            return array('response_status' => 'neqcode', 'res_msg' => '输入验证码不正确');//输入验证码不正确
        }
        if ($user_type == 'STU') {
            $is_phone = D('api_users')->field('id')->where(array('phone' => $param['phone']))->select();
            if ($is_phone) {
                return array('response_status' => 'hasphone', 'res_msg' => '手机号已经注册');//手机号已经注册
            }
            $data['login_first'] = 'Y';
            $insert = D('api_users')->add($data);
            if ($insert) {
                $data['login_first'] = 'N';
                $data['user_type'] = 'TEA';
                $insert_teacher = D('api_ct_users')->add($data);
                if ($insert_teacher) {
                    return array('response_status' => 'success', 'res_msg' => '成功');//success:成功;fail:失败
                } else {
                    return array('response_status' => 'tfail', 'res_msg' => '机构注册失败');//机构注册失败
                }
            } else {
                return array('response_status' => 'fail', 'res_msg' => '失败');//success:成功;fail:失败
            }
        } else {
            $is_phone = D('api_ct_users')->field('id')->where(array('phone' => $param['phone']))->select();
            if ($is_phone) {
                return array('response_status' => 'hasphone', 'res_msg' => '手机号已经注册');//手机号已经注册
            }
            $data['user_type'] = $param['user_type'];
            if ($user_type == 'TEA') {
                $data['login_first'] = 'Y';
                $insert = D('api_ct_users')->add($data);
                if ($insert) {
                    $data['login_first'] = 'N';
                    $insert_stu = D('api_users')->add($data);
                    if ($insert_stu) {
                        return array('response_status' => 'success', 'res_msg' => '成功');//success:成功;fail:失败
                    } else {
                        return array('response_status' => 'sfail', 'res_msg' => '学生身份注册失败');//学生身份注册失败
                    }
                } else {
                    return array('response_status' => 'fail', 'res_msg' => '失败');//success:成功;fail:失败
                }
            } else {
                $insert = D('api_ct_users')->add($data);
                if ($insert) {
                    return array('response_status' => 'success', 'res_msg' => '成功');//success:成功;fail:失败
                } else {
                    return array('response_status' => 'fail', 'res_msg' => '失败');//success:成功;fail:失败
                }
            }
        }

    }*/


    /**
     * 账号密码登陆
     * @author: 李胜辉
     * @time: 2018/11/03 09:34
     *
     */
    public function login($param)
    {
        $phone = $param['phone'];//手机号
        $password = md5($param['password']);//密码
        Response::debug($phone . '+' . $param['password'] . '+' . $password);
        $user_info = D('api_users')->field('id,phone,user_name,icon,balance,nickname')->where(array('phone' => $phone, 'password' => $password, 'use_status' => 1))->find();//先查询学生表
        if ($user_info) { //如果有该账户
            $user_info['user_type'] = 'STU';//身份为学生
            Response::success($user_info);
        } else {
            $com_info = D('api_ct_users')->field('id,phone,user_name,com_name,user_type,icon,balance,nickname,audit_status')->where(array('phone' => $phone, 'password' => $password, 'del_status' => 2))->find();//查询机构表
            if ($com_info) { //如果机构表中有该用户
                switch ($com_info['audit_status']) {
                    case 'S':
                        Response::success($com_info);
                        break;
                    case 'F':
                        Response::error(-2,'审核未通过');
                        break;
                    case 'W':
                        Response::error(-3,'待审核');
                        break;
                    default :
                        Response::error(-1,'账号或密码错误');
                        break;
                }
            } else {
                Response::error(-1,'账号或密码错误');
            }
        }

    }

    /**
     * 手机号验证码登陆
     * @author: 李胜辉
     * @time: 2018/11/03 09:34
     * @param:
     */
/*    public function verifyLogin($param)
    {

        $phone = $param['phone'];//手机号
        $verify_code = $param['input_code'];//用户输入的验证码
        $sys_code = $param['sys_code'];//系统发送的验证码
        Response::debug($phone . '+' . $verify_code . '+' . $sys_code);
        $pcre = '/^1[3456789]\d{9}$/';

        if (!preg_match_all($pcre, $phone)) {
            return array('response_status' => 'perror', 'res_msg' => '手机号格式不正确');//手机号格式不正确
        }
        if (empty($verify_code) && empty($sys_code)) {
            return array('response_status' => 'null', 'res_msg' => '请填写验证码');//请填写验证码
        }
        if ($verify_code != $sys_code) {
            return array('response_status' => 'error', 'res_msg' => '验证码输入不正确');//验证码输入不正确
        }
        $user_info = D('api_users')->field('id,login_first,phone,user_name,icon,balance,nickname')->where(array('phone' => $phone, 'use_status' => 1))->find();//先查询学生表
        if ($user_info) { //如果有该账户
            if ($user_info->login_first == 'Y') {//如果为首选登录项
                $user_info['login_status'] = 'success';//success:成功;fail:失败
                $user_info['user_type'] = 'STU';//身份为学生
                Response::debug($user_info);
                return $user_info;

            } else {
                $teacher_info = D('api_ct_users')->field('id,login_first,phone,user_name,com_name,user_type,icon,balance,nickname')->where(array('phone' => $phone, 'del_status' => 2, 'audit_status' => 'S'))->find();//查询机构/老师表
                if ($teacher_info) {

                    $teacher_info['login_status'] = 'success';//success:成功;fail:失败
                    $teacher_info['res_msg'] = '成功';
                    Response::debug($teacher_info);
                    return $teacher_info;
                } else {
                    return array('login_status' => 'uperror', 'res_msg' => '账号或密码错误');//账号或密码错误
                }
            }
        } else {
            $com_info = D('api_ct_users')->field('id,login_first,phone,user_name,com_name,user_type,icon,balance,nickname')->where(array('phone' => $phone, 'del_status' => 2, 'audit_status' => 'S'))->find();//查询机构表
            if ($com_info) { //如果机构表中有该用户

                $com_info['login_status'] = 'success';//success:成功;fail:失败
                $com_info['res_msg'] = '成功';
                Response::debug($com_info);
                return $com_info;
            } else {
                return array('login_status' => 'uperror', 'res_msg' => '账号或密码错误');//账号或密码错误
            }
        }


    }*/

    /**
     * 忘记密码
     * @author: 李胜辉
     * @time: 2018/11/03 09:34
     * @param:
     */
    public function forgetPassword($param)
    {
        $phone = $param['phone'];//手机号
        $verify_code = $param['input_code'];//用户输入的验证码
        $sys_code = $param['sys_code'];//发送的验证码
        $password = md5($param['password']); //密码
        $preg = '/^1[3456789]\d{9}$/';//手机号正则
        $preg_pass = '/^[\da-zA-Z]{6,20}$/';//密码正则
        if ($phone == '' || !preg_match($preg, $phone)) {
            Response::error(-2,'手机号格式不正确');
        }
        if ($verify_code == '' || $verify_code != $sys_code) {
            Response::error(-3,'验证码不正确');
        }
        if ($param['password'] == '' || !preg_match($preg_pass, $param['password'])) {
            Response::error(-4,'密码格式不正确');
        }
        Response::debug($phone . '+' . $param['password'] . '+' . $password);
        $data['password'] = $password;
        $user_info = D('api_users')->field('id')->where(array('phone' => $phone))->find();
        if ($user_info!==false) {
            $res = D('api_users')->where(array('phone' => $phone, 'id' => $user_info['id']))->save($data);
            if ($res) {
                Response::success(array('update_num'=>$res));
            } else {
                Response::error(-1,'修改失败');
            }
        } else {
            $com_info = D('api_ct_users')->field('id,user_type')->where(array('phone' => $phone))->find();
            if ($com_info) {
                $com = D('api_ct_users')->where(array('phone' => $phone, 'id' => $com_info['id']))->save($data);
                if ($com!==false) {
                    Response::success(array('update_num'=>$com));
                } else {
                    Response::error(-1,'修改失败');
                }
            } else {
                Response::error(-9,'该手机号尚未注册');
            }
        }
    }

}