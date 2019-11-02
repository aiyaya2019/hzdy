<?php
namespace app\api\controller;
use \think\Controller;
use app\common\model\User;
use app\common\model\Config;
use app\common\model\Coupon;

class Common extends Controller
{	
	
    public function _initialize()
    {   
         //获取方法名称
        $action = strtolower(request()->action());
        $token = input('token');
        //$token = '3f1f1b52c172ddb7f1f79b76a2b7571d';
        if(empty($token) && $action != 'getopenid' && $action != 'update_user'){
            return_ajax(400,'缺少接口权限token');
        }
        $user = User::where(['token'=>$token])->find();
        if(empty($user)){ return_ajax(400,'token 错误！'); }
        if($user['status'] == 2){ return_ajax(400,'您的账号已被冻结，请联系客服'); }
        User::where('id',$user['id'])->setField('login_time',time());
        $this->uid = $user['id'];
    }

    /**
     * 弹出优惠券
     */
    public function getCoupon(){
        if(request()->isPost()){
            $post = input('post.');

            $user = User::where('id', $this->uid)->find();

            $time = time();

            $where = 'start_time <= ' .$time .' and end_time >=' .$time .' and type = 1 or uid = ' .$this->uid .' or grade_id = ' .$user['grade_id'];

            $list = Coupon::where($where)->order('id desc')->limit('1')->find();

            if ($list){
                return_ajax(200,'获取成功',$list);
            }else{
                return_ajax(400,'暂无优惠券');
            }
        }
    }

	/**
     * [selectAll 公共查询方法]
     * @Author   PengJun
     * @DateTime 2019-03-22
     * @return   [type]     [description]
     */
    public function selectAll($model,$data=[])
    {
        $table = model($model);
        $where = [];
        $order = 'add_time desc';
        $field = '*';

        $page = empty($data['page'])?1:$data['page'];
        $count = empty($data['count'])?20:$data['count'];
        $with = empty($data['with'])?[]:$data['with'];
        $ispage = empty($data['ispage'])?true:$data['ispage'];

        if(!empty($data['where'])){
            $where = $data['where'];
        }

        if(!empty($data['order'])){
            $order = $data['order'];
        }

        if(!empty($data['field'])){
            $field = $data['field'];
        }

        if($ispage == true){
            $info = $table->with($with)->where($where)->order($order)->field($field)->page($page,$count)->select();
        } else {
            $info = $table->with($with)->where($where)->order($order)->field($field)->select();
        }

        return $info;
    }

    /**
     * [getFind 查询单条数据]
     * @Author   PengJun
     * @DateTime 2019-04-24
     * @return   [type]     [description]
     */
    public function getFind($model,$data=[])
    {
        $table = model($model);
        $where = [];
        $order = 'add_time desc';
        $field = '*';
        $with = [];

        if(!empty($data['where'])){
            $where = $data['where'];
        }

        if(!empty($data['order'])){
            $order = $data['order'];
        }

        if(!empty($data['field'])){
            $field = $data['field'];
        }

        if(!empty($data['with'])){
            $with = $data['with'];
        }

        if(!is_array($data)){
            $where['id'] = $data;
        }

        $list = $table->with($with)->where($where)->order($order)->field($field)->find();

        return $list;
    }

    /**
     * [getUser 获取用户信息]
     * @Author   PengJun
     * @DateTime 2019-03-28
     * @return   [type]     [description]
     */
    public function getUser($field)
    {
        $user = User::where('id',$this->uid)->field('id')->field($field)->find();

        return $user;
    }

    /**
     * [fileUp 文件上传]
     * @Author   PengJun
     * @DateTime 2019-04-12
     * @return   [type]     [description]
     */
    public function fileUp()
    {
        if(request()->file('file')){
            $file = imgUpdate('file');
            if($file['code'] == 400){ return_ajax(400,$file['msg']); }

            return_ajax(200,'上传成功',$file['data']);
        }
    }

    /**
     * [config 获取分享标题和图片]
     * @Author   PengJun
     * @DateTime 2019-04-12
     * @return   [type]     [description]
     */
    public function config()
    {
        $res = config::field('id,share_title,share_pic')->where('id',1)->find();
        return_ajax(200,'获取成功',$res);
    }
  
    /**
     * 获取公共模块内容
     */
    public function getPubContent(){
        $res = config::field('id,pub_content')->where('id',1)->find();
        if ($res) {
            $res['pub_content'] = preg_replace('/style=""/','',$res['pub_content']);
            $res['pub_content'] = preg_replace('/src="(.*?)"/','src="'.$_SERVER["REQUEST_SCHEME"].'://'.$_SERVER['SERVER_NAME'].'$1" style="width:100%;"',$res['pub_content']);
            # code...
        }
        return_ajax(200,'获取成功',$res);
    }
  
  
}
