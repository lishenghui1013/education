<?php
/**
 * 知识点管理
 * User: 李胜辉
 * Date: 2018/10/17
 * Time: 17:32
 */

namespace Admin\Controller;

use Think\log;

class KnowledgeController extends BaseController
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
        $limit = $getInfo['limit'] ? $getInfo['limit'] : C('PAGENUM');//每页显示条数
        $start = ($curr-1) * $limit;//开始

        $class = $getInfo['class_id'] ? $getInfo['class_id'] : '';//查询的时间
        $subject = $getInfo['subject_id'] ? $getInfo['subject_id'] : '';//查询的审核状态
        $versions = $getInfo['versions_id'] ? $getInfo['versions_id'] : '';//查询的时间
        $title = $getInfo['title'] ? $getInfo['title'] : '';//查询的审核状态
        $where = array();

        $where['article_type'] = 'POINT';
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
            $where['a.title'] = array('like','%' . $title . '%');
        }
        //查询总条数
        $total = D('api_article_publish as a')->join('left join api_class as c on c.id=a.class_id')->join('left join api_subject as s on s.id=a.subject_id')->join('left join api_versions as v on v.id=a.versions_id')->join('left join api_user as u on u.id=a.pub_userid')->where($where)->count();//查询满足要求的总记录数
        $info = D('api_article_publish as a')->join('left join api_class as c on c.id=a.class_id')->join('left join api_subject as s on s.id=a.subject_id')->join('left join api_versions as v on v.id=a.versions_id')->join('left join api_user as u on u.id=a.pub_userid')->field('a.id,a.title,a.content,a.versions_id,a.class_id,a.subject_id,a.pub_time,a.show_status,a.read_num,a.collect_num,a.share_num,u.username,v.versions_name,c.class_name,s.subject_name')->where($where)->order('a.id desc')->limit($start, $limit)->select();
        foreach($info as $keys=>$values){
            foreach($values as $key=>$value){
                if($values[$key]===null){
                    $info[$keys][$key] = '';

                }
            }

        }
        if($info){
            $data = array(
                'limit'=>$limit,
                'curr'=>$curr,
                'add_time'=>$getInfo['add_time'],
                'status'=>'success',
                'total' => $total,
                'data' => $info
            );
        }else{
            $data = array(
                'limit'=>$limit,
                'curr'=>$curr,
                'add_time'=>$getInfo['add_time'],
                'status'=>'fail',
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
        $list = D('api_article_publish as a')->join('left join api_class as c on c.id=a.class_id')->join('left join api_subject as s on s.id=a.subject_id')->join('left join api_versions as v on v.id=a.versions_id')->join('left join api_user as u on u.id=a.pub_userid')->field('a.id,a.title,a.cover,a.price,a.content,a.versions_id,a.class_id,a.subject_id,a.pub_time,a.show_status,a.read_num,a.collect_num,a.share_num,u.username,v.versions_name,c.class_name,s.subject_name')->where(array('a.id' => $id))->find();
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
        $res = D('api_article_publish')->where(array('id' => $id))->save(array('show_status' => 1));
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
        $res = D('api_article_publish')->where(array('id' => $id))->save(array('show_status' => 2));
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
            $data['show_status'] = $data['show_status'] == 'on' ? 1 : 2;
            $data['pub_time'] = time();
            $res = D('api_article_publish')->add($data);
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
            $listInfo = D('api_article_publish')->where("id='$id'")->find();
            //查询级别列表
            $class_list = D('api_class')->field('id,class_name')->order('id asc')->select();
            //查询版本列表
            $versions_list = D('api_versions')->field('id,versions_name')->order('id asc')->select();
            //查询科目列表
            $subject_list = D('api_subject')->field('id,subject_name')->order('id asc')->select();
            $this->assign('class_list', $class_list);
            $this->assign('versions_list', $versions_list);
            $this->assign('subject_list', $subject_list);
            $this->assign('detail', $listInfo);
            $this->display('add');
        } elseif (IS_POST) {
            $postData = I('post.');
            $postData['show_status'] = $postData['show_status'] == 'on' ? 1 : 2;

            $res = D('api_article_publish')->where(array('id' => $postData['id']))->save($postData);
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
            $upload->subName = 'uploads/articlePublish/knowledge';  //子文件夹
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
     * layui编辑器图片上传
     * @author: 李胜辉
     * @time: 2018/10/29 17:32
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
            $upload->subName = 'uploads/articlePublish/knowledge/editor';  //子文件夹
            $upload->replace = true;  //同名文件是否覆盖
            // 上传文件
            $images = $upload->upload();
            //return $images;
            //Log::record('$images', Log::DEBUG);die;
            //判断是否有图
            if ($images) {
                $info['code'] = 0;
                $info['data']['src'] = $url . substr($images['file']['savepath'], 3) . $images['file']['savename'];//拼接图片地址
                $info['msg'] = '上传成功';
                echo json_encode($info);
            } else {
                $info['code'] = 1;
                $info['data']['src'] = '';
                $info['msg'] = '上传失败';
                echo json_encode($info);
            }
        } else {
            $info['code'] = 2;
            $info['data']['src'] = '';
            $info['msg'] = '没有选择上传的图片';
            echo json_encode($info);
        }
    }
    /**
     * 批量添加页
     * @author: 李胜辉
     * @time: 2018/11/16 17:32
     */
    public function batchAdd()
    {
        $this->display();

    }
    /**
     * 知识点导入excel
     * @author: 李胜辉
     * @time: 2018/11/16 17:32
     *
     */
    public function imports()
    {

        header("Content-Type:text/html;charset = utf-8");

        if (!empty($_FILES)) {

            $upload = new \Think\Upload();   // 实例化上传类
            $upload->maxSize = 3145728;    // 设置附件上传大小
            $upload->exts = array('xls', 'xlsx'); // 设置附件上传类型
            $upload->rootPath = THINK_PATH;          // 设置附件上传根目录
            $upload->savePath = '../Public/';    // 设置附件上传（子）目录
            $upload->subName = 'uploads/knowledge';  //子文件夹
            $upload->replace = true;  //同名文件是否覆盖
            // 上传文件
            $info = $upload->upload();
            if ($info) {
                $file_name = substr($info['excel_file']['savepath'], 3) . $info['excel_file']['savename'];//拼接图片地址
                $exts = strtolower(pathinfo($file_name, PATHINFO_EXTENSION));//判断导入表格后缀格式
                vendor("PHPExcel.PHPExcel");
                if ($exts == 'xlsx') {
                    $objReader = \PHPExcel_IOFactory::createReader('Excel2007');
                    $objPHPExcel = $objReader->load($file_name, $encode = 'utf-8');

                } else if ($exts == 'xls') {
                    $objReader = \PHPExcel_IOFactory::createReader('Excel15');
                    $objPHPExcel = $objReader->load($file_name, $encode = 'utf-8');
                }
                $sheet = $objPHPExcel->getSheet(0);
                $highestRow = $sheet->getHighestRow();//获取总行数
                $highestColumn = $sheet->getHighestColumn();//取得总列数
                $datas = array();
                for ($i = 3; $i <= $highestRow; $i++) {
                    $data['title'] = $objPHPExcel->getActiveSheet()->getCell("A" . $i)->getValue();
                    $data['pub_userid'] = session('uid');
                    $data['pub_time'] = time();
                    $data['content'] = $objPHPExcel->getActiveSheet()->getCell("B" . $i)->getValue();

                    $data['price'] = $objPHPExcel->getActiveSheet()->getCell("C" . $i)->getValue();
                    $data['show_status'] = $objPHPExcel->getActiveSheet()->getCell("D" . $i)->getValue();
                    $data['article_type'] = $objPHPExcel->getActiveSheet()->getCell("E" . $i)->getValue();
                    $data['class_id'] = $objPHPExcel->getActiveSheet()->getCell("F" . $i)->getValue();
                    $class_id = D('api_class')->where(array('class_name' => $data['class_id']))->getField('id');
                    $data['class_id'] = $class_id?$class_id:0;
                    $subject_ids = $objPHPExcel->getActiveSheet()->getCell("G" . $i)->getValue();
                    $subject_id = D('api_subject')->where(array('subject_name' => $subject_ids))->getField('id');
                    $data['subject_id'] = $subject_id?$subject_id:0;
                    $versions_ids = $objPHPExcel->getActiveSheet()->getCell("H" . $i)->getValue();
                    $versions_id = D('api_versions')->where(array('versions_name' => $versions_ids))->getField('id');
                    $data['versions_id'] = $versions_id?$versions_id:0;
                    $datas[] = $data;
                }
                $res = D('api_article_publish')->addAll($datas);
                if ($res) {
                    unlink($file_name);
                    echo 1;//成功
                } else {
                    echo 2;//失败
                }

            } else {
                $a = $upload->getError();//获取失败信息
                echo json_encode($a);
            }
        } else {
            echo json_encode(3);
        }

    }


}