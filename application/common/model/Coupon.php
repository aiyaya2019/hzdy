<?php
namespace app\common\model;
use \think\Model;

Class Coupon extends Model
{	
    protected $append = [];
	//时间自动写入
	protected $autoWriteTimestamp = true;
	//更改添加时间字段
	protected $createTime = 'add_time';

	public function getStartTimeAttr($val)
	{
		if(!empty($val)){
			return date('Y-m-d H:i',$val);
		}
	}

	public function getEndTimeAttr($val)
	{
		if(!empty($val)){
			return date('Y-m-d H:i',$val);
		}
	}
}