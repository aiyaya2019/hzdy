<?php
namespace app\common\model;
use \think\Model;

Class GoodsAttr extends Model
{	
    protected $append = [];
	//时间自动写入
	protected $autoWriteTimestamp = true;
	//更改添加时间字段
	protected $createTime = 'add_time';

	public function spec()
	{
		return $this->hasMany('GoodsSpec','goods_attr_id','id')->field('id,title,ap_id,goods_attr_id');
	}
}