<?php
namespace app\admin\controller;
use app\common\model\User;
use app\common\model\Goods;
use app\common\model\Order;
use app\common\model\BargainOrder;
use app\common\model\GroupOrder;
use app\common\model\SpikeOrder;
use app\common\model\LimitOrder;
use app\common\model\UserCount;
use app\common\model\GoodsCount;

Class Index extends Common{

	public function index()
	{

		return $this->fetch();
	}

	public function console()
	{
	    $post = input('post.');
	    if (!empty($post['time'])){

	        $time = strtotime($post['time']);
            $today_add_time = strtotime(date('Y-m-d 00:00:00',$time));
            $today_end_time = strtotime(date('Y-m-d 23:59:59',$time));

            $first =  date('Y-m-01', strtotime($post['time']));
            $month_add_time = strtotime(date('Y-m-01 00:00:00', strtotime($post['time'])));
            $month_end_time = strtotime(date('Y-m-d 23:59:59', strtotime("$first +1 month -1 day")));

            $where = 'add_time >= '.$today_add_time.' and add_time <= '.$today_end_time.'';
            $map = 'add_time >= '.$month_add_time.' and add_time <= '.$month_end_time.'';
        }else{
            $time = time();
            $date = date('Y-m-d',$time);
            $today_add_time = strtotime(date('Y-m-d 00:00:00',$time));
            $today_end_time = strtotime(date('Y-m-d 23:59:59',$time));

            $first =  date('Y-m-01', strtotime($date));
            $month_add_time = strtotime(date('Y-m-01 00:00:00', strtotime($date)));
            $month_end_time = strtotime(date('Y-m-d 23:59:59', strtotime("$first +1 month -1 day")));

            $where = 'add_time >= '.$today_add_time.' and add_time <= '.$today_end_time.'';
            $map = 'add_time >= '.$month_add_time.' and add_time <= '.$month_end_time.'';
        }

        
	    //销售金额
        $order['order_price'] = Order::where($where)->where('status',4)->sum('pay_money');//正常订单的日销售额
        $order['order_money'] = Order::where($map)->where('status',4)->sum('pay_money');//正常订单的月销售额
        $order['order_total'] = Order::where('status',4)->sum('pay_money');//正常订单的总销售额
       //退款金额
        $order['order_refund_price'] = Order::where($where)->where(['status'=>5,'refund_state'=>2])->sum('pay_money');//正常订单的日退款金额
        $order['order_refund_money'] = Order::where($map)->where(['status'=>5,'refund_state'=>2])->sum('pay_money');//正常订单的月退款金额
        $order['order_refund_total'] = Order::where(['status'=>5,'refund_state'=>2])->sum('pay_money');//正常订单的总退款金额

        //砍价订单销售金额
        $order['bargain_price'] = BargainOrder::where($where)->where('status',4)->sum('pay_money');//砍价订单的日销售额
        $order['bargain_money'] = BargainOrder::where($map)->where('status',4)->sum('pay_money');//砍价订单的月销售额
        $order['bargain_total'] = BargainOrder::where('status',4)->sum('pay_money');//砍价订单的总销售额
        //砍价订单退款金额
        $order['bargain_refund_price'] = BargainOrder::where($where)->where('status',6)->sum('pay_money');//砍价订单的日销售额
        $order['bargain_refund_money'] = BargainOrder::where($map)->where('status',6)->sum('pay_money');//砍价订单的月销售额
        $order['bargain_refund_total'] = BargainOrder::where('status',6)->sum('pay_money');//砍价订单的总销售额

        //拼团订单销售金额
        $order['group_price'] = GroupOrder::where($where)->where('status',4)->sum('pay_money');//拼团订单的月销售额
        $order['group_money'] = GroupOrder::where($map)->where('status',4)->sum('pay_money');//拼团订单的月销售额
        $order['group_total'] = GroupOrder::where('status',4)->sum('pay_money');//拼团订单的总销售额
        //拼团金额退款金额
        $order['group_refund_price'] = GroupOrder::where($where)->where(['status'=>5,'refund_state'=>2])->sum('pay_money');//拼团订单的月销售额
        $order['group_refund_money'] = GroupOrder::where($map)->where(['status'=>5,'refund_state'=>2])->sum('pay_money');//拼团订单的月销售额
        $order['group_refund_total'] = GroupOrder::where(['status'=>5,'refund_state'=>2])->sum('pay_money');//拼团订单的总销售额

        //秒杀订单销售金额
        $order['spike_price'] = SpikeOrder::where($where)->where('status',4)->sum('pay_money');//秒杀订单的月销售额
        $order['spike_money'] = SpikeOrder::where($map)->where('status',4)->sum('pay_money');//秒杀订单的月销售额
        $order['spike_total'] = SpikeOrder::where('status',4)->sum('pay_money');//秒杀订单的总销售额
        //秒杀订单退款金额
        $order['spike_refund_price'] = SpikeOrder::where($where)->where('status',6)->sum('pay_money');//秒杀订单的月销售额
        $order['spike_refund_money'] = SpikeOrder::where($map)->where('status',6)->sum('pay_money');//秒杀订单的月销售额
        $order['spike_refund_total'] = SpikeOrder::where('status',6)->sum('pay_money');//秒杀订单的总销售额

        //限时打折订单销售金额
        $order['limit_price'] = LimitOrder::where($where)->where('status',4)->sum('pay_money');//限时打折订单的月销售额
        $order['limit_money'] = LimitOrder::where($map)->where('status',4)->sum('pay_money');//限时打折订单的月销售额
        $order['limit_total'] = LimitOrder::where('status',4)->sum('pay_money');//限时打折订单的总销售额
        //限时打折订单退款金额
        $order['limit_refund_price'] = LimitOrder::where($where)->where('status',6)->sum('pay_money');//限时打折订单的月销售额
        $order['limit_refund_money'] = LimitOrder::where($map)->where('status',6)->sum('pay_money');//限时打折订单的月销售额
        $order['limit_refund_total'] = LimitOrder::where('status',6)->sum('pay_money');//限时打折订单的总销售额

        //销售金额
        $order['today_price'] = sprintf('%.2f',$order['order_price']+$order['bargain_price']+$order['group_price']+$order['spike_price']+$order['limit_price']);
        $order['month_price'] = sprintf('%.2f',$order['order_money']+$order['bargain_money']+$order['group_money']+$order['spike_money']+$order['limit_money']);
        $order['count_price'] = sprintf('%.2f',$order['order_total']+$order['bargain_total']+$order['group_total']+$order['spike_total']+$order['limit_total']);
        //退款金额
        $order['today_refund_price'] = sprintf('%.2f',$order['order_refund_price']+$order['bargain_refund_price']+$order['group_refund_price']+$order['spike_refund_price']+$order['limit_refund_price']);
        $order['month_refund_price'] = sprintf('%.2f',$order['order_refund_money']+$order['bargain_refund_money']+$order['group_refund_money']+$order['spike_refund_money']+$order['limit_refund_money']);
        $order['count_refund_price'] = sprintf('%.2f',$order['order_refund_total']+$order['bargain_refund_total']+$order['group_refund_total']+$order['spike_refund_total']+$order['limit_refund_total']);

        //统计用户
        if (!empty($post['user_time'])){

            $time = strtotime($post['user_time']);
            $today_add_time = strtotime(date('Y-m-d 00:00:00',$time));
            $today_end_time = strtotime(date('Y-m-d 23:59:59',$time));

            $first =  date('Y-m-01', strtotime($post['user_time']));
            $month_add_time = strtotime(date('Y-m-01 00:00:00', strtotime($post['user_time'])));
            $month_end_time = strtotime(date('Y-m-d 23:59:59', strtotime("$first +1 month -1 day")));

            $where = 'add_time >= '.$today_add_time.' and add_time <= '.$today_end_time.'';
            $map = 'add_time >= '.$month_add_time.' and add_time <= '.$month_end_time.'';

            $a = 'add_time >= '.$today_add_time.' and add_time <= '.$today_end_time.'';
            $b = 'add_time >= '.$month_add_time.' and add_time <= '.$month_end_time.'';
        }else{
            $time = time();
            $date = date('Y-m-d',$time);
            $today_add_time = strtotime(date('Y-m-d 00:00:00',$time));
            $today_end_time = strtotime(date('Y-m-d 23:59:59',$time));

            $first =  date('Y-m-01', strtotime($date));
            $month_add_time = strtotime(date('Y-m-01 00:00:00', strtotime($date)));
            $month_end_time = strtotime(date('Y-m-d 23:59:59', strtotime("$first +1 month -1 day")));

            $where = 'add_time >= '.$today_add_time.' and add_time <= '.$today_end_time.'';
            $map = 'add_time >= '.$month_add_time.' and add_time <= '.$month_end_time.'';

            $a = 'add_time >= '.$today_add_time.' and add_time <= '.$today_end_time.'';
            $b = 'add_time >= '.$month_add_time.' and add_time <= '.$month_end_time.'';

        }

        $user['today_count'] = User::where($where)->count();
        $user['month_count'] = User::where($map)->count();

        //日/月访问用户
        $user['today_visit_count'] = UserCount::where($a)->count();
        $user['month_visit_count'] = UserCount::where($b)->group('uid')->count();

        //日/月访问次数
        $user['today_visit_num'] = UserCount::where($a)->sum('num');
        $user['month_visit_num'] = UserCount::where($b)->sum('num');

        $user['count'] = User::count();

        if(request()->isAjax()){
            $post = input('post.');
            $where = [];

            //商品名称搜索
            if(!empty($post['title'])){
                $where['title'] = ['like','%'.$post['title'].'%'];
            }


            $list = Goods::where($where)->order('add_time desc')->page(input('page'),20)->select();
            if ($list){
                if (!empty($post['goods_time'])){
                    $time = time();
                    $today_add_time = strtotime(date('Y-m-d 00:00:00',$time));
                    $today_end_time = strtotime(date('Y-m-d 23:59:59',$time));
                    $where = 'add_time >= '.$today_add_time.' and add_time <= '.$today_end_time.'';
                    foreach ($list as $key=>$value){
                        $list[$key]['visit'] = GoodsCount::where('goods_id',$value['id'])->where($where)->value('visit');
                        $list[$key]['number'] = GoodsCount::where('goods_id',$value['id'])->where($where)->value('number');
                        $list[$key]['add_number'] = GoodsCount::where('goods_id',$value['id'])->where($where)->value('add_number');
                        $list[$key]['buy'] = GoodsCount::where('goods_id',$value['id'])->where($where)->value('buy');
                        $list[$key]['add_count'] = GoodsCount::where('goods_id',$value['id'])->where($where)->value('add_count');
                        $list[$key]['add_num'] = GoodsCount::where('goods_id',$value['id'])->where($where)->value('add_num');
                        $list[$key]['add_money'] = GoodsCount::where('goods_id',$value['id'])->where($where)->value('add_money');
                    }
                }else{
                    foreach ($list as $key=>$value){
                        $list[$key]['visit'] = GoodsCount::where('goods_id',$value['id'])->sum('visit');
                        $list[$key]['number'] = GoodsCount::where('goods_id',$value['id'])->sum('number');
                        $list[$key]['add_number'] = GoodsCount::where('goods_id',$value['id'])->sum('add_number');
                        $list[$key]['buy'] = GoodsCount::where('goods_id',$value['id'])->sum('buy');
                        $list[$key]['add_count'] = GoodsCount::where('goods_id',$value['id'])->sum('add_count');
                        $list[$key]['add_num'] = GoodsCount::where('goods_id',$value['id'])->sum('add_num');
                        $list[$key]['add_money'] = GoodsCount::where('goods_id',$value['id'])->sum('add_money');
                    }
                }
            }
            $count = Goods::where($where)->count();
            return_ajax(200,'获取成功',$list,$count);
        }

		return $this->fetch('',[
			'order' => $order,
			'user' => $user,
		]);
	}
}