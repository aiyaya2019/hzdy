<?php
/**
 * Created by PhpStorm.
 * User: vevay
 * Time: 2019/7/5 10:20
 */

namespace app\common\model;


use think\Model;

class Logistics extends Model
{
    protected $append = ['status_name'];
    //时间自动写入
    protected $autoWriteTimestamp = true;
    //更改添加时间字段
    protected $createTime = 'add_time';

    public function getAddTimeAttr($val){
        return date('Y-m-d H:i:s',$val);
    }

    public function getStatusNameAttr($val,$data){
        return $data['status']=1?'显示':'隐藏';
    }
}