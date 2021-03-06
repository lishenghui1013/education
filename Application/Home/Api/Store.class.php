<?php

/**
 * 商城相关操作
 * @since   2018/11/07 创建
 * @author  李胜辉
 */

namespace Home\Api;

use Admin\Model\ApiAppModel;
use Home\ORG\ApiLog;
use Home\ORG\Crypt;
use Home\ORG\Response;
use Home\ORG\ReturnCode;
use Home\Api\Common;

class Store extends Base
{


    /**
     * 轮播图
     * @author: 李胜辉
     * @time: 2018/11/07 10:34
     *
     */
    public function slideshow($param)
    {
        $pic_type = $param['pic_type'];//轮播图类型('COM':机构;'STU':学生;'TEA':老师;)
        $list = D('api_slideshow as s')->join('left join api_publish as p on p.id=s.publish_id')->field('s.id,s.publish_id,p.cover')->where(array('s.pic_type' => $pic_type))->order('s.id desc')->select();
        if (empty($list)) {
            Response::error('-1', '暂无数据');
        } else {
            Response::success($list);
        }

    }

    /**
     * 平台轮播图
     * @author: 李胜辉
     * @time: 2018/12/08 10:34
     *
     */
    public function terraceSlideshow($param)
    {
        $pic_type = $param['pic_type'] ? $param['pic_type'] : 'STOR';//轮播图类型('COM':机构;'STU':学生;'TEA':老师;STOR:商城平台)
        $list = D('api_slideshow as s')->join('left join api_curriculum as p on p.id=s.publish_id')->field('s.id,s.publish_id,p.cover')->where(array('s.pic_type' => $pic_type))->order('s.id desc')->select();
        if (empty($list)) {
            Response::error(-1, '暂无数据');
        } else {
            Response::success($list);
        }

    }

    /**
     * 发布信息列表
     * @author: 李胜辉
     * @time: 2018/11/07 10:34
     *
     */
    public function publishList($param)
    {
        $pagenum = $param['pagenum'] ? $param['pagenum'] : 1;//当前页
        $limit = $param['limit'] ? $param['limit'] : 10;//每页显示条数
        $start = ($pagenum - 1) * $limit;
        $user_type = $param['user_type'] ? $param['user_type'] : '';//发布人的类型(COM:机构;TEA:老师;STU:学生)
        $item_type = $param['item_type'] ? $param['item_type'] : '';//发布内容类型(ART:文章;RAD:视频;SRAD:系列视频;FILE:文件;PIC:图片;)
        $where = array();
        $where['p.del_status'] = 2;
        $where['p.audit_status'] = 'S';
        $where['p.user_type'] = $user_type;
        if ($item_type !== '') {
            $where['item_type'] = $item_type;
        }
        if ($user_type == 'TEA' || $user_type == 'COM') {
            $list = D('api_publish as p')->join('left join api_ct_users as c on c.id=p.pub_userid')->join('left join api_publish_category as pc on pc.id=p.category_id')->field('p.id,p.title,FROM_UNIXTIME(p.pub_time,"%Y-%m-%d") as pub_time,p.share_num,p.item_type,p.user_type,p.collect_num,p.cover,c.icon,c.user_name,pc.category_name')->where($where)->order('p.id desc')->limit($start, $limit)->select();
            Response::success($list);
        } else if ($user_type == 'STU') {
            $list = D('api_publish as p')->join('left join api_users as c on c.id=p.pub_userid')->join('left join api_publish_category as pc on pc.id=p.category_id')->field('p.id,p.title,FROM_UNIXTIME(p.pub_time,"%Y-%m-%d") as pub_time,p.share_num,p.item_type,p.user_type,p.collect_num,p.cover,c.icon,c.user_name,pc.category_name')->where($where)->order('p.id desc')->limit($start, $limit)->select();
            Response::success($list);
        } else {
            Response::error(-1, '失败');
        }
    }

    /**
     *横向滑动列表
     * @author: 李胜辉
     * @time: 2018/12/12 10:34
     *
     */
    public function publishCrosswiseList($param)
    {
        $user_type = $param['user_type'] ? $param['user_type'] : '';//发布人的类型(COM:机构;TEA:老师;STU:学生)
        $item_type = $param['item_type'] ? $param['item_type'] : '';//发布内容类型(ART:文章;RAD:视频;SRAD:系列视频;FILE:文件;PIC:图片;)
        $where = array();
        $where['p.del_status'] = 2;
        $where['p.audit_status'] = 'S';
        $where['p.user_type'] = $user_type;
        if ($item_type !== '') {
            $where['item_type'] = $item_type;
        }
        if ($user_type == 'TEA' || $user_type == 'COM') {
            $list = D('api_publish as p')->join('left join api_ct_users as c on c.id=p.pub_userid')->join('left join api_publish_category as pc on pc.id=p.category_id')->field('p.id,p.title,FROM_UNIXTIME(p.pub_time,"%Y-%m-%d") as pub_time,p.share_num,p.collect_num,p.cover,c.icon,c.user_name,pc.category_name')->where($where)->order('p.id desc')->select();
            Response::success($list);
        } else if ($user_type == 'STU') {
            $list = D('api_publish as p')->join('left join api_users as c on c.id=p.pub_userid')->join('left join api_publish_category as pc on pc.id=p.category_id')->field('p.id,p.title,FROM_UNIXTIME(p.pub_time,"%Y-%m-%d") as pub_time,p.share_num,p.collect_num,p.cover,c.icon,c.user_name,pc.category_name')->where($where)->order('p.id desc')->select();
            Response::success($list);
        } else {
            Response::error(-1, '失败');
        }
    }

    /**
     * 发布信息列表(合并版)
     * @author: 李胜辉
     * @time: 2018/12/13 10:34
     *
     */
    public function publishAllList($param)
    {
        $pagenum = $param['pagenum'] ? $param['pagenum'] : 1;//当前页
        $limit = $param['limit'] ? $param['limit'] : 10;//每页显示条数
        $start = ($pagenum - 1) * $limit;
        $user_type = $param['user_type'] ? $param['user_type'] : '';//发布人的类型(COM:机构;TEA:老师;STU:学生)
        $where = array();
        $where['p.del_status'] = 2;
        $where['p.audit_status'] = 'S';
        $where['p.user_type'] = $user_type;
        if ($user_type == 'TEA' || $user_type == 'COM') {
            $list = D('api_publish as p')->join('left join api_ct_users as c on c.id=p.pub_userid')->join('left join api_publish_category as pc on pc.id=p.category_id')->field('p.id,p.title,FROM_UNIXTIME(p.pub_time,"%Y-%m-%d") as pub_time,p.share_num,p.item_type,p.user_type,p.collect_num,p.cover,c.icon,c.user_name,pc.category_name')->where($where)->order('p.id desc')->limit($start, $limit)->select();
            if ($list) {
                foreach ($list as $key => $value) {
                    $item_type = $value['item_type'] ? $value['item_type'] : '';//发布内容类型(ART:文章;RAD:视频;SRAD:系列视频;FILE:文件;PIC:图片;)
                    if ($item_type !== '') {
                        $where['item_type'] = $item_type;
                    }
                    $child_list = D('api_publish as p')->join('left join api_ct_users as c on c.id=p.pub_userid')->join('left join api_publish_category as pc on pc.id=p.category_id')->field('p.id,p.title,FROM_UNIXTIME(p.pub_time,"%Y-%m-%d") as pub_time,p.share_num,p.collect_num,p.item_type,p.cover,c.icon,c.user_name,pc.category_name')->where($where)->order('p.id desc')->select();
                    if ($child_list) {
                        $list[$key]['child_list'] = $child_list;
                    } else {
                        $list[$key]['child_list'] = array();
                    }
                }
                unset($key, $value);
                Response::success($list);
            } else {
                Response::error(-1, '暂无数据');
            }
        } else if ($user_type == 'STU') {
            $list = D('api_publish as p')->join('left join api_users as c on c.id=p.pub_userid')->join('left join api_publish_category as pc on pc.id=p.category_id')->field('p.id,p.title,FROM_UNIXTIME(p.pub_time,"%Y-%m-%d") as pub_time,p.share_num,p.item_type,p.user_type,p.collect_num,p.cover,c.icon,c.user_name,pc.category_name')->where($where)->order('p.id desc')->limit($start, $limit)->select();
            if ($list) {
                foreach ($list as $key => $value) {
                    $item_type = $param['item_type'] ? $param['item_type'] : '';//发布内容类型(ART:文章;RAD:视频;SRAD:系列视频;FILE:文件;PIC:图片;)
                    if ($item_type !== '') {
                        $where['item_type'] = $item_type;
                    }
                    $child_list = D('api_publish as p')->join('left join api_users as c on c.id=p.pub_userid')->join('left join api_publish_category as pc on pc.id=p.category_id')->field('p.id,p.title,FROM_UNIXTIME(p.pub_time,"%Y-%m-%d") as pub_time,p.share_num,p.collect_num,p.cover,c.icon,c.user_name,pc.category_name')->where($where)->order('p.id desc')->select();
                    if ($child_list) {
                        $list[$key]['child_list'] = $child_list;
                    } else {
                        $list[$key]['child_list'] = array();
                    }
                    Response::success($list);
                }
            } else {
                Response::error(-1, '暂无数据');
            }
        } else {
            Response::error(-1, '暂无数据');
        }
    }

    /**
     * 发布信息列表(分类显示版)
     * @author: 李胜辉
     * @time: 2018/12/13 10:34
     *
     */
    public function publishCategoryDisplayList($param)
    {
        $user_type = $param['user_type'] ? $param['user_type'] : '';//发布人的类型(COM:机构;TEA:老师;STU:学生)
        $where = array();
        $where['p.del_status'] = 2;
        $where['p.audit_status'] = 'S';
        $where['p.user_type'] = $user_type;
        if ($user_type == 'TEA' || $user_type == 'COM') {
            $list = D('api_publish as p')->join('left join api_ct_users as c on c.id=p.pub_userid')->join('left join api_publish_category as pc on pc.id=p.category_id')->field('p.id,p.title,FROM_UNIXTIME(p.pub_time,"%Y-%m-%d") as pub_time,p.share_num,p.item_type,p.user_type,p.collect_num,p.cover,c.icon,c.user_name,pc.category_name')->where($where)->order('p.id desc')->group('p.item_type')->select();
            if ($list) {
                foreach ($list as $key => $value) {
                    $item_type = $value['item_type'] ? $value['item_type'] : '';//发布内容类型(ART:文章;RAD:视频;SRAD:系列视频;FILE:文件;PIC:图片;)
                    if ($item_type !== '') {
                        $where['item_type'] = $item_type;
                    }
                    $child_list = D('api_publish as p')->join('left join api_ct_users as c on c.id=p.pub_userid')->join('left join api_publish_category as pc on pc.id=p.category_id')->field('p.id,p.title,FROM_UNIXTIME(p.pub_time,"%Y-%m-%d") as pub_time,p.share_num,p.collect_num,p.item_type,p.cover,c.icon,c.user_name,pc.category_name')->where($where)->order('p.id desc')->select();
                    if ($child_list) {
                        $list[$key]['child_list'] = $child_list;
                    } else {
                        $list[$key]['child_list'] = array();
                    }
                }
                unset($key, $value);
                Response::success($list);
            } else {
                Response::error(-1, '暂无数据');
            }
        } else if ($user_type == 'STU') {
            $list = D('api_publish as p')->join('left join api_users as c on c.id=p.pub_userid')->join('left join api_publish_category as pc on pc.id=p.category_id')->field('p.id,p.title,FROM_UNIXTIME(p.pub_time,"%Y-%m-%d") as pub_time,p.share_num,p.item_type,p.user_type,p.collect_num,p.cover,c.icon,c.user_name,pc.category_name')->where($where)->order('p.id desc')->group('p.item_type')->select();
            if ($list) {
                foreach ($list as $key => $value) {
                    $item_type = $param['item_type'] ? $param['item_type'] : '';//发布内容类型(ART:文章;RAD:视频;SRAD:系列视频;FILE:文件;PIC:图片;)
                    if ($item_type !== '') {
                        $where['item_type'] = $item_type;
                    }
                    $child_list = D('api_publish as p')->join('left join api_users as c on c.id=p.pub_userid')->join('left join api_publish_category as pc on pc.id=p.category_id')->field('p.id,p.title,FROM_UNIXTIME(p.pub_time,"%Y-%m-%d") as pub_time,p.share_num,p.collect_num,p.cover,c.icon,c.user_name,pc.category_name')->where($where)->order('p.id desc')->select();
                    if ($child_list) {
                        $list[$key]['child_list'] = $child_list;
                    } else {
                        $list[$key]['child_list'] = array();
                    }
                    Response::success($list);
                }
            } else {
                Response::error(-1, '暂无数据');
            }
        } else {
            Response::error(-1, '暂无数据');
        }
    }

    /**
     * 发布信息详情页
     * @author: 李胜辉
     * @time: 2018/11/07 10:34
     */
    public function publishDetail($param)
    {
        $id = $param['id'];//信息id
        $pub_type = $param['user_type'];//发布人的类型(COM:机构;TEA:老师;STU:学生)
        $info = D('api_publish')->where(array('id' => $id, 'del_status' => 2, 'audit_status' => 'S'))->field('id,item_type,FROM_UNIXTIME(pub_time,"%Y-%m-%d") as pub_time,price')->find();
        $item_type = $info['item_type'];
        if ($item_type == 'SRAD') { //系列视频
            switch ($pub_type) {
                case 'STU':
                    $list = D('api_publish_content as c')->join('left join api_publish as p on p.id=c.publish_id')->join('left join api_users as u on u.id=c.pub_userid')->field('c.id,c.content,c.content_pic,c.title,u.icon,u.user_name,u.nickname,c.pub_userid,p.cover,p.user_type')->where(array('c.publish_id' => $id, 'c.del_status' => 2))->order('c.id asc')->limit(0, 1)->select();
                    $list['pub_time'] = $info['pub_time'];
                    $list['price'] = $info['price'];
                    if ($list) {
                        Response::success($list);
                    } else {
                        Response::error(-1, '失败');
                    }
                    break;
                case 'TEA':
                case 'COM':
                    $list = D('api_publish_content as c')->join('left join api_publish as p on p.id=c.publish_id')->join('left join api_ct_users as u on u.id=c.pub_userid')->field('c.id,c.content,c.content_pic,c.title,u.icon,u.user_name,u.com_name,u.nickname,c.pub_userid,p.cover,p.user_type')->where(array('c.publish_id' => $id, 'c.del_status' => 2))->order('c.id asc')->limit(0, 1)->select();
                    $list['pub_time'] = $info['pub_time'];
                    $list['price'] = $info['price'];
                    if ($list) {
                        Response::success($list);
                    } else {
                        Response::error(-1, '失败');
                    }
                    break;
                default :
                    Response::error(-1, '失败');
                    break;
            }
        } else {
            switch ($pub_type) { //非系列视频
                case 'STU':
                    $list = D('api_publish as p')->join('left join api_publish_content as c on c.publish_id=p.id')->join('left join api_users as u on u.id=p.pub_userid')->field('p.id,p.cover,p.user_type,p.title,u.icon,u.user_name,u.nickname,p.pub_userid,FROM_UNIXTIME(p.pub_time,"%Y-%m-%d") as pub_time,c.content,c.content_pic')->where(array('c.publish_id' => $id, 'c.del_status' => 2))->select();
                    $cont = array();
                    if ($list) {
                        if ($item_type == 'PIC') {
                            foreach ($list as $key => $value) {
                                $content = explode(';', $value['content']);
                                if ($content) {
                                    foreach ($content as $keys => $values) {
                                        $cont[$keys]['pic'] = $values;
                                    }
                                    unset($keys, $values);
                                }
                                $list[$key]['content']=$cont;
                            }
                            unset($key, $value);
                        }
                        Response::success($list);
                    } else {
                        Response::error(-1, '失败');
                    }
                    break;
                case 'TEA':
                case 'COM':
                    $list = D('api_publish as p')->join('left join api_publish_content as c on c.publish_id=p.id')->join('left join api_ct_users as u on u.id=p.pub_userid')->field('p.id,p.user_type,p.cover,p.title,u.icon,u.user_name,u.com_name,u.nickname,p.pub_userid,FROM_UNIXTIME(p.pub_time,"%Y-%m-%d") as pub_time,c.content,c.content_pic')->where(array('c.publish_id' => $id, 'c.del_status' => 2))->select();
                    $cont = array();
                    if ($list) {
                        if ($item_type == 'PIC') {
                            foreach ($list as $key => $value) {
                                $content = explode(';', $value['content']);
                                if ($content) {
                                    foreach ($content as $keys => $values) {
                                        $cont[$keys]['pic'] = $values;
                                    }
                                    unset($keys, $values);
                                }
                                $list[$key]['content']=$cont;
                            }
                            unset($key, $value);
                        }
                        Response::success($list);
                    } else {
                        Response::error(-1, '失败');
                    }
                    break;
                default :
                    Response::error(-1, '失败');
                    break;
            }
        }


    }

    /**
     * 视频目录列表
     * @author: 李胜辉
     * @time: 2018/11/07 10:34
     */
    public function videoCatalogList($param)
    {
        $publish_id = $param['publish_id'];//发布id
        $total = D('api_publish_content')->where(array('publish_id' => $publish_id))->count();
        $limit = $param['limit'] ? $param['limit'] : $total;//每页显示条数
        $list = D('api_publish_content')->field('id,title,duration')->where(array('publish_id' => $publish_id))->limit(0, $limit)->select();
        $total_money = D('api_publish')->where(array('id' => $publish_id))->getField('price');
        $list['total'] = $total_money;//视频总价
        if ($list) {
            Response::success($list);
        } else {
            Response::error(-1, '失败');
        }
    }

    /**
     * 视频详情页
     * @author: 李胜辉
     * @time: 2018/11/07 10:34
     */
    public function videoCatalogDetail($param)
    {
        $id = $param['id'];//视频目录id
        $detail = D('api_publish_content as c')->join('left join api_publish as p on p.id=c.publish_id')->field('c.id,c.cover,c.title,c.content,FROM_UNIXTIME(c.pub_time,"%Y-%m-%d") as pub_time,p.user_type,p.pub_userid')->where(array('c.id' => $id, 'c.del_status' => 2))->find();
        $common = new Common();
        $info = $common->getUserInfo(array('user_type' => $detail['user_type'], 'user_id' => $detail['pub_userid']));
        $detail['icon'] = $info['icon'];
        $detail['user_name'] = $info['user_name'];
        if ($detail) {
            Response::success($detail);
        } else {
            Response::error(-1, '失败');
        }

    }

    /**
     * 热门评论列表
     * @author: 李胜辉
     * @time: 2018/11/07 10:34
     */
    public function hotComment($param)
    {
        $pagenum = $param['pagenum'] ? $param['pagenum'] : 1;//当前页
        $limit = $param['limit'] ? $param['limit'] : 10;//每页显示条数
        $start = ($pagenum - 1) * $limit;
        $item_id = $param['item_id'];//评论标题id
        $pub_type = $param['pub_type'];//发布内容用户类型(COM:机构;TEA:老师;STU:学生)
        if ($pub_type == 'STU') {
            $list = D('api_comment as c')->join('left join api_users as u on u.id=c.user_id')->field('u.icon,u.nickname,u.user_name,c.content,FROM_UNIXTIME(c.add_time,"%Y-%m-%d") as add_time')->where(array('c.item_id' => $item_id, 'c.audit_status' => 'S'))->limit($start, $limit)->order('c.id desc')->select();

        } else {
            $list = D('api_comment as c')->join('left join api_ct_users as u on u.id=c.user_id')->field('u.icon,u.com_name,u.nickname,u.user_name,c.content,FROM_UNIXTIME(c.add_time,"%Y-%m-%d") as add_time')->where(array('c.item_id' => $item_id, 'c.audit_status' => 'S'))->limit($start, $limit)->order('c.id desc')->select();

        }
        if ($list) {
            Response::success($list);
        } else {
            Response::error(-1, '失败');
        }

    }

    /**
     * 发布信息分类列表
     * @author: 李胜辉
     * @time: 2018/11/07 10:34
     */
    public function publishCategoryList()
    {
        $list = D('api_publish_category')->order('id asc')->select();
        if ($list) {
            Response::success($list);
        } else {
            Response::error(-1, '失败');
        }

    }

    /**
     * 发布图片/文章/视频/文件
     * @author: 李胜辉
     * @time: 2018/11/08 10:34
     */
    public function publishInfo($param)
    {
        $item_type = $param['item_type'];//发布内容类型(ART:文章;VID:视频;SVID:系列视频;FILE:文件;PIC:图片;)
        switch ($item_type) {
            case 'ART':
                $path = 'publish/article';
                $url = $this->uploads($path);
                $data['intro'] = $param['intro'] ? $param['intro'] : '';//简介
                $content['content'] = $param['content'] ? $param['content'] : '';//内容??
                break;
            case 'VID':
                $path = 'publish/video';
                $url = $this->uploads($path);
                $data['intro'] = $param['intro'] ? $param['intro'] : '';//简介
                $content['content'] = $url['content'] ? $url['content'] : '';//内容
                break;
            case 'FILE':
                $path = 'publish/file';
                $url = $this->uploads($path);
                $data['intro'] = $param['intro'] ? $param['intro'] : '';//简介
                $content['content'] = $url['content'] ? $url['content'] : '';//内容
                break;
            case 'PIC':
                $path = 'publish/pic';
                $url = $this->uploads($path);
                $content['content'] = $url['content'] ? $url['content'] : '';//内容
                $data['intro'] = $param['intro'] ? $param['intro'] : '';//简介

                break;
            default :
                $path = 'publish/article';
                $url = $this->uploads($path);
                $data['intro'] = $param['intro'] ? $param['intro'] : '';//简介
                $content['content'] = $param['intro'] ? $param['intro'] : '';//内容
                break;
        }

        $data['cover'] = $url['cover'] ? $url['cover'] : '';//封面
        $data['title'] = $param['title'];//标题

        $data['pub_time'] = time();//添加时间
        $data['category_id'] = $param['category_id'];//类型id
        $data['user_type'] = $param['user_type'];//发布人的类型(COM:机构;TEA:老师;STU:学生)
        $data['item_type'] = $param['item_type'];//发布内容类型(ART:文章;RAD:视频;SRAD:系列视频;FILE:文件;PIC:图片;)
        $data['pub_userid'] = $param['user_id'];//发布人id
        $insert = D('api_publish')->add($data);
        if ($insert) {
            $content['cover'] = $url['cover'] ? $url['cover'] : '';//封面
            $content['publish_id'] = $insert;//发布id
            $content['title'] = $param['title'];//标题
            $content['content_pic'] = $url['art_pic'] ? $url['art_pic'] : '';//内容中的图片
            $content['pub_time'] = time();//添加时间
            $content['pub_userid'] = $param['user_id'];//发布人id
            $add = D('api_publish_content')->add($content);
            if ($add) {
                Response::success($add);
            } else {
                Response::error('-2', '目录添加失败');
            }
        } else {
            Response::error(-1, '失败');
        }
    }


    /**
     * 发布系列视频
     * @author: 李胜辉
     * @time: 2018/11/07 16:34
     */
    public function publishSetVideo($param)
    {
        $path = 'publish/setVideo';
        //将视频url保存到数组中
        $url = $this->uploads($path);
        $data['cover'] = $url['cover'] ? $url['cover'] : '';//封面
        $data['title'] = $param['title'];//标题
        $data['intro'] = $param['intro'] ? $param['intro'] : '';//简介
        $data['pub_time'] = time();//添加时间
        $data['category_id'] = $param['category_id'];//类型id
        $data['user_type'] = $param['user_type'];//发布人的类型(COM:机构;TEA:老师;STU:学生)
        $data['item_type'] = $param['item_type'];//发布内容类型(ART:文章;RAD:视频;SRAD:系列视频;FILE:文件;PIC:图片;)
        $data['pub_userid'] = $param['user_id'];//发布人id
        $data['price'] = $param['price'];//价格
        $insert = D('api_publish')->add($data);
        $content = array();
        $datas = array();
        if ($insert) {
            $content['cover'] = $url['cover'] ? $url['cover'] : '';//封面
            $content['publish_id'] = $insert;//发布id
            $content['pub_time'] = time();//添加时间
            $content['pub_userid'] = $param['user_id'];//发布人id
            unset($url['cover']);
            if ($url) {
                $arr_content = explode(';',$url['content']);
                foreach($arr_content as $key=>$value){
                    $content['title'] = $param['titles'][$key];//标题
                    $content['content'] = $value;//内容
                    $datas[] = $content;
                }
                unset($key,$value);
            }
            $add = D('api_publish_content')->addAll($datas);
            if ($add) {
                Response::success($add);
            } else {
                Response::error('-2', '目录添加失败');
            }

        } else {
            Response::error(-1, '失败');
        }
    }

    /**
     * 文件上传方法
     * @author: 李胜辉
     * @time: 2018/11/07 16:34
     * @param: $files  $_FILES
     * @param: $path string 路径
     */
    public function uploads($path)
    {
        //获取网站根目录地址$url
        $PHP_SELF = $_SERVER['PHP_SELF'] ? $_SERVER['PHP_SELF'] : $_SERVER['SCRIPT_NAME'];
        $str = substr($PHP_SELF, 1);
        $url = 'http://' . $_SERVER['HTTP_HOST'] . '/' . substr($str, 0, strpos($str, '/') + 1);
        Response::debug($url);
        $upload = new \Think\Upload();   // 实例化上传类
        $upload->maxSize = 314572800000;    // 设置附件上传大小
        /*$upload->exts = array('jpg', 'gif', 'png', 'jpeg'); // 设置附件上传类型*/
        $upload->rootPath = THINK_PATH;          // 设置附件上传根目录
        $upload->savePath = '../Public/uploads/';    // 设置附件上传（子）目录
        $upload->subName = $path;  //子文件夹
        $upload->replace = true;  //同名文件是否覆盖
        // 上传文件
        $return = array();

        if ($_FILES) {
            foreach ($_FILES as $key => $value) {
                $temp = array();
                $temp[$key] = $_FILES[$key];
                $res_info = $upload->upload($temp);
                if ($res_info) {
                    $info = '';
                    foreach ($res_info as $keys => $tepimg) {
                        $info .= $url . preg_replace('/^..\//', '', $tepimg['savepath']) . $tepimg['savename'] . ';';//拼接图片地址
                    }
                    unset($keys, $tepimg);
                    $info = substr($info, 0, -1);
                    $return[$key] = $info;
                }
            }
            unset($key, $value);

        }
        return $return;
    }


}