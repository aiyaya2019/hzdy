<?php
namespace app\common\model;
use \think\Model;

Class LimitGoods extends Model
{
    protected $append = [];
    //时间自动写入
    protected $autoWriteTimestamp = true;
    //更改添加时间字段
    protected $createTime = 'add_time';

    public function time()
    {
        return $this->hasOne('limit_time','id','time_id')->field('id,start_time,end_time');
    }

    public function getLabelIdAttr($val)
    {
        if(!empty($val)){
            return explode(',',$val);
        } else {
            return [];
        }
    }

    //分割相册
    public function getImagesAttr($val)
    {
        if(!empty($val)){
            return explode(',',$val);
        }
    }


}