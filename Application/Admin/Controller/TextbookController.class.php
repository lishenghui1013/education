<?php
/**
 * 课本管理
 * User: 李胜辉
 * Date: 2018/10/17
 * Time: 17:32
 */

namespace Admin\Controller;


class TextbookController extends BaseController
{
    /**
     * 列表页
     * @author: 李胜辉
     * @time: 2018/10/17 17:32
     */
    public function index()
    {
        //查询级别列表
        $class_list = D('api_class')->field('id,class_name')->order('id asc')->select();
        //查询版本列表
        $versions_list = D('api_versions')->field('id,versions_name')->order('id asc')->select();
        //查询科目列表
        $subject_list = D('api_subject')->field('id,subject_name')->order('id asc')->select();
        $this->assign('class_list', $class_list);//级别列表
        $this->assign('versions_list', $versions_list);//版本列表
        $this->assign('subject_list', $subject_list);//科目列表
        $this->display();
    }

    /**
     * ajax列表页
     * @author: 李胜辉
     * @time: 2018/10/17 17:32
     */
    public function ajaxGetIndex()
    {
        $getInfo = I('post.');
        $curr = $getInfo['curr'] ? $getInfo['curr'] : 1;//当前页
        $limit = $getInfo['limit'] ? $getInfo['limit'] : 1;//每页显示条数
        $start = ($curr - 1) * $limit;//开始

        $class = $getInfo['class_id'] ? $getInfo['class_id'] : '';//查询的时间
        $subject = $getInfo['subject_id'] ? $getInfo['subject_id'] : '';//查询的审核状态
        $versions = $getInfo['versions_id'] ? $getInfo['versions_id'] : '';//查询的时间
        $title = $getInfo['title'] ? $getInfo['title'] : '';//查询的审核状态
        $where = array();
        if ($class != '') {
            $where['c.id'] = $class;
        }
        if ($subject != '') {
            $where['s.id'] = $subject;
        }
        if ($versions != '') {
            $where['v.id'] = $versions;
        }
        if ($title != '') {
            $where['t.title'] = array('like', '%' . $title . '%');
        }
        //查询总条数
        $total = D('api_textbook as t')->join('left join api_class as c on c.id=t.class_id')->join('left join api_subject as s on s.id=t.subject_id')->join('left join api_versions as v on v.id=t.versions_id')->join('left join api_user as u on u.id=t.pub_userid')->where($where)->count();//查询满足要求的总记录数
        $info = D('api_textbook as t')->join('left join api_class as c on c.id=t.class_id')->join('left join api_subject as s on s.id=t.subject_id')->join('left join api_versions as v on v.id=t.versions_id')->join('left join api_user as u on u.id=t.pub_userid')->field('t.id,t.title,t.intro,t.versions_id,t.class_id,t.subject_id,t.pub_time,t.show_status,t.read_num,t.collect_num,t.share_num,u.username,v.versions_name,c.class_name,s.subject_name')->where($where)->order('t.id desc')->limit($start, $limit)->select();
        foreach ($info as $keys => $values) {
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
                'status' => 'success',
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
     * 查看
     * @author: 李胜辉
     * @time: 2018/10/17 17:32
     */
    public function look()
    {
        $id = I('get.id');//获取数据
        $list = D('api_textbook as t')->join('left join api_class as c on c.id=t.class_id')->join('left join api_subject as s on s.id=t.subject_id')->join('left join api_versions as v on v.id=t.versions_id')->join('left join api_user as u on u.id=t.pub_userid')->field('t.id,t.title,t.cover,t.price,t.intro,t.versions_id,t.class_id,t.subject_id,t.pub_time,t.show_status,t.read_num,t.collect_num,t.share_num,u.username,v.versions_name,c.class_name,s.subject_name')->where(array('t.id' => $id))->find();
        $this->assign('list', $list);
        $this->display();
    }

    /**
     * 上线
     * @author: 李胜辉
     * @time: 2018/10/19 09:32
     */
    public function open()
    {
        $id = I('post.id');
        $res = D('api_textbook')->where(array('id' => $id))->save(array('show_status' => 1));
        if ($res === false) {
            $this->ajaxError('操作失败');
        } else {
            $this->ajaxSuccess('添加成功');
        }
    }

    /**
     * 下线
     * @author: 李胜辉
     * @time: 2018/10/19 09:32
     */
    public function close()
    {
        $id = I('post.id');
        $res = D('api_textbook')->where(array('id' => $id))->save(array('show_status' => 2));
        if ($res === false) {
            $this->ajaxError('操作失败');
        } else {
            $this->ajaxSuccess('添加成功');
        }
    }

    /**
     * 添加页
     * @author: 李胜辉
     * @time: 2018/10/17 17:32
     */
    public function add()
    {
        if (IS_POST) {
            $data = I('post.');
            $data['pub_userid'] = session('uid');
            /*print_r($data);die;*/
            $data['show_status'] = $data['show_status'] == 'on' ? 1 : 2;
            $data['pub_time'] = time();
            $res = D('api_textbook')->add($data);
            if ($res === false) {
                $this->ajaxError('操作失败', 0);
            } else {
                $this->ajaxSuccess('添加成功');
            }
        } else {
            //查询级别列表
            $class_list = D('api_class')->field('id,class_name')->order('id asc')->select();
            //查询版本列表
            $versions_list = D('api_versions')->field('id,versions_name')->order('id asc')->select();
            //查询科目列表
            $subject_list = D('api_subject')->field('id,subject_name')->order('id asc')->select();
            $this->assign('class_list', $class_list);
            $this->assign('versions_list', $versions_list);
            $this->assign('subject_list', $subject_list);

            $this->display();
        }
    }

    /**
     * 修改页
     * @author: 李胜辉
     * @time: 2018/10/17 17:32
     */
    public function update()
    {

        if (IS_GET) {
            $id = I('get.id');
            $listInfo = D('api_textbook')->where("id='$id'")->find();
            //查询级别列表
            $class_list = D('api_class')->field('id,class_name')->order('id asc')->select();
            //查询版本列表
            $versions_list = D('api_versions')->field('id,versions_name')->order('id asc')->select();
            //查询科目列表
            $subject_list = D('api_subject')->field('id,subject_name')->order('id asc')->select();
            $this->assign('class_list', $class_list);
            $this->assign('versions_list', $versions_list);
            $this->assign('subject_list', $subject_list);
            //print_r($img);
            $this->assign('detail', $listInfo);
            $this->display('add');
        } elseif (IS_POST) {
            $postData = I('post.');
            $postData['show_status'] = $postData['show_status'] == 'on' ? 1 : 2;

            $res = D('api_textbook')->where(array('id' => $postData['id']))->save($postData);
            if ($res === false) {
                $this->ajaxError('操作失败');
            } else {
                $this->ajaxSuccess('编辑成功');
            }
        }
    }

    /**
     * 图片上传
     * @author: 李胜辉
     * @time: 2018/10/17 17:32
     */
    public function upload()
    {
        //获取网站根目录地址$url
        $PHP_SELF = $_SERVER['PHP_SELF'] ? $_SERVER['PHP_SELF'] : $_SERVER['SCRIPT_NAME'];
        $str = substr($PHP_SELF, 1);
        $url = 'http://' . $_SERVER['HTTP_HOST'] . '/' . substr($str, 0, strpos($str, '/') + 1);
        if (!empty($_FILES)) {
            $upload = new \Think\Upload();   // 实例化上传类
            $upload->maxSize = 3145728;    // 设置附件上传大小
            $upload->exts = array('jpg', 'gif', 'png', 'jpeg'); // 设置附件上传类型
            $upload->rootPath = THINK_PATH;          // 设置附件上传根目录
            $upload->savePath = '../Public/';    // 设置附件上传（子）目录
            $upload->subName = 'uploads/articlePublish/textbook/';  //子文件夹
            $upload->replace = true;  //同名文件是否覆盖
            // 上传文件
            $images = $upload->upload();
            //return $images;
            //Log::record('$images', Log::DEBUG);die;
            //判断是否有图
            if ($images) {
                $info['url'] = $url . substr($images['file']['savepath'], 3) . $images['file']['savename'];//拼接图片地址
                $info['imgid'] = rand(0, 1000);
                echo json_encode($info);
            } else {
                $a = $upload->getError();//获取失败信息
                echo json_encode($a);
            }
        } else {
            echo json_encode(2);
        }
    }

    /**
     * 目录列表
     * @author: 李胜辉
     * @time: 2018/10/22 08:44
     */
    public function catalog()
    {

        $pagenum = I('post.pagenum/d', 1);//每页显示条数
        $currentpage = I('get.p/d', 1);//当前页码
        $start = ($currentpage - 1) * $pagenum;//开始查询项
        $title = I('post.title') !== '' ? I('post.title') : (I('get.ctitle') !== '' ? I('get.ctitle') : '');//标题
        $map['textbook_id'] = I('post.textbook_id') !== '' ? I('post.textbook_id') : (I('get.textbook_id') !== '' ? I('get.textbook_id') : '');//课本id
        if ($title != '') {
            $map['_string'] = 'c.title like "%' . $title . '%"';
        }
        //查询总条数
        $count = D('api_textbook_content as c')->join('left join api_textbook as t on t.id=c.textbook_id')->join('left join api_user as u on u.id=c.pub_userid')->where($map)->count();//查询满足要求的总记录数

        $list = D('api_textbook_content as c')->join('left join api_textbook as t on t.id=c.textbook_id')->join('left join api_user as u on u.id=c.pub_userid')->field('c.id,c.textbook_id,c.title,c.content,c.sort,c.price,c.pub_time,c.show_status,c.read_num,c.collect_num,c.share_num,u.username')->where($map)->order('c.sort')->page($currentpage . ',' . $pagenum)->select();


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
            $key = implode(explode('.', $key));
            if ($key == '_string') {

                $temp_arr = explode(' ', $map[$key]);
                foreach ($temp_arr as $k => $v) {
                    $temp_arr[$key] = trim($v);
                }
                $key = implode(explode('.', $temp_arr['0']));
                $val = substr($temp_arr['2'], 2, -2);

            }
            $Page->parameter[$key] = urlencode($val);

        }
        $show = $Page->show();// 分页显示输出
        $this->assign('title', $title);//查询题目关键字
        $this->assign('list', $list);//查询到的数据
        $this->assign('page', $show);// 赋值分页输出
        $this->assign('textbook_id', $map['textbook_id']);// 赋值分页输出

        $this->display();
    }

    /**
     * 查看目录
     * @author: 李胜辉
     * @time: 2018/10/17 17:32
     */
    public function lookCatalog()
    {
        $id = I('get.id');//获取数据
        $list = D('api_textbook_content as c')->join('left join api_textbook as t on t.id=c.textbook_id')->join('left join api_user as u on u.id=c.pub_userid')->field('c.id,c.title,c.content,c.sort,c.price,c.pub_time,c.show_status,c.read_num,c.collect_num,c.share_num,u.username')->where(array('t.id' => $id))->find();
        $this->assign('list', $list);
        $this->display();
    }

    /**
     * 目录上线
     * @author: 李胜辉
     * @time: 2018/10/19 09:32
     */
    public function openCatalog()
    {
        $id = I('post.id');
        $res = D('api_textbook_content')->where(array('id' => $id))->save(array('show_status' => 1));
        if ($res === false) {
            $this->ajaxError('操作失败');
        } else {
            $this->ajaxSuccess('添加成功');
        }
    }

    /**
     * 下线目录
     * @author: 李胜辉
     * @time: 2018/10/19 09:32
     */
    public function closeCatalog()
    {
        $id = I('post.id');
        $res = D('api_textbook_content')->where(array('id' => $id))->save(array('show_status' => 2));
        if ($res === false) {
            $this->ajaxError('操作失败');
        } else {
            $this->ajaxSuccess('添加成功');
        }
    }

    /**
     * 添加目录
     * @author: 李胜辉
     * @time: 2018/10/17 17:32
     */
    public function addCatalog()
    {
        if (IS_POST) {
            $data = I('post.');
            $data['pub_userid'] = session('uid');
            /*print_r($data);die;*/
            $data['show_status'] = $data['show_status'] == 1 ? 1 : 2;
            $data['pub_time'] = time();
            $res = D('api_textbook_content')->add($data);
            if ($res === false) {
                $this->ajaxError('操作失败', 0);
            } else {
                $this->ajaxSuccess('添加成功');
            }
        } else {
            $textbook_id = I('get.textbook_id');
            $this->assign('textbook_id', $textbook_id);
            $this->display();
        }

    }

    /**
     * 修改目录页
     * @author: 李胜辉
     * @time: 2018/10/22 09:22
     */
    public function updateCatalog()
    {

        if (IS_GET) {
            $id = I('get.id');
            $listInfo = D('api_textbook_content')->where("id='$id'")->find();
            $this->assign('detail', $listInfo);
            $this->display('addCatalog');
        } elseif (IS_POST) {
            $postData = I('post.');
            $postData['show_status'] = $postData['show_status'] == 'on' ? 1 : 2;

            $res = D('api_textbook_content')->where(array('id' => $postData['id']))->save($postData);
            if ($res === false) {
                $this->ajaxError('操作失败');
            } else {
                $this->ajaxSuccess('编辑成功');
            }
        }
    }
}