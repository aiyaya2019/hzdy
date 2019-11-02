<?php
namespace app\common\model;
use \think\Model;
use \app\common\model\GoodsVal;
use \app\common\model\GoodsType;

Class Goods extends Model
{	
    protected $append = ['money_range','type_name'];
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

	//查询商品价格区间
	public function getMoneyRangeAttr($val,$data)
	{	
		$info['min'] = GoodsVal::where(['goods_id'=>$data['id']])->order('price asc,add_time asc')->value('price');
		$info['old_min'] = GoodsVal::where(['goods_id'=>$data['id']])->order('price asc,add_time asc')->value('old_price');
		$info['max'] = GoodsVal::where(['goods_id'=>$data['id']])->order('price desc,add_time desc')->value('price');

		return $info;
	}

	//商品分类信息
	public function getTypeNameAttr($val,$data)
	{
		if(!empty($data['type_id'])){
			$p_type = GoodsType::get($data['type_id']);

			$type = GoodsType::get($p_type['pid']);

			return $type['title'].' &rarr; '.$p_type['title'];
		}	
	}

	public function getLabelIdAttr($val)
	{
		if(!empty($val)){
			return explode(',',$val);
		} else {
			return [];
		}
	}
  
    public function getNavIdAttr($val)
    {
        if(!empty($val)){
            return explode(',',$val);
        } else {
            return [];
        }
    }




}