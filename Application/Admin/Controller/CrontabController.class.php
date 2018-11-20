<?php
/**
 * 定时任务
 * User: 李胜辉
 * Date: 2018/11/20
 * Time: 17:32
 */
namespace Admin\Controller;


class CrontabController extends BaseController {


    /**
     * 定时扣除没有签到的会员豆币
     * @author: 李胜辉
     * @time: 2018/10/23 09:32
     */
    public function open()
    {
        ignore_user_abort();//关掉浏览器，PHP脚本也可以继续执行.
        set_time_limit(0);
        $date = strtotime(date('Y-m-d',time()));
        $time = 60*24*60;
        $control = include 'stop.php';
        $i = 1;

        while ($control) {

            $control = include 'stop.php';
            $conn = new mysqli("localhost", "root", "root", "education");
            $sql = 'update api_users set balance=(balance+1) where id=1';
            sleep($time);
            $conn->query($sql);
        }
        do{
            $timing = M('one_timing')->where(array('id'=>1))->find();//通过后台控制数据库的数据 来控制此循环
            ignore_user_abort();//关掉浏览器，PHP脚本也可以继续执行.
            set_time_limit(0);// 通过set_time_limit(0)可以让程序无限制的执行下去
            $interval=60*60*24;// 每隔24小时运行
            //todo
            echo time()."<br>";
            sleep($interval);
        }
        while($timing['timing'] == 1);//当为true时  无限循环
    }


}