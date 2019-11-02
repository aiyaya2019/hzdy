<?php
namespace app\common\model;
use \think\Model;

Class SpikeTime extends Model
{	
    protected $append = ['status'];
	//时间自动写入
	protected $autoWriteTimestamp = true;
	//更改添加时间字段
	protected $createTime = 'add_time';

    public function getStartTimeAttr($val)
    {
    	return date('Y-m-d H:i:s',$val);
    }

    public function getEndTimeAttr($val)
    {
    	return date('Y-m-d H:i:s',$val);
    }

    public function getStatusAttr($val,$data)
    {
        if(!empty($data['start_time']) && !empty($data['end_time'])){
            if($data['start_time'] > time())
            {
                return ['status'=>1,'status_name'=>'未开始'];

            } else if($data['start_time'] < time() && $data['end_time'] > time())
            {
                return ['status'=>2,'status_name'=>'秒杀中','end_time'=>$data['end_time']];

            } else if($data['end_time'] < time())
            {
                return ['status'=>3,'status_name'=>'已结束'];
            }
        }
    }
}