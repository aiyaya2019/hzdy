<?php
namespace app\admin\controller;
use app\common\model\User as UserModel;
use app\common\model\Part;
use app\common\model\Order;
use app\common\model\Reco;
use app\common\model\UserGrade;
use app\common\model\UserCoupon;
use app\common\model\Msg;
use app\common\model\Friend;
use app\common\model\UserSign;
use app\common\model\PointChange;
use think\Db;

Class User extends Common{

    public function index()
    {
        if(request()->isAjax()){
            $post = input('post.');

            $where = '';
            if(!empty($post['keywords'])){ $where = 'number like "%'.$post['keywords'].'%" or nickname like "%'.emojiEncode($post['keywords']).'%"'; }

            $user = UserModel::where($where)->page(input('page'),20)->select();
            $count = UserModel::where($where)->count();

            return_ajax(200,'获取成功',$user,$count);
        }
        return $this->fetch();
    }

    //查看下级
    public function sub()
    {

        if(request()->isPost()){
            $post = input('post.');
            $where = 'top_id = '.$post['id'].'';
            if(!empty($post['keywords'])){ $where .= ' and number like "%'.$post['keywords'].'%" or nickname like "%'.emojiEncode($post['keywords']).'%"'; }

            $user = UserModel::where($where)->page(input('page'),20)->select();
            $count = UserModel::where($where)->count();

            return_ajax(200,'获取成功',$user,$count);
        }
        return $this->fetch();
    }

    //编辑会员
    public function save()
    {
        $id = input('id');

        if(request()->isPost()){
            $post = input('post.');
            $post['jump'] = 2;
            $user = new UserModel;
            if ($user->allowField(true)->save($post,['id'=>$id])){
                return_ajax(200,'编辑成功');
            }else{
                return_ajax(400,'网络繁忙');
            }
        }

        $user = UserModel::where('id',$id)->find();
        $order = Order::order('id desc')->where('uid',$user['id'])->find();
        if ($order){
            $user['address'] = $order['province'].$order['city'].$order['area'];
        }else{
            $user['address'] = '';
        }

        $grade = UserGrade::order('id asc')->select();
        return $this->fetch('',[
            'user'  => $user,
            'grade'  => $grade,
        ]);
    }

    /**
     * [grade 会员等级]
     * @Author   PengJun
     * @DateTime 2019-05-07
     * @return   [type]     [description]
     */
    public function grade()
    {
        if(request()->isPost()){
            $post = input('post.');
           $list =  UserGrade::order('full_price asc')->select();
           if ($list){
               foreach ($list as $k=>$v)
               {
                   $list[$k]['user_count'] = UserModel::where('grade_id',$v['id'])->count();
               }
           }
           $count = UserGrade::count();
//            $post['order'] = 'full_price asc';
//            $list = $this->selectAll('user_grade',$post);

            return_ajax(200,'获取成功',$list,$count);
        }
        return $this->fetch();
    }

    /**
     * [grade_save 添加/编辑会员等级]
     * @Author   PengJun
     * @DateTime 2019-05-07
     * @return   [type]     [description]
     */
    public function grade_save()
    {
        $id = input('id');

        if(request()->isPost()){
            $post = input('post.');

            //图片上传
            if(request()->file('pic')){
                $file = imgUpdate('pic');
                if($file['code'] == 400){ return_ajax(400,$file['msg']); }
                $post['icon'] = $file['data'];
            }

            $this->saves('user_grade',$post);
        }

        $list = $this->getFind('user_grade',$id);

        return $this->fetch('',[
            'list' => $list
        ]);
    }

    /**
     * [desc 会员说明]
     * @Author   PengJun
     * @DateTime 2019-05-08
     * @return   [type]     [description]
     */
    public function desc()
    {   
        if(request()->isPost()){
            $post = input('post.');

            $this->saves('config',$post);
        }

        $list = $this->getFind('config');

        return $this->fetch('',[
            'list' => $list
        ]);
    }

    /**
     * [birthday 生日优惠]
     * @Author   PengJun
     * @DateTime 2019-05-08
     * @return   [type]     [description]
     */
    public function birthday()
    {
        if(request()->isPost()){
            $post = input('post.');

            $this->saves('config',$post);
        }

        $list = $this->getFind('config');

        return $this->fetch('',[
            'list' => $list
        ]);
    }

    /**
     * [rule 推广规则]
     * @Author   PengJun
     * @DateTime 2019-05-08
     * @return   [type]     [description]
     */
    public function rule()
    {
        if(request()->isPost()){
            $post = input('post.');

            $this->saves('config',$post);
        }

        $list = $this->getFind('config');

        return $this->fetch('',[
            'list' => $list
        ]);
    }

    /**
     * [user_excel 导出所有用户]
     * @Author   PengJun
     * @DateTime 2019-01-29
     * @return   [type]     [description]
     */
    public function user_excel()
    {   
        ini_set('memory_limit','3072M');
        set_time_limit(0);

        $user = UserModel::all();

        $head = ['昵称','省份','城市','openid','性别'];
        $data = [];
        foreach($user as $key=>$vo){
            $data[] = [
                filterEmoji($vo['nickname']),
                $vo['province'],
                $vo['city'],
                $vo['openid'],
                $vo['sex_name'],
            ];
        }
        excelExport('用户信息',$head,$data);
    }
  
  /**
     * 更新状态
     * @author vevay
     * @time: 2019/7/16 15:50
     */
    public function edit(){
        $post = $this->request->post();
        save('user',$post);
    }

    /**
     * 站内信列表
     */
    public function msg(){
        if(request()->isAjax()){
            $post = input('post.');

            $where = [];
            if(!empty($post['id'])){
                $where['title'] = ['like', '%' .$post['title'] .'%'];
            }else{

            }
            $data = Msg::where($where)->page(input('page'), 20)->select();
            if ($data) {
                foreach ($data as $key => $value) {
                    // 1发给全部用户；2发给个人；3发给特定等级
                    switch ($value['type']) {
                        case '1':
                            $data[$key]['type_name'] = '全部用户';
                            break;
                        case '2':
                            $user = UserModel::where('id', $value['uid'])->find();
                            $data[$key]['type_name'] = '用户：' .$user['nickname'];
                            break;
                        
                        default:
                            $grade = Db::name('user_grade')->where('id', $value['grade_id'])->find();
                            $data[$key]['type_name'] = '特定等级：' .$grade['title'];
                            break;
                    }
                    
                }
            }
            $count = Msg::where($where)->count();

            return_ajax(200,'获取成功',$data,$count);
        }
        return $this->fetch();
    }

    /**
     * 添加站内信
     */
    public function msg_save(){
        $id = input('id');

        if(request()->isPost()){
            $post = input('post.');

            if (!$post['id']) {//添加
              Db::startTrans();// 启动事务
              $msg_id = Db::name('msg')->insertGetId($post);
              if ($post['type'] == '1') {//发给全部用户
                $users = UserModel::field('id, grade_id')->select();
                foreach ($users as $key => $value) {
                  $arr[$key] = [
                    'uid'      => $value['id'],
                    'msg_id'   => $msg_id,
                    'add_time' => time(),
                  ];
                }
              }elseif ($post['type'] == '2') {//发给个人
                $user = UserModel::where('id', $post['uid'])->find();
                $post['grade_id'] = $user['grade_id'];
                $arr['0'] = [
                    'uid'      => $post['uid'],
                    'msg_id'   => $msg_id,
                    'add_time' => time(),
                ];
              }else{//发给特定等级
                $users = UserModel::field('id, grade_id')->where('grade_id', $post['grade_id'])->select();
                foreach ($users as $key => $value) {
                  $arr[$key] = [
                    'uid'      => $value['id'],
                    'msg_id'   => $msg_id,
                    'add_time' => time(),
                  ];
                }
              }
              $res = Db::name('msg_user')->insertAll($arr);
              if ($msg_id && $res) {
                Db::commit();// 提交事务
                return_ajax(200,'添加成功');
                # code...
              }else{
                Db::rollback();// 回滚事务
                return_ajax(400,'添加失败，请稍后重试');
              }
            }else{//编辑
              $id = $post['id'];
              unset($post['id']);
              $msg = Db::name('msg')->where('id', $id)->find();
              if ($msg['type'] == $post['type']) {
                $res = Db::name('msg')->where('id', $id)->update($post);
                if ($res) {
                  return_ajax(200,'编辑成功');
                }else{
                  return_ajax(400,'编辑失败，请稍后重试');
                }

              }else{
                Db::startTrans();// 启动事务
                $res_del = Db::name('msg_user')->where('msg_id', $id)->delete();//删除
                $res_msg = Db::name('msg')->where('id', $id)->update($post);//更新

                if ($post['type'] == '1') {//发给全部用户
                  $users = UserModel::field('id, grade_id')->select();
                  foreach ($users as $key => $value) {
                    $arr[$key] = [
                      'uid'      => $value['id'],
                      'msg_id'   => $id,
                      'add_time' => time(),
                    ];
                  }
                }elseif ($post['type'] == '2') {//发给个人
                  $user = UserModel::where('id', $post['uid'])->find();
                  $post['grade_id'] = $user['grade_id'];
                  $arr['0'] = [
                      'uid'      => $post['uid'],
                      'msg_id'   => $id,
                      'add_time' => time(),
                  ];
                }else{//发给特定等级
                  $users = UserModel::field('id, grade_id')->where('grade_id', $post['grade_id'])->select();
                  foreach ($users as $key => $value) {
                    $arr[$key] = [
                      'uid'      => $value['id'],
                      'msg_id'   => $id,
                      'add_time' => time(),
                    ];
                  }
                }
                $res = Db::name('msg_user')->insertAll($arr);
                if (($res_del && $res_msg) && $res) {
                  Db::commit();// 提交事务
                  return_ajax(200,'编辑成功');
                  # code...
                }else{
                  Db::rollback();// 回滚事务
                  return_ajax(400,'编辑失败，请稍后重试');
                }
              }
            }
        }

        $user  = UserModel::select();
        $grade = Db::name('user_grade')->select();

        $list = $this->getFind('msg', $id);

        return $this->fetch('', [
            'grade' => $grade,
            'user'  => $user,
            'list'  => $list
        ]);
    }

    /**
     * 发放优惠券
     */
    public function grant_coupon(){
        $id = input('id');

        if(request()->isPost()){
            $post = input('post.');
            $coupon = Db::name('coupon')->where('id', $post['coupon_id'])->find();
            if($coupon){
                $coupon['start_time'] = strtotime($coupon['start_time']);
                $coupon['end_time'] = strtotime($coupon['end_time']);
                $data = [
                    'uid'        => $post['id'],
                    'coupon_id'  => $coupon['id'],
                    'full_price' => $coupon['full_price'],
                    'less_price' => $coupon['less_price'],
                    'day'        => $coupon['day'],
                    'type'       => $coupon['type'],
                    'num'        => $coupon['num'],
                    'start_time' => time(),
                    'end_time'   => time() + ($coupon['day'] * 86400),
                    'add_time'   => time(),
                    'point'      => $coupon['point'],
                    'day_time'   => time() + ($coupon['day'] * 86400),
                ];
                $rs = Db::name('user_coupon')->insert($data);
                return_ajax(200,'操作成功');
            } else {
                return_ajax(400,'操作失败，请稍后重试');
            }
        }

        $user   = UserModel::where('id', $id)->find();

        $where  = 'type = 1 OR ' .'(type = 2 and uid = ' .$id .') OR ' .'(type = 3 and grade_id = ' .$user['grade_id'] .')';
        $coupon = Db::name('coupon')->where($where)->select();

        return $this->fetch('',[
            'user'   => $user,
            'coupon' => $coupon,
        ]);
    }

    /**
     * 首页自定义导航
     * @author vevay
     * @time: 2019/7/15 17:51
     */
    public function friend(){
        if(request()->isAjax()) {

            $baner = Friend::select();
            return_ajax(200,'获取成功',$baner);
        }
        return $this->fetch();
    }

    /**
     * 编辑自定义导航
     * @author vevay
     * @time: 2019/7/15 18:19
     */
    public function friend_save(){
        $id = input('id');

        if(request()->isPost()){
            $post = input('post.');
            $nav = new Friend();

            //封面上传
            if(request()->file('pic')){

                $file = imgUpdate('pic');
               
                $post['pic'] = $file['data'];
            }

            $post['update_time'] = time();
            if(empty($post['id'])){
                //新增
                if($nav->allowField(true)->save($post)){
                    return_ajax(200,'添加成功');
                } else {
                    return_ajax(400,'添加失败,请稍后重试');
                }
            } else {
                //编辑
                if($nav->allowField(true)->save($post,['id'=>$post['id']])){
                    return_ajax(200,'编辑成功');
                } else {
                    return_ajax(400,'编辑失败,请稍后重试');
                }
            }
        }

        $data = Friend::get($id);

        return $this->fetch('',[
            'data'  => $data,
        ]);
    }

    //积分明细
    public function point()
    {
        $id = input('id');
        if(request()->isPost()){
            $post = input('post.');

            $where = 'uid = '.$id.'';

            if (!empty($post['pay_type'])){
                $where .= ' and pay_type = '.$post['pay_type'].'';
            }

            $list = PointChange::where($where)->select();
            $count = PointChange::where($where)->count();
            return_ajax(200,'获取成功',$list,$count);
        }
        return $this->fetch();
    }

    //签到记录
    public function sign()
    {
        $id = input('id');
        if(request()->isPost()){
            $post = input('post.');

            $where = 'uid = '.$id.'';

            if (!empty($post['pay_type'])){
                $where .= ' and pay_type = '.$post['pay_type'].'';
            }

            $list = UserSign::where($where)->select();
            $count = UserSign::where($where)->count();
            return_ajax(200,'获取成功',$list,$count);
        }
        return $this->fetch();
    }

    //持有的优惠券
    public function coupon()
    {
        $id = input('id');
        if(request()->isPost()){
            $post = input('post.');

            $where = 'uid = '.$id.'';

            if (!empty($post['pay_type'])){
                $where .= ' and pay_type = '.$post['pay_type'].'';
            }

            $list = UserCoupon::where($where)->select();
            $count = UserCoupon::where($where)->count();
            return_ajax(200,'获取成功',$list,$count);
        }
        return $this->fetch();
    }

    /**导入会员数据
     * @return mixed
     */
    public function explode(){

        if(request()->isPost()){
            $post = input('post.');

            if(request()->file('file')){
                $file = imgUpdate('file');
                if($file['code'] == 400){ return_ajax(400,$file['msg']); }
                $post['file'] = $file['data'];
            }else{
                echo '<script>alert("请选择文件"); window.location.href = "https://hzdy.kailly.com/admin/user/index.html";</script>';
            }

            $data = insert_excel($_SERVER['DOCUMENT_ROOT'] .$post['file']);
            if (empty($data)) {
                echo '<script>alert("导入数据为空"); window.location.href = "https://hzdy.kailly.com/admin/user/index.html";</script>';
            }

            $arr = $data;

            foreach ($arr as $key => $value) {
                $openid  = UserModel::where('openid',$value[3])->find();
                if ($openid){
                    echo '<script>alert("存在重复的openid"); window.location.href = "https://hzdy.kailly.com/admin/user/index.html";</script>';
                    exit;
                }
            }

            foreach ($arr as $key => $value) {
                $array[$key]['nickname']  = emojiEncode($value[0]);
                $array[$key]['grade_id']   = $value[1];
                $array[$key]['top_id']   = $value[2];
                $array[$key]['openid']   = $value[3];
                $array[$key]['point']   = $value[4];
                $array[$key]['money']   = $value[5];
                $array[$key]['number']   = $this->getNonceStr();
                $array[$key]['token']   = $this->GetToken($value[4]);
                $array[$key]['add_time'] = time();
                $array[$key]['update_time'] = time();
            }

            $rs = UserModel::insertAll($array);

            if($rs){
                echo '<script>alert("导入成功"); window.location.href = "https://hzdy.kailly.com/admin/user/index.html";</script>';
            } else {
                echo '<script>alert("导入失败，请稍后再试"); window.location.href = "https://hzdy.kailly.com/admin/user/index.html";</script>';
            }
        }
        return $this->fetch();
    }

    public function GetToken($openid)
    {
        $key = 'jigujigu';
        $token = md5(md5($openid).md5($key).time());

        $isset = UserModel::get(['token'=>$token]);
        if($isset){
            $this->GetToken($openid);
        } else {
            return $token;
        }
    }

    /**
     *
     * 产生随机字符串，不长于6位
     * @param int $length
     * @return 产生的随机字符串
     */
    public function getNonceStr($length = 6)
    {
        $chars = "0123456789";
        $str ="";
        for ( $i = 0; $i < $length; $i++ )  {
            $str .= substr($chars, mt_rand(0, strlen($chars)-1), 1);
        }
        $res = UserModel::where('number',$str)->find();
        if ($res) {
            $str = $this->getNonceStr();
        }
        return $str;
    }


}