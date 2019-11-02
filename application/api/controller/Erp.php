<?php
namespace app\api\controller;
use \think\Controller;
class Erp extends Controller
{	

    /**
     * [getOrder 获取订单信息]
     * @Author   PengJun
     * @DateTime 2019-08-21
     * @return   [type]     [description]
     */
    public function getOrder()
    {   
        $post = input('post.');

        // $order = model('Order')->with('user,goods')->page($post['pageindex'],$post['pagesize'])->select();
        $order = model('Order')->with('user,goods')->page(1,20)->select();
 
        $count = model('Order')->count();
        $page = ceil($count / 20);
        $page = $page - 1;

        $info['ishasnextpage'] = $page>0?1:0;
        $info['numtotalorder'] = $count;

        $status = ['JH_01','JH_02','JH_03','JH_04','JH_14','JH_05','JH_14'];
        foreach($order as $vo){
            foreach($vo['goods'] as $val){
                $attr = json_decode($val['goods_attr'],true);
                $goods[] = [
                    'productid' => $val['goods_id'],
                    'tradegoodsno' => $val['goods_id'],
                    'tradegoodsname' => $val['goods_title'],
                    'tradegoodsspec' => $attr['spec_name'],
                    'goodscount' => $val['number'],
                    'price' => $val['goods_price'],
                    'discountmoney' => 0,
                    'taxamount' => 0,
                    'tariffamount' => 0,
                    'addedvalueamount' => 0,
                    'consumptiondutyamount' => 0,
                    'refundstatus' => 'JH_07',
                    'status' => $status[$vo['status']-1],
                    'outskuid' => 0,
                    'platgoodsid' => $val['goods_id'],
                    'platskuid' => $attr['id']
                ];
            }
            $orders[] = [
                'platorderno'            => $vo['order_no'],
                'tradestatus'            => $status[$vo['status']-1],
                'tradestatusdescription' => $vo['status_name'],
                'tradetime'              => $vo['add_time'],
                'username'               => $vo['user']['nickname'],
                'nick'                   => $vo['username'],
                'buyermobile'            => $vo['userphone'],
                'receivername'           => $vo['username'],
                'province'               => $vo['province'],
                'city'                   => $vo['city'],
                'area'                   => $vo['area'],
                'address'                => $vo['address'],
                'paytype'                => 'JH_WeiXin',
                'shouldpaytype'          => '微信付款',
                'customerremark'         => $vo['remarks'],
                'goodsfee'               => $vo['pay_money'],
                'totalamount'            => $vo['order_price'],
                'realpaymoney'           => $vo['pay_money'],
                'favourablemoney'        => $vo['coupon_money'] + $vo['point_money'] + $vo['birthday_money'] + $vo['members_money'] + $vo['full_money'],
                'taxamount'              => 0,
                'tariffamount'           => 0,
                'addedvalueamount'       => 0,
                'consumptiondutyamount'  => $vo['pay_money'],
                'commissionvalue'        => 0,
                'paytime'                => empty($vo['pay_at'])?0:date('Y-m-d H:i:s'),
                'codservicefee'          => 0,
                'sellerflag'             => 'JH_Green',
                'cardtype'               => 'JH_01',
                'ishwgflag'              => 0,
                'fetchtime'              => date('Y-m-d H:i:s'),
                'fetchtimedesc'          => date('Y-m-d H:i:s'),
                'goodinfos'              => $goods,
            ];
        }

        $info['code'] = 10000;
        $info['msg'] = '获取成功';
        $info['subcode'] = time();
        $info['submessage'] = 'SUCCESS';
        $info['polyapitotalms'] = 0;
        $info['polyapirequestid'] = 0;
        $info['orders'] = $orders;

        return json_encode($info);
    }

    public function orderShip()
    {   
        $post = input('post.');

        if($post['token'] == '5839ad824e1849bd9b8e1059f008b84a'){
            $data = json_decode($post['bizcontent'],true);
            $order = model('order')::get(['order_no'=>$data['platorderno']]);
            if($order){
                $order->status = 3;
                $order->logistics_state = 1;
                $order->logistics_name = $data['logisticname'];
                $order->logistics_no = $data['logisticno'];
                $order->logistics_time = time();
                $order->save();
            }
        }
        $info['code'] = 10000;
        $info['msg'] = '获取成功';
        $info['subcode'] = time();
        $info['submessage'] = 'SUCCESS';
        $info['polyapitotalms'] = 0;
        $info['polyapirequestid'] = 0;
        return json_encode($info);
    }
}