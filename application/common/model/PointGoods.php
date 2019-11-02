<?php
namespace app\common\model;
use \think\Model;

Class PointGoods extends Model
{
    protected $append = [];
    //时间自动写入
    protected $autoWriteTimestamp = true;
    //更改添加时间字段
    protected $createTime = 'add_time';

    //分割相册
    public function getImagesAttr($val)
    {
        if(!empty($val)){
            return explode(',',$val);
        }
    }
}