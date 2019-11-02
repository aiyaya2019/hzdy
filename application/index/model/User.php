<?php
namespace app\index\model;
use \think\Model;
use app\admin\model\UserGrade;

Class User extends Model
{	
    protected $append = ['sex_name'];
	//时间自动写入
	protected $autoWriteTimestamp = true;
	//更改添加时间字段
	protected $createTime = 'add_time';

    public function getNicknameAttr($val)
    {
        return urldecode($val);
    }

    public function getSexNameAttr($val,$data)
    {
        switch ($data['sex']) {
            case 1:
                return '男';
                break;
            case 1:
                return '女';
                break;
            default:
                return '保密';
                break;
        }
    }

    public function getLoginTimeAttr($val)
    {
        if(!empty($val)){
            return date('Y-m-d H:i',$val);
        }
    }

    //获取用户会员等级
    public function getGradeNameAttr($val,$data){
        if(!empty($data['grade'])){
            if($data['grade'] != 0){
                $geade = UserGrade::where('id = '.$data['grade'])->value('title');
            } else {
                $geade = '普通会员';
            }
            return $geade;
        }
    }
}