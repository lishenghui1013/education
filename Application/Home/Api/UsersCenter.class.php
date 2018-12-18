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
use Think\Model;

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
            Response::success(array('id' => $res));
        } else {
            Response::error(-1, '添加失败');
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
            Response::success(array('update_num' => $res));
        } else {
            Response::error(-1, '添加失败');
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
            Response::success(array('num' => $num));
        } else {
            Response::error(-1, '暂无数据');
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
            $list = D('api_notice')->field('id,title,content,read_status,notice_type,FROM_UNIXTIME(add_time,"%Y-%m-%d") as add_time')->where($where)->order('id desc')->limit($start, $limit)->select();
            if ($list) {
                Response::success($list);
            } else {
                Response::error(-1, '暂无数据');
            }
        } else {
            Response::error(-2, '缺少参数');
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
        $list = D('api_notice')->field('id,title,content,read_status,notice_type,read_time,send_userid,FROM_UNIXTIME(add_time,"%Y-%m-%d") as add_time')->where($where)->find();
        if ($list) {
            Response::success($list);
        } else {
            Response::error(-1, '暂无数据');
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
            $list = D('api_users')->field('id,user_name,nickname,true_name,phone,balance,icon,FROM_UNIXTIME(add_time,"%Y-%m-%d") as add_time')->where($where)->find();

        } else {
            $list = D('api_ct_users')->field('id,user_name,com_name,nickname,true_name,user_type,phone,balance,icon,add_time')->where($where)->find();

        }
        if ($list) {
            Response::success($list);
        } else {
            Response::error(-1, '暂无数据');
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
            $list = D('api_comment')->field('id,content,pub_type,is_catalog,item_id,FROM_UNIXTIME(add_time,"%Y-%m-%d") as add_time')->where($where)->order('id desc')->limit($start, $limit)->select();
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
                Response::success($list);
            } else {
                Response::error(-1, '暂无数据');
            }

        } else {
            Response::error(-2, '缺少参数');
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
            Response::success(array('del_num' => $res));
        } else {
            Response::error(-1, '暂无数据');
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
            $list = D('api_collect')->field('id,item_type,item_category,pub_type,is_catalog,item_id,FROM_UNIXTIME(add_time,"%Y-%m-%d") as add_time')->where($where)->order('id desc')->limit($start, $limit)->select();
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
                Response::success($list);
            } else {
                Response::error(-1, '暂无数据');
            }
            return $list;
        } else {
            Response::error(-2, '缺少参数');
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
            Response::success(array('ratio' => $ratio));
        } else {
            Response::error(-1, '暂无数据');
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
            Response::success(array('ratio' => $list));
        } else {
            Response::error(-1, '暂无数据');
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
            Response::success(array('balance' => $balance));
        } else {
            Response::error(-1, '暂无数据',array('balance' => 0));
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
            Response::success(array('id' => $insert));
        } else {
            Response::error(-1, '添加失败');
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
        $is_default = D('api_bankcard')->where(array('id' => $id))->field('id,default,user_type,user_id,audit_status')->find();//查询银行卡信息
        if ($is_default['default'] == 'Y') {
            $default = D('api_bankcard')->field('id')->where(array('user_type' => $is_default['user_type'], 'default' => 'N', 'user_id' => $is_default['user_id'], 'audit_status' => 'S'))->order('id asc')->limit(0, 1)->select();
            if ($default) {
                $update = D('api_bankcard')->where(array('id' => $default[0]['id']))->save(array('default' => 'Y'));
                if ($update) {
                    $res = D('api_bankcard')->where(array('id' => $id))->delete();
                } else {
                    Response::error(-2, '设置默认银行卡失败');
                }
            } else {
                $res = D('api_bankcard')->where(array('id' => $id))->delete();
            }
        }else{
            $res = D('api_bankcard')->where(array('id' => $id))->delete();
        }

        if ($res) {
            Response::success(array('del_num' => $res));
        } else {
            Response::error(-1, '删除失败');
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
        if ($list) {
            Response::success($list);
        } else {
            Response::error(-1, '暂无数据');
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
        if($update===false){
            Response::error(-2, '出错了');
        }else{
            $data['default'] = 'Y';//如果是第一张卡设为默认
            $set = D('api_bankcard')->where($where)->save($data);
            if ($set) {
                Response::success(array('update_num'=>$set));
            } else {
                Response::error(-1, '设置失败');
            }
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
            Response::success($list);
        } else {
            Response::error(-1, '暂无数据');
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
        $pagenum = $param['pagenum'] ? $param['pagenum'] : 1;//当前页
        $limit = $param['limit'] ? $param['limit'] : 10;//每页显示条数
        $start = ($pagenum - 1) * $limit;
        $where = array();
        $where['b.user_id'] = $param['user_id'];//用户id
        $where['b.user_type'] = $param['user_type'];//用户类型(COM:机构;TEA:老师;STU:学生)
        $where['b.audit_status'] = 'S';//审核状态
        $list = D('api_bankcard as b')->join('left join api_bankname as n on n.id=b.bank_id')->field('b.id,b.user_name,b.phone,b.bank_id,b.bank_card,n.bank_name,n.pic,n.logo')->where($where)->order('b.id asc')->limit($start, $limit)->select();
        if ($list) {
            Response::success($list);
        } else {
            Response::error(-1, '暂无数据');
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
        $ratio = D('api_ratio')->where(array('ratio_type' => 'WITH'))->getField('ratio');
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
            Response::success(array('id'=>$insert));
        } else {
            Response::error(-1, '申请失败');
        }
    }

    /**
     * 签到
     * @author: 李胜辉
     * @time: 2018/11/13 09:34
     *
     */
    public function signIn($param)
    {
        $common = new Common();
        $microtime = $common->getMicrotime();
        $where = array();
        $data['order'] = $microtime . mt_rand(1000, 9999);//订单号
        $data['io_type'] = 'SIGN';//收支类型(SIGN:签到;READ:阅读;SHARE:分享;NOSIGN:未签到;PUB:发布;INVITE:邀请;SHOP:购物;PUBGET:发布所得;)
        $data['user_type'] = $param['user_type'];//角色类型(STU:学生;TEA:老师;COM:机构)
        $data['explain'] = '签到';//说明
        $data['user_id'] = $param['user_id'];//用户id
        $data['add_time'] = time();//添加时间
        $date = date('Y-m-d', $data['add_time']);//日期
        $where['_string'] = 'FROM_UNIXTIME(add_time,"%Y-%m-%d")="' . $date . '"';
        $where['user_id'] = $data['user_id'];
        $where['role_type'] = $data['role_type'];
        $where['pay_type'] = $data['io_type'];
        $is_sign = D('api_bean_io')->where($where)->select();
        if ($is_sign) {
            return array('response_status' => 'signed', 'res_msg' => '已经签到过了');//已经签到过了
        }
        $i = 1;//签到连续天数
        $one = 24 * 60 * 60;//一天的秒数
        //获取当前日期时间戳
        $curr_time = strtotime(date('Y-m-d', $data['add_time']));
        //查询奖励表中签到记录等级数量
        $award_list = D('api_award')->field('id,serial_days,num,FROM_UNIXTIME(add_time,"%Y-%m-%d") as add_time')->where(array('award_type' => 'SIGN'))->order('serial_days desc')->select();
        $total = count($award_list);
        //查询签到信息
        unset($where['_string']);
        $signed_info = D('api_bean_io')->where($where)->field('id,FROM_UNIXTIME(add_time,"%Y-%m-%d") as add_time')->order('add_time desc')->limit(0, $award_list[0]['serial_days'])->select();

        $max = count($signed_info);
        if ($signed_info) {
            for ($j = 0; $j < $max; $j++) {
                $start = $curr_time - $one * ($j + 1);
                $end = $curr_time - $one * $j;
                if ($signed_info[$j]['add_time'] > $start && $signed_info[$j]['add_time'] < $end) {
                    $i++;
                } else {
                    $j = $max;
                }
            }
        }
        $map['award_type'] = 'SIGN';
        $map['serial_days'] = array('elt', $i);
        $award_info = D('api_award')->where($map)->field('award_num')->order('serial_days desc')->limit(0, 1)->select();//奖励金额
        $data['num'] = $award_info[0]['award_num'];//奖励金额
        $insert = D('api_bean_io')->add($data);
        if ($insert) {
            if ($param['user_type'] == 'STU') {
                $balance = D('api_users')->where(array('id' => $param['user_id']))->getField('bean_balance');
                $blance = $data['num'] + $balance;
                $res = D('api_users')->where(array('id' => $param['user_id']))->save(array('bean_balance' => $blance));
                if ($res) {
                    Response::success(array('update_num'=>$res));
                } else {
                    Response::error(-2, '用户余额未更新成功');
                }
            } else {
                $balance = D('api_ct_users')->where(array('id' => $param['user_id']))->getField('bean_balance');
                $blance = $data['num'] + $balance;
                $res = D('api_ct_users')->where(array('id' => $param['user_id']))->save(array('bean_balance' => $blance));
                if ($res) {
                    Response::success(array('update_num'=>$res));
                } else {
                    Response::error(-2, '用户余额未更新成功');
                }
            }
        } else {
            Response::error(-1, '签到失败');
        }
    }

    /**
     * 签到详情
     * @author: 李胜辉
     * @time: 2018/11/13 09:34
     *
     */
    public function signInDetail($param)
    {
        $curr_time = time();//添加时间
        $where['user_type'] = $param['user_type'];//角色类型(STU:学生;TEA:老师;COM:机构)
        $where['user_id'] = $param['user_id'];//用户id
        $where['pay_type'] = 'SIGN';
        //签到信息
        $signed_info = D('api_bean_io')->field('id,FROM_UNIXTIME(add_time,"%Y-%m-%d") as add_time')->where($where)->select();
        $signed_info['total'] = count($signed_info);//累计签到多少天
        //连续签到多少天
        //获取当前日期时间戳
        $curr_date = strtotime(date('Y-m-d', $curr_time));
        $i = 1;//签到连续天数
        $one = 24 * 60 * 60;//一天的秒数
        if ($signed_info) {
            for ($j = 0; $j < $signed_info['total']; $j++) {
                $start = $curr_date - $one * ($j + 1);
                $end = $curr_date - $one * $j;
                if ($signed_info[$j]['add_time'] > $start && $signed_info[$j]['add_time'] < $end) {
                    $i++;
                } else {
                    $j = $signed_info['total'];
                }
            }
        }
        $signed_info['serial_signed'] = $i;//连续签到天数
        $date = date('Y-m-d', $curr_time);//日期
        $wheres['_string'] = 'FROM_UNIXTIME(add_time,"%Y-%m-%d")="' . $date . '"';
        $wheres['user_id'] = $param['user_id'];
        $wheres['role_type'] = $param['user_type'];
        $wheres['pay_type'] = 'SIGN';
        $is_sign = D('api_bean_io')->field('id,num,status,order,io_type,user_type,explain,user_id,FROM_UNIXTIME(add_time,"%Y-%m-%d") as add_time')->where($wheres)->select();
        if ($is_sign) {
            $signed_info['signed_status'] = 'SIGNED';//已经签到过了
        } else {
            $signed_info['signed_status'] = 'NO';//今天还未签到
        }
        if ($signed_info) {
            Response::success($signed_info);
        } else {
            Response::error(-1, '签到失败',$signed_info);
        }
    }

    /**
     * 其他奖励
     * @author: 李胜辉
     * @time: 2018/11/13 09:34
     *
     */
    public function otherAward($param)
    {
        $common = new Common();
        $microtime = $common->getMicrotime();
        $where = array();
        $data['order'] = $microtime . mt_rand(1000, 9999);//订单号
        $data['io_type'] = $param['award_type'];//收支类型(SIGN:签到;READ:阅读;SHARE:分享;NOSIGN:未签到;PUB:发布;INVITE:邀请;SHOP:购物;PUBGET:发布所得;)
        $data['user_type'] = $param['user_type'];//角色类型(STU:学生;TEA:老师;COM:机构)
        //说明
        switch ($param['award_type']) {
            case 'SHARE':
                $data['explain'] = '分享';
                break;
            case 'PUB':
                $data['explain'] = '发布';
                break;
            case 'INVITE':
                $data['explain'] = '邀请';
                break;
            case 'PUBGET':
                $data['explain'] = '发布所得';
                break;
            default :
                break;
        }
        $data['user_id'] = $param['user_id'];//用户id
        $data['add_time'] = time();//添加时间
        $date = date('Y-m-d', $data['add_time']);//日期
        $where['_string'] = 'FROM_UNIXTIME(add_time,"%Y-%m-%d")="' . $date . '"';
        $where['user_id'] = $data['user_id'];
        $where['user_type'] = $data['user_type'];
        $where['io_type'] = $data['io_type'];
        $num_total = D('api_bean_io')->where($where)->getField('sum(num) as total');
        $award_info = D('api_award')->field('id,award_num,limit_max')->where(array('award_type' => $data['io_type']))->find();
        if ($num_total >= $award_info['limit_max']) {
            return array('response_status' => 'maxed', 'res_msg' => '已达到上限');//已达到上限
        }
        $data['num'] = $award_info['award_num'];//奖励数量
        $add = D('api_bean_io')->add($data);
        if ($add) {
            if ($param['user_type'] == 'STU') {
                $balance = D('api_users')->where(array('id' => $param['user_id']))->getField('bean_balance');
                $blance = $data['num'] + $balance;
                $res = D('api_users')->where(array('id' => $param['user_id']))->save(array('bean_balance' => $blance));
                if ($res) {
                    Response::success(array('update_num'=>$res));
                } else {
                    Response::error(-2, '用户余额未更新成功');
                }
            } else {
                $balance = D('api_ct_users')->where(array('id' => $param['user_id']))->getField('bean_balance');
                $blance = $data['num'] + $balance;
                $res = D('api_ct_users')->where(array('id' => $param['user_id']))->save(array('bean_balance' => $blance));
                if ($res) {
                    Response::success(array('update_num'=>$res));
                } else {
                    Response::error(-2, '用户余额未更新成功');
                }
            }
        } else {
            Response::error(-1, '失败');
        }
    }

    /**
     * 阅读消费豆币
     * @author: 李胜辉
     * @time: 2018/11/20 09:34
     *
     */
    public function readExpenseBean($param)
    {
        $common = new Common();
        $microtime = $common->getMicrotime();
        $where = array();
        $data['order'] = $microtime . mt_rand(1000, 9999);//订单号
        $data['io_type'] = $param['award_type'];//收支类型(SIGN:签到;READ:阅读;SHARE:分享;NOSIGN:未签到;PUB:发布;INVITE:邀请;SHOP:购物;PUBGET:发布所得;)
        $data['user_type'] = $param['user_type'];//角色类型(STU:学生;TEA:老师;COM:机构)
        //说明
        $data['explain'] = '阅读';
        $data['user_id'] = $param['user_id'];//用户id
        $data['add_time'] = time();//添加时间

        //先查看是否已经阅读并支付过
        $where['user_id'] = $data['user_id'];//用户id
        $where['user_type'] = $data['user_type'];//角色类型(STU:学生;TEA:老师;COM:机构)
        $where['item_id'] = $param['item_id'];//文章id
        $readed = D('api_read_expense')->where($where)->getField('id');
        if ($readed) {
            $sql = 'update api_publish_content set read_num=read_num+1 where id=' . $param['item_id'];
            $model = new Model();
            $model->query($sql);
            Response::error(-3, '已阅读过,不用继续支付费用');
        }
        $award_num = D('api_award')->where(array('award_type' => $data['io_type']))->getField('award_num');
        if ($param['user_type'] == 'STU') {
            $balance = D('api_users')->where(array('id' => $param['user_id']))->getField('bean_balance');//查询豆币余额
            if ($balance < $award_num) {
                Response::error(-1, '余额不足');
            }
            $data['num'] = $award_num;//奖励数量
            $add = D('api_bean_io')->add($data);
            if ($add) {
                $blance = $balance - $data['num'];
                $res = D('api_users')->where(array('id' => $param['user_id']))->save(array('bean_balance' => $blance));
                if ($res) {
                    $recode['add_time'] = $data['add_time'];
                    $recode['user_type'] = $param['user_type'];
                    $recode['user_id'] = $param['user_id'];
                    $recode['item_id'] = $param['item_id'];
                    D('api_read_expense')->add($recode);
                    $sql = 'update api_publish_content set read_num=read_num+1 where id=' . $param['item_id'];
                    $model = new Model();
                    $model->query($sql);
                    Response::success(array('update_num'=>$res));
                } else {
                    Response::error(-2, '用户余额未更新成功');
                }
            }

        } else {
            $balance = D('api_ct_users')->where(array('id' => $param['user_id']))->getField('bean_balance');//查询豆币余额
            if ($balance < $award_num) {
                Response::error(-1, '余额不足');
            }
            $data['num'] = $award_num;//奖励数量
            $add = D('api_bean_io')->add($data);
            if ($add) {
                $blance = $balance - $data['num'];
                $res = D('api_ct_users')->where(array('id' => $param['user_id']))->save(array('bean_balance' => $blance));
                if ($res) {
                    $recode['add_time'] = $data['add_time'];
                    $recode['user_type'] = $param['user_type'];
                    $recode['user_id'] = $param['user_id'];
                    $recode['item_id'] = $param['item_id'];
                    D('api_read_expense')->add($recode);
                    $sql = 'update api_publish_content set read_num=read_num+1 where id=' . $param['item_id'];
                    $model = new Model();
                    $model->query($sql);
                    Response::success(array('update_num'=>$res));
                } else {
                    Response::error(-2, '用户余额未更新成功');
                }
            }
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
                Response::success(array('update_num'=>$set));
            } else {
                Response::error(-1, '修改失败');
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
                Response::success(array('update_num'=>$set));
            } else {
                Response::error(-1, '修改失败');
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
                    Response::success(array('update_num'=>$edit));
                } else {
                    Response::error(-1, '修改失败');
                }

            } else {
                Response::error(-1, '修改失败');
            }
        } else if ($type == 'COM') {
            $update = D('api_ct_users')->where($where)->data($data)->save();
            if ($update) {
                Response::success(array('update_num'=>$update));
            } else {
                Response::error(-1, '修改失败');
            }
        } else {
            Response::error(-2, '缺少参数');
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
            $model = new Model();
            $item_category = $param['pub_type'];
            switch ($item_category) {
                case 'ART':
                    $sql = 'update api_article_publish set share_num=share_num+1 where id=' . $param['item_id'];
                    $model->query($sql);
                    break;
                case 'VID':
                    $sql = 'update api_video_content set share_num=share_num+1 where id=' . $param['item_id'];
                    $model->query($sql);
                    break;
                case 'TEX':
                    $sql = 'update api_textbook_content set share_num=share_num+1 where id=' . $param['item_id'];
                    $model->query($sql);
                    break;
                case 'PUB':
                    $sql = 'update api_publish_content set share_num=share_num+1 where id=' . $param['item_id'];
                    $model->query($sql);
                    break;
                default :
                    break;
            }
            $info['pub_type'] = $type;
            $info['is_catalog'] = $is_catalog;
            $info['item_id'] = $id;
            Response::success($info);
        } else {
            Response::error(-1, '分享失败');
        }
    }
    /*******************************************************************************************分享 结束*******************************************************/
    /*******************************************************************************************我的订单 开始*******************************************************/

    /**
     * 评价商品
     * @author: 李胜辉
     * @time: 2018/11/14 09:34
     *
     */
    public function commentGoods($param)
    {
        $data['goods_id'] = $param['goods_id']; //商品id
        $data['goods_type'] = $param['goods_type'] ? $param['goods_type'] : '';//商品类型
        $data['comment_content'] = $param['comment_content'] ? $param['comment_content'] : '';//详情
        $data['pic'] = $param['pic'] ? $param['pic'] : '';//图片
        $data['category_id'] = $param['category_id'] ? $param['category_id'] : '';//分类id
        $data['user_type'] = $param['user_type'];//评价人类型(STU:学生TEA:老师COM:机构SYS:平台;)
        $data['add_id'] = $param['add_id'];//添加人id
        $data['add_time'] = time();//添加时间
        $res = D('api_goods_comment')->add($data);
        if ($res) {
            Response::success(array('id'=>$res));
        } else {
            Response::error(-1, '评价失败');
        }
    }

    /**
     * 我的订单列表
     * @author: 李胜辉
     * @time: 2018/11/14 09:34
     *
     */
    public function myOrderList($param)
    {
        $pagenum = $param['pagenum'] ? $param['pagenum'] : 1;//当前页
        $limit = $param['limit'] ? $param['limit'] : 10;//每页显示条数
        $start = ($pagenum - 1) * $limit;
        $data['user_type'] = $param['user_type']; //用户类型(COM:机构;TEA:老师;STU:学生)
        $category_id = $param['category_id'] ? $param['category_id'] : '';//分类id
        $user_id = $param['user_id'] ? $param['user_id'] : '';//用户id
        $order_status = $param['order_status'] ? $param['order_status'] : '';//订单状态(W:待付款;Y:已付款;C:已关闭;S:已发货;CD:已评价;N:已收货;F:完成;R:退货中;RS:退款成功)
        $where = array();
        if ($category_id != '') {
            $where['category_id'] = $category_id;
        }
        if ($user_id != '') {
            $where['o.add_id'] = $user_id;
        }
        if ($order_status != '') {
            $where['o.order_status'] = $order_status;
        }
        $res = D('api_order as o')->join('left join api_curriculum as c on c.id=o.goods_id')->field('o.id,o.order_no,o.goods_id,o.unit_price,o.total_price,o.goods_num,FROM_UNIXTIME(o.add_time,"%Y-%m-%d") as add_time,o.order_status,c.curriculum_name,c.price,c.cover,c.category_id')->where($where)->limit($start, $limit)->select();
        if ($res) {
            Response::success($res);
        } else {
            Response::error(-1, '暂无数据');
        }
    }

    /**
     * 我的订单详情
     * @author: 李胜辉
     * @time: 2018/11/23 09:34
     *
     */
    public function myOrderDetail($param)
    {
        $id = $param['id'];//订单id
        $res = D('api_order as o')->join('left join api_curriculum as c on c.id=o.goods_id')->field('o.id,o.order_no,o.goods_id,o.unit_price,o.total_price,o.goods_num,FROM_UNIXTIME(o.add_time,"%Y-%m-%d") as add_time,o.order_status,c.curriculum_name,c.price,c.cover,c.category_id')->where(array('o.id' => $id, 'o.order_status' => array('neq', 'C')))->find();
        if ($res) {
            Response::success($res);
        } else {
            Response::error(-1, '暂无数据');
        }
    }

    /**
     * 确认收货
     * @author: 李胜辉
     * @time: 2018/11/23 09:34
     *
     */
    public function confirmGet($param)
    {
        $id = $param['id'];//订单id
        $data['order_status'] = 'N';
        $res = D('api_order')->where(array('id' => $id))->save($data);
        if ($res) {
            Response::success(array('update_num'=>$res));
        } else {
            Response::error(-1, '确认收货失败');
        }
    }

    /**
     * 删除订单
     * @author: 李胜辉
     * @time: 2018/11/23 09:34
     *
     */
    public function deleteOrder($param)
    {
        $id = $param['id'];//订单id
        $data['order_status'] = 'C';
        $res = D('api_order')->where(array('id' => $id))->save($data);
        if ($res) {
            Response::success(array('del_num'=>$res));
        } else {
            Response::error(-1, '删除失败');
        }
    }

    /**
     * 退课
     * @author: 李胜辉
     * @time: 2018/11/23 09:34
     *
     */
    public function refund($param)
    {
        $id = $param['id'];//订单id
        $data['order_status'] = 'R';
        $res = D('api_order')->where(array('id' => $id))->save($data);
        if ($res) {
            Response::success(array('update_num'=>$res));
        } else {
            Response::error(-1, '申请失败');
        }
    }
    /*******************************************************************************************我的订单 结束*******************************************************/
    /*******************************************************************************************商家的订单 开始*******************************************************/


    /**
     * 商家的订单列表
     * @author: 李胜辉
     * @time: 2018/11/14 09:34
     *
     */
    public function storeOrderList($param)
    {
        $pagenum = $param['pagenum'] ? $param['pagenum'] : 1;//当前页
        $limit = $param['limit'] ? $param['limit'] : 10;//每页显示条数
        $start = ($pagenum - 1) * $limit;
        $data['user_type'] = $param['user_type']; //用户类型(COM:机构;TEA:老师;STU:学生)
        $category_id = $param['category_id'] ? $param['category_id'] : '';//分类id
        $user_id = $param['user_id'] ? $param['user_id'] : '';//用户id
        $order_status = $param['order_status'] ? $param['order_status'] : '';//订单状态(W:待付款;Y:已付款;C:已关闭;S:已发货;CD:已评价;N:已收货;F:完成;R:退货中;RS:退款成功)
        $where = array();
        if ($category_id != '') {
            $where['c.category_id'] = $category_id;
        }
        if ($user_id != '') {
            $where['c.add_id'] = $user_id;
        }
        if ($order_status != '') {
            $where['o.order_status'] = $order_status;
        }
        $res = D('api_order as o')->join('left join api_curriculum as c on c.id=o.goods_id')->field('o.id,o.order_no,o.goods_id,o.unit_price,o.total_price,o.goods_num,FROM_UNIXTIME(o.add_time,"%Y-%m-%d") as add_time,o.order_status,c.curriculum_name,c.price,c.cover,c.category_id')->where($where)->limit($start, $limit)->select();
        if ($res) {
            Response::success($res);
        } else {
            Response::error(-1, '暂无数据');
        }
    }

    /**
     * 商家的订单详情
     * @author: 李胜辉
     * @time: 2018/11/23 09:34
     *
     */
    public function storeOderDetail($param)
    {
        $id = $param['id'];//订单id
        $res = D('api_order as o')->join('left join api_curriculum as c on c.id=o.goods_id')->field('o.id,o.order_no,o.goods_id,o.unit_price,o.total_price,o.goods_num,FROM_UNIXTIME(o.add_time,"%Y-%m-%d") as add_time,o.order_status,c.curriculum_name,c.price,c.cover,c.category_id')->where(array('o.id' => $id, 'o.order_status' => array('neq', 'C')))->find();
        if ($res) {
            Response::success($res);
        } else {
            Response::error(-1, '暂无数据');
        }
    }

    /**
     * 发货
     * @author: 李胜辉
     * @time: 2018/11/23 09:34
     *
     */
    public function shipments($param)
    {
        $id = $param['id'];//订单id
        $data['order_status'] = 'S';
        $res = D('api_order')->where(array('id' => $id))->save($data);
        if ($res) {
            Response::success(array('update_num'=>$res));
        } else {
            Response::error(-1, '发货失败');
        }
    }


    /*******************************************************************************************商家的订单 结束*******************************************************/
}