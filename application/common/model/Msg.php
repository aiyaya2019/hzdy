<?php

namespace app\common\model;

use \think\Model;

use \app\common\model\Car;


Class Msg extends Model{	

	//时间自动写入

	protected $autoWriteTimestamp = true;

	//更改添加时间字段

	protected $createTime = 'add_time';




}