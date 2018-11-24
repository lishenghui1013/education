<?php
/**
 * 词组管理
 * User: 李胜辉
 * Date: 2018/10/17
 * Time: 17:32
 */

namespace Admin\Controller;

use Think\log;

class WordsController extends BaseController
{
    /**
     * 列表页
     * @author: 李胜辉
     * @time: 2018/10/17 17:32
     */
    public function index()
    {
        $id = I('get.id');
        $this->assign('id',$id);
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

        $content = $getInfo['content'] ? $getInfo['content'] : '';//内容关键字
        $where = array();
        $where['w.item_id'] = $getInfo['item_id'] ? $getInfo['item_id'] : '';

        $where['w.item_type'] = $getInfo['item_type'] ? $getInfo['item_type'] : 'OTHER';
        if ($content != '') {
            $where['w.content'] = array('like','%' . $content . '%');
        }

        //查询总条数
        $total = D('api_words_team as w')->join('left join api_article_publish as a on a.id=w.item_id')->join('left join api_user as u on u.id=w.add_id')->where($where)->count();//查询满足要求的总记录数
        $info = D('api_words_team as w')->join('left join api_article_publish as a on a.id=w.item_id')->join('left join api_user as u on u.id=w.add_id')->field('w.id,w.item_type,w.item_id,w.content,w.add_time,u.username,a.title')->where($where)->order('w.id desc')->limit($start, $limit)->select();
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
                'status'=>'success',
                'total' => $total,
                'data' => $info
            );
        }else{
            $data = array(
                'limit'=>$limit,
                'curr'=>$curr,
                'status'=>'fail',
                'total' => $total,
                'data' => $info
            );
        }

        $this->ajaxReturn($data, 'json');
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
            $data['add_id'] = session('uid');
            $data['item_id'] = $data['item_id']?$data['item_id']:'';
            $data['item_type'] = $data['item_type']?$data['item_type']:'OTHER';
            $data['content'] = $data['content']?trim($data['content']):'';
            $data['add_time'] = time();
            $res = D('api_words_team')->add($data);
            if ($res === false) {
                $this->ajaxError('操作失败', 0);
            } else {
                $this->ajaxSuccess('添加成功');
            }
        } else {
            $data = I('get.');
            $id = $data['id'];
            $detail = D('api_article_publish')->where(array('id'=>$id))->find();
            $this->assign('detail',$detail);
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
            $listInfo = D('api_words_team')->where("id='$id'")->find();
            $this->assign('detail', $listInfo);
            $this->display();
        } elseif (IS_POST) {
            $postData = I('post.');
            $id =$postData['item_id'];
            $data['content'] = $postData['content'];
            $res = D('api_words_team')->where(array('id' => $id))->save($data);
            if ($res === false) {
                $this->ajaxError('操作失败');
            } else {
                $this->ajaxSuccess('编辑成功');
            }
        }
    }


    /**
     * 批量添加页
     * @author: 李胜辉
     * @time: 2018/11/16 17:32
     */
    public function batchAdd()
    {
        $item_id = I('get.item_id');
        session('item_id',$item_id);
        $this->display();

    }
    /**
     * 词组导入excel
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
            $upload->subName = 'uploads/words';  //子文件夹
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
                    $data['content'] = $objPHPExcel->getActiveSheet()->getCell("A" . $i)->getValue();
                    $data['item_type'] = $objPHPExcel->getActiveSheet()->getCell("B" . $i)->getValue();
                    $data['add_id'] = session('uid');
                    $data['add_time'] = time();
                    $data['item_id'] = session('item_id');
                    $datas[] = $data;
                }
                $res = D('api_words_team')->addAll($datas);
                if ($res) {
                    session('item_id',null);
                    unlink($file_name);
                    echo 1;//成功
                } else {
                    session('item_id',null);
                    echo 2;//失败
                }

            } else {
                session('item_id',null);
                $a = $upload->getError();//获取失败信息
                echo json_encode($a);
            }
        } else {
            session('item_id',null);
            echo json_encode(3);
        }
    }

    /**
     * 删除
     * @author: 李胜辉
     * @time: 2018/11/23 17:32
     */
    public function delete()
    {
            $id = I('post.id');
            $del = D('api_words_team')->where("id='$id'")->delete();
            if ($del === false) {
                $this->ajaxError('操作失败');
            } else {
                $this->ajaxSuccess('编辑成功');
            }

    }
}