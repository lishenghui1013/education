<?php
/**
 * 视频管理
 * User: 李胜辉
 * Date: 2018/10/17
 * Time: 17:32
 */

namespace Admin\Controller;


class VideoController extends BaseController
{
    /**
     * 列表
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
     * ajax获取视频列表
     * @author: 李胜辉
     * @time: 2018/10/17 17:32
     */
    public function ajaxGetIndex()
    {
        $getInfo = I('post.');
        $curr = $getInfo['curr'] ? $getInfo['curr'] : 1;//当前页
        $limit = $getInfo['limit'] ? $getInfo['limit'] : 1;//每页显示条数
        $start = ($curr - 1) * $limit;//开始

        $class = $getInfo['class_id'] ? $getInfo['class_id'] : '';//级别id
        $subject = $getInfo['subject_id'] ? $getInfo['subject_id'] : '';//科目id
        $versions = $getInfo['versions_id'] ? $getInfo['versions_id'] : '';//版本id
        $title = $getInfo['title'] ? $getInfo['title'] : '';//标题
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
            $where['o.title'] = array('like', '%' . $title . '%');
        }

        //查询总条数
        $total = D('api_video as o')->join('left join api_class as c on c.id=o.class_id')->join('left join api_subject as s on s.id=o.subject_id')->join('left join api_versions as v on v.id=o.versions_id')->join('left join api_user as u on u.id=o.pub_userid')->where($where)->count();//查询满足要求的总记录数
        $info = D('api_video as o')->join('left join api_class as c on c.id=o.class_id')->join('left join api_subject as s on s.id=o.subject_id')->join('left join api_versions as v on v.id=o.versions_id')->join('left join api_user as u on u.id=o.pub_userid')->field('o.id,o.title,o.intro,o.versions_id,o.class_id,o.subject_id,o.pub_time,o.show_status,o.read_num,o.collect_num,o.share_num,u.username,v.versions_name,c.class_name,s.subject_name')->where($where)->order('o.id desc')->limit($start, $limit)->select();
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
        $list = D('api_video as o')->join('left join api_class as c on c.id=o.class_id')->join('left join api_subject as s on s.id=o.subject_id')->join('left join api_versions as v on v.id=o.versions_id')->join('left join api_user as u on u.id=o.pub_userid')->field('o.id,o.title,o.cover,o.price,o.intro,o.versions_id,o.class_id,o.subject_id,o.pub_time,o.show_status,o.read_num,o.collect_num,o.share_num,u.username,v.versions_name,c.class_name,s.subject_name')->where(array('o.id' => $id))->find();
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
        $res = D('api_video')->where(array('id' => $id))->save(array('show_status' => 1));
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
        $res = D('api_video')->where(array('id' => $id))->save(array('show_status' => 2));
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
            $res = D('api_video')->add($data);
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
            $listInfo = D('api_video')->where("id='$id'")->find();
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

            $res = D('api_video')->where(array('id' => $postData['id']))->save($postData);
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
            $upload->maxSize = 3145728000000;    // 设置附件上传大小
            $upload->exts = array('jpg', 'gif', 'png', 'jpeg'); // 设置附件上传类型
            $upload->rootPath = THINK_PATH;          // 设置附件上传根目录
            $upload->savePath = '../Public/';    // 设置附件上传（子）目录
            $upload->subName = 'uploads/video/cover';  //子文件夹
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
        $video_id = I('get.video_id');
        $this->assign('video_id', $video_id);
        $this->display();
    }

    /**
     * ajax获取视频目录列表
     * @author: 李胜辉
     * @time: 2018/10/22 08:44
     */
    public function ajaxGetCatalog()
    {
        $getInfo = I('post.');
        $curr = $getInfo['curr'] ? $getInfo['curr'] : 1;//当前页
        $limit = $getInfo['limit'] ? $getInfo['limit'] : 2;//每页显示条数
        $start = ($curr - 1) * $limit;//开始
        $title = $getInfo['title'] ? $getInfo['title'] : '';//查询的审核状态
        $video_id = $getInfo['video_id'];
        $where = array();
        $where['video_id'] = $video_id;
        if ($title != '') {
            $where['c.title'] = array('like', '%' . $title . '%');
        }

        //查询总条数
        $total = D('api_video_content as c')->join('left join api_video as t on t.id=c.video_id')->join('left join api_user as u on u.id=c.pub_userid')->where($where)->count();//查询满足要求的总记录数
        $info = D('api_video_content as c')->join('left join api_video as t on t.id=c.video_id')->join('left join api_user as u on u.id=c.pub_userid')->field('c.id,c.video_id,c.title,c.video_url,c.sort,c.price,c.pub_time,c.show_status,c.read_num,c.collect_num,c.share_num,u.username')->where($where)->order('c.sort')->limit($start, $limit)->select();
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
     * 查看视频目录详情
     * @author: 李胜辉
     * @time: 2018/10/17 17:32
     */
    public function lookCatalog()
    {
        $id = I('get.id');//获取数据
        $list = D('api_video_content as c')->join('left join api_video as t on t.id=c.video_id')->join('left join api_user as u on u.id=c.pub_userid')->field('c.id,c.title,c.video_url,c.sort,c.price,c.pub_time,c.show_status,c.read_num,c.collect_num,c.share_num,u.username')->where(array('c.id' => $id))->find();
        $this->assign('list', $list);
        $this->display();
    }

    /**
     * 视频目录上线
     * @author: 李胜辉
     * @time: 2018/10/19 09:32
     */
    public function openCatalog()
    {
        $id = I('post.id');
        $res = D('api_video_content')->where(array('id' => $id))->save(array('show_status' => 1));
        if ($res === false) {
            $this->ajaxError('操作失败');
        } else {
            $this->ajaxSuccess('添加成功');
        }
    }

    /**
     * 下线视频目录
     * @author: 李胜辉
     * @time: 2018/10/19 09:32
     */
    public function closeCatalog()
    {
        $id = I('post.id');
        $res = D('api_video_content')->where(array('id' => $id))->save(array('show_status' => 2));
        if ($res === false) {
            $this->ajaxError('操作失败');
        } else {
            $this->ajaxSuccess('添加成功');
        }
    }

    /**
     * 添加视频目录
     * @author: 李胜辉
     * @time: 2018/10/17 17:32
     */
    public function addCatalog()
    {
        if (IS_POST) {
            $data = I('post.');
            $data['pub_userid'] = session('uid');
            $data['show_status'] = $data['show_status'] == 'on' ? 1 : 2;
            $data['pub_time'] = time();
            $res = D('api_video_content')->add($data);
            if ($res === false) {
                $this->ajaxError('操作失败', 0);
            } else {
                $this->ajaxSuccess('添加成功');
            }
        } else {
            $video_id = I('get.video_id');
            $this->assign('video_id', $video_id);
            $this->display();
        }

    }

    /**
     * 修改视频目录
     * @author: 李胜辉
     * @time: 2018/10/22 09:22
     */
    public function updateCatalog()
    {

        if (IS_GET) {
            $id = I('get.id');
            $listInfo = D('api_video_content')->where("id='$id'")->find();
            $this->assign('detail', $listInfo);
            $this->display('addCatalog');
        } elseif (IS_POST) {
            $postData = I('post.');
            $postData['show_status'] = $postData['show_status'] == 'on' ? 1 : 2;

            $res = D('api_video_content')->where(array('id' => $postData['id']))->save($postData);
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
    public function uploadc()
    {
        //获取网站根目录地址$url
        $PHP_SELF = $_SERVER['PHP_SELF'] ? $_SERVER['PHP_SELF'] : $_SERVER['SCRIPT_NAME'];
        $str = substr($PHP_SELF, 1);
        $url = 'http://' . $_SERVER['HTTP_HOST'] . '/' . substr($str, 0, strpos($str, '/') + 1);
        if (!empty($_FILES)) {
            $upload = new \Think\Upload();   // 实例化上传类
            $upload->maxSize = 3145728000000;    // 设置附件上传大小
            $upload->exts = array('mp4'); // 设置附件上传类型
            $upload->rootPath = THINK_PATH;          // 设置附件上传根目录
            $upload->savePath = '../Public/';    // 设置附件上传（子）目录
            $upload->subName = 'uploads/video/content';  //子文件夹
            $upload->replace = true;  //同名文件是否覆盖
            // 上传文件
            $images = $upload->upload();
            //return $images;
            //Log::record('$images', Log::DEBUG);die;
            //判断是否有图
            if ($images) {
                $info['url'] = $url . substr($images['file']['savepath'], 3) . $images['file']['savename'];//拼接视频地址
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
     * 批量添加页
     * @author: 李胜辉
     * @time: 2018/10/31 11:32
     */
    public function batchAdd()
    {
        $this->display();

    }

    /**
     * 课本导入excel
     * @author: 李胜辉
     * @time: 2018/10/31 11:32
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
            $upload->subName = 'uploads/video/cover';  //子文件夹
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
                for ($i = 1; $i <= $highestRow; $i++) {
                    $data['title'] = $objPHPExcel->getActiveSheet()->getCell("A" . $i)->getValue();
                    $data['pub_userid'] = session('uid');
                    $data['pub_time'] = time();
                    $data['intro'] = $objPHPExcel->getActiveSheet()->getCell("B" . $i)->getValue();
                    $data['price'] = $objPHPExcel->getActiveSheet()->getCell("C" . $i)->getValue();

                    $data['show_status'] = $objPHPExcel->getActiveSheet()->getCell("D" . $i)->getValue();

                    $data['class_id'] = $objPHPExcel->getActiveSheet()->getCell("E" . $i)->getValue();
                    $class_id = D('api_class')->where(array('class_name' => $data['class_id']))->getField('id');
                    $data['class_id'] = $class_id ? $class_id : 0;
                    $data['subject_id'] = $objPHPExcel->getActiveSheet()->getCell("F" . $i)->getValue();
                    $subject_id = D('api_subject')->where(array('subject_name' => $data['subject_id']))->getField('id');
                    $data['subject_id'] = $subject_id ? $subject_id : 0;
                    $data['versions_id'] = $objPHPExcel->getActiveSheet()->getCell("G" . $i)->getValue();
                    $versions_id = D('api_versions')->where(array('versions_name' => $data['versions_id']))->getField('id');
                    $data['versions_id'] = $versions_id?$versions_id:0;

                    $data['video_type'] = $objPHPExcel->getActiveSheet()->getCell("H" . $i)->getValue();

                }
                $res = D('api_video')->add($data);
                if ($res) {
                    echo 1;//存储成功
                } else {
                    echo 2;//保存失败
                }

            } else {
                echo 4;//上传失败
            }
        } else {
            echo 3;//没有选择文件
        }

    }

    /**
     * 目录批量添加页
     * @author: 李胜辉
     * @time: 2018/10/31 10:32
     */
    public function catalogBatchAdd()
    {
        $video_id = I('get.video_id');
        session('video_id', $video_id);
        $this->display();

    }

    /**
     * 课本导入excel
     * @author: 李胜辉
     * @time: 2018/10/31 10:32
     *
     */
    public function catalogImports()
    {
        header("Content-Type:text/html;charset = utf-8");
        //获取网站根目录地址$url
        $PHP_SELF = $_SERVER['PHP_SELF'] ? $_SERVER['PHP_SELF'] : $_SERVER['SCRIPT_NAME'];
        $str = substr($PHP_SELF, 1);
        $url = 'http://' . $_SERVER['HTTP_HOST'] . '/' . substr($str, 0, strpos($str, '/') + 1);

        if (!empty($_FILES)) {

            $upload = new \Think\Upload();   // 实例化上传类
            $upload->maxSize = 3145728;    // 设置附件上传大小
            $upload->exts = array('mp4', 'ogg', 'webm'); // 设置附件上传类型
            $upload->rootPath = THINK_PATH;          // 设置附件上传根目录
            $upload->savePath = '../Public/';    // 设置附件上传（子）目录
            $upload->subName = 'uploads/video/content';  //子文件夹
            $upload->replace = true;  //同名文件是否覆盖
            // 上传文件
            $info = $upload->upload();

            if ($info) {
                $sql = 'insert into api_video_content(title,video_id,video_url,pub_userid,pub_time) values';
                $str_values = '';
                foreach ($info as $key => $value) {
                    $video_url = $url . substr($value['savepath'], 3) . $value['savename'];//拼接图片地址
                    $title = $_FILES['excel_file']['name'][$key];
                    $title = substr($title, 0, strrpos($title, '.'));
                    $video_id = session('video_id');
                    $pub_userid = session('uid');
                    $pub_time = time();
                    $str_values .= '("' . $title . '","' . $video_id . '","' . $video_url . '","' . $pub_userid . '","' . $pub_time . '"),';
                }
                unset($key, $value);
                $str_values = substr($str_values, 0, -1);
                $sql = $sql . $str_values;
                $table = M('api_video_content');
                $res = $table->execute($sql);
                if ($res) {
                    session('video_id', null);
                    echo 1;//保存成功
                } else {
                    echo 2;//保存失败
                }
            } else {
                echo 4;//上传失败
            }
        } else {
            echo 3;//没有选择上传文件
        }

    }


}