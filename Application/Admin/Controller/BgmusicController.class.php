<?php
/**
 * 背景音乐
 * User: 李胜辉
 * Date: 2018/11/19
 * Time: 17:32
 */
namespace Admin\Controller;


class BgmusicController extends BaseController {
    /**
     * 列表页
     * @author: 李胜辉
     * @time: 2018/11/19 08:32
     */
    public function index()
    {
        $this->display();
    }

    /**
     * ajax列表页
     * @author: 李胜辉
     * @time: 2018/11/19 17:32
     */
    public function ajaxGetIndex()
    {
        $getInfo = I('post.');
        $curr = $getInfo['curr'] ? $getInfo['curr'] : 1;//当前页
        $limit = $getInfo['limit'] ? $getInfo['limit'] : C('PAGENUM');//每页显示条数
        $start = ($curr - 1) * $limit;//开始
        $music_name = $getInfo['music_name'] ? $getInfo['music_name'] : '';//查询关键字
        $where = array();
        if ($music_name != '') {
            $where['c.music_name'] = array('like', '%' . $music_name . '%');
        }
        //查询总条数
        $total = D('api_bg_music as c')->join('left join api_user as u on u.id=c.add_id')->where($where)->count();//查询满足要求的总记录数

        $info = D('api_bg_music as c')->join('left join api_user as u on u.id=c.add_id')->field('c.id,c.music_name,c.user_type,c.user_id,c.music_url,u.username,c.add_time')->where($where)->order('c.id')->limit($start, $limit)->select();
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
                'status' => 'success',//查询状态:成功为success,失败为fail
                'total' => $total,
                'data' => $info
            );
        } else {
            $data = array(
                'limit' => $limit,
                'curr' => $curr,
                'status' => 'fail',
                'total' => $total,
                'data' => $info
            );
        }

        $this->ajaxReturn($data, 'json');
    }

    /**
     * 删除记录
     * @author: 李胜辉
     * @time: 2018/11/19 09:32
     */
    public function delete()
    {
        $id = I('post.id');
        $res = D('api_bg_music')->where(array('id' => $id))->delete();
        if ($res === false) {
            $this->ajaxError('删除失败');
        } else {
            $this->ajaxSuccess('删除成功');
        }
    }
    /**
     * 添加音乐
     * @author: 李胜辉
     * @time: 2018/11/19 09:32
     */
    public function add()
    {
        if (IS_POST) {
            $data = I('post.');
            $data['add_id'] = session('uid');
            $data['add_time'] = time();
            $res = D('api_bg_music')->add($data);
            if ($res === false) {
                $this->ajaxError('操作失败', 0);
            } else {
                $this->ajaxSuccess('添加成功');
            }
        } else {
            $this->display();
        }
    }
    /**
     * 编辑音乐
     * @author: 李胜辉
     * @time: 2018/11/19 09:32
     */
    public function update()
    {
        if (IS_GET) {
            $id = I('get.id');
            $listInfo = D('api_bg_music')->where(array('id'=>$id))->find();
            $this->assign('detail', $listInfo);
            $this->display('add');
        } elseif (IS_POST) {
            $postData = I('post.');
            $res = D('api_bg_music')->where(array('id' => $postData['id']))->save($postData);
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
     * @time: 2018/11/16 17:32
     *
     */
    public function upload()
    {
        //获取网站根目录$url
        $PHP_SELF = $_SERVER['PHP_SELF'] ? $_SERVER['PHP_SELF'] : $_SERVER['SCRIPT_NAME'];
        $str = substr($PHP_SELF, 1);
        $url = 'http://' . $_SERVER['HTTP_HOST'] . '/' . substr($str, 0, strpos($str, '/') + 1);
        if (!empty($_FILES)) {
            $upload = new \Think\Upload();   // 实例化上传类
            $upload->maxSize = 0;    // 设置附件上传大小
            /* $upload->exts      =     array("apk"); // 设置附件上传类型*/
            $upload->rootPath = THINK_PATH;          // 设置附件上传根目录
            $upload->savePath = '../Public/';    // 设置附件上传（子）目录
            $upload->subName = 'uploads/music';  //子文件夹
            $upload->replace = true;  //同名文件是否覆盖
            // 上传文件
            $return = array();
            //判断是否有图
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
            echo json_encode($return);
        } else {
            echo 2;
        }
    }


}