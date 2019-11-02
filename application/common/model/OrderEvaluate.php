<?php
/**
 * Created by PhpStorm.
 * User: vevay
 * Time: 2019/7/5 20:00
 */

namespace app\common\model;


use think\Model;

class OrderEvaluate extends Model
{
    protected $append = ['status_name'];

    //时间自动写入
    protected $autoWriteTimestamp = true;
    //更改添加时间字段
    protected $createTime = 'add_time';

    // 订单状态
    public function getStatusNameAttr($val,$data)
    {
        return $data['status'] == 1?"显示":"隐藏";
    }

    public function getAddTimeAttr($val){
        return date('Y-m-d H:i:s',$val);
    }

    public function order(){
        return $this->hasOne('Order','id','order_id')->field('id,order_no,status');
    }

    public function user(){
        return $this->hasOne('User','id','uid')->field('id,nickname,head_img,sex');
    }
}