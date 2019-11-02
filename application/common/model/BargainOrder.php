<?php
namespace app\common\model;
use \think\Model;
Class BargainOrder extends Model
{	
    protected $append = ['status_name','bargain_status_name'];
	//时间自动写入
	protected $autoWriteTimestamp = true;
	//更改添加时间字段
	protected $createTime = 'add_time';

	//计算剩余砍价时长
	public function getEndTimeAttr($val)
	{
		return date('Y-m-d H:i',$val);
	}
    // 订单状态
    public function getStatusNameAttr($val,$data)
    {
        // 状态 1待付款 2待发货 3待收货 4已完成 5申请售后
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
                return '取消订单';
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
    // 砍价状态处理
    public function getBargainStatusNameAttr($val,$data){
        switch ($data['bargain_status']) {
            case 1:
                return '砍价中';
                break;
            case 2:
                return '砍价成功';
                break;
            case 3:
                return '砍价失败';
                break;
            case 4:
                return '终止砍价';
                break;
        }
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