<?php
/**
 * Created by PhpStorm.
 * User: vevay
 * Time: 2019/7/5 10:00
 */
namespace app\common\model;
use think\Model;
class Order extends Model
{
    protected $append = ['status_name'];
    //时间自动写入
    protected $autoWriteTimestamp = true;
    //更改添加时间字段
    protected $createTime = 'add_time';
    // 订单状态
    public function getStatusNameAttr($val,$data)
    {
        // 状态 1待付款 2待发货 3待收货 4已完成 5申请售后  6已取消
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
                return '已取消';
                break;
            case 7:
                return '已退款';
                break;
        }
    }
    // 下单时间处理
    public function getAddTimeAttr($val){
        return date('Y-m-d H:i:s',$val);
    }
    // 支付时间处理
    public function getPayAtAttr($val){
        return empty($val)?'待支付':date('Y-m-d H:i:s',$val);
    }
    /**
     * 下单用户
     * @author vevay
     * @time: 2019/7/5 10:03
     */
    public function user(){
        return $this->hasOne('User','id','uid')->field('id,nickname,head_img,sex');
    }
    /**
     * 订单商品
     * @author vevay
     * @time: 2019/7/5 18:26
     */
    public function goods(){
        return $this->hasMany('OrderList','order_id','id');
    }
}