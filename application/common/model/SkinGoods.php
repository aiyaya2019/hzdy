<?php
namespace app\common\model;
use \think\Model;

Class SkinGoods extends Model
{	
    protected $append = [];
	//时间自动写入
	protected $autoWriteTimestamp = true;
	//更改添加时间字段
	protected $createTime = 'add_time';

    public function goods()
    {
    	return $this->hasOne('goods','id','goods_id')->field('id,title,pic');
    }

    public function oldGoods()
    {
    	return $this->hasOne('goods','id','old_goods_id')->field('id,title,pic');
    }
}