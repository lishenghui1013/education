<?php

/**
 * 链接页
 * @since   2018/12/21 创建
 * @author  李胜辉
 */

namespace Home\Api;

use Admin\Model\ApiAppModel;
use Home\ORG\ApiLog;
use Home\ORG\Crypt;
use Home\ORG\Response;
use Home\ORG\ReturnCode;
use Home\Api\Common;

class Platform extends Base
{
    /**
     * 平台固定连接
     * @author: 李胜辉
     * @time: 2018/12/21 14:34
     *
     */
    public function getLink($param)
    {
        $type = $param['type'];//类型(P:平台;G:商品)
        $link = '';
        if($type=='P'){
            $link = 'http://localhost/education/Link/index.html';
        }
        if($type=='G'){
            $link = 'http://localhost/education/Link/index.html';
        }
        if ($link) {
            Response::success(array('link'=>$link));
        } else {
            Response::error(-1,'暂无数据');
        }
    }

}