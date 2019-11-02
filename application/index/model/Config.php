<?php
namespace app\index\model;
use \think\Model;

Class Config extends Model
{	
    protected $append = ['sex_name'];
	//时间自动写入
	protected $autoWriteTimestamp = true;
	//更改添加时间字段
	protected $createTime = 'add_time';
}