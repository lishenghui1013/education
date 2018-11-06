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
     * 账号密码登陆
     * @author: 李胜辉
     * @time: 2018/11/03 09:34
     *
     */
    public function login($param)
    {

        $user_name = $param['user_name'];//用户名
        $password = md5($param['password']);//密码
        Response::debug($user_name . '+' . $param['password'] . '+' . $password);
        $user_info = D('api_users')->field('id,login_first,phone,user_name,icon,balance,nickname')->where(array('user_name' => $user_name, 'password' => $password, 'use_status' => 1))->find();//先查询学生表
        if ($user_info) { //如果有该账户
            if ($user_info->login_first == 'Y') {//如果为首选登录项
                $user_info['login_status'] = 'success';//success:登录成功;fail:登录失败
                $user_info['user_type'] = 'STU';//身份为学生
                return $user_info;

            } else {
                $teacher_info = D('api_ct_users')->field('id,login_first,phone,user_name,com_name,user_type,icon,balance,nickname')->where(array('user_name' => $user_name, 'password' => $password, 'del_status' => 2, 'audit_status' => 'S'))->find();//查询机构/老师表
                if ($teacher_info) {
                    $teacher_info['login_status'] = 'success';//success:登录成功;fail:登录失败
                    return $teacher_info;
                } else {
                    return array('login_status' => 'uperror');//账号或密码错误
                }
            }
        } else {
            $com_info = D('api_ct_users')->field('id,login_first,phone,user_name,com_name,user_type,icon,balance,nickname')->where(array('user_name' => $user_name, 'password' => $password, 'del_status' => 2, 'audit_status' => 'S'))->find();//查询机构表
            if ($com_info) { //如果机构表中有该用户
                $com_info['login_status'] = 'success';//success:登录成功;fail:登录失败
                return $com_info;
            } else {
                return array('login_status' => 'uperror');//账号或密码错误
            }
        }

    }

    /**
     * 手机号验证码登陆
     * @author: 李胜辉
     * @time: 2018/11/03 09:34
     * @param:
     */
    public function verifyLogin($param)
    {

        $phone = $param['phone'];//手机号
        $verify_code = $param['input_code'];//用户输入的验证码
        $sys_code = $param['sys_code'];//系统发送的验证码
        Response::debug($phone . '+' . $verify_code . '+' . $sys_code);
        $pcre = '/^1[3456789]\d{9}$/';

        if (!preg_match_all($pcre, $phone)) {
            return array('response_status' => 'perror');//手机号格式不正确
        }
        if (empty($verify_code) && empty($sys_code)) {
            return array('response_status' => 'null');//请填写验证码
        }
        if ($verify_code != $sys_code) {
            return array('response_status' => 'error');//验证码输入不正确
        }
        $user_info = D('api_users')->field('id,login_first,phone,user_name,icon,balance,nickname')->where(array('phone' => $phone, 'use_status' => 1))->find();//先查询学生表
        if ($user_info) { //如果有该账户
            if ($user_info->login_first == 'Y') {//如果为首选登录项
                $user_info['login_status'] = 'success';//success:登录成功;fail:登录失败
                $user_info['user_type'] = 'STU';//身份为学生
                Response::debug($user_info);
                return $user_info;

            } else {
                $teacher_info = D('api_ct_users')->field('id,login_first,phone,user_name,com_name,user_type,icon,balance,nickname')->where(array('phone' => $phone, 'del_status' => 2, 'audit_status' => 'S'))->find();//查询机构/老师表
                if ($teacher_info) {

                    $teacher_info['login_status'] = 'success';//success:登录成功;fail:登录失败
                    Response::debug($teacher_info);
                    return $teacher_info;
                } else {
                    return array('login_status' => 'uperror');//账号或密码错误
                }
            }
        } else {
            $com_info = D('api_ct_users')->field('id,login_first,phone,user_name,com_name,user_type,icon,balance,nickname')->where(array('phone' => $phone, 'del_status' => 2, 'audit_status' => 'S'))->find();//查询机构表
            if ($com_info) { //如果机构表中有该用户

                $com_info['login_status'] = 'success';//success:登录成功;fail:登录失败
                Response::debug($com_info);
                return $com_info;
            } else {
                return array('login_status' => 'uperror');//账号或密码错误
            }
        }


    }

    /**
     * 忘记密码
     * @author: 李胜辉
     * @time: 2018/11/03 09:34
     * @param:
     */
    public function forgetPassword($param)
    {
        $user_type = $param['user_type'];//用户类型(COM:机构;TEA:老师;STU:学生)
        $phone = $param['phone'];//手机号
        $verify_code = $param['input_code'];//用户输入的验证码
        $sys_code = $param['sys_code'];//发送的验证码
        $password = md5($param['password']); //密码
        /*$confirm_pwd = md5($param['confirm_pwd']);//确认密码*/
        $preg = '/^1[3456789]\d{9}$/';//手机号正则
        $preg_pass = '/^[\da-zA-Z]{6,20}$/';//密码正则
        if ($phone == '' || !preg_match($preg, $phone)) {
            return array('response_status' => 'pherror');//手机号格式不正确
        }
        if ($verify_code == '' || $verify_code != $sys_code) {
            return array('response_status' => 'cerror');//验证码不正确
        }
        if ($param['password'] == '' || !preg_match($preg_pass, $param['pwsd'])) {
            return array('response_status' => 'pserror');//密码格式不正确
        }
        Response::debug($phone . '+' . $param['password'] . '+' . $password);
        switch ($user_type) {
            case 'STU': //是学生
                $user_info = D('api_users')->field('id')->where(array('phone' => $phone))->find();//查询学生表记录
                if (!$user_info) {
                    return array('response_status' => 'no');//此用户不存在
                }
                $data['password'] = $password;
                $res = D('api_users')->where(array('phone' => $phone,'id'=>$user_info->id))->save($data);
                $teacher = D('api_ct_users')->where(array('phone' => $phone))->save($data);
                if ($res && $teacher) {
                    return array('response_status' => "success");//修改成功
                } else {
                    return array('response_status' => "fail");//修改失败
                }
                break;
            case 'COM': //机构
                $user_info = D('api_ct_users')->field('id')->where(array('phone' => $phone,'user_type'=>'COM'))->find();//查询老师表记录
                if (!$user_info) {
                    return array('response_status' => 'no');//此用户不存在
                }
                $data['password'] = $password;
                $com = D('api_ct_users')->where(array('phone' => $phone,'id'=>$user_info->id))->save($data);
                if ($com) {
                    return array('response_status' => "success");//修改成功
                } else {
                    return array('response_status' => "fail");//修改失败
                }
                break;
            case 'TEA': //老师
                $user_info = D('api_ct_users')->field('id')->where(array('phone' => $phone,'user_type'=>'TEA'))->find();//查询老师表记录
                if (!$user_info) {
                    return array('response_status' => 'no');//此用户不存在
                }
                $data['password'] = $password;
                $res = D('api_users')->where(array('phone' => $phone))->save($data);
                $teacher = D('api_ct_users')->where(array('phone' => $phone,'id'=>$user_info->id))->save($data);
                if ($res && $teacher) {
                    return array('response_status' => "success");//修改成功
                } else {
                    return array('response_status' => "fail");//修改失败
                }
                break;
            default:
                break;
        }


    }

}