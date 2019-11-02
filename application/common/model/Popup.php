<?php

/**

 * Created by PhpStorm.

 * User: vevay

 * Time: 2019/7/1 9:43

 */



namespace app\common\model;

use think\Model;



/**

 * 弹窗管理

 * Class Popup

 * @package app\common\model

 */

class Popup extends Model

{

    //时间自动写入

    protected $autoWriteTimestamp = true;

    //更改添加时间字段

    protected $createTime = 'add_time';



}