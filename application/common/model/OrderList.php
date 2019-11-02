<?php
/**
 * Created by PhpStorm.
 * User: vevay
 * Time: 2019/7/5 10:01
 */

namespace app\common\model;


use think\Model;

class OrderList extends Model
{
    //时间自动写入
    protected $autoWriteTimestamp = true;
    //更改添加时间字段
    protected $createTime = 'add_time';



}