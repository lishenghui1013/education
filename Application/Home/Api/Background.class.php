<?php

/**
 * 背景相关操作
 * @since   2018/11/19 创建
 * @author  李胜辉
 */

namespace Home\Api;

use Admin\Model\ApiAppModel;
use Home\ORG\ApiLog;
use Home\ORG\Crypt;
use Home\ORG\Response;
use Home\ORG\ReturnCode;

class Background extends Base
{


    /**
     * 背景音乐调取
     * @author: 李胜辉
     * @time: 2018/11/19  10:34
     *
     */
    public function backgroundMusic()
    {
        $listInfo = D('api_bg_music')->field('id,music_name,music_url')->order('id desc')->select();
        if (empty($listInfo)) {
            Response::error(-1,'暂无数据');
        }else{
            Response::success($listInfo);
        }
    }


}