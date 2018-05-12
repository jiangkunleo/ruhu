<?php
namespace app\home\controller;
use think\Controller;
use think\Request;
use app\admin\model\Banner as BannerModel;
use app\admin\model\News as NewsModel;
use app\home\model\Test as TestModel;
use app\home\model\Order as OrderModel;
use app\home\model\About as AboutModel;
use app\home\model\Examples as ExamplesModel;
/**
 *  前台首页
 */
class Index extends Controller{

    //前台首页
    public function index() {
        //获取所有轮播图信息
        $bannerModel = new BannerModel();
        $banner_data = $bannerModel->where(['is_valid'=>'Y','type'=>1])->select();
        $this->assign('banner_data',$banner_data);

        //获取轮播――公告信息
        $newsModel     = new NewsModel();
        $news_list_obj = $newsModel->field('')->where(['is_notice'=>'Y','is_valid'=>'Y'])->order('add_time','desc')->limit(3)->select();
        $news_list = $news_list_obj->toArray();
        //halt($news_list);
        $this->assign('news_list',$news_list);

        return $this->fetch();
    }

    //公告文章单页
    public function notice(Request $request) {
        $new_id    = $request->param('id');
        $newsModel = new NewsModel();
        $new_data  = $newsModel->get($new_id);
        $new_data  = $new_data->toArray();

        $this->assign('new_data',$new_data);
        return $this->fetch();
    }

    //入户条件测试页
    public function test(Request $request) {
        if( $request->isPost() ) {
            //halt(input('post.'));
            //数据安全过滤
            $test_data['name'] = addslashes(strip_tags(trim(input('post.name'))));
            $test_data['phone'] = addslashes(strip_tags(trim(input('post.phone'))));
            $test_data['insurance'] = addslashes(strip_tags(trim(input('post.insurance'))));
            $test_data['education_code'] = input('post.education_code');
            $test_data['age'] = input('post.age');
            $test_data['is_property'] = input('post.is_property');
            $test_data['add_time'] =  date('Y-m-d H:i:s',time());
            //**数据验证
            $rules = [
                'name|姓名'   =>['require','max'=>50,'min'=>2],
                'phone|手机号'=>['require','regex'=>'/^((13[0-9])|(14[5|7])|(15([0-3]|[5-9]))|(18[0,5-9]))\\d{8}$/','unique'   =>'estimate'],
                'insurance|社保年限'=>['require','integer','max'=>100,'gt:-1'],
            ];
            $message = $this->validate($test_data,$rules);
            if($message!==true) {
                $this->error($message);die;
            } 
            //保存数据
            $testModel = new TestModel();
            $status    = $testModel->save($test_data);
            if( $status !== false ) {
                $this->success('测评信息上传成功，我们工作人员将会与您联系！',url('home/index/index'));die;
            }else{
                $this->error('测评信息提交失败，请稍后再试！');
            }            
        }
        return $this->fetch();
    }

    //入户条件
    public function condition() {

        return $this->fetch();
    }

    //网上预约入户
    public function order(Request $request) {
        if( $request->isPost() ) {
            //数据安全过滤
            $order_data['name']           = addslashes(strip_tags(trim(input('post.name'))));
            $order_data['phone']          = addslashes(strip_tags(trim(input('post.phone'))));
            $order_data['age']            = addslashes(strip_tags(trim(input('post.age'))));
            $order_data['insurance']      = addslashes(strip_tags(trim(input('post.insurance'))));
            $order_data['education_code'] = input('post.education_code');
            $order_data['is_overbirth']   = input('post.is_overbirth');
            //**数据验证
            //验证规则
            $rules = [
                'name|姓名' =>['require','max'=>50,'min'=>2],
                'phone|手机号'=>['require','regex'=>'/^((13[0-9])|(14[5|7])|(15([0-3]|[5-9]))|(18[0,5-9]))\\d{8}$/','unique'=>'bespeak'],
                'age|年龄'  =>['require','integer','max'=>3,'min'=>1,'gt:-1'],
                'insurance|社保年限'=>['require','integer','max'=>100,'gt:-1'],
                'is_overbirth|是否超生'=>['require'],
            ];
            $message = $this->validate($order_data,$rules);
            if($message!==true) {
                $this->error($message);die;
            } 
            //数据验证OK后保存到数据库
            //补充数据
            $order_data['add_time'] =  date('Y-m-d H:i:s',time());
            $orderModel = new OrderModel();
            $status = $orderModel->save($order_data);
            if( $status !== false ) {
                $this->success('预约信息上传成功，我们工作人员将会与您联系！',url('home/index/order'));die;
            }else{
                $this->error('预约失败，请稍后再试！');
            }
        }
        return $this->fetch();
    }

    //入户流程
    public function flow() {

        return $this->fetch();
    }

    //成功案列列表
    public function examples () {
        $examplesModel = new ExamplesModel();
        $list  = $examplesModel->order('id','asc')->paginate(3); //分页，每页5条数据
        $count = $examplesModel->count(); //总记录数
        $page  = $list->render();      //页码数据
        $currentPage = $list->currentPage(); //当前的页码
        return $this->fetch('examples',['list'=>$list ,'page'=>$page,'count'=>$count,'currentPage'=>$currentPage]);
    }

    //显示成功案列文章详情
    public function cases() {
        $cases_id   = input('id');
        $casesModel = new ExamplesModel();
        $cases_data = $casesModel->get($cases_id);
        $cases_data = $cases_data->toArray();
        $this->assign('cases_data',$cases_data);
        return $this->fetch();
    }


    //关于我们
    public function about() {
        $aboutModel   = new AboutModel();
        $tel_data     = $aboutModel->where('is_valid','Y')->find('tel');  //电话信息
        $fax_data     = $aboutModel->where('is_valid','Y')->find('fax');  //传真信息
        $email_data   = $aboutModel->where('is_valid','Y')->find('email');  //信息
        $address_data = $aboutModel->where('is_valid','Y')->find('address');  //地址信息
        $qq_data      = $aboutModel->where('is_valid','Y')->find('qq');  //qq信息
        $wechart_data = $aboutModel->where('is_valid','Y')->find('wechart');  //微信公众号信息

        return $this->fetch('about',['tel'=>$tel_data,'fax'=>$fax_data,'email'=>$email_data,'address'=>$address_data,'qq'=>$qq_data,'wechart'=>$wechart_data]);
    }

    //入户政策
    public function policy() {
        $newsModel = new NewsModel();
        $list   = $newsModel->order('id','asc')->paginate(3); //分页，每页3条数据
        $count  = $newsModel->count(); //总记录数
        $page   = $list->render();      //页码数据
        $currentPage = $list->currentPage(); //当前的页码
        return $this->fetch('policy',['list'=>$list ,'page'=>$page,'count'=>$count,'currentPage'=>$currentPage]);
    }

    //入户政策详情页
    public function policydet() {
        $new_id       = input('id');
        $newsModel    = new NewsModel();
        $new_data_obj = $newsModel->get($new_id);
        $new_data     = $new_data_obj->toArray();
        $this->assign('new_data',$new_data);
        return $this->fetch();        
    }
    
}
