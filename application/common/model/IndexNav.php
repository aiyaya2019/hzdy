<?php
/**
 * Created by PhpStorm.
 * User: vevay
 * Time: 2019/7/15 17:57
 */

namespace app\common\model;


use think\Model;

class IndexNav extends Model
{
    protected $append = ['status_name'];
    //时间自动写入
    protected $autoWriteTimestamp = true;
    //更改添加时间字段
    protected $createTime = 'add_time';

    // 状态
    public function getStatusNameAttr($val,$data)
    {
        // 状态 1待付款 2待发货 3待收货 4已完成 5申请售后  6已取消
        switch ($data['status']) {
            case 1:
                return '显示';
                break;
            case 2:
                return '隐藏';
                break;
        }
    }

    // 时间处理
    public function getAddTimeAttr($val){
        return date('Y-m-d H:i:s',$val);
    }
}