<?php
/**
 * Created by PhpStorm.
 * User: vevay
 * Time: 2019/7/1 16:33
 */
namespace app\common\model;
use think\Model;
class GroupOrder extends Model
{
    protected $append = ['status_name','group_status_name'];

    // 订单状态
    public function getStatusNameAttr($val,$data)
    {
        // 状态 1待付款 2待发货 3待收货 4已完成 5申请售后 6已取消
        switch ($data['status']) {
            case 1:
                return '待支付';
                break;
            case 2:
                return '待发货';
                break;
            case 3:
                return '待收货';
                break;
            case 4:
                return '已完成';
                break;
            case 5:
                return '售后申请';
                break;
            case 6:
                return '售后成功';
                break;
            case 7:

                return '售后失败';

                break;
            case 8:

                return '已取消';

                break;
        }
    }

    // 拼团状态
    public function getGroupStatusNameAttr($val,$data)
    {
        // 拼团状态 1拼团中 2拼团成功 3拼团失败
        switch ($data['group_status']) {
            case 1:
                return '拼团中';
                break;
            case 2:
                return '拼团成功';
                break;
            case 3:
                return '拼团失败';
                break;
        }
    }

    // 拼团结束时间处理
    public function getEndTimeAttr($val){
        return date('Y-m-d H:i:s',$val);
    }

    // 下单时间处理
    public function getAddTimeAttr($val){
        return date('Y-m-d H:i:s',$val);
    }

    // 支付时间处理
    public function getPayAtAttr($val){
        return date('Y-m-d H:i:s',$val);
    }

    // 退款状态处理
    public function getRefundStateAttr($val){
        switch ($val) {
            case 1:
                return '申请中';
                break;
            case 2:
                return '退款成功';
                break;
            case 3:
                return '拒绝退款';
                break;
            default:
                return '未申请';
                break;
        }
    }

    // 退款时间处理
    public function getRefundAtAttr($val){
        return date('Y-m-d H:i:s',$val);
    }
    
    // 取消时间处理
    public function getCancelAtAttr($val){
        return date('Y-m-d H:i:s',$val);
    }

    //发货时间
    public function getLogisticsTimeAttr($val)
    {
        if(!empty($val)){
            return date('Y-m-d H:i',$val);
        }
    }

    //收货时间
    public function getReceiptTimeAttr($val)
    {
        if(!empty($val)){
            return date('Y-m-d H:i',$val);
        }
    }
}