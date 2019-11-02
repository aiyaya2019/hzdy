<?php
namespace app\common\model;
use \think\Model;

Class GroupGoods extends Model
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
	
	public function getLabelIdAttr($val)
	{
		if(!empty($val)){
			return explode(',',$val);
		}
	}

	public function getDescAttr($val)
	{	
		if(!empty($val)){
			return preg_replace('/src="(.*?)"/','src="'.$_SERVER["REQUEST_SCHEME"].'://'.$_SERVER['SERVER_NAME'].'$1" style="width:100%;"',$val);
		}
	}

	public function getParameterAttr($val)
	{	
		if(!empty($val)){
			return preg_replace('/src="(.*?)"/','src="'.$_SERVER["REQUEST_SCHEME"].'://'.$_SERVER['SERVER_NAME'].'$1" style="width:100%;"',$val);
		}
	}
	
}