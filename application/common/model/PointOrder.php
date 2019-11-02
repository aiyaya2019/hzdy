<?php
namespace app\common\model;
use \think\Model;

Class PointOrder extends Model
{
    protected $append = ['status_name'];
    //时间自动写入
    protected $autoWriteTimestamp = true;
    //更改添加时间字段
    protected $createTime = 'add_time';

    // 订单状态
    public function getStatusNameAttr($val,$data)
    {
        // 状态 1待付款 2待发货 3待收货 4已完成 5申请售后
        switch ($data['status']) {
            case 1:
                return '待发货';
                break;
            case 2:
                return '已发货';
                break;
            case 3:
                return '已取消';
                break;
        }
    }
}