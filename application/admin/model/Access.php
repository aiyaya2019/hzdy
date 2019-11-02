<?php
namespace app\admin\model;
use \think\Model;

class Access extends Model
{	
	protected $autoWriteTimestamp = true; //开启时间字段自动写入
	protected $createTime = false; //关闭创建时间字段的自动写入
}

?>