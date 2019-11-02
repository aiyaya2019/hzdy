<?php
namespace app\api\controller;
use app\common\model\Order;
use app\common\model\UserGrade;
use app\common\model\Config;
use app\common\model\UserNotice;
use app\common\model\Friend;
use app\common\model\User as UserModel;
use app\common\model\UserCount;
use app\common\model\FriendOrder;
class User extends Common
{	

    //邀请好友
    public function friend()
    {
        if(request()->isPost()){
            $post = input('post.');
            $arr['order'] = 'id desc';
            $data = $this->selectAll('friend');
            if ($data){
                return_ajax(200,'获取成功',$data);
            }else{
                return_ajax(400,'暂无数据');
            }
        }
    }

    /**
     * [user_update 更新用户信息]
     * @Author   PengJun
     * @DateTime 2019-05-13
     * @return   [type]     [description]
     */
    public function user_update()
    {   
        if(request()->isPost()){
            $post = input('post.');
            $table = model('user');
            
            if($table->allowField(true)->save($post,['id'=>$this->uid])){
                return_ajax(200,'更新成功');
            } else {
                return_ajax(400,'编辑失败,请稍后重试');
            }
        }
    }

    //会员中心
    public function members()
    {
        if(request()->isPost()){
            $post = input('post.');
            $data['field'] = 'id,sex,grade_id,number';
            $data['where'] = 'id = '.$this->uid.'';
            $user = $this->getFind('user',$data);

            //查出用户当前的消费金额
            $user['price'] = Order::where('uid',$this->uid)->where('status != 1 and status != 6 and status != 7')->sum('pay_money');
            //用户升级
            $id = UserGrade::order('full_price asc')->where('full_price >= '.$user['price'].'')->value('id');
            //获取用户当前应该升级的等级
            $ids= UserGrade::order('full_price desc')->where('full_price <= '.$user['price'].'')->value('id');
            if (!$id) {
                $ids = 5;
                $arr = UserGrade::where('id',5)->find();
                $user['total'] = 0;
                $user['upgrade_name'] = $arr['title'];
                $user['grade_price'] = 0;
                $user['icon'] = $arr['icon'];
            }else{
                  //查出下一个等级需要的金额
//                $id = $user['grade_id']+1;
                $money = UserGrade::where('id',$id)->value('full_price');
                $user['total'] = $money;
                $user['icon'] =  UserGrade::where('id',$id)->value('icon');;
                $user['upgrade_name'] = UserGrade::where('id',$id)->value('title');
                $user['grade_price'] = $money-$user['price'];
            }

            model('user')::where('id',$this->uid)->setField('grade_id',$ids);
            
            //会员说明
            $user['desc'] = Config::where('id',1)->value('grade_desc');
            $grade = UserGrade::select();
            return_ajax(200,'获取成功',$user,$grade);

        }
    }

    //会员权益
    public function details()
    {
        if(request()->isPost()){
            $post = input('post.');
            if (empty($post['id'])) { return_ajax(400,'缺少必传参数id');}
            $res = UserGrade::where('id',$post['id'])->find();
            if ($res){
                return_ajax(200,'获取成功',$res);
            }else{
                return_ajax(400,'网络繁忙');
            }
        }
    }

    //消息通知
    public function user_notice()
    {
        if(request()->isPost()){
            $post = input('post.');
            if (empty($post['is_read'])) { return_ajax(400,'缺少必传参数is_read'); }
            $res = UserNotice::where(['uid'=>$this->uid,'is_read'=>$post['is_read']])->select();
            $count = UserNotice::where(['uid'=>$this->uid,'is_read'=>$post['is_read']])->count();
            if ($res){
                return_ajax(200,'获取成功',$res,$count);
            }else{
                return_ajax(400,'暂无新消息');
            }
        }
    }

    //删除消息
    public function delete_notice()
    {
        if(request()->isPost()) {
            $post = input('post.');
            if (empty($post['id'])) { return_ajax(400,'缺少必传参数id'); }
            $where = 'id in('.$post['id'].')';
            $res = UserNotice::where($where)->delete();
            if ($res){
                return_ajax(200,'删除成功');
            }else{
                return_ajax(400,'网络繁忙');
            }
        }
    }

    //全部已读
    public function is_read()
    {
        if(request()->isPost()) {
            $post = input('post.');
            $res = UserNotice::where('uid',$this->uid)->setField('is_read',2);
            if ($res){
                return_ajax(200,'操作成功');
            }else{
                return_ajax(400,'网络繁忙');
            }
        }
    }

    //统计
    public function count()
    {

            $user = UserCount::where('uid',$this->uid)->whereTime('add_time','today')->find();
            if (!$user){
                $data = [
                    'uid'   => $this->uid,
                    'num'   => 1,
                ];
                $u = new UserCount;
                $u->allowField(true)->save($data);
            }else{
                UserCount::where('id',$user['id'])->setInc('num',1);
            }
    }

    //领取满足邀请好友条件的奖励
    public function receive_friend()
    {
        if(request()->isPost()) {
            $post = input('post.');
            if (empty($post['friend_id'])) { return_ajax(400,'缺少必传参数friend_id');}
            if (empty($post['name'])) { return_ajax(400,'请填写收货人');}
            if (empty($post['phone'])) { return_ajax(400,'请输入手机号');}
            if (empty($post['address'])) { return_ajax(400,'请输入收货地址');}
            $res = FriendOrder::where('uid',$this->uid)->find();
            if ($res){
                return_ajax(400,'您已经领取过了');
            }else{
                //查询是否满足邀请人数的条件
                $num = Config::where('id',1)->value('friend_num');
                $count =UserModel::where('top_id',$this->uid)->count();
                if ($count < $num){
                    return_ajax(400,'抱歉，您暂未达到领取条件');
                }else{
                    //满足领取条件
                    $data = Friend::where('id',$post['friend_id'])->find();
                    $arr = [
                        'uid'   => $this->uid,
                        'friend_id'   => $post['friend_id'],
                        'pic'   => $data['pic'],
                        'name'   => $post['name'],
                        'phone'   => $post['phone'],
                        'address'   => $post['address'],
                    ];
                    $rs = FriendOrder::create($arr);
                    if ($rs){
                        return_ajax(200,'领取成功');
                    }else{
                        return_ajax(400,'网络繁忙');
                    }
                }
            }
        }
    }
    
}
