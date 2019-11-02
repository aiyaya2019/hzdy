<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006-2016 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: 流年 <liu21st@gmail.com>
// +----------------------------------------------------------------------
// 应用公共文件
/**
 * [p 传递数据以易于阅读的样式格式化后输出]
 * @Author   PengJun
 * @DateTime 2018-06-09
 * @param    [type]     $data [description]
 * @return   [type]           [description]
 */
function p($data){
    // 定义样式
    $str='<pre style="display: block;padding: 9.5px;margin: 44px 0 0 0;font-size: 13px;line-height: 1.42857;color: #333;word-break: break-all;word-wrap: break-word;background-color: #F5F5F5;border: 1px solid #CCC;border-radius: 4px;">';
    // 如果是boolean或者null直接显示文字；否则print
    if (is_bool($data)) {
        $show_data=$data ? 'true' : 'false';
    }elseif (is_null($data)) {
        $show_data='null';
    }else{
        $show_data=print_r($data,true);
    }
    $str.=$show_data;
    $str.='</pre>';
    echo $str;die;
}
/**
 * [toArray 查询结果转换数组]
 * @Author   PengJun
 * @DateTime 2018-09-03
 */
function toArray($array){
    $data = [];
    if(is_array($array)){
        foreach($array as $vo){
            $data[] = $vo->toArray();
        }
    } else {
        $data = $array->toArray();
    }
    
    return $data;
}
/**
 * [return_ajax ajax返回信息]
 * @Author   HTL
 * @DateTime 2017-09-25T10:12:24+0800
 * @param    integer                  $code   [状态码 默认1]
 * @param    string                   $info   [提示信息]
 * @param    array                    $data   [返回的数据]
 */
function return_ajax($code=1,$info='请求成功',$data=array(),$count=0){
   exit(json_encode(array('code'=>$code,'msg'=>$info,'data'=>$data,'count'=>$count)));
}
/**
 * 打印输出数据到文件
 * @param mixed $data
 * @param bool $replace
 * @param string|null $pathname
 */
function files($data, $replace = false, $pathname = null)
{
    is_null($pathname) && $pathname = RUNTIME_PATH . date('Ymd') . '.txt';
    $str = (is_string($data) ? $data : (is_array($data) || is_object($data)) ? print_r($data, true) : var_export($data, true)) . "\n";
    $replace ? file_put_contents($pathname, $str) : file_put_contents($pathname, $str, FILE_APPEND);
}
/**
 * [imgUpdate TP5文件上传]
 * @Author   PengJun
 * @DateTime 2018-05-10
 * @param    [type]     $fileName [文件变量名]
 * @param    [type]     $fileUrl  [文件路径]
 * @return   [type]               [description]
 */
function imgUpdate($fileName,$fileUrl='')
{   
    $fileUrl?$fileUrl:date('Ymd',time());
    // 获取表单上传文件
    $files = request()->file($fileName);
    if(is_array($files)){ //多图上传
        foreach($files as $key=>$file){
            //进行大小，文件后缀验证，通过移动到public/uploads/pet 目录下
            $info = $file->validate(['size'=>31457280,'ext'=>'jpeg,jpg,png,gif,mp4,zip,rar'])->move(ROOT_PATH.'public'.DS.'uploads'.DS.$fileUrl);
            if($info){
                //获取文件名称 并将路径中的 \ 替换成 / 
                $data[$key] = '/uploads'.$fileUrl.'/'.str_replace("\\",'/',$info->getSaveName());
            }else{
                $str = '第'.($key+1).'个文件上传失败,失败原因:'.$file->getError();
                return ['code'=>400,'msg'=>$str];
            }
        }
    }else{ //单图上传
        //进行大小，文件后缀验证，通过移动到public/uploads/pet 目录下
        $info = $files->validate(['size'=>31457280,'ext'=>'jpeg,jpg,png,gif,mp4,zip,rar,xls,xlsx'])->move(ROOT_PATH.'public'.DS.'uploads'.DS.$fileUrl);
        if($info){
            //获取文件名称 并将路径中的 \ 替换成 /
            $data = '/uploads'.$fileUrl.'/'.str_replace("\\",'/',$info->getSaveName());
        }else{
            $str = '文件上传失败,失败原因:'.$files->getError();
            return ['code'=>400,'msg'=>$str];
        }
    }
    return ['code'=>200,'msg'=>'上传成功','data'=>$data];
}
/**
 * [str_cut 字符截取]
 * @Author   PengJun
 * @DateTime 2018-07-19
 * @param    [type]     &$string [字符串]
 * @param    [type]     $start   [开始下标]
 * @param    [type]     $length  [长度]
 * @param    string     $charset [编码]
 * @param    string     $dot     [后缀]
 */
function str_cut($string, $start, $length, $charset = "utf-8", $dot = '...') {
    if(function_exists('mb_substr')) {
        if(mb_strlen($string, $charset) > $length) {
            return mb_substr ($string, $start, $length, $charset) . $dot;
        }
        return mb_substr ($string, $start, $length, $charset);
        
    }else if(function_exists('iconv_substr')) {
        if(iconv_strlen($string, $charset) > $length) {
            return iconv_substr($string, $start, $length, $charset) . $dot;
        }
        return iconv_substr($string, $start, $length, $charset);
    }
    $charset = strtolower($charset);
    switch ($charset) {
        case "utf-8" :
            preg_match_all("/[\x01-\x7f]|[\xc2-\xdf][\x80-\xbf]|\xe0[\xa0-\xbf][\x80-\xbf]|[\xe1-\xef][\x80-\xbf][\x80-\xbf]|\xf0[\x90-\xbf][\x80-\xbf][\x80-\xbf]|[\xf1-\xf7][\x80-\xbf][\x80-\xbf][\x80-\xbf]/", $string, $ar);
            if(func_num_args() >= 3) {
                if (count($ar[0]) > $length) {
                    return join("", array_slice($ar[0], $start, $length)) . $dot;
                }
                return join("", array_slice($ar[0], $start, $length));
            } else {
                return join("", array_slice($ar[0], $start));
            }
            break;
        default:
            $start = $start * 2;
            $length   = $length * 2;
            $strlen = strlen($string);
            for ( $i = 0; $i < $strlen; $i++ ) {
                if ( $i >= $start && $i < ( $start + $length ) ) {
                    if ( ord(substr($string, $i, 1)) > 129 ) $tmpstr .= substr($string, $i, 2);
                    else $tmpstr .= substr($string, $i, 1);
                }
                if ( ord(substr($string, $i, 1)) > 129 ) $i++;
            }
            if ( strlen($tmpstr) < $strlen ) $tmpstr .= $dot;
            
            return $tmpstr;
    }
}
/**
 * 
 * 产生随机字符串，不长于32位
 * @param int $length
 * @return 产生的随机字符串
 */
function getNonceStr($length = 32) 
{
    $chars = "abcdefghijklmnopqrstuvwxyz0123456789";  
    $str ="";
    for ( $i = 0; $i < $length; $i++ )  {  
        $str .= substr($chars, mt_rand(0, strlen($chars)-1), 1);  
    } 
    return $str;
}
/**
 * 获取一定范围内的随机数字
 * 跟rand()函数的区别是 位数不足补零 例如
 * rand(1,9999)可能会得到 465
 * rand_number(1,9999)可能会得到 0465  保证是4位的
 * @param integer $min 最小值
 * @param integer $max 最大值
 * @return string
 */
function rand_number ($min=1, $max=999999) {
    return sprintf("%0".strlen($max)."d", mt_rand($min,$max));
}
/**
 * 传入时间戳,计算距离现在的时间
 * @param  number $time 时间戳
 * @return string       返回多少以前
 */
function word_time($time) {
    $time = (int) substr($time, 0, 10);
    $int = time() - $time;
    $str = '';
    if ($int <= 2){
        $str = sprintf('刚刚', $int);
    }elseif ($int < 60){
        $str = sprintf('%d秒前', $int);
    }elseif ($int < 3600){
        $str = sprintf('%d分钟前', floor($int / 60));
    }elseif ($int < 86400){
        $str = sprintf('%d小时前', floor($int / 3600));
    }else{
        $str = date('Y-m-d', $time);
    }
    return $str;
}
/**
 * 使用curl获取远程数据
 * @param  string $url url连接
 * @return string      获取到的数据
 */
function curl_get_contents($url){
    $ch=curl_init();
    curl_setopt($ch, CURLOPT_URL, $url);                //设置访问的url地址
    // curl_setopt($ch,CURLOPT_HEADER,1);               //是否显示头部信息
    curl_setopt($ch, CURLOPT_TIMEOUT, 5);               //设置超时
    curl_setopt($ch, CURLOPT_USERAGENT, $_SERVER['HTTP_USER_AGENT']);   //用户访问代理 User-Agent
    curl_setopt($ch, CURLOPT_REFERER,$_SERVER['HTTP_HOST']);        //设置 referer
    curl_setopt($ch,CURLOPT_FOLLOWLOCATION,1);          //跟踪301
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);        //返回结果
    curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false); //不验证证书
    curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, false); //不验证证书
    $r=curl_exec($ch);
    curl_close($ch);
    return $r;
}
/**
 * 通过CURL发送HTTP请求
 * @param string $url  //请求URL
 * @param array $postFields //请求参数 
 * @return mixed
 */
 function curlPost($url,$postFields=[]){
    //$postFields = http_build_query($postFields);
    $ch = curl_init ();
    curl_setopt ( $ch, CURLOPT_POST, 1 );
    curl_setopt ( $ch, CURLOPT_HEADER, 0 );
    curl_setopt ( $ch, CURLOPT_RETURNTRANSFER, 1 );
    curl_setopt ( $ch, CURLOPT_URL, $url );
    curl_setopt ( $ch, CURLOPT_POSTFIELDS, $postFields );
    curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false); //不验证证书
    curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, false); //不验证证书
    $result = curl_exec ( $ch );
    curl_close ( $ch );
    return $result;
}
/**
 * [isPhone 检测手机号格式]
 * @Author   PengJun
 * @DateTime 2018-06-22
 * @param    [type]     $data [description]
 * @return   boolean          [description]
 */
function isPhone($data) {
    $search ='/^1(3|4|5|6|7|8|9)\d{9}$/';
    if (preg_match($search, $data)) {
        return true;
    } else {
        return false;
    }
}
/**
 * [replaceSpecialChar 过滤特殊字符]
 * @Author   PengJun
 * @DateTime 2019-01-19
 * @param    [type]     $strParam [description]
 */
function replaceSpecialChar($strParam){
    $regex = "/\/|\~|\!|\@|\#|\\$|\%|\^|\&|\*|\+|\{|\·|\}|\:|\<|\>|\?|\[|\]|\,|\s|\.|\/|\;|\'|\`|\=|\\\|\|/";
    return preg_replace($regex,"",$strParam);
}
// 过滤掉emoji表情
function filterEmoji($str)
{
  $str = preg_replace_callback( '/./u',
      function (array $match) {
        return strlen($match[0]) >= 4 ? '' : $match[0];
      },
      $str);
   return $str;
}
/**
 * Emoji原形转换为String
 * @param string $content
 * @return string
 */
function emojiEncode($content)
{
    return json_decode(preg_replace_callback("/(\\\u[ed][0-9a-f]{3})/i", function ($str) {
        return addslashes($str[0]);
    }, json_encode($content)));
}
/**
 * Emoji字符串转换为原形
 * @param string $content
 * @return string
 */
function emojiDecode($content)
{
    return json_decode(preg_replace_callback('/\\\\\\\\/i', function () {
        return '\\';
    }, json_encode($content)));
}
/**
 * excel表格导出
 * @param string $fileName 文件名称
 * @param array $headArr 表头名称
 * @param array $data 要导出的数据
 * @author static7  
 * */
function excelExport($fileName = '', $headArr = [], $data = []) {
    import('PHPExcel.Classes.PHPExcel',EXTEND_PATH);
    $fileName .= "_".date("Ymdhis",time()).".xls";

    $objPHPExcel = new \PHPExcel();
    $objPHPExcel->getProperties();
    $key = ord("A"); // 设置表头
    foreach ($headArr as $v) {
        $colum = chr($key);
        $objPHPExcel->setActiveSheetIndex(0)->setCellValue($colum . '1', $v);
        $objPHPExcel->setActiveSheetIndex(0)->setCellValue($colum . '1', $v);
        $key += 1;
    }
    $column = 2;
    $objActSheet = $objPHPExcel->getActiveSheet();
    foreach ($data as $key => $rows) { // 行写入
        $span = ord("A");
        foreach ($rows as $keyName => $value) { // 列写入
            $objActSheet->setCellValue(chr($span) . $column, $value);
            $span++;
        }
        $column++;
    }
    $fileName = iconv("utf-8", "gb2312", $fileName); // 重命名表
    $objPHPExcel->setActiveSheetIndex(0); // 设置活动单指数到第一个表,所以Excel打开这是第一个表
    ob_end_clean();
    header('Content-Type: application/vnd.ms-excel');
    header("Content-Disposition: attachment;filename=".$fileName."");
    header('Cache-Control: max-age=0');
    $objWriter = \PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel5');
    $objWriter->save('php://output'); // 文件通过浏览器下载
    exit();
}

/**
 * [insert_excel 读取Excel表格信息]
 * @Author   PengJun
 * @DateTime 2018-11-06
 * @param    [type]     $file [表格文件地址]
 */
function insert_excel($file)
{
    import('PHPExcel.Classes.PHPExcel',EXTEND_PATH);
    $PHPExcel = new \PHPExcel();

    if ($file) {
        //获取文件后缀
        $name = substr(strrchr($file,'.'),1);
        if($name == 'xlsx'){
            $objReader = PHPExcel_IOFactory::createReader('Excel2007');
        }else{
            $objReader = PHPExcel_IOFactory::createReader('Excel5');
        }
        $obj_PHPExcel =$objReader->load($file, $encode = 'utf-8');
        //加载文件内容,编码utf-8
        $excel_array=$obj_PHPExcel->getsheet(0)->toArray();
        // print_r($excel_array);die;
        //转换为数组格式
        array_shift($excel_array);
        return $excel_array;
        //批量插入数据
    }
}

/**
 * [saves 公共添加/编辑方法]
 * @Author   PengJun
 * @DateTime 2019-05-15
 * @param    [type]     $model     [description]
 * @param    [type]     $data      [description]
 * @param    boolean    $is_return [description]
 * @return   [type]                [description]
 */
function save($model,$data,$is_return=false)
{
    $table = model($model);
    $data['update_time'] = time();
    if(empty($data['id'])){
        //新增
        $data['add_time'] = time();
        if($table->allowField(true)->save($data)){
            if($is_return == true){
                return $table->id;
            } else {
                return_ajax(200,'保存成功',$table->id);
            }
        } else {
            if($is_return == true){
                return false;
            } else {
                return_ajax(400,'保存失败,请稍后重试');
            }
        }
    } else {
        //编辑
        if($table->allowField(true)->save($data,['id'=>$data['id']])){
            if($is_return == true){
                return $data['id'];
            } else {
                return_ajax(200,'保存成功');
            }
        } else {
            if($is_return == true){
                return false;
            } else {
                return_ajax(400,'保存失败,请稍后重试');
            }
        }
    }
}

// 订单号
function get_order_sn(){
    return date('YmdHi') . str_pad(mt_rand(1, 99999), 4, '0', STR_PAD_LEFT);
}

function order_no($no, $table)
{
    $table = model($table);
    $order_no = date('YmdHi').rand_number(0,999999);
    $is = $table->where($no, $order_no)->find();
    if($is){
        order_no($table);
    } else {
        return $order_no;
    }
}

/**
 * [order_sn 生成订单编号]
 * @Author   PengJun
 * @DateTime 2019-05-26
 * @return   [type]     [description]
 */
function order_sn($table)
{
    $table = model($table);
    $order_sn = date('YmdHi').rand_number(0,999999);
    $is = $table->where('order_sn',$order_sn)->find();
    if($is){
        order_sn($table);
    } else {
        return $order_sn;
    }
}

/**
 * [randomFloat 生成带小数的随机数]
 * @Author   PengJun
 * @DateTime 2019-07-13
 * @param    integer    $min [description]
 * @param    integer    $max [description]
 */
function randomFloat($min = 0, $max = 10)
{
    $num = $min + mt_rand() / mt_getrandmax() * ($max - $min);
    return sprintf("%.2f", $num);
}

	/**
	 * 生成随机数
	 * @param  [type]  $type  [类型，1：订单号，2随机数]
	 * @param  integer $num   [数量]
	 * @return [type]         [字符串]
	 */
	function randomCode($type=1,$num=8){
      $s = '';
		if ($type==1) {
			$str = "1234567890";//输出字符集
			$len = strlen($str)-1;
			for($i=0 ; $i<20; $i++){
				$s.= $str[rand(0,$len)];
			}
			$str = date('YmdHis').substr($s,5,$num) ;
		}else{
			$str = "123456789qwertyuiopasdfghjklzxcvbnm";//输出字符集
			$len = strlen($str)-1;
			for($i=0 ; $i<30; $i++){
				$s.= $str[rand(0,$len)];
			}
			$str = str_shuffle(date('YmdHis').$s);
			$str = substr($str,5,$num);
		}
		return $str;
	}

/**
 * [price 用户余额记录]
 * @Author   PengJun
 * @DateTime 2019-05-07
 * @param    [type]     $type  [类型 1收入 2支出]
 * @param    [type]     $uid   [用户ID]
 * @param    [type]     $price [金额 收入传正数 支出传负数]
 * @param    [type]     $desc  [原因]
 * @param    [type]     $new_uid  [新用户id]
 */
function price($type,$uid,$price,$desc,$new_uid=0)
{
    $table = model('user_money');

    $data = [
        'type'        => $type,
        'money'       => $price,
        'uid'         => $uid,
        'desc'        => $desc,
        'new_uid'        => $new_uid,
        'add_time'    => time(),
        'update_time' => time(),
    ];

    if($table->insert($data)){
        return true;
    } else {
        return false;
    }
}

/**
 * [point 积分记录]
 * @Author   PengJun
 * @DateTime 2019-05-07
 * @param    [type]     $type  [类型 1签到获得  2兑换商品 3抵扣 4兑换优惠券]
 * @param    [type]     $uid   [用户ID]
 * @param    [type]     $point [积分 收入传正数 支出传负数]
 * @param    [type]     $desc  [原因]
 * @param    [type]     $pay_type  [类型 1收入 2支出]
 */
function point($type,$uid,$point,$pay_type,$desc)
{
    $table = model('point_change');

    $data = [
        'type'        => $type,
        'point'       => $point,
        'uid'         => $uid,
        'desc'        => $desc,
        'pay_type'        => $pay_type,
        'add_time'    => time(),
        'update_time' => time(),
    ];

    if($table->insert($data)){
        return true;
    } else {
        return false;
    }
}