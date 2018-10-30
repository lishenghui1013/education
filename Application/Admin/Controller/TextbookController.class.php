<?php
/**
 * 课本管理
 * User: 李胜辉
 * Date: 2018/10/17
 * Time: 17:32
 */

namespace Admin\Controller;

use PHPExcel_IOFactory;
use PHPExcel;
use Behavior;

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
     * 导入数据
     * @author: 李胜辉
     * @time: 2018/10/30 17:32
     * @param $filename
     * @param string $exts
     * @param $or
     *
     */
    /*public function dataImport($filename, $exts = 'xls', $or)
    {


        //导入PHPExcel类库，因为PHPExcel没有用命名空间，只能inport导入
        vendor('PHPExcel.PHPExcel');
        //创建PHPExcel对象，注意，不能少了\
        $PHPExcel = new \PHPExcel();
        //如果excel文件后缀名为.xls，导入这个类
        if ($exts == 'xls') {
            Vendor('PHPExcel.PHPExcel.Reader.Excel5');
            $PHPReader = new \PHPExcel_Reader_Excel5();
        } else if ($exts == 'xlsx') {
            Vendor('PHPExcel.PHPExcel.Reader.Excel2007');
            $PHPReader = new \PHPExcel_Reader_Excel2007();
        }


        //载入文件
        $PHPExcel = $PHPReader->load($filename);
        //获取表中的第一个工作表，如果要获取第二个，把0改为1，依次类推
        $currentSheet = $PHPExcel->getSheet(0);
        //获取总列数
        $allColumn = $currentSheet->getHighestColumn();
        //获取总行数
        $allRow = $currentSheet->getHighestRow();
            //循环获取表中的数据，$currentRow表示当前行，从哪行开始读取数据，索引值从0开始
        for ($currentRow = 2; $currentRow <= $allRow; $currentRow++) {
            //从哪列开始，A表示第一列
            for ($currentColumn = 'A'; $currentColumn <= $allColumn; $currentColumn++) {
                //数据坐标
                $address = $currentColumn . $currentRow;
                //读取到的数据，保存到数组$data中
                $cell = $currentSheet->getCell($address)->getValue();

                if ($cell instanceof PHPExcel_RichText) {
                    $cell = $cell->__toString();
                }
                $data[$currentRow - 1][$currentColumn] = $cell;
            //  print_r($cell);
            }

        }
        // 写入数据库操作
        $this->insertData($data);

    }


    /**
     * 写入数据库操作
     * @author: 李胜辉
     * @time: 2018/10/30 17:32
     * @param $data
     *
     */
    /* public function insertData($data)
     {
         $created_time = date('Y-m-d H:i:s');
         $apinfo = A('apinfo');
         foreach ($data as $k => $v) {

             if ($k != 0) {
                 print_r($v);exit;
                 //shop信息
                 $info['shop_name'] = $v['C'];
                 $info['address'] = $v['D'];
                 $info['contact_name'] = $v['I'];
                 $info['contact_phone'] = $v['J'];
                 $info['lng'] = $v['G'];
                 $info['lat'] = $v['H'];

                 $info['shop_code'] = time() . $k;
                 $type_explain = $v['K'];
                 $where['type_explain'] = array('like', "%$type_explain%");

                 $info['type_code'] = 5;

                 $info['wa_area'] = $v['L'];

                 $id = M('shop')->add($info);//shop_id
                 $info['insert_time'] = date('Y-m-d H:i:s');

                 //开始添加device信息


                 $infos['dev_no'] = $info['shop_code'];
                 $infos['dev_code'] = $v['B'];
                 $infos['dev_mac'] = strtolower(str_replace('-', '', $v['B']));
                 $infos['device_name'] = $v['C'];
                 $infos['device_ip'] = $v['F'];
                 $infos['location_id'] = '3397';
                 $infos['area_code'] = $v['L'];
                 $infos['address'] = $v['D'];
                 $infos['device_address'] = $v['D'];

                 $infos['agent_id'] = 1;
                 $infos['customer_id'] = 1;
                 $infos['shop_id'] = $id;
                 $infos['lng'] = $v['G'];
                 $infos['lat'] = $v['H'];
                 $infos['pss'] = $v['M'];
                 $infos['site_code'] = $apinfo->setWanganCode($v['L'], 3, $info['type_code'], $id);

                 $result = M('device')->add($infos);
                 $apinfo->insertdevice($info, $infos, $id);
                 $apinfo->apinfo_defaultoption($infos['dev_mac']);
             }

         }

         $this->success('添加成功', U('index'), 1);

     }*/


    /**
     * 导入excel
     * @author: 李胜辉
     * @time: 2018/10/30 17:32
     *
     */
    public function imports()
    {
        header("Content-Type:text/html;charset = utf-8");
        /* //获取网站根目录地址$url
         $PHP_SELF = $_SERVER['PHP_SELF'] ? $_SERVER['PHP_SELF'] : $_SERVER['SCRIPT_NAME'];
         $str = substr($PHP_SELF, 1);
         $url = 'http://' . $_SERVER['HTTP_HOST'] . '/' . substr($str, 0, strpos($str, '/') + 1);*/
        if (!empty($_FILES)) {

            $upload = new \Think\Upload();   // 实例化上传类
            $upload->maxSize = 3145728;    // 设置附件上传大小
            $upload->exts = array('xls', 'xlsx'); // 设置附件上传类型
            $upload->rootPath = THINK_PATH;          // 设置附件上传根目录
            $upload->savePath = '../Public/';    // 设置附件上传（子）目录
            $upload->subName = 'uploads/articlePublish/textbook';  //子文件夹
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
                for ($i = 2; $i <= $highestRow; $i++) {
                    $data['title'] = $objPHPExcel->getActiveSheet()->getCell("A" . $i)->getValue();
                    $data['cover'] = $objPHPExcel->getActiveSheet()->getCell("B" . $i)->getValue();
                    echo json_encode($data['cover']);
                    exit;
                    $data['pub_userid'] = session('uid');
                    $data['pub_time'] = time();
                    $data['intro'] = $objPHPExcel->getActiveSheet()->getCell("C" . $i)->getValue();
                    $data['price'] = $objPHPExcel->getActiveSheet()->getCell("D" . $i)->getValue();
                    $data['show_status'] = $objPHPExcel->getActiveSheet()->getCell("E" . $i)->getValue();
                    $data['copyright'] = $objPHPExcel->getActiveSheet()->getCell("F" . $i)->getValue();
                    $data['class_id'] = $objPHPExcel->getActiveSheet()->getCell("G" . $i)->getValue();
                    $class_id = D('api_class')->where(array('class_name' => $data['class_id']))->getField('id');
                    $data['class_id'] = $class_id;
                    $data['subject_id'] = $objPHPExcel->getActiveSheet()->getCell("H" . $i)->getValue();
                    $subject_id = D('api_subject')->where(array('subject_name' => $data['subject_id']))->getField('id');
                    $data['subject_id'] = $subject_id;
                    $data['versions_id'] = $objPHPExcel->getActiveSheet()->getCell("I" . $i)->getValue();
                    $versions_id = D('api_versions')->where(array('versions_name' => $data['versions_id']))->getField('id');
                    $data['versions_id'] = $versions_id;
                }
                $res = D('api_textbook')->add($data);
                if ($res) {
                    $this->success('导入成功!');
                } else {
                    $this->error('导入失败!');
                }

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
     * @time: 2018/10/30 17:32
     */
    public function batchAdd()
    {
        if (IS_POST) {

        } else {
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
            $upload->subName = 'uploads/articlePublish/textbook';  //子文件夹
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
        $textbook_id = I('get.textbook_id');
        $this->assign('textbook_id', $textbook_id);
        $this->display();
    }

    /**
     * ajax获取目录列表
     * @author: 李胜辉
     * @time: 2018/10/30 08:44
     */
    public function ajaxGetCatalog()
    {
        $getInfo = I('post.');
        $curr = $getInfo['curr'] ? $getInfo['curr'] : 1;//当前页
        $limit = $getInfo['limit'] ? $getInfo['limit'] : 2;//每页显示条数
        $start = ($curr - 1) * $limit;//开始
        $title = $getInfo['title'] ? $getInfo['title'] : '';//查询的审核状态
        $textbook_id = $getInfo['textbook_id'];
        $where = array();
        $where['textbook_id'] = $textbook_id;
        if ($title != '') {
            $where['c.title'] = array('like', '%' . $title . '%');
        }

        //查询总条数
        $total = D('api_textbook_content as c')->join('left join api_textbook as t on t.id=c.textbook_id')->join('left join api_user as u on u.id=c.pub_userid')->where($where)->count();//查询满足要求的总记录数
        $info = D('api_textbook_content as c')->join('left join api_textbook as t on t.id=c.textbook_id')->join('left join api_user as u on u.id=c.pub_userid')->field('c.id,c.textbook_id,c.title,c.content,c.sort,c.price,c.pub_time,c.show_status,c.read_num,c.collect_num,c.share_num,u.username')->where($where)->order('c.sort asc')->limit($start, $limit)->select();
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
     * 查看目录
     * @author: 李胜辉
     * @time: 2018/10/17 17:32
     */
    public function lookCatalog()
    {
        $id = I('get.id');//获取数据
        $list = D('api_textbook_content as c')->join('left join api_textbook as t on t.id=c.textbook_id')->join('left join api_user as u on u.id=c.pub_userid')->field('c.id,c.title,c.content,c.sort,c.price,c.pub_time,c.show_status,c.read_num,c.collect_num,c.share_num,u.username')->where(array('c.id' => $id))->find();
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
            $data['show_status'] = $data['show_status'] == 'on' ? 1 : 2;
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