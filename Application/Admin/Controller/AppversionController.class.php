<?php
/**
 * Created by PhpStorm.
 * User: wrl
 * Date: 2018/11/17
 * Time: 10:39
 */
namespace  Admin\Controller;
use Think\log;
class AppversionController extends BaseController{
    /**
     * 获取菜单列表
     * @author zhaoxiang <zhaoxiang051405@gmail.com>
     */
    public function index() {

        $listInfo = D('api_appversion')->select();
        $this->assign('list', $listInfo);
        $this->display();
    }

    /**
     * 添加APP版本
     * @author: 李胜辉
     * @time: 2018/11/16 17:32
     *
     */
    public function add() {
        if( IS_POST ){
            $data = I('post.');
            $data['add_time'] = time();
            $data['add_user_id'] = session('uid');
            $res = D('api_appversion')->add($data);
            if( $res === false ){
                $this->ajaxError('操作失败');
            }else{
                $this->ajaxSuccess('添加成功');
            }
        }else{
            $this->display();
        }
    }

    /**
     * 编辑APP版本
     * @author: 李胜辉
     * @time: 2018/11/16 17:32
     *
     */
    public function edit(){
        Log::record('编辑APP版本', Log::DEBUG);
        if( IS_GET ){
            $id = I('get.id');
            $details=D('api_appversion')->where("id='$id'")->find();
            $this->assign('detail', $details);
            $this->display('add');
            //echo var_dump ($details);
        }elseif( IS_POST ){

            $data = I('post.');
            $res = D('api_appversion')->where(array('id' => $data['id']))->save($data);
            if( $res === false ){
                $this->ajaxError('操作失败');
            }else{
                $this->ajaxSuccess('添加成功');
            }
        }
    }
    /**
     * 删除APP版本
     * @author: 李胜辉
     * @time: 2018/11/16 17:32
     *
     */
   /* public function del() {
        $id = I('post.id');
        $res = D('api_appversion')->where(array('id' => $id))->delete();
        if ($res === false) {
            $this->ajaxError('操作失败');
        } else {
            $this->ajaxSuccess('操作成功');
        }
    }
    //图片上传
    public function upload(){
        //获取网站根目录$url
        $PHP_SELF = $_SERVER['PHP_SELF'] ? $_SERVER['PHP_SELF'] : $_SERVER['SCRIPT_NAME'];
        $str = substr($PHP_SELF, 1);
        $url = 'http://' . $_SERVER['HTTP_HOST'] . '/' . substr($str, 0, strpos($str, '/') + 1);
        if (!empty($_FILES)) {
            $upload = new \Think\Upload();   // 实例化上传类
            $upload->maxSize   =     0 ;    // 设置附件上传大小
            $upload->exts      =     array("apk"); // 设置附件上传类型
            $upload->rootPath  =     THINK_PATH;          // 设置附件上传根目录
            $upload->savePath  =     '../Public/';    // 设置附件上传（子）目录
            $upload->subName   =     'uploads/apk/';  //子文件夹
            $upload->replace   =     true;  //同名文件是否覆盖
            // 上传文件
            $images   =   $upload->upload();
            //判断是否有图
            if($images){
                $info= $url . preg_replace('/^..\//','',$images['pho']['savepath']) . $images['pho']['savename'];//拼接图片地址
                echo json_encode($info);
            }
            else{
                $a=$upload->getError();//获取失败信息
                echo json_encode($a);
            }
        }else{
            return 2;
        }
    }*/
    /**
     * 文件上传方法
     * @author: 李胜辉
     * @time: 2018/11/16 16:34
     * @param: $files  $_FILES
     * @param: $path string 路径
     */
    public function upload()
    {
        //获取网站根目录地址$url
        $PHP_SELF = $_SERVER['PHP_SELF'] ? $_SERVER['PHP_SELF'] : $_SERVER['SCRIPT_NAME'];
        $str = substr($PHP_SELF, 1);
        $url = 'http://' . $_SERVER['HTTP_HOST'] . '/' . substr($str, 0, strpos($str, '/') + 1);
        Response::debug($url);
        $upload = new \Think\Upload();   // 实例化上传类
        $upload->maxSize = 3145728;    // 设置附件上传大小
        /*$upload->exts = array('jpg', 'gif', 'png', 'jpeg'); // 设置附件上传类型*/
        $upload->rootPath = THINK_PATH;          // 设置附件上传根目录
        $upload->savePath = '../Public/uploads/';    // 设置附件上传（子）目录
        $upload->subName = 'app/version';  //子文件夹
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
        return json_encode($return);
    }


}