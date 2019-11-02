<?php
namespace app\common\model;
use \think\Model;

Class Collect extends Model
{
    protected $append = [];
    //时间自动写入
    protected $autoWriteTimestamp = true;
    //更改添加时间字段
    protected $createTime = 'add_time';

    //关联商品
    public function goods()
    {
        return $this->hasOne('Goods','id','goods_id')->field('id,title,pic,price');
    }
}