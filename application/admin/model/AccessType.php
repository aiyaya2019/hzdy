<?php
namespace app\admin\model;
use \think\Model;

class AccessType extends Model
{	
	protected $autoWriteTimestamp = true; //开启时间字段自动写入
	protected $createTime = false; //关闭创建时间字段的自动写入

	//关联控制器方法
	public function node()
	{
		return $this->hasMany('Access','pid','id')->order('sort desc');
	}
}

?>