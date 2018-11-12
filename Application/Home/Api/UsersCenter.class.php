<?php

/**
 * 用户中心的相关操作
 * @since   2018/11/06 创建
 * @author  李胜辉
 */

namespace Home\Api;

use Admin\Model\ApiAppModel;
use Home\ORG\ApiLog;
use Home\ORG\Crypt;
use Home\ORG\Response;
use Home\ORG\ReturnCode;
use Home\Api\Common;

class UsersCenter extends Base
{


    /**
     * 添加我的级别
     * @author: 李胜辉
     * @time: 2018/11/06 09:34
     *
     */
    public function addMyClass($param)
    {
        $data['class_id'] = $param['calss_id']; //我的级别id
        $data['user_type'] = $param['user_type']; //用户类型(COM:机构;TEA:老师;STU:学生)
        $data['add_id'] = $param['add_id'];//添加人id
        $data['add_time'] = time();//添加时间
        $res = D('api_myclass')->add($data);
        if ($res) {
            return array('response_status' => 'success');//success:成功;fail:失败
        } else {
            return array('response_status' => 'fail');//success:成功;fail:失败
        }

    }

    /**
     * 编辑我的级别
     * @author: 李胜辉
     * @time: 2018/11/06 09:34
     *
     */
    public function setMyClass($param)
    {
        $data['id'] = $param['id']; //修改项id;
        $data['class_id'] = $param['class_id']; //我的级别id

        $res = D('api_myclass')->save($data);
        if ($res) {
            return array('response_status' => 'success');//success:成功;fail:失败
        } else {
            return array('response_status' => 'fail');//success:成功;fail:失败
        }

    }

    /**
     * 获取未读信息条数
     * @author: 李胜辉
     * @time: 2018/11/06 09:34
     *
     */
    public function getUnreadNum($param)
    {
        $where['to_suerid'] = $param['user_id']; //用户id;
        $where['user_type'] = $param['user_type']; //用户类型(COM:机构;TEA:老师;STU:学生)
        $where['read_status'] = 'UNREAD'; //阅读状态(READ:已读;UNREAD:未读)
        $where['del_status'] = 2; //删除状态(1,已删除;2,未删除)

        $num = D('api_notice')->where($where)->count();
        if ($num) {
            return array('response_status' => 'success', 'num' => $num);//success:成功;fail:失败
        } else {
            return array('response_status' => 'fail', 'num' => 0);//success:成功;fail:失败
        }

    }

    /**
     * 消息列表
     * @author: 李胜辉
     * @time: 2018/11/06 09:34
     *
     */
    public function noticeList($param)
    {
        $user_id = $param['user_id'] ? $param['user_id'] : '';//用户id

        $pagenum = $param['pagenum'] ? $param['pagenum'] : 1;//当前页
        $limit = $param['limit'] ? $param['limit'] : 10;//每页显示条数
        $start = ($pagenum - 1) * $limit;
        $moth = $param['moth'] ? $param['moth'] : '';//添加生词的月份时间戳
        $day = $param['day'] ? $param['day'] : '';//添加生词日期时间戳
        $where = array();
        $where['user_type'] = $param['user_type']; //用户类型(COM:机构;TEA:老师;STU:学生)
        $where['del_status'] = 2;
        if ($day !== '') {
            $year = date('Y', $day);//年份
            $moth = date('m', $day);//月份
            $date = date('d', $day);//日期
            $where['_string'] = 'year(FROM_UNIXTIME(add_time,"%Y-%m-%d"))="' . $year . '" and month(FROM_UNIXTIME(add_time,"%Y-%m-%d"))="' . $moth . '" and dayofmonth(FROM_UNIXTIME(add_time,"%Y-%m-%d"))="' . $date . '"';
        } else if ($moth !== '') {
            $year = date('Y', $moth);//年份
            $moth = date('m', $moth);//月份
            $where['_string'] = 'year(FROM_UNIXTIME(add_time,"%Y-%m-%d"))="' . $year . '" and month(FROM_UNIXTIME(add_time,"%Y-%m-%d"))="' . $moth . '"';
        }
        if ($user_id !== '') {
            $where['add_suerid'] = $user_id;
            $list = D('api_notice')->field('id,title,content,read_status,notice_type,add_time')->where($where)->order('id desc')->limit($start, $limit)->select();
            if ($list) {
                $list['response_status'] = 'success';//success:成功;fail:失败
                return $list;
            } else {
                $list['response_status'] = 'fail';//success:成功;fail:失败
                $list['msg'] = '暂无数据';
                return $list;
            }
        } else {
            $list['response_status'] = 'lack';//缺少参数
            return $list;
        }
    }

    /**
     * 消息详情
     * @author: 李胜辉
     * @time: 2018/11/06 09:34
     *
     */
    public function noticeDetail($param)
    {
        $where = array();
        $where['id'] = $param['id'];//消息id
        $where['del_status'] = 2;
        $list = D('api_notice')->field('id,title,content,read_status,notice_type,read_time,send_userid,add_time')->where($where)->find();
        if ($list) {
            $list['response_status'] = 'success';//success:成功;fail:失败
            return $list;
        } else {
            $list['response_status'] = 'fail';//success:成功;fail:失败
            return $list;
        }

    }

    /**
     * 查询会员资料详情
     * @author: 李胜辉
     * @time: 2018/11/06 09:34
     *
     */
    public function userInfoDetail($param)
    {
        $where = array();
        $where['use_status'] = 1;
        $where['id'] = $param['id'];//用户id
        $user_type = $param['user_type'];//用户类型(COM:机构;TEA:老师;STU:学生)
        if ($user_type == 'STU') {
            $list = D('api_users')->field('id,user_name,nickname,true_name,phone,balance,icon,add_time')->where($where)->find();

        } else {
            $list = D('api_ct_users')->field('id,user_name,com_name,nickname,true_name,user_type,phone,balance,icon,add_time')->where($where)->find();

        }
        if ($list) {
            $list['response_status'] = 'success';//success:成功;fail:失败
            return $list;
        } else {
            $list['response_status'] = 'fail';//success:成功;fail:失败
            return $list;
        }

    }



    /*******************************************************************************************评论 开始*******************************************************/


    /**
     * 评论列表
     * @author: 李胜辉
     * @time: 2018/11/05 09:34
     */
    public function commentList($param)
    {
        $pagenum = $param['pagenum'] ? $param['pagenum'] : 1;//当前页
        $limit = $param['limit'] ? $param['limit'] : 10;//每页显示条数
        $start = ($pagenum - 1) * $limit;
        $user_id = $param['user_id'] ? $param['user_id'] : '';//用户id
        $user_type = $param['user_type'] ? $param['user_type'] : '';//用户类型(COM:机构;TEA:老师;STU:学生)
        $where = array();
        if ($user_type !== '') {
            $where['user_type'] = $user_type;
        }

        if ($user_id !== '') {
            $where['user_id'] = $user_id;
            $list = D('api_comment')->field('id,content,pub_type,is_catalog,item_id,add_time')->where($where)->order('id desc')->limit($start, $limit)->select();
            if ($list) {
                foreach ($list as $key => $value) {
                    if ($value['is_catalog'] == 'N') {
                        $title = D('api_publish')->where(array('id' => $value['item_id']))->getField('title');
                        $list[$key]['title'] = $title;
                    } else {
                        $title = D('api_publish_content')->where(array('id' => $value['item_id']))->getField('title');
                        $list[$key]['title'] = $title;
                    }
                }
                unset($key, $value);
                $list['response_status'] = 'success';//成功
                return $list;
            } else {
                $list['response_status'] = 'fail';//失败
                return $list;
            }

        } else {
            $list['response_status'] = 'lack';//缺少参数
            return $list;
        }
    }

    /*******************************************************************************************评论 结束*******************************************************/

    /*******************************************************************************************收藏 开始*******************************************************/
    /**
     * 取消收藏
     * @author: 李胜辉
     * @time: 2018/11/05 09:34
     */
    public function deleteCollect($param)
    {
        $id = $param['id'];//收藏id
        $res = D('api_collect')->where(array('id' => $id))->delete();
        if ($res) {
            return array('response_status' => 'success');//success:成功;fail:失败
        } else {
            return array('response_status' => 'fail');//success:成功;fail:失败
        }
    }

    /**
     * 收藏列表
     * @author: 李胜辉
     * @time: 2018/11/05 09:34
     */
    public function collectList($param)
    {
        $pagenum = $param['pagenum'] ? $param['pagenum'] : 1;//当前页
        $limit = $param['limit'] ? $param['limit'] : 10;//每页显示条数
        $start = ($pagenum - 1) * $limit;
        $item_type = $param['item_type'] ? $param['item_type'] : '';//收藏项目的类型(STORE:商城;GOODS:商品;KAP:知识;EXE:习题;WOR:试题;RADIO:广播;LIB:图书馆
        $user_id = $param['user_id'] ? $param['user_id'] : '';//用户id
        $where = array();
        $where['user_type'] = $param['user_type'];//用户类型(COM:机构;TEA:老师;STU:学生)
        if ($user_id !== '') {
            if ($item_type !== '') {
                $where['item_type'] = $item_type;
            }
            $where['user_id'] = $user_id;
            $list = D('api_collect')->field('id,item_type,item_category,pub_type,is_catalog,item_id,add_time')->where($where)->order('id desc')->limit($start, $limit)->select();
            if ($list) {
                switch ($item_type) {
                    case 'STORE':
                        //查询商城信息
                        foreach ($list as $key => $value) { //循环 压入数据
                            if ($value['is_catalog'] == 'N') { //收藏的是大标题
                                $temp = D('api_publish')->field('id as ids,title')->where(array('id' => $value['item_id']))->find();
                                $list[$key]['ids'] = $temp['ids'];
                                $list[$key]['title'] = $temp['title'];
                            } else {  //收藏的是目录详情页内容
                                $temp = D('api_publish_content')->field('id as ids,title')->where(array('id' => $value['item_id']))->find();
                                $list[$key]['ids'] = $temp['ids'];
                                $list[$key]['title'] = $temp['title'];
                            }
                        }

                        break;
                    case 'GOODS': //商品

                        break;
                    case 'KAP':  //知识
                        //知识
                        foreach ($list as $key => $value) { //循环 压入数据
                            switch ($value['item_category']) { //项目分类(ART:知识点,句子,阅读文章,词组;VID:视频;TEX:课本;OTHER:其他的)
                                case 'ART':
                                    $temp = D('api_article_publish')->field('id as ids,title')->where(array('id' => $value['item_id']))->find();
                                    $list[$key]['ids'] = $temp['ids'];
                                    $list[$key]['title'] = $temp['title'];
                                    break;
                                case 'VID':
                                    if ($value['is_catalog'] == 'N') { //收藏的是大标题
                                        $temp = D('api_video')->field('id as ids,title')->where(array('id' => $value['item_id']))->find();
                                        $list[$key]['ids'] = $temp['ids'];
                                        $list[$key]['title'] = $temp['title'];
                                    } else {  //收藏的是目录详情页内容
                                        $temp = D('api_video_content')->field('id as ids,title')->where(array('id' => $value['item_id']))->find();
                                        $list[$key]['ids'] = $temp['ids'];
                                        $list[$key]['title'] = $temp['title'];
                                    }
                                    break;
                                case 'TEX':
                                    if ($value['is_catalog'] == 'N') { //收藏的是大标题
                                        $temp = D('api_textbook')->field('id as ids,title')->where(array('id' => $value['item_id']))->find();
                                        $list[$key]['ids'] = $temp['ids'];
                                        $list[$key]['title'] = $temp['title'];
                                    } else {  //收藏的是目录详情页内容
                                        $temp = D('api_textbook_content')->field('id as ids,title')->where(array('id' => $value['item_id']))->find();
                                        $list[$key]['ids'] = $temp['ids'];
                                        $list[$key]['title'] = $temp['title'];
                                    }
                                    break;
                                default:
                                    break;
                            }
                        }

                        break;
                    case 'EXE': //练习

                        break;
                    case 'WOR': //试题

                        break;
                    case 'RADIO': //广播

                        break;
                    case 'LIB': //图书馆

                        break;
                    default:
                        //分页
                        foreach ($list as $key => $value) { //循环 压入数据
                            switch ($value['item_type']) {
                                case 'STORE':
                                    //查询商城信息
                                    if ($value['is_catalog'] == 'N') { //收藏的是大标题
                                        $temp = D('api_publish')->field('id as ids,title')->where(array('id' => $value['item_id']))->find();
                                        $list[$key]['ids'] = $temp['ids'];
                                        $list[$key]['title'] = $temp['title'];
                                    } else {  //收藏的是目录详情页内容
                                        $temp = D('api_publish_content')->field('id as ids,title')->where(array('id' => $value['item_id']))->find();
                                        $list[$key]['ids'] = $temp['ids'];
                                        $list[$key]['title'] = $temp['title'];
                                    }
                                    break;
                                case 'GOODS': //商品

                                    break;
                                case 'KAP': //知识
                                    switch ($value['item_category']) { //项目分类(ART:知识点,句子,阅读文章,词组;VID:视频;TEX:课本;OTHER:其他的)
                                        case 'ART':
                                            $temp = D('api_article_publish')->field('id as ids,title')->where(array('id' => $value['item_id']))->find();
                                            $list[$key]['ids'] = $temp['ids'];
                                            $list[$key]['title'] = $temp['title'];
                                            break;
                                        case 'VID':
                                            if ($value['is_catalog'] == 'N') { //收藏的是大标题
                                                $temp = D('api_video')->field('id as ids,title')->where(array('id' => $value['item_id']))->find();
                                                $list[$key]['ids'] = $temp['ids'];
                                                $list[$key]['title'] = $temp['title'];
                                            } else {  //收藏的是目录详情页内容
                                                $temp = D('api_video_content')->field('id as ids,title')->where(array('id' => $value['item_id']))->find();
                                                $list[$key]['ids'] = $temp['ids'];
                                                $list[$key]['title'] = $temp['title'];
                                            }
                                            break;
                                        case 'TEX':
                                            if ($value['is_catalog'] == 'N') { //收藏的是大标题
                                                $temp = D('api_textbook')->field('id as ids,title')->where(array('id' => $value['item_id']))->find();
                                                $list[$key]['ids'] = $temp['ids'];
                                                $list[$key]['title'] = $temp['title'];
                                            } else {  //收藏的是目录详情页内容
                                                $temp = D('api_textbook_content')->field('id as ids,title')->where(array('id' => $value['item_id']))->find();
                                                $list[$key]['ids'] = $temp['ids'];
                                                $list[$key]['title'] = $temp['title'];
                                            }
                                            break;
                                        default:
                                            break;
                                    }

                                    break;
                                case 'EXE': //练习

                                    break;
                                case 'WOR': //试题

                                    break;
                                case 'RADIO': //校园广播

                                    break;
                                case 'LIB':  //图书馆

                                    break;
                                default:
                            }


                        }
                        unset($key, $value);
                        break;
                }
                $list['response_status'] = 'success';//success:成功;fail:失败
            } else {
                $list['response_status'] = 'no';//暂无数据
            }
            return $list;
        } else {
            $list['response_status'] = 'lack';//缺少参数
            return $list;
        }
    }

    /*******************************************************************************************收藏 结束*******************************************************/
    /*******************************************************************************************我的金币 开始*******************************************************/
    /**
     * 查询比例
     * @author: 李胜辉
     * @time: 2018/11/08 09:34
     *
     */
    public function getRatio($param)
    {
        $where = array();
        $where['ratio_type'] = $param['ratio_type']; //类型;
        $ratio = D('api_ratio')->where($where)->getField('ratio');
        if ($ratio) {
            return array('response_status' => 'success', 'ratio' => $ratio);//success:成功;fail:失败
        } else {
            return array('response_status' => 'fail');//success:成功;fail:失败
        }
    }
    /**
     * 充值/消费记录列表
     * @author: 李胜辉
     * @time: 2018/11/06 09:34
     *
     */
    public function iomoneyList($param)
    {
        $user_id = $param['user_id'] ? $param['user_id'] : '';//用户id
        $user_type = $param['user_type'];//用户类型(STU:学生;TEA:老师;COM:机构)
        $pagenum = $param['pagenum'] ? $param['pagenum'] : 1;//当前页
        $limit = $param['limit'] ? $param['limit'] : 10;//每页显示条数
        $start = ($pagenum - 1) * $limit;
        $sql = 'select * from (select concat("+","",gold_num) as num,`explain`,add_time from api_recharge where user_id=' . $user_id . ' and role_type="' . $user_type . '" and status=1 UNION select concat("-","",e_money) as num,`explain`,add_time from api_expense where user_id=' . $user_id . ' and e_status="S" and r_type="' . $user_type . '") as u order by add_time asc limit ' . $start . ',' . $limit;
        $table = M();
        $list = $table->query($sql);
        if ($list) {
            $list['response_status'] = 'success';//success:成功;fail:失败
            return $list;
        } else {
            $list['response_status'] = $sql;//success:成功;fail:失败
            return $list;
        }

    }

    /**
     * 查询余额
     * @author: 李胜辉
     * @time: 2018/11/08 09:34
     *
     */
    public function getBalance($param)
    {
        $where = array();
        $where['id'] = $param['user_id']; //用户id;
        $where['user_type'] = $param['user_type']; //用户类型(COM:机构;TEA:老师;STU:学生)
        if ($param['user_type'] == 'STU') {
            $where['use_status'] = 1;
            $balance = D('api_users')->where($where)->getField('balance');
        } else {
            $balance = D('api_ct_users')->where($where)->getField('balance');
        }
        if ($balance) {
            return array('response_status' => 'success', 'balance' => $balance);//success:成功;fail:失败
        } else {
            return array('response_status' => 'fail', 'balance' => 0);//success:成功;fail:失败
        }
    }

    /**
     * 添加银行卡
     * @author: 李胜辉
     * @time: 2018/11/08 09:34
     *
     */
    public function addBankCard($param)
    {
        $data['user_name'] = $param['user_name'];//用户姓名
        $data['bank_card'] = $param['bank_card'];//银行卡号
        $data['bank_id'] = $param['bank_id'];//银行id
        $data['user_type'] = $param['user_type'];//用户类型(COM:机构;TEA:老师;STU:学生)
        $data['user_id'] = $param['user_id'];//用户id
        $data['add_time'] = time();//添加时间
        $is_have = D('api_bankcard')->where(array('user_id' => $param['user_id'], 'user_type' => $param['user_type']))->count();
        if (!$is_have) {
            $data['default'] = 'Y';//如果是第一张卡设为默认
        }
        $insert = D('api_bankcard')->add($data);
        if ($insert) {
            return array('response_status' => 'success');//success:成功;fail:失败
        } else {
            return array('response_status' => 'fail');//success:成功;fail:失败
        }
    }
    /**
     * 删除银行卡
     * @author: 李胜辉
     * @time: 2018/11/12 09:34
     *
     */
    public function delBankCard($param)
    {
        $id = $param['id'];//银行卡id
        $is_default = D('api_bankcard')->where(array('id' => $id))->field('id,default,user_type,user_id,audit_status')->find();
        if($is_default['default']=='Y'){
            $default = D('api_bankcard')->field('id')->where(array('user_type'=>$is_default['user_type'],'default'=>'N','user_id'=>$is_default['user_id'],'audit_status'=>'S'))->order('id asc')->limit(0,1)->select();
            if($default){
                $update = D('api_bankcard')->where(array('id'=>$default[0]['id']))->save(array('default'=>'Y'));
                if($update){
                    $res = D('api_bankcard')->where(array('id' => $id))->delete();
                }else{
                    return array('response_status' => 'fail');//失败
                }
            }else{
                $res = D('api_bankcard')->where(array('id' => $id))->delete();
            }
        }

        if ($res) {
            return array('response_status' => 'success');//success:成功;fail:失败
        } else {
            return array('response_status' => 'fail');//success:成功;fail:失败
        }
    }
    /**
     * 银行列表
     * @author: 李胜辉
     * @time: 2018/11/08 09:34
     *
     */
    public function bankList()
    {
        $list = D('api_bankname')->field('id,bank_name,logo,pic')->order('id asc')->select();
        if($list){
            $list['response_status'] = 'success';//成功
            return $list;
        }else{
            $list['response_status'] = 'fail';//失败
            return $list;
        }

    }
    /**
     * 设为默认银行卡
     * @author: 李胜辉
     * @time: 2018/11/08 09:34
     *
     */
    public function setDefault($param)
    {
        $where['id'] = $param['id'];//银行卡id
        $info = D('api_bankcard')->field('id,user_id,user_type')->where($where)->find();
        $update = D('api_bankcard')->where(array('user_id' => $info->user_id, 'user_type' => $info->user_type, 'default' => 'Y'))->data(array('default' => 'N'))->save();
        $data['default'] = 'Y';//如果是第一张卡设为默认
        $set = D('api_bankcard')->where($where)->save($data);
        if ($set) {
            return array('response_status' => 'success');//success:成功;fail:失败
        } else {
            return array('response_status' => 'fail');//success:成功;fail:失败
        }
    }

    /**
     * 查询默认提现银行卡
     * @author: 李胜辉
     * @time: 2018/11/08 09:34
     *
     */
    public function getDefault($param)
    {
        $where = array();
        $where['b.user_id'] = $param['user_id'];//用户id
        $where['b.user_type'] = $param['user_type'];//用户类型(COM:机构;TEA:老师;STU:学生)
        $where['b.audit_status'] = 'S';//审核状态
        $where['b.default'] = 'Y';//默认提现
        $list = D('api_bankcard as b')->join('left join api_bankname as n on n.id=b.bank_id')->field('b.id,b.user_name,b.phone,b.bank_id,b.bank_card,n.bank_name,n.pic,n.logo')->where($where)->find();
        if ($list) {
            $list['response_status'] = 'success';//success:成功;fail:失败
            return $list;
        } else {
            return array('response_status' => 'fail');//success:成功;fail:失败
        }
    }

    /**
     * 我的银行卡列表
     * @author: 李胜辉
     * @time: 2018/11/08 09:34
     *
     */
    public function bankCardList($param)
    {
        $where = array();
        $where['b.user_id'] = $param['user_id'];//用户id
        $where['b.user_type'] = $param['user_type'];//用户类型(COM:机构;TEA:老师;STU:学生)
        $where['b.audit_status'] = 'S';//审核状态
        $list = D('api_bankcard as b')->join('left join api_bankname as n on n.id=b.bank_id')->field('b.id,b.user_name,b.phone,b.bank_id,b.bank_card,n.bank_name,n.pic,n.logo')->where($where)->order('b.id asc')->select();
        if ($list) {
            $list['response_status'] = 'success';//success:成功;fail:失败
            return $list;
        } else {
            return array('response_status' => 'fail');//success:成功;fail:失败
        }
    }

    /**
     * 提现
     * @author: 李胜辉
     * @time: 2018/11/08 09:34
     *
     */
    public function withdraw($param)
    {
        $common = new Common();
        $microtime = $common->getMicrotime();
        $ratio = D('api_ratio')->where(array('ratio_type'=>'WITH'))->getField('ratio');
        $data['e_money'] = floatval($param['e_money']) / $ratio;//提现金额
        $data['order'] = date("YmdHis") . $microtime . mt_rand(1000, 9999);//订单号
        $data['etype'] = 2;//类型(1,消费;2,提现)
        $data['r_type'] = $param['user_type'];//角色类型(STU:学生;TEA:老师;COM:机构)
        $data['explain'] = '提现';//说明
        $data['user_id'] = $param['user_id'];//用户id
        $data['bankcard_id'] = $param['bankcard_id'];//银行卡id
        $data['add_time'] = time();//添加时间
        $insert = D('api_expense')->add($data);
        if ($insert) {
            return array('response_status' => 'success');//success:成功;fail:失败
        } else {
            return array('response_status' => 'fail');//success:成功;fail:失败
        }
    }
    /*******************************************************************************************我的金币 结束*******************************************************/
    /*******************************************************************************************用户资料 开始*******************************************************/
    /**
     * 修改头像
     * @author: 李胜辉
     * @time: 2018/11/08 09:34
     *
     */
    public function setIcon($param)
    {
        $common = new Common();
        $where['id'] = $param['user_id'];//用户id
        if ($param['user_type'] == 'STU') { //用户类型为学生(STU:学生;TEA:老师;COM:机构)
            $path = 'student/icon';
            $old_icon = D('api_users')->where(array('id' => $param['user_id']))->getField('icon');
            $icon = $common->uploads(array('path' => $path));
            $set = D('api_users')->where($where)->data(array('icon' => $icon))->save();
            if ($set) {
                if ($old_icon) { //删除旧头像
                    unlink($old_icon);
                }
                return array('response_status' => 'success');//success:成功;fail:失败
            } else {
                return array('response_status' => 'fail');//success:成功;fail:失败
            }
        } else {
            $path = 'com/icon';
            $old_icon = D('api_ct_users')->where(array('id' => $param['user_id']))->getField('icon');
            $icon = $common->uploads(array('path' => $path));
            $set = D('api_ct_users')->where($where)->data(array('icon' => $icon))->save();
            if ($set) {
                if ($old_icon) {
                    unlink($old_icon);
                }
                return array('response_status' => 'success');//success:成功;fail:失败
            } else {
                return array('response_status' => 'fail');//success:成功;fail:失败
            }
        }

    }

    /**
     * 修改我的资料
     * @author: 李胜辉
     * @time: 2018/11/08 09:34
     *
     */
    public function updateMyInfo($param)
    {
        $data['phone'] = $param['phone'];//电话
        $data['user_name'] = $param['user_name'];//姓名
        $where['id'] = $param['user_id'];//用户id
        $type = $param['user_type'];//用户类型(STU:学生;TEA:老师;COM:机构)
        if ($type == 'STU' || $type == 'TEA') {
            $old_info = D('api_users')->field('id,phone,user_name')->where($where)->find();
            $update = D('api_users')->where($where)->data($data)->save();
            if ($update) {
                $edit = D('api_users')->where(array('phone' => $old_info['phone']))->data($data)->save();
                if ($edit) {
                    return array('response_status' => 'success');//success:成功;fail:失败
                } else {
                    return array('response_status' => 'tfail');//老师表更新失败
                }

            } else {
                return array('response_status' => 'fail');//success:成功;fail:失败
            }
        } else if ($type == 'COM') {
            $update = D('api_ct_users')->where($where)->data($data)->save();
            if ($update) {
                return array('response_status' => 'success');//success:成功;fail:失败
            } else {
                return array('response_status' => 'fail');//success:成功;fail:失败
            }
        } else {
            return array('response_status' => 'lack');//缺少参数
        }

    }


    /*******************************************************************************************用户资料 结束*******************************************************/
    /*******************************************************************************************分享 开始*******************************************************/
    /**
     * 分享
     * @author: 李胜辉
     * @time: 2018/11/08 09:34
     *
     */
    public function share($param)
    {
        $app_versions = $param['app_versions'];//当前APP版本
        $type = $param['pub_type'] ? $param['pub_type'] : '';//发布类型(ART:文章,句子,词组,知识点;VID:视频;TEX:课本;PUB:机构发布)
        $is_catalog = $param['is_catalog'] ? $param['is_catalog'] : '';//是否目录详情(Y:是;N:不是)
        $id = $param['item_id'] ? $param['item_id'] : '';//分享内容id
        $info = D('api_appversions')->field('id,app_versions,app_url,app_type,code_url')->where(array('app_versions' => $app_versions))->find();
        if ($info) {
            $info['response_status'] = 'success';//success:成功;fail:失败
            $info['pub_type'] = $type;
            $info['is_catalog'] = $is_catalog;
            $info['item_id'] = $id;
            return $info;
        } else {
            $info['response_status'] = 'fail';//success:成功;fail:失败
            return $info;
        }
    }
    /*******************************************************************************************分享 结束*******************************************************/
    /*******************************************************************************************银行卡 开始*******************************************************/



    /*******************************************************************************************银行卡 结束*******************************************************/
}