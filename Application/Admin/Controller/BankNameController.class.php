<?php
/**
 * 级别管理
 * User: 李胜辉
 * Date: 2018/10/17
 * Time: 17:32
 */
namespace Admin\Controller;


class BankNameController extends BaseController {
    /**
     * 列表页
     * @author: 李胜辉
     * @time: 2018/11/10 11:32
     */
    public function index()
    {
        $this->display();
    }

    /**
     * ajax列表页
     * @author: 李胜辉
     * @time: 2018/10/25 17:32
     */
    public function ajaxGetIndex()
    {
        $getInfo = I('post.');
        $curr = $getInfo['curr'] ? $getInfo['curr'] : 1;//当前页
        $limit = $getInfo['limit'] ? $getInfo['limit'] : 10;//每页显示条数
        $start = ($curr - 1) * $limit;//开始
        $bank_name = $getInfo['bank_name'] ? $getInfo['bank_name'] : '';//查询关键字
        $where = array();
        if ($bank_name != '') {
            $where['c.bank_name'] = array('like', '%' . $bank_name . '%');
        }
        //查询总条数
        $total = D('api_bankname as c')->join('left join api_user as u on u.id=c.add_id')->where($where)->count();//查询满足要求的总记录数

        $info = D('api_bankname as c')->join('left join api_user as u on u.id=c.add_id')->field('c.id,c.bank_name,u.username,c.add_time,c.logo,c.pic')->where($where)->order('c.id')->limit($start, $limit)->select();
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
     * @time: 2018/11/10 11:32
     */
    public function delete()
    {
        $id = I('post.id');
        $res = D('api_bankname')->where(array('id' => $id))->delete();
        if ($res === false) {
            $this->ajaxError('删除失败');
        } else {
            $this->ajaxSuccess('删除成功');
        }
    }
    /**
     * 添加银行
     * @author: 李胜辉
     * @time: 2018/11/10 11:32
     */
    public function add()
    {
        if (IS_POST) {
            $data = I('post.');
            $data['add_id'] = session('uid');
            $data['add_time'] = time();
            $res = D('api_bankname')->add($data);
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
     * 编辑银行名称
     * @author: 李胜辉
     * @time: 2018/11/10 11:32
     */
    public function update()
    {
        if (IS_GET) {
            $id = I('get.id');
            $listInfo = D('api_bankname')->where(array('id'=>$id))->find();
            $this->assign('detail', $listInfo);
            $this->display('add');
        } elseif (IS_POST) {
            $postData = I('post.');
            $res = D('api_bankname')->where(array('id' => $postData['id']))->save($postData);
            if ($res === false) {
                $this->ajaxError('操作失败');
            } else {
                $this->ajaxSuccess('编辑成功');
            }
        }
    }
    /**
     * layui编辑器图片上传
     * @author: 李胜辉
     * @time: 2018/11/10 17:32
     */
    public function uploads()
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
            $upload->subName = 'uploads/bank/pic';  //子文件夹
            $upload->replace = true;  //同名文件是否覆盖
            // 上传文件
            $images = $upload->upload();

            //判断是否有图
            if ($images) {
                foreach($images as $key=>$value){
                    $info['url'] = $url . substr($images[$key]['savepath'], 3) . $images[$key]['savename'];//拼接图片地址
                }
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


}