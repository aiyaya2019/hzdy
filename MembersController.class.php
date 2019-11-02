<?php
namespace Api\Controller;
use Think\Controller;
use Think\Vender;
class MembersController extends CommonController {
    //收藏问题
    public function collectProblem()
    {
        $request = json_decode(file_get_contents("php://input"),1);
        $request = $request?$request:I('post.');
        if (!$request['problem_id']){
            echo encode(array('code'=>2,'msg'=>"缺少相应参数id"));return;
        }
        if (!$request['members_id']){
            echo encode(array('code'=>2,'msg'=>"缺少相应参数members_id"));return;
        }
        $where['problem_id'] = $request['problem_id'];
        $where['members_id'] = $request['members_id'];
        $query = $this->finddata('collect',$where);
        if ($query){
            echo encode(array('code'=>6,'msg'=>'问题已收藏'));return;
        }
        $where['my_answer'] = $request['answer_id'];
        $where['type'] = $request['type'];
        $data = $this->adddata('collect',$where);
        if($data){
            echo encode(array('code'=>6,'msg'=>'问题已收藏'));
        }else{
            echo encode(array('code'=>2,'msg'=>"问题收藏失败"));
        }
    }
    //获取我的收藏列表
    public function getCollect()
    {
        $request = json_decode(file_get_contents("php://input"),1);
        $request = $request?$request:I('post.');
        $members_id = $request['members_id'];
        $type = $request['type'];
        if(!$members_id){
            echo encode(array('code'=>2,'msg'=>'缺少必要参数id')); return;
        }
        $where['members_id'] = $members_id;
        if ($type){
            $where['type'] = $type;
        }
        $collect = D('CollectRelation')->relation(true)->where($where)->select();
        foreach($collect as $k=> $v){
            $answer =$this->selectdata('answer',array('problem_id'=>$v['problem_id']),'id,answer');
            $collect[$k]['answer_list'] = $answer;
        }
        if ($collect){
            echo encode(array('code'=>6,'msg'=>'获取成功','data'=>$collect));
        }else{
            echo encode(array('code'=>2,'msg'=>'暂时还没有收藏'));
        }
    }
    //取消收藏
    public function cancelCollect()
    {
        $request = json_decode(file_get_contents("php://input"),1);
        $request = $request?$request:I('post.');
        if (!$request['problem_id'] || !$request['members_id']){
            echo encode(array('code'=>2,'msg'=>"缺少相应参数id"));return;
        }
        $where['members_id'] = array('eq',$request['members_id']);

        if ($request['problem_id'] == 'all' && $request['type']){   //如果传递参数为all，类型存在，取消该用户所有错题收藏
            $where['type'] = array('eq',1);
        }elseif($request['problem_id'] == 'all'){//如果传递参数为all，类型不存在，取消该用户所有收藏

        }elseif(is_array($request['problem_id'])){  //如果问题id为数组
            $where['problem_id'] = array('in',$request['problem_id']);
        }else{
            $where['problem_id'] = array('eq',$request['problem_id']);
        }

        $rs = $this->deletedata('collect',$where);
        if ($rs){
            echo encode(array('code'=>6,'msg'=>'取消收藏成功'));
        }else{
            echo encode(array('code'=>5,'msg'=>'取消收藏失败'));
        }
    }
    //排行榜
    public function getUserSort()
    {
        $request = json_decode(file_get_contents("php://input"),1);
        $request = $request?$request:I('post.');
        if (!$request['members_id']){
            echo encode(array('code'=>2,'msg'=>'缺少必要参数id')); return;
        }
        if (!$request['type']){
            echo encode(array('code'=>2,'msg'=>'缺少必要参数type')); return;
        }
        if (!$request['area']){
            echo encode(array('code'=>2,'msg'=>'缺少必要参数area')); return;
        }
        //查询用户信息
        $userInfo = $this->finddata('members',array('id'=>$request['members_id']),'two_department_id,department_id');
        //本月起始时间戳
        $beginThismonth=mktime(0,0,0,date('m'),1,date('Y'));
        //当前时间
        $time = time();
        $pageSize = 20;
        if (!$request['p']){
            $request['p'] = 1;
        }
        $limit = ($request['p'] -1)* $pageSize;
        if ($request['type'] == 1){                             //总榜
            if ($request['area'] == 1){         //部门
                $sql = "SELECT AVG(m.point) as avg_point,m.department_id FROM tbkl_department d JOIN tbkl_members m  GROUP BY m.department_id  ORDER BY avg_point DESC limit ".$limit . ",".$pageSize;
            }elseif($request['area'] == 2){    //二级部门
                $sql = "SELECT AVG(m.point) as avg_point,m.two_department_id FROM tbkl_two_department d JOIN tbkl_members m  GROUP BY m.two_department_id  ORDER BY avg_point DESC limit ".$limit . ",".$pageSize;
            }else{      //获取所有用户排名
                $sql = "SELECT id,username,headimgurl,point,department_id,two_department_id FROM tbkl_members  ORDER BY point DESC LIMIT ".$limit.",10";
                $sql1 = "SELECT id,username,headimgurl,point,department_id,two_department_id FROM tbkl_members  ORDER BY point DESC";
            }
        }else{                                                       //月榜
            if ($request['area'] == 1){               //部门
                $sql = "SELECT AVG(p.point) as avg_point,t.name,t.pic from tbkl_point_change p JOIN tbkl_department t WHERE p.department_id = t.id GROUP BY department_id ORDER BY avg_point limit ".$limit . ",".$pageSize;
            }elseif($request['area'] == 2){          //二级部门
                $sql = "SELECT AVG(p.point) as avg_point,t.name,t.pic from tbkl_point_change p JOIN tbkl_two_department t WHERE p.two_department_id = t.id GROUP BY two_department_id ORDER BY avg_point limit ".$limit . ",".$pageSize;
            }else{                                  //个人
                $sql = "SELECT SUM(a.point) as point,a.members_id as id,b.username,b.headimgurl,b.department_id,b.two_department_id FROM tbkl_point_change a JOIN tbkl_members b ON a.members_id = b.id where a.create_time >= ".$beginThismonth ." AND a.create_time <= ".$time ."  GROUP BY members_id order by point desc limit ".$limit.",10";
                $sql1 = "SELECT SUM(a.point) as point,a.members_id as id,b.username,b.headimgurl FROM tbkl_point_change a JOIN tbkl_members b ON a.members_id = b.id where a.create_time >= ".$beginThismonth ." AND a.create_time <= ".$time ."  GROUP BY members_id order by point desc";
            }
        }
        $data = M()->query($sql);
        if ($request['type'] == 1){
            if ($request['area'] == 1 ){
                foreach ($data as $k => $v){
                    $name = $this->finddata('department',array('id'=>$v['department_id']),'name');
                    $data[$k]['name'] = $name;
                }
            }
            if ($request['area'] == 2 ){
                foreach ($data as $k => $v){
                    $name = $this->finddata('two_department',array('id'=>$v['two_department_id']),'name');
                    $data[$k]['name'] = $name;
                }
            }
        }
        if ($request['area'] == 3) {     //如果是个人排名，计算胜利场次
            $data1 = M()->query($sql1);
            foreach ($data as $k => $v) {     //胜利场次
                if ($request['type'] == 1) {
                    $win_count = $this->countdata('answer_list', array('members_id' => $v['id'], 'type' => 3, 'win' => 1));
                } else {
                    $where2['members_id'] = array('eq', $v['id']);
                    $where2['type'] = array('eq', 3);
                    $where2['win'] = array('eq', 1);
                    $where2['create_time'] = array('EGT', $beginThismonth);
                    $where2['create_time'] = array('ELT', $time);
                    $win_count = $this->countdata('answer_list', $where2);

                }
                $data[$k]['win_count'] = $win_count ? $win_count : 0;
                if (!$v['headimgurl']) $data[$k]['headimgurl'] = "/Uploads/Index/headimg/default.jpg";

                $department = $this->finddata('department', array('id' => $v['department_id']), 'name');
                $two_department = $this->finddata('two_department', array('id' => $v['two_department_id']), 'name');
                $data[$k]['department'] = $department;
                $data[$k]['two_department'] = $two_department;
            }
            foreach ($data1 as $k => $v){
                if ($request['type'] == 1) {
                    $win_count = $this->countdata('answer_list', array('members_id' => $v['id'], 'type' => 3, 'win' => 1));
                } else {
                    $where2['members_id'] = array('eq', $v['id']);
                    $where2['type'] = array('eq', 3);
                    $where2['win'] = array('eq', 1);
                    $where2['create_time'] = array('EGT', $beginThismonth);
                    $where2['create_time'] = array('ELT', $time);
                    $win_count = $this->countdata('answer_list', $where2);

                }
                $data1[$k]['win_count'] = $win_count ? $win_count : 0;
            }
            $point2 = array();
            $win_count2 = array();
            foreach ($data1 as $k => $v) {
                $point2[$k] = $v['point'];
                $win_count2[$k] = $v['win_count'];
            }
            array_multisort($point2, SORT_DESC, $win_count2, SORT_DESC, $data1);//按积分和胜场排序
            $point1 = array();
            $win_count1 = array();
            foreach ($data as $k => $v) {
                $point1[$k] = $v['point'];
                $win_count1[$k] = $v['win_count'];
            }
            array_multisort($point1, SORT_DESC, $win_count1, SORT_DESC, $data);//按积分和胜场排序
            //获取我的排名
            $my_sort = 0;
            foreach ($data1 as $k => $v) {
                if ($v['id'] == $request['members_id']) $my_sort = $k + 1;
            }
            //获取我的信息
            $members = $this->finddata('members', array('id' => $request['members_id']), '');
            $my_point = $members['point'];
            $headimgurl = $members['headimgurl'];
            $username = $members['username'];
            $department_id = $members['department_id'];
            $two_department_id = $members['two_department_id'];
            $department = $this->finddata('department', array('id' => $department_id), 'name');
            $two_department = $this->finddata('two_department', array('id' => $two_department_id), 'name');
            $myInfo['point'] = $my_point;
            $myInfo['headimgurl'] = $headimgurl ? $headimgurl:"/Uploads/Index/headimg/default.jpg";
            $myInfo['username'] = $username;
            $myInfo['department'] = $department;
            $myInfo['two_department'] = $two_department;
            if ($request['type'] == 1) {
                $myInfo['win_count'] = $this->countdata('answer_list', array('members_id' => $request['members_id'], 'type' => 3, 'win' => 1));

            }
            if ($request['type'] == 2) {
                $sql = "select SUM(point) as point from tbkl_point_change WHERE members_id = " . $request['members_id'] . " AND msg LIKE '%对战切磋%' AND create_time >= " . $beginThismonth;
                $my_point = M()->query($sql);
                $my_point = $my_point[0]['point'] ? $my_point[0]['point'] : 0;
                $myInfo['point'] = $my_point;
                $where2['members_id'] = array('eq', $request['members_id']);
                $where2['type'] = array('eq', 3);
                $where2['win'] = array('eq', 1);
                $where2['create_time'] = array('EGT', $beginThismonth);
                $where2['create_time'] = array('ELT', $time);
                $myInfo['win_count'] = $this->countdata('answer_list', $where2);
            }
            if ($request['type'] == 1 && $request['area'] == 1) {
                foreach ($data as $k => $v) {
                    $name = $this->finddata('department', array('id' => $v['department_id']), 'name,pic');
                    $data[$k]['name'] = $name['name'];
                    $data[$k]['pic'] = $name['pic'];
                    unset($data[$k]['department_id']);
                }
            }
            if ($request['type'] == 1 && $request['area'] == 2) {
                foreach ($data as $k => $v) {
                    $name = $this->finddata('two_department', array('id' => $v['two_department_id']), 'name,pic');
                    $data[$k]['name'] = $name['name'];
                    $data[$k]['pic'] = $name['pic'];
                    unset($data[$k]['two_department_id']);
                }
            }
        }
        if ($data){
            echo encode(array('code'=>6,'msg'=>'获取成功','data'=>$data,'my_sort'=>$my_sort,'myInfo'=>$myInfo));
        }elseif(!$data && $request['p']>1){
            echo encode(array('code'=>3,'msg'=>'已经到底了'));
        }else{
            echo encode(array('code'=>4,'msg'=>'暂时没有排名信息'));
        }
    }
    //对战历史
    public function getWarHistory()
    {
        $request = json_decode(file_get_contents("php://input"),1);
        $request = $request?$request:I('post.');
        $members_id = $request['members_id'];
        if (!$members_id){
            echo encode(array('code'=>2,'msg'=>"缺少相应参数id"));return;
        }
        $count = $this->countdata('answer_list',array('members_id'=>$members_id,'type'=>3)); //对战总场数
        $win = $this->countdata('answer_list',array('members_id'=>$members_id,'type'=>3,'win'=>1)); //对战胜利场次
        $point =$this->finddata('members',array('id'=>$members_id),'point');//积分
        $where['point'] = array('elt',$point);
        $res = $this->selectdata('level',$where,'name,pic,level,point','point DESC');//查出比自己积分少的等级 倒序
        $where['point'] = array('egt',$point);
        $res1 = $this->selectdata('level',$where,'level,point','point ASC');//查出比自己积分多的等级 升序
        $level = $res[0]['level'];      //我的等级
        $next_level = round(($point -  $res[0]['point'])/($res1[0]['point']-$res[0]['point']) * 100,1);//求出距离下一等级百分比，保留一位小数
        $star = $point - $res[0]['point'];
        $data['level'] = $level;
        $data['star'] = $star;
        $data['next_level'] = $next_level;
        $data['name'] = $res[0]['name'];
        $data['pic'] = $res[0]['pic'];
        $data['count'] = $count;
        $data['win'] = $win;
        $data['point'] = $point;
        echo encode(array('code'=>6,'msg'=>'获取成功','data'=>$data));
    }
    //设置回答记录
    public function setAnswerList()
    {
        $request = json_decode(file_get_contents("php://input"),1);
        $request = $request?$request:I('post.');
        if (!$request['members_id'] || !$request['answer_id'] || !$request['problem_id']){
            echo encode(array('code'=>2,'msg'=>"缺少相应参数id"));return;
        }
        if (!$request['type']){
            echo encode(array('code'=>2,'msg'=>"缺少相应类型type参数"));return;
        }
        if (!$request['is_new_match']){
            echo encode(array('code'=>2,'msg'=>"缺少相应参数is_new_match"));return;
        }
        if ($request['is_new_match']==1){
            if (!$request['id']){
                echo encode(array('code'=>2,'msg'=>"缺少相应参数id"));return;
            }
        }
        $answer =  array($request['problem_id'] =>$request['answer_id']); //将问题id和答案id 以键值保存为数组
        $data['members_id'] = $request['members_id'];
        $data['type'] = $request['type'];
        if ($request['is_new_match'] == 2){                  //判断是否是新比赛  如果是
            $data['answer'] = encode($answer);
            $data['create_time'] = time();
            $problem_cate_id = $this->finddata('problem',array('id'=>$request['problem_id']),'problem_cate_id');
            $data['problem_cate_id'] = $problem_cate_id;
            $res = $this->adddata('answer_list',$data);
            if ($res){
                echo encode(array('code'=>6,'msg'=>'记录成功','data'=>$res));
            }else{
                echo encode(array('code'=>5,'msg'=>'记录失败'));
            }
        }elseif($request['is_new_match'] == 1){
            $rs = $this->finddata('answer_list',array('id'=>$request['id']),'');
            $answer_list = json_decode($rs['answer'],true); //将数据库取出的answer 转换为数组
            $answer_list[$request['problem_id']] = $request['answer_id'];//将新答案以键值方式添加进数组
            $data['answer'] = encode($answer_list);
            $res = $this->savedata('answer_list',$data,array('id'=>$rs['id']));
            if ($res){
                echo encode(array('code'=>6,'msg'=>'记录成功'));
            }else{
                echo encode(array('code'=>5,'msg'=>'记录失败,可能已存在同样的问题和答案'));
            }
        }


    }
    //输赢判断
    public function getWhoWin()
    {
        //
        $request = json_decode(file_get_contents("php://input"),1);
        $request = $request?$request:I('post.');
        if (!$request['members_id'] || !$request['b_members_id']){
            echo encode(array('code'=>2,'msg'=>'缺少相应参数id'));return;
        }
        $sql = "SELECT answer FROM tbkl_answer_list WHERE members_id = ".$request['members_id']." AND type = 3 ORDER BY id DESC LIMIT 1";//查询最近一次对战的答案
        $b_sql = "SELECT answer FROM tbkl_answer_list WHERE members_id = ".$request['b_members_id']." AND type = 3 ORDER BY id DESC LIMIT 1";
        $rs = M()->query($sql);
        $rs1 = M()->query($b_sql);
        if (!$rs){
            echo encode(array('code'=>4,'msg'=>'没有您的答题记录'));return;
        }
        if (!$rs1){
            echo encode(array('code'=>4,'msg'=>'没有对手的答题记录'));return;
        }
        $my_answer = json_decode($rs[0]['answer'],true);         //将json转化为数组
        $b_answer = json_decode($rs1[0]['answer'],true);
        $my_score = 0;      //初始化我的正确条数
        $b_score = 0;      //初始化对手的正确条数
        foreach ($my_answer as $k => $v){   //获取我的正确条数
            $data = $this->finddata('problem',array('id'=>$k),'answer_id,score');
            if ($data['answer_id'] == $v){
                $my_score += 1;
            }
        }
        foreach ($b_answer as $k => $v){   //获取对手的正确条数
            $data = $this->finddata('problem',array('id'=>$k),'answer_id,score');
            if ($data['answer_id'] == $v){
                $b_score += 1;
            }
        }
        $this->setMatchData($request['members_id'],$my_score,$b_score);

    }
    //胜负处理
    public function setMatchData($members_id,$score,$b_score)
    {
        if (!$members_id){
            echo encode(array('code'=>2,'msg'=>"缺少相应参数id"));return;
        }
        $where['create_time'] = time();
        $where['msg'] = '对战切磋胜利';
        $where['members_id'] = $members_id;
        $where['point'] = 1;
        $department = $this->finddata('members',array('id'=>$members_id),'point,two_department_id,department_id');
        $where['two_department_id'] = $department['two_department_id'];
        $where['department_id'] = $department['department_id'];
        if ($score > $b_score){
            //更新积分变化表
            $beginToday=mktime(0,0,0,date('m'),date('d'),date('Y'));//今日开始时间戳
            $nowTime = time();
            $sql = "SELECT SUM(point) as point FROM tbkl_point_change WHERE create_time >= ".$beginToday." AND create_time <= ".$nowTime." AND members_id = ".$members_id;
            $max_point = $this->finddata('base','','max_point');//获取每日最大积分上限
            $todayPoint = M()->query($sql);
            if ($todayPoint[0]['point'] < $max_point){
                $rs = $this->adddata('point_change',$where);
            }
            //更新答题列表胜负
            $sql = "SELECT id FROM tbkl_answer_list WHERE members_id = ".$members_id." AND type = 3 ORDER BY id DESC LIMIT 1";//查询最近一次我的对战切磋id
            $rs1 = M()->query($sql);
            $data['win'] = 1;
            $res = $this->savedata('answer_list',$data,array('id'=>$rs1[0]['id']));
            if ($rs && $res){
                echo encode(array('code'=>6,'msg'=>"积分变化表和胜负记录已更新"));return;
            }
            if (!$rs && $res){
                echo encode(array('code'=>6,'msg'=>"胜负记录已更新，积分变化表更新失败"));return;
            }
            if ($rs && !$res){
                echo encode(array('code'=>6,'msg'=>"积分变化表已更新,胜负记录更新失败"));return;
            }
        }elseif(($score == $b_score)){
            //更新积分变化表
            $beginToday=mktime(0,0,0,date('m'),date('d'),date('Y'));//今日开始时间戳
            $nowTime = time();
            $sql = "SELECT SUM(point) as point FROM tbkl_point_change WHERE create_time >= ".$beginToday." AND create_time <= ".$nowTime." AND members_id = ".$members_id;
            $max_point = $this->finddata('base','','max_point');
            $todayPoint = M()->query($sql);
            if ($todayPoint[0]['point'] < $max_point){
                $rs = $this->adddata('point_change',$where);
            }
            if ($rs){
                echo encode(array('code'=>5,'msg'=>"平局,更新积分成功"));return;
            }
        }else{
            //获取我的等级
            $where1['point'] = array('elt',$department['point']);
            $res = $this->selectdata('level',$where1,'level','point DESC');//查出比自己积分少的等级 倒序
            $now_level = $this->selectdata('level',array('level'=>$res[0]['level']),'point','point ASC');
            $now_level_lower_point = $now_level[0]['point'];//当前等级最低积分
            if ($now_level_lower_point < $department['point']) {//如果当前积分大于当前等级最低积分
                $where['msg'] = '对战切磋失败';
                $where['point'] = -1;
                $this->adddata('point_change', $where);
            }
            echo encode(array('code'=>3,'msg'=>"很遗憾,您失败了,再来一局吧！"));return;
        }
    }
    //获得对手答案
    public function getMatchAnswer()
    {
        $request = json_decode(file_get_contents("php://input"),1);
        $request = $request?$request:I('post.');
        if (!$request['b_members_id'] || !$request['members_id']){
            echo encode(array('code'=>2,'msg'=>'缺少相应参数id'));return;
        }
        if (!$request['problem_id']){
            echo encode(array('code'=>2,'msg'=>'缺少相应参数id'));return;
        }
        $sql = "SELECT answer FROM tbkl_answer_list WHERE members_id = ".$request['members_id']." AND type = 3 ORDER BY id DESC LIMIT 1";//查询最近一次对战的答案
        $b_sql = "SELECT answer,id FROM tbkl_answer_list WHERE members_id = ".$request['b_members_id']." AND type = 3 ORDER BY id DESC LIMIT 1";
        $rs = M()->query($sql);
        $rs1 = M()->query($b_sql);
        $members_answer = $rs[0]['answer'];
        $b_members_answer = $rs1[0]['answer'];
        $members_answer = json_decode($members_answer,true);        //将取出的json转换成数组
        $b_members_answer = json_decode($b_members_answer,true);
        if ($b_members_answer[$request['problem_id']]){  //如果对方该题答案有值，表示已答题
            $b_new_answer = $b_members_answer[$request['problem_id']];
            echo encode(array('code'=>6,'msg'=>"获取对方答案id成功",'data'=>$b_new_answer));return;
        }else{
            echo encode(array('code'=>5,'msg'=>"对方还未回答，请等待"));return;
        }


    }
    //获得对手是否答完
    public function getMatchFinish()
    {
        $request = json_decode(file_get_contents("php://input"),1);
        $request = $request?$request:I('post.');
        if (!$request['members_id']){
            echo encode(array('code'=>2,'msg'=>'缺少相应参数id'));return;
        }
        $sql = "SELECT answer FROM tbkl_answer_list WHERE members_id = ".$request['members_id']." AND type = 3 ORDER BY id DESC LIMIT 1";//查询最近一次对战的答案
        $rs = M()->query($sql);
        $members_answer = $rs[0]['answer'];
        $members_answer = json_decode($members_answer,true);        //将取出的json转换成数组
        if (count($members_answer) == 15){
            echo encode(array('code'=>6,'msg'=>"对手答题完成"));return;
        }else{
            echo encode(array('code'=>5,'msg'=>"对方还在答题，请等待"));return;
        }
    }
    //计算正确率
    public function getAccuracy()
    {
        $request = json_decode(file_get_contents("php://input"),1);
        $request = $request?$request:I('post.');
        if (!$request['members_id']){
            echo encode(array('code'=>2,'msg'=>'缺少相应参数id'));return;
        }
        if (!$request['type']){
            echo encode(array('code'=>2,'msg'=>'缺少相应参数type'));return;
        }
        $sql = "SELECT answer FROM tbkl_answer_list WHERE members_id = ".$request['members_id']." AND type = ".$request['type']." ORDER BY id DESC LIMIT 1";
        $rs = M()->query($sql);
        if (!$rs){
            echo encode(array('code'=>4,'msg'=>'没有您的答题记录'));return;
        }
        $my_answer = json_decode($rs[0]['answer'],true);         //将json转化为数组
        $num = 0;      //初始化我的答对数量
        foreach ($my_answer as $k => $v){   //获取我的分值
            $data = $this->finddata('problem',array('id'=>$k),'answer_id,score');
            if ($data['answer_id'] == $v){
               $num += 1;
            }
        }
        $win = 0;
        $accuracy = round($num / count($my_answer) * 100,1);
        if ($accuracy >= 80){
            $win = 1;
        }else{
            $win = 2;
        }
        $accuracy = $accuracy . '%';
        $data = array('accuracy'=>$accuracy,'win'=>$win);
        echo encode(array('code'=>6,'msg'=>"获取正确率成功",'data'=>$data));return;
    }
    //我要出题
    public function setMyProblem()
    {
        $request = json_decode(file_get_contents("php://input"),1);
        $request = $request?$request:I('post.');
        if (!$request['problem_cate_id']){
            echo encode(array('code'=>2,'msg'=>"请选择问题分类"));return;
        }
        if (!$request['problem']){
            echo encode(array('code'=>2,'msg'=>"请输入问题内容"));return;
        }
        if (!$request['answer']){
            echo encode(array('code'=>2,'msg'=>"请输入问题答案"));return;
        }
        if (!$request['correct']){
            echo encode(array('code'=>2,'msg'=>"请输入问题正确答案"));return;
        }
        if (!$request['members_id']){
            echo encode(array('code'=>2,'msg'=>"缺少参数id"));return;
        }
        $request['status'] = 2;         //待审核状态为2
        $request['create_time'] = time();
        $answer = $request['answer'];
        $correct = $request['correct'];
        unset($request['answer']);
        unset($request['correct']);
        $rs = $this->adddata('problem',$request);//将问题插入数据库
        $where['problem_id'] = $rs;
        $where['create_time'] = date('Y-m-d H:i:s');

        foreach($answer as $k => $v){
            if ($v != $correct){
                $where['answer'] = $v;
                $this->adddata('answer',$where);//将其他答案插入数据库
            }
        }
        $where['answer'] = $correct;
        $res = $this->adddata('answer',$where);//将正确答案插入数据库
        $update_time = time();
        $result = $this->savedata('problem',array('answer_id'=>$res,'update_time'=>$update_time),array('id'=>$rs));//将正确答案的id插入问题表的answer_id
        if ($result){
            echo encode(array('code'=>6,'msg'=>'出题成功，请等待管理员审核'));
        }else{
            echo encode(array('code'=>2,'msg'=>'很遗憾，出题失败'));
        }

    }
    //排位赛积分增加
    public function addScore()
    {
        $request = json_decode(file_get_contents("php://input"),1);
        $request = $request?$request:I('post.');
        if (!$request['members_id']){
            echo encode(array('code'=>2,'msg'=>"缺少相应参数id"));return;
        }
        $request['type'] = 2;
        $answer = $this->selectdata('answer_list',$request,'answer');

        if (!$answer[0]['answer']){
            echo encode(array('code'=>4,'msg'=>'没有您的答题记录'));return;
        }
        $my_answer = json_decode($answer[0]['answer'],true);         //将json转化为数组
        $my_score = 0;      //初始化我的正确数量
        foreach ($my_answer as $k => $v){   //获取我的正确数量
            $data = $this->finddata('problem',array('id'=>$k),'answer_id,score');
//            dump($data);die();
            if ($data['answer_id'] == $v){
                $my_score += 1;
            }
        }
        $department = $this->finddata('members',array('id'=>$request['members_id']),'point,two_department_id,department_id');
        $where['two_department_id'] = $department['two_department_id'];
        $where['department_id'] = $department['department_id'];

        $where['members_id'] = $request['members_id'];
        $where['create_time'] = time();
        if ($my_score >= 12){   //如果正确条数大于12
            //更新积分变化表
            $where['point'] = 1;
            $where['msg'] = '排位赛胜利';
            $beginToday=mktime(0,0,0,date('m'),date('d'),date('Y'));//今日开始时间戳
            $nowTime = time();
            $sql = "SELECT SUM(point) as point FROM tbkl_point_change WHERE create_time >= ".$beginToday." AND create_time <= ".$nowTime." AND members_id = ".$request['members_id'];
            $max_point = $this->finddata('base','','max_point');
            $todayPoint = M()->query($sql);
            if ($todayPoint[0]['point'] < $max_point){
                $rs = $this->adddata('point_change',$where);
            }
            //更新胜利
            $id = $this->selectdata('answer_list',array('type'=>2,'members_id'=>$request['members_id']),'id','id DESC');
            $this->savedata('answer_list',array('win'=>1),array('id'=>$id[0]['id']));
            echo encode(array('code'=>6,'msg'=>'挑战成功','data'=>$my_score));return;
        }else{
            //获取我的等级
            $where1['point'] = array('elt',$department['point']);
            $res = $this->selectdata('level',$where1,'level','point DESC');//查出比自己积分少的等级 倒序
            $now_level = $this->selectdata('level',array('level'=>$res[0]['level']),'point','point ASC');
            $now_level_lower_point = $now_level[0]['point'];//当前等级最低积分
            if ($now_level_lower_point < $department['point']){//如果当前积分大于当前等级最低积分
                $where['point'] = -1;
                $where['msg'] = '排位赛失败';
                $this->adddata('point_change',$where);
            }
            echo encode(array('code'=>5,'msg'=>'很遗憾，挑战失败，再接再厉吧','data'=>$my_score));
        }


    }
    //参加的考试类型
    public function getTestType()
    {
        $request = json_decode(file_get_contents("php://input"),1);
        $request = $request?$request:I('post.');
        if (!$request['members_id']){
            echo encode(array('code'=>2,'msg'=>"缺少参数id"));return;
        }
        $request['type'] = 2;
//        $rs = $this->selectdata('answer_list',$request,'problem_cate_id');
        $sql = "SELECT problem_cate_id FROM tbkl_answer_list WHERE members_id = ".$request['members_id']." AND type = 2 GROUP BY problem_cate_id ORDER BY id DESC";
        $rs = M()->query($sql);
        $data = array();
        foreach ($rs as $k =>$v){
            $result = $this->finddata('problem_cate',array('id'=>$v['problem_cate_id']),'');
            $result['pic'] = substr($result['pic'],1);
            $data[$k] = $result;
        }
        if ($rs){
            echo encode(array('code'=>6,'msg'=>'获取最近考试类型成功','data'=>$data));
        }else{
            echo encode(array('code'=>5,'msg'=>'您还没有参加考试，先去排位赛挑战吧'));
        }
    }
    //排位生成问题
    public function getRankedProblem()
    {
        $request = json_decode(file_get_contents("php://input"),1);
        $request = $request?$request:I('post.');
        if (!$request['members_id'] || !$request['problem_cate_id']){
            echo encode(array('code'=>2,'msg'=>"缺少相应参数id"));return;
        }
        $limit = 15;    //设置问题条数
        //获取该分类下所有问题的id
        $rs = $this->selectdata('problem',array('problem_cate_id'=>$request['problem_cate_id'],'status'=>0),'id','');
        if (!$rs){
            echo encode(array('code'=>4,'msg'=>"该分类下暂时还没有问题"));return;
        }
        //随机取出指定条数的id
        $id_arr = array();
        foreach ($rs as $k =>$v){
            array_push($id_arr,$v['id']);
        }
        $id_arr = array_flip($id_arr);
        if (count($id_arr) < $limit) $limit = count($id_arr);
        $id_arr = array_rand($id_arr,$limit);
        shuffle($id_arr);//打乱顺序
        $id_str = '';
        if (is_array($id_arr)){
//                $where['id'] = array('in',$id_arr);
            foreach($id_arr as $v){
                $id_str .= $v.',';
            }
        }else{
            $where['id'] = $id_arr;
            $id_str .= $id_arr;
        }
        $request['problem_idstr'] = $id_str;
        $request['create_time'] = time();
        $rs = $this->adddata('ranked',$request);//生成的随机问题插入数据库
        if ($rs){
            echo encode(array('code'=>6,'msg'=>'获取问题成功','data'=>$rs));
        }else{
            echo encode(array('code'=>5,'msg'=>'获取问题失败'));
        }
    }
    //排位答题，每次只给一题
    public function answerRankedProblem()
    {
        $request = json_decode(file_get_contents("php://input"),1);
        $request = $request?$request:I('post.');
        if (!$request['members_id'] || !$request['ranked_id']){
            echo encode(array('code'=>2,'msg'=>"缺少相应参数"));return;
        }
        $problem_idstr = $this->finddata('ranked',array('id'=>$request['ranked_id']),'problem_idstr');
        $id_arr = explode(',',$problem_idstr);
        foreach ($id_arr as $k =>&$v){
            if ($v == ''){
                unset($id_arr[$k]);
            }
        }
        if (!$id_arr){
            echo encode(array('code'=>3,'msg'=>"答题完成"));return;
        }

        $where['id'] = $id_arr[0];
        unset($id_arr[0]);
        $problem_idstr = implode(',',$id_arr);
        $this->savedata('ranked',array('problem_idstr'=>$problem_idstr),array('id'=>$request['ranked_id']));

        $data = D('ProblemRelation')->relation(true)->where($where)->select();
        foreach ($data as $k => $v){           //让答案的id作为数组的下标
            $data[$k]['answer'] = convert_arr_key($v['answer'],'id');
            $data[$k]['correct_answer'] = $data[$k]['answer'][$data[$k]['answer_id']]['answer'];
            $rs = $this->finddata('collect',array('problem_id'=>$data['id'],'members_id'=>$request['members_id']),'id');
            $data[$k]['is_collect'] = 0;//是否已收藏  默认0未收藏
            if ($rs) $data[$k]['is_collect'] = 1;   //已收藏
            if ($v['members_id']){
                $name = $this->finddata('members',array('id'=>$v['members_id']),'username');
                $data[$k]['name'] = $name;
            }
        }
        //打乱答案顺序
        foreach($data[0]['answer'] as $k =>$v){
            $str = mb_substr($v['answer'],0,2,'utf-8');
            if ($str == '以上'){
                $fourAnswer = $v;
                unset($data[0]['answer'][$k]);//去除以以上开头的答案
            }
        }
        shuffle($data[0]['answer']);//打乱答案顺序
        if ($fourAnswer) array_push($data[0]['answer'],$fourAnswer);
        if($data){
            echo encode(array('code'=>6,'msg'=>'获取成功','data'=>$data));
        }else{
            echo encode(array('code'=>4,'msg'=>"问题不存在"));
        }
    }
    //个人信息
    public function getMembersInfo()
    {
        $request = json_decode(file_get_contents("php://input"),1);
        $request = $request?$request:I('post.');
        if (!$request['members_id']){
            echo encode(array('code'=>2,'msg'=>"缺少相应参数"));return;
        }
        $data = $this->finddata('members',array('id'=>$request['members_id']));
        if (!$data){
            echo encode(array('code'=>5,'msg'=>"用户不存在"));return;
        }
        $department = $this->finddata('department',array('id'=>$data['department_id']),'name');
        $two_department = $this->finddata('two_department',array('id'=>$data['two_department_id']),'name');
        $data['department'] = $department;
        $data['two_department'] = $two_department;
        if (!$data['headimgurl']) $data['headimgurl'] = "/Uploads/Index/headimg/default.jpg";
        echo encode(array('code'=>6,'msg'=>"获取成功",'data'=>$data));
    }
    //用户密码修改
    public function setPassword()
    {
        $request = json_decode(file_get_contents("php://input"),1);
        $request = $request?$request:I('post.');
        if (!$request['num']){
            echo encode(array('code'=>2,'msg'=>"缺少相应参数"));return;
        }
        if (!$request['old_password'] || !$request['password'] || !$request['repassword']){
            echo encode(array('code'=>2,'msg'=>"请填写完整信息"));return;
        }
        if($request['password'] != $request['repassword']){
            echo encode(array('code'=>3,'msg'=>"两次输入密码不一致"));return;
        }
        $password = $this->finddata('members',array('num'=>$request['num']),'password');//数据库查出旧密码
      //dump($password);
        if (!$password){
            echo encode(array('code'=>4,'msg'=>"用户不存在"));return;
        }
        $old_password = md5(md5($request['old_password'].'kaili'));//加密用户输入的旧密码
        if ($password != $old_password){    //旧密码不正确
            echo encode(array('code'=>4,'msg'=>"原始密码不正确"));return;
        }
        $new_password = md5(md5($request['password'].'kaili'));//加密新密码
        $rs = M("members")->where(array('num'=>$request['num']))->setField('password',$new_password);
        if($rs){
            echo encode(array('code'=>6,'msg'=>'密码重置成功'));
        }else{
            echo encode(array('code'=>5,'msg'=>"密码重置失败"));
        }
    }
  //设置头像
    public function setHeadimg(){
        $request = json_decode(file_get_contents("php://input"),1);
        $request = $request?$request:I('post.');
        $members_id = $request['members_id'];
        $headimgurl = $request['headimgurl'];
        if (!$members_id){
            echo encode(array('code'=>2,'msg'=>"缺少相应参数"));return;
        }
        if (!$headimgurl){
            echo encode(array('code'=>2,'msg'=>"缺少相应参数"));return;
        }
        $rs = M('members')->where(array('id'=>$members_id))->setField('headimgurl',$headimgurl);
        if($rs){
            echo encode(array('code'=>6,'msg'=>'设置成功','data'=>$headimgurl));
        }else{
            echo encode(array('code'=>5,'msg'=>"设置失败"));
        }
    }
    //检查本月积分是否少于两分
    public function check_score()
    {
        $request = json_decode(file_get_contents("php://input"),1);
        $request = $request?$request:I('post.');
        if (!$request['members_id']){
            echo encode(array('code'=>2,'msg'=>"缺少相应参数"));return;
        }
        $beginThismonth=mktime(0,0,0,date('m'),1,date('Y'));//本月开始时间戳
        $twentyThismonth=mktime(23,59,59,date('m'),20,date('Y'));//本月20号末点时间戳
        $now_time = time();//当前时间戳
        if ($now_time >= $twentyThismonth){ //如果本月已过20号
            $sql = "SELECT SUM(point) as this_month_point FROM ".C('DB_PREFIX')."point_change WHERE members_id = ".$request['members_id']." AND create_time >= ".$beginThismonth;
            $data = M()->query($sql);
            $this_month_point = $data[0]['this_month_point'];
            $least_point = $this->finddata('base','','least_point');//获取当月积分提醒值
            if ($this_month_point < $least_point){
                echo encode(array('code'=>6,'msg'=>"您的本月积分低于2 分"));return;
            }else{
                echo encode(array('code'=>5,'msg'=>"您的本月积分大于2分"));return;
            }
        }else{
            echo encode(array('code'=>4,'msg'=>"本月还没过20号"));return;
        }
    }
    //检测本月积分是否大于5分
    public function getTodayScore()
    {
        $request = json_decode(file_get_contents("php://input"),1);
        $request = $request?$request:I('post.');
        if (!$request['members_id']){
            echo encode(array('code'=>2,'msg'=>"缺少相应参数"));return;
        }
        $beginToday=mktime(0,0,0,date('m'),date('d'),date('Y'));//今日开始时间戳
        $nowTime = time();
        $sql = "SELECT SUM(point) as point FROM tbkl_point_change WHERE create_time >= ".$beginToday." AND create_time <= ".$nowTime." AND members_id = ".$request['members_id'];
        $max_point = $this->finddata('base','','max_point');
        $todayPoint = M()->query($sql);
        if ($todayPoint[0]['point'] >= $max_point){
            echo encode(array('code'=>6,'msg'=>"您今日积分已满".$max_point."分"));return;
        }else{
            echo encode(array('code'=>5,'msg'=>"您今日积分还没到".$max_point."分"));return;
        }
    }
    //获取练习分值
    public function getTestScore()
    {
        $request = json_decode(file_get_contents("php://input"),1);
        $request = $request?$request:I('post.');
        if (!$request['members_id']){
            echo encode(array('code'=>2,'msg'=>"缺少相应参数id"));return;
        }
        $request['type'] = 1;
        $answer = $this->selectdata('answer_list',$request,'answer');

        if (!$answer[0]['answer']){
            echo encode(array('code'=>4,'msg'=>'没有您的答题记录'));return;
        }
        $my_answer = json_decode($answer[0]['answer'],true);         //将json转化为数组
        $my_score = 0;      //初始化我的正确数量
        foreach ($my_answer as $k => $v){   //获取我的正确数量
            $data = $this->finddata('problem',array('id'=>$k),'answer_id,score');
            if ($data['answer_id'] == $v){
                $my_score += 1;
            }
        }
        if ($my_score >= 12){   //如果正确条数大于12
            echo encode(array('code'=>6,'msg'=>'挑战成功','data'=>$my_score));return;
        }else{
            echo encode(array('code'=>5,'msg'=>'很遗憾，挑战失败，再接再厉吧','data'=>$my_score));
        }


    }
}