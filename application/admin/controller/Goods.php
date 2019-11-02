<?php
namespace app\admin\controller;
use app\common\model\Goods as GoodsModel;
use app\common\model\GoodsAttr;
use app\common\model\GoodsSpec;
use app\common\model\GoodsVal;
use app\common\model\GoodsType;
use app\common\model\IndexNav;
use app\common\model\ZoneGoods;
use app\common\model\OrderEvaluate;
use app\common\model\User;
use think\Db;

Class Goods extends Common{

    /**
     * [index 商品列表]
     * @Author   PengJun
     * @DateTime 2019-01-24
     * @return   [type]     [description]
     */
    public function index()
    {   
        if(request()->isAjax()){
            $post = input('post.');
            $where = [];

            //商品名称搜索
            if(!empty($post['title'])){
                $where['title'] = ['like','%'.$post['title'].'%'];
            }

            //商品分类搜索
            if(!empty($post['type_id'])){
                $where['type_id'] = $post['type_id'];
            }
            $where['is_show'] = ['neq', '2'];

            $list = GoodsModel::where($where)->order('pay_num desc')->page(input('page'),20)->select();
            $count = GoodsModel::where($where)->count();
            return_ajax(200,'获取成功',$list,$count);
        }

        //获取商品分类
        $type = GoodsType::with('this')->where(['pid'=>0])->select();

        return $this->fetch('',[
            'type' => $type
        ]);
    }

    /**
     * 下架商品
     */
    public function noShow(){
        if(request()->isAjax()){
            $post = input('post.');
            $where = [];

            //商品名称搜索
            if(!empty($post['title'])){
                $where['title'] = ['like','%'.$post['title'].'%'];
            }

            //商品分类搜索
            if(!empty($post['type_id'])){
                $where['type_id'] = $post['type_id'];
            }

            $where['is_show'] = '2';

            $list = GoodsModel::where($where)->order('pay_num desc')->page(input('page'),20)->select();
            $count = GoodsModel::where($where)->count();
            return_ajax(200,'获取成功',$list,$count);
        }

        //获取商品分类
        $type = GoodsType::with('this')->where(['pid'=>0])->select();

        return $this->fetch('',[
            'type' => $type
        ]);

    }

    /**
     * [save 添加/编辑商品]
     * @Author   PengJun
     * @DateTime 2019-01-24
     * @return   [type]     [description]
     */
    public function save()
    {
        $id = input('id');

        if(request()->isPost()){
            $post = input('post.');
            $goods = new GoodsModel;
            $ZoneGoods = new ZoneGoods;

            //封面上传
            if(request()->file('pic')){
                $file = imgUpdate('pic');
                if($file['code'] == 400){ return_ajax(400,$file['msg']); }
                $post['pic'] = $file['data'];
            }
            // 条形码
            if(request()->file('img')){
                $file = imgUpdate('img');
                if($file['code'] == 400){ return_ajax(400,$file['msg']); }
                $post['img'] = $file['data'];
            }

            if(!empty($post['files'])){
                $post['images'] = implode(',',$post['files']);
            }
            
            //选择了专区
            if(!empty($post['zone_id'])){
                //删除商品原专区
                ZoneGoods::destroy(['goods_id'=>$post['id']]);
                foreach($post['zone_id'] as $vo){
                    $zone_goods[] = [
                        'zone_id'  => $vo,
                        'goods_id' => $post['id'],
                    ];
                }

                $ZoneGoods->saveAll($zone_goods);
            }

            //商品标签
            if(!empty($post['label_id'])){
                $post['label_id'] = implode(',',$post['label_id']);
            } else {
                $post['label_id'] = '';
            }
            // 商品所属栏目
            $post['nav_id'] = empty($post['nav_id'])?'':implode(',',$post['nav_id']);

            $post['update_time'] = time();
            if(empty($post['id'])){
                //新增
                if($goods->allowField(true)->save($post)){
                    return_ajax(200,'添加成功',$goods->id);
                } else {
                    return_ajax(400,'添加失败,请稍后重试');
                }
            } else {
                //编辑
                if($goods->allowField(true)->save($post,['id'=>$post['id']])){
                    return_ajax(200,'编辑成功');
                } else {
                    return_ajax(400,'编辑失败,请稍后重试');
                }
            }
        }

        $goods = GoodsModel::get($id);
        //获取商品分类
        $type = GoodsType::with('this')->where(['pid'=>0])->select();
        //获取专区
        $zone = $this->selectAll('zone');
        //获取商品所属专区
        $zgoods = ZoneGoods::where('goods_id',$id)->column('zone_id');
        //商品标签
        $label = $this->selectAll('goods_label');
        // 获取首页导航栏目
        $nav = IndexNav::where(['id'=>['<',4]])->select();
        // p(toArray($goods));
        return $this->fetch('',[
            'goods'  => $goods,
            'type'   => $type,
            'zone'   => $zone['list'],
            'label'  => $label['list'],
            'zgoods' => $zgoods,
            'nav'=>$nav
        ]);
    }

    /**
     * [attr_spec 设置商品规格]
     * @Author   PengJun
     * @DateTime 2019-03-19
     * @return   [type]     [description]
     */
    public function attr_spec()
    {
        $id = input('id');

        $goods = GoodsModel::get($id);

        if(request()->isPost()){
            $post = input('post.');

            // return_ajax(400,'配置失败，请重试',$post);
            //添加/修改商品规格属性
            $attr = $this->attr($post['attr'],$post['goods_id']);
            //添加/修改商品规格属性的值
            $spec = $this->spec($post['spec'],$post['goods_id']);

            if($attr && $spec){
                return_ajax(200,'配置成功');
            } else {
                return_ajax(400,'配置失败，请重试');
            }
        }


        //获取商品规格信息
        $attr = GoodsAttr::with('spec')->where('goods_id',$id)->field('id,title,ap_id')->select();
        //获取商品规格初始化显示信息
        $data = $this->data($id);
        //获取商品规格初始化值
        $item = $this->item($id);
        // p($data['info']);
        return $this->fetch('',[
            'goods'      => $goods,
            'item'       => $item,
            'data'       => $data['info']?$data['info']:json_encode([]),
            'default'    => $data['default']?$data['default']:'',
            'goods_spec' => $attr,
        ]);
    }

    /**
     * [attr 添加商品规格信息]
     * @Author   PengJun
     * @DateTime 2019-03-19
     * @return   [type]     [description]
     */
    public function attr($attr,$goods_id)
    {
        foreach($attr as $vo){
            //添加属性
            $attr = new GoodsAttr;
            //查询属性是否已经存在 存在就更新否则就添加
            $is_attr = GoodsAttr::get(['goods_id'=>$goods_id,'ap_id'=>$vo['id']]);
            if($is_attr){
                //更新
                $is_attr->title = $vo['name'];
                $is_attr->update_time = time();
                $is_attr->save();
                $attr_id = $is_attr['id'];
                $aid[] = $is_attr['id'];
            } else {
                //添加
                $attr_array = [
                    'title'       => $vo['name'],
                    'goods_id'    => $goods_id,
                    'ap_id'       => $vo['id'],
                    'add_time'    => time(),
                    'update_time' => time(),
                ];
                $attr->save($attr_array);
                $attr_id = $attr->id;
            }
            //添加规格信息
            foreach($vo['sub'] as $val){
                //查询规格信息是否已经存在
                $is_spec = GoodsSpec::get(['goods_id'=>$goods_id,'ap_id'=>$val['id']]);
                if($is_spec){
                    $info[] = [
                        'id'            => $is_spec['id'],
                        'title'         => $val['name'],
                        'update_time'   => time()
                    ];
                    $pid[] = $is_spec['id'];
                } else {
                    $info[] = [
                        'title'         => $val['name'],
                        'goods_id'      => $goods_id,
                        'goods_attr_id' => $attr_id,
                        'ap_id'         => $val['id'],
                        'add_time'      => time(),
                        'update_time'   => time()
                    ];
                }
            }
        }
        //删除数据
        if(!empty($aid)){
            GoodsAttr::destroy(['id'=>['not in',$aid],'goods_id'=>$goods_id]);
        }
        if(!empty($pid)){
            GoodsSpec::destroy(['id'=>['not in',$pid],'goods_id'=>$goods_id]);
        }
        
        $GoodsSpec = new GoodsSpec;
        if($GoodsSpec->saveAll($info)){
            return $info;
        } else {
            return false;
        }
    }

    /**
     * [spec 添加规格属性的值]
     * @Author   PengJun
     * @DateTime 2019-03-19
     * @param    [type]     $spec     [description]
     * @param    integer    $goods_id [description]
     * @return   [type]               [description]
     */
    public function spec($spec,$goods_id)
    {
        foreach($spec as $key=>$vo){
            $str = '';
            $name = '';
            foreach($vo['ids'] as $k=>$v){
                foreach($v as $kk=>$i){
                    $attr = GoodsAttr::where(['ap_id'=>$kk,'goods_id'=>$goods_id])->find();
                    $spec = GoodsSpec::where(['ap_id'=>$i,'goods_id'=>$goods_id])->find();
                    $str .= $attr['id'].':'.$spec['id'];
                    $name .= $attr['title'].'：'.$spec['title'];
                    if($kk != count($vo['ids'])){
                        $str .= ',';
                        $name .= ' , ';
                    }
                }
            }
            //查询属性值是否已经存在
            $isset = GoodsVal::get(['goods_id'=>$goods_id,'attr_spec'=>$str]);
            if($isset){
                $info[$key] = $vo;
                $info[$key]['id'] = $isset['id'];
                $info[$key]['spec_name'] = $name;
                $info[$key]['update_time'] = time();
                $id[] = $isset['id'];
            } else {
                $info[$key] = $vo;
                $info[$key]['attr_spec'] = $str;
                $info[$key]['spec_name'] = $name;
                $info[$key]['goods_id'] = $goods_id;
                $info[$key]['add_time'] = time();
                $info[$key]['update_time'] = time();
            }
        }

        //删除数据
        if(!empty($id)){
            GoodsVal::destroy(['id'=>['not in',$id],'goods_id'=>$goods_id]);
        }
        $goods_val = new GoodsVal;
        if($goods_val->allowField(true)->saveAll($info)){
            return true;
        } else {
            return false;
        }
    }


    /**
     * [item 商品规格初始化信息]
     * @Author   PengJun
     * @DateTime 2018-08-10
     * @return   [type]     [description]
     */
    public function item($id)
    {   
        //[{"id":1,"name":"颜色","sub":[{"id":1,"name":"黑"},{"id":2,"name":"白"},{"id":3,"name":"蓝"}]},{"id":2,"name":"尺寸","sub":[{"id":1,"name":"S"},{"id":2,"name":"M"},{"id":3,"name":"L"}]},{"id":3,"name":"测试","sub":[{"id":1,"name":"测试"}]}]
        $attr = GoodsAttr::with('spec')->where('goods_id',$id)->field('id,title,ap_id')->select();
        $info = [];
        foreach($attr as $vo){
            $sub = [];
            foreach($vo['spec'] as $val){
                $sub[] = ['id'=>$val['ap_id'],'name'=>$val['title']];
            }
            $info[] = [
                'id'   => $vo['ap_id'],
                'name' => $vo['title'],
                'sub'  => $sub
            ];
        }
        return json_encode($info);
    }

     /**
     * [data 商品规格初始化显示信息/以及默认选中值]
     * @Author   PengJun
     * @DateTime 2018-08-10
     * @return   [type]     [description]
     */
    public function data($id)
    {
        //[{"ids":[{"1":"1"},{"2":"4"}],"price":100,"stock":100,"sku":100,"vip":100,"cost":100,"purc":100},{"ids":[{"1":"2"},{"2":"5"}],"price":200,"stock":200,"sku":200,"vip":200,"cost":200,"purc":200}]
        $goods_val = GoodsVal::where('goods_id',$id)->select();
        if($goods_val){
            foreach($goods_val as $vo){
                $a = [];
                $attr_spec = explode(',',$vo['attr_spec']);
                foreach($attr_spec as $val){
                    $arr = explode(':',$val);
                    $key = GoodsAttr::where('id',$arr[0])->value('ap_id');
                    $value = GoodsSpec::where('id',$arr[1])->value('ap_id');
                    $a[] = [$key=>$value];
                    $default[] = $value;
                }
                $info[] = ['ids'=>$a,'price'=>$vo['price'],'old_price'=>$vo['old_price'],'stock'=>$vo['stock'],'fare_money'=>$vo['fare_money']];
            }

            $list['default'] = array_unique($default);
            $list['info'] = json_encode($info);
            return $list;
        }
    }

    /**
     * [type 商品分类]
     * @Author   PengJun
     * @DateTime 2019-03-20
     * @return   [type]     [description]
     */
    public function type()
    {
        if(input('json') == 1){

            $where = [];
            $list = GoodsType::where($where)->order('sort desc')->select();

            return_ajax(200,'获取成功',$list);
        }

        return $this->fetch();
    }

    /**
     * [type_save 分类编辑]
     * @Author   PengJun
     * @DateTime 2019-05-05
     * @return   [type]     [description]
     */
    public function type_save()
    {   
        $id = input('id');

        if(request()->isPost()){
            $post = input('post.');
            $type = new GoodsType;

            //图片上传
            if(request()->file('pic')){
                $file = imgUpdate('pic');
                if($file['code'] == 400){ return_ajax(400,$file['msg']); }
                $post['pic'] = $file['data'];
            }

            $post['update_time'] = time();
            if(empty($post['id'])){
                $post['add_time'] = time();
                $oper = $type->allowField(true)->save($post);
            } else {
                $oper = $type->allowField(true)->save($post,['id'=>$id]);
            }


            if($oper)
            {
                return_ajax(200,'操作成功');
            } else {
                return_ajax(400,'操作失败，请稍后重试');
            }
        }

        $type = GoodsType::get($id);

        return $this->fetch('',[
            'type' => $type
        ]);
    }

    /**
     * [DeployDele 删除分类]
     * @Author   PengJun
     * @DateTime 2018-10-06
     */
    public function delete_type()
    {
        $id = input('id');

        if(GoodsType::destroy($id)){
            GoodsType::destroy(['pid'=>$id]);
            return_ajax(200,'删除成功');
        } else {
            return_ajax(200,'删除失败,请稍后重试');
        }
    }

    /**
     * [label 商品标签]
     * @Author   PengJun
     * @DateTime 2019-05-07
     * @return   [type]     [description]
     */
    public function label()
    {
        if(request()->isPost()){
            $post = input('post.');

            $list = $this->selectAll('goods_label',$post);

            return_ajax(200,'获取成功',$list['list'],$list['count']);
        }

        return $this->fetch();
    }

    /**
     * [label_save 添加/编辑商品标签]
     * @Author   PengJun
     * @DateTime 2019-05-07
     * @return   [type]     [description]
     */
    public function label_save()
    {
        $id = input('id');

        if(request()->isPost()){
            $post = input('post.');

            $this->saves('goods_label',$post);
        }

        $list = $this->getFind('goods_label',$id);

        return $this->fetch('',[
            'list' => $list
        ]);
    } 

    /**
     * [help 咨询与售后]
     * @Author   PengJun
     * @DateTime 2019-05-07
     * @return   [type]     [description]
     */
    public function help()
    {
        if(request()->isPost()){
            $post = input('post.');

            $this->saves('goods_help',$post);
        }

        $list = $this->getFind('goods_help');

        return $this->fetch('',[
            'list' => $list
        ]);
    }

    /**
     * 评论列表
     * @return [type] [description]
     */
    public function evaluate(){
        $goods_id = input('goods_id');
        if(request()->isPost()){
            $post = input('post.');
            $post['where']['goods_id'] = $goods_id;
            $list = $this->selectAll('order_evaluate', $post);
            if ($list) {
                foreach ($list['list'] as $key => &$value) {
                  $list['list'][$key]['nickname']   = emojiDecode($value['nickname']);
                }
            }
            return_ajax(200,'获取成功',$list['list'],$list['count']);
        }
        return $this->fetch('');
    }

    /**
     * 假评论列表
     */
    public function evaluateLst(){
        if(request()->isAjax()){
            $post = input('post.');
            $where = [];

            $post['where']['is_true'] = ['eq', '2'];

            $list = $this->selectAll('order_evaluate', $post);
            return_ajax(200,'获取成功',$list['list'],$list['count']);
        }
        return $this->fetch('',[
        ]);
    }

    /**
     * 添加/编辑商品评论
     * $id 商品id
     */
    public function evaluate_save(){
        $goods_id = input('goods_id');
        // $where['uid']      = null;
        // $where['order_id'] = null;

        if(request()->isPost()){
            $post = input('post.');
            $post['is_true'] = '2';
            $user = User::where('id', $post['uid'])->find();

            $post['nickname'] = $user['nickname'];
            $post['head_img'] = $user['head_img'];
            //封面上传
            if(request()->file('head_img')){
                $file = imgUpdate('head_img');
                if($file['code'] == 400){ return_ajax(400,$file['msg']); }
                $post['head_img'] = $file['data'];
            }
            //新增
            $post['add_time'] = time();
            $post['status'] = '0';
            $res = OrderEvaluate::insert($post);
            if($res){
                return_ajax(200,'添加成功', $res);
            } else {
                return_ajax(400,'添加失败,请稍后重试');
            }
        }

        $where['goods_id'] = $goods_id;
        $goods = GoodsModel::get($goods_id);
        $user  = User::where('status', '1')->select();
        return $this->fetch('', [
            'goods' => $goods,
            'user'  => $user,
        ]);
    }


    /**
     * 编辑评论
     */
    public function evaluate_edit(){
        $id = input('id');

        if(request()->isPost()){
            $post = input('post.');
            $post['is_true'] = '2';
            //封面上传
            if(request()->file('head_img')){
                $file = imgUpdate('head_img');
                if($file['code'] == 400){ return_ajax(400,$file['msg']); }
                $post['head_img'] = $file['data'];
            }

            $post['update_time'] = time();
            $id = $post['id'];
            unset($post['id']);
            // print_r($post);exit;
            $res = OrderEvaluate::where('id', $id)->update($post);
            if($res){
                return_ajax(200,'添加成功', $res);
            } else {
                return_ajax(400,'添加失败,请稍后重试');
            }
        }

        $evaluate = OrderEvaluate::get($id);
        return $this->fetch('', [
            'evaluate' => $evaluate,
        ]);
    }
    /**
     * 库存警戒商品
     */
    public function warn_goods(){
        $config = Db::name('config')->where('id', '1')->find();
        // print_r($config);
        if(request()->isAjax()){
            $post = input('post.');
            $where = [];

            // 规格表中库存低于库存警戒线的商品id
            $gids = Db::name('goods_val')->field('id, goods_id, stock')->where('stock', '<', $config['stock_warn'])->select();
            
            if ($gids) {
                $gid = array_column($gids, 'goods_id', 'goods_id');

                $where['id'] = ['in', $gid];

                //商品名称搜索
                if(!empty($post['title'])){
                    $where['title'] = ['like','%'.$post['title'].'%'];
                }

                //商品分类搜索
                if(!empty($post['type_id'])){
                    $where['type_id'] = $post['type_id'];
                }

                $list = GoodsModel::where($where)->order('add_time desc')->page(input('page'),20)->select();
                $count = GoodsModel::where($where)->count();
                return_ajax(200,'获取成功',$list,$count);
            }

        }

        //获取商品分类
        $type = GoodsType::with('this')->where(['pid'=>0])->select();

        return $this->fetch('',[
            'type' => $type
        ]);
    }


   //批量修改
    public function batch()
    {
        if(request()->isPost()){
            $post = input('post.');
            if ($post['type'] == 1){
                //上架
                $data = [
                    'is_show' => 1,
                    'update_time' => time(),
                ];
                
                $res = GoodsModel::where('id in ('.$post['id'].')')->update($data);
            }else{
                //下架
                $data = [
                    'is_show' => 2,
                    'update_time' => time(),
                ];
                $res = GoodsModel::where('id in ('.$post['id'].')')->update($data);
            }

            if ($res){
                return_ajax(200,'修改成功');
            }else{
                return_ajax(400,'网络繁忙');
            }
        }
    }











}