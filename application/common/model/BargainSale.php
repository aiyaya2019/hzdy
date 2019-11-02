<?php
namespace app\common\model;
use \think\Model;

Class BargainSale extends Model
{	
    protected $append = ['status_name','type_name'];
	//时间自动写入
	protected $autoWriteTimestamp = true;
	//更改添加时间字段
	protected $createTime = 'add_time';

	public function getPicAttr($val)
	{
		if(!empty($val)){
			return explode(',',$val);
		}
	}

    // 订单状态
    public function getStatusNameAttr($val,$data)
    {
        // 0未处理  1成功 2拒绝
        switch ($data['status']) {
            case 1:
                return '同意退款';
                break;
            case 2:
                return '拒绝退款';
                break;
            default:
                return '待处理';
                break;
        }
    }

    public function getTypeNameAttr($val,$data)
    {
        if ($data['type'] == 1){
            return '仅退款';
        }else{
            return '退货退款';
        }
    }



    // 退款订单信息
    public function order(){
        return $this->hasOne('BargainOrder','id','order_id')->field('*');
    }
}