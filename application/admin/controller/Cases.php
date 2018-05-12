<?php
namespace app\admin\controller;
use app\admin\controller\Common;
use think\Request;
use think\Session;
use app\admin\model\Cases as CasesModel;
/**
 *  成功案列控制器
 */
class Cases extends Common{
	//成功案列列表
	public function index() {
		//删除原图（新上传的原图有则删，没有则跳过）
		$big_logo_path = @Session::get('big_logo_path');
	    if(file_exists($big_logo_path)&&chmod($big_logo_path,0777)) {	
	     	unlink($big_logo_path);
	     	Session::delete('big_logo_path');
	     	unset($big_logo_path);
	    }

		//获取分页数据 分配到模板
		$casesModel   = new CasesModel();
		$list  = $casesModel->order('id','asc')->paginate(12); //分页，每页5条数据
		$count = $casesModel->count(); //总记录数
		$page  = $list->render();      //页码数据
		$currentPage = $list->currentPage(); //当前的页码
		return $this->fetch('index',['list'=>$list ,'page'=>$page,'count'=>$count,'currentPage'=>$currentPage]);
	}

	//新增案列
	public function add(Request $request) {
		if($request->isPost()) {
		    $file = request()->file('image');
		    //判断是否有文件上传，没有则给出提示
		    if (empty($file)) { 
		      $this->error('请选择上传文件'); die;
		    }			
			//过滤接收的post数据
			$case_data['name']         = addslashes(strip_tags(trim(input('post.name'))));
			$case_data['native_place'] = addslashes(strip_tags(trim(input('post.native_place'))));
			$case_data['education_code'] = input('post.education_code');
			$case_data['permit_time'] = trim(input('post.permit_time'));
			$case_data['permit_code'] = input('post.permit_code');
			$case_data['age'] = addslashes(strip_tags(trim(input('post.age'))));
			$case_data['url'] = trim(input('post.url'));
			$case_data['content'] = htmlspecialchars(input('post.content'));
			$case_data['seo_title'] = htmlspecialchars(input('post.seo_title'));
			$case_data['seo_keyword'] = htmlspecialchars(input('post.seo_keyword'));
			$case_data['seo_description'] = htmlspecialchars(input('post.seo_description'));
			$case_data['add_time'] =  date('Y-m-d H:i:s',time());
			$case_data['is_valid'] = input('post.is_valid');
			//**验证数据
			$rules = [
				'name|户主名称' =>['require','max'=>200,'min'=>2],
				'native_place|户主籍贯'    =>['require','max'=>100,'min'=>1],
			    'permit_time|入户时间'    =>['require','regex'=>'/^((((19|20)\d{2})-(0?[13-9]|1[012])-(0?[1-9]|[12]\d|30))|(((19|20)\d{2})-(0?[13578]|1[02])-31)|(((19|20)\d{2})-0?2-(0?[1-9]|1\d|2[0-8]))|((((19|20)([13579][26]|[2468][048]|0[48]))|(2000))-0?2-29))$/'],
				'age|年龄'    =>['require','integer','max'=>120,'gt:0'],
				'url|外链地址'    =>['url'],
				'content|案列内容'    =>['require','min'=>3],
				'seo_title|优化标题'    =>['min'=>1,'max'=>200],
				'seo_keyword|优化关键词'    =>['min'=>1,'max'=>200],
				'seo_description|优化描述'    =>['min'=>1,'max'=>2000],
			];
			$message = $this->validate($case_data,$rules);
			if($message!==true) {
				$this->error($message);die;
			}
			//上传文件移动到框架应用根目录/public/uploads/cases目录下
		    $info = $file->validate(['size'=>8388608,'ext'=>'jpg,png,gif,jpeg'])->move(ROOT_PATH . 'public' . DS . 'uploads'.DS.'cases');
		    //判断上传图片是否成功！
		    if( $info!== false ){  
				//调用image类静态方法打开图片
				$big_logo_path = './uploads/cases/'.$info->getSaveName(); //上传原图的存储路径
		    	$image = \think\Image::open($big_logo_path);
		    	//缩略图片路径
		    	$thumb_logo_path = './thumb/cases/'.$info->getFileName();
		    	$res = $image->thumb(200,100,\think\Image::THUMB_CENTER)->save($thumb_logo_path );

		    	if($res!==false) {
		    		//图片缩略成功，将缩略图路径存放到数据库中
					$case_data['image'] = '/thumb/cases/'.$info->getFileName();
					$casesModel = new CasesModel();
				    $status = $casesModel->save($case_data);
				    if($status !== false) {
				    	//********删原图*********
				    	//在一个执行周期内删不了原图，则将原图路径保存到session中，跳转到显示列表页中再删除原图
					    $big_logo_path = str_replace('/','\\',$big_logo_path);
					    Session::set('big_logo_path',$big_logo_path);

				    	$this->success('成功添加一条案列！',url('admin/cases/index'));die;
				    }else{
				    	$this->error('添加失败！');die;
				    }		
		    	}else{
		    		return $this->error('图片上传失败！'.$res->getError());die;         
		    	}
		    }else{        
		    	// 上传失败获取错误信息16.
		    	return $this->error('图片上传失败！'.$file->getError());die;         
		    } 
		}
		return $this->fetch();
	}



	//更新案列
	public function edit(Request $request) {
		//判断是否有get请求
		if($request->isGet()) {
			$id   = input('id');
			//数据库提取当前新闻信息
			$info = CasesModel::get($id);
			$case_data = $info->toArray();
			return $this->fetch('edit',['case_data'=>$case_data]);

		}elseif($request->isPost()) {
			//判断是否有文件上传更改
			$file = request()->file('image');
			//分两种情况，有文件上传的数据更新和没有文件上传的数据处理
			//有文件上传的数据处理
			if(!empty($file)) {
				//过滤数据
				$case_data['id']   = input('post.id');
				$case_data['name'] = addslashes(strip_tags(trim(input('post.name'))));
				$case_data['native_place']   = addslashes(strip_tags(trim(input('post.native_place'))));
				$case_data['education_code'] = input('post.education_code');
				$case_data['permit_time'] = trim(input('post.permit_time'));
				$case_data['permit_code'] = input('post.permit_code');
				$case_data['age'] = addslashes(strip_tags(trim(input('post.age'))));
				$case_data['url'] = trim(input('post.url'));
				$case_data['content'] = htmlspecialchars(input('post.content'));
				$case_data['seo_title'] = htmlspecialchars(input('post.seo_title'));
				$case_data['seo_keyword'] = htmlspecialchars(input('post.seo_keyword'));
				$case_data['seo_description'] = htmlspecialchars(input('post.seo_description'));
				$case_data['add_time']    =  input('post.add_time');
				$case_data['modify_time'] =  date('Y-m-d H:i:s',time()); 
				$case_data['is_valid']    = input('post.is_valid');
				//**验证数据
				$rules = [
					'name|户主名称' =>['require','max'=>200,'min'=>2],
					'native_place|户主籍贯'    =>['require','max'=>100,'min'=>1],
				    'permit_time|入户时间'    =>['require','regex'=>'/^((((19|20)\d{2})-(0?[13-9]|1[012])-(0?[1-9]|[12]\d|30))|(((19|20)\d{2})-(0?[13578]|1[02])-31)|(((19|20)\d{2})-0?2-(0?[1-9]|1\d|2[0-8]))|((((19|20)([13579][26]|[2468][048]|0[48]))|(2000))-0?2-29))$/'],
					'age|年龄'    =>['require','integer','max'=>120,'gt:0'],
					'url|外链地址'    =>['url'],
					'content|案列内容'    =>['require','min'=>3],
					'seo_title|优化标题'    =>['min'=>1,'max'=>200],
					'seo_keyword|优化关键词'    =>['min'=>1,'max'=>200],
					'seo_description|优化描述'    =>['min'=>1,'max'=>2000],
				];
				$message = $this->validate($case_data,$rules);
				if($message!==true) {
					$this->error($message);die;
				}
				//移动图片到指定的项目文件夹下
				$info = $file->validate(['size'=>8388608,'ext'=>'jpg,png,gif,jpeg'])->move(ROOT_PATH . 'public' . DS . 'uploads'.DS.'cases');
				//判断图片上传验证是否通过
				if($info!==false) {
					//验证通过，对图片进行缩略图处理
					$big_logo_path = './uploads/cases/'.$info->getSaveName();//原图的路径
			    	$image = \think\Image::open($big_logo_path);//打开图片
			    	$thumb_logo_path = './thumb/cases/'.$info->getFileName(); //定义缩略图的路径
			    	//缩略图片
			    	$res = $image->thumb(200,100,\think\Image::THUMB_CENTER)->save($thumb_logo_path );
			    	//判断缩略图片是否成功
			    	if($res!==false) {
			    		//将缩略图路径更新到数据库中
						$case_data['image'] = '/thumb/cases/'.$info->getFileName();

						//在更新数据之前，先得到旧缩略图片的路径,
						$id = input('post.id');
						$old_info_obj = CasesModel::get($id);
						$old_info = $old_info_obj->toArray();
						$old_thumb_image_path = '.'.$old_info['image']; //获取旧缩略图片的路径
						//将更改的数据新增到数据库，同时删除之前上传的缩略图片
						$status = $old_info_obj->update($case_data);
						if($status !== false) {
							//数据更改成功，先删除旧缩略图
							if( file_exists($old_thumb_image_path)&&chmod($old_thumb_image_path,0777) ){
					          unlink( $old_thumb_image_path );
					        }
					    	//********删原图(要删除重新上传的原图)*********
					    	//在一个执行周期内删不了原图，则将原图路径保存到session中，跳转到显示列表页中再删除原图
						    $big_logo_path = str_replace('/','\\',$big_logo_path);
						    Session::set('big_logo_path',$big_logo_path);

					    	$this->success('更改新闻成功！',url('admin/cases/index'));die;
					    }else{
					    	$this->error('更改新闻失败!');die;
					    }	

			    	}else{
			    		$this->error('图片缩小失败'.$info->getError());die;
			    	}
				}else{
					//更改的图片上传验证没通过
					$this->error('图片上传失败'.$info->getError());die;
				}
			}
			//如果没有更改上传文件，则不用对上传的数据进行处理，直接更新表单其他数据
			//过滤数据
			$case_data['id']   = input('post.id');
			$case_data['name'] = addslashes(strip_tags(trim(input('post.name'))));
			$case_data['native_place']   = addslashes(strip_tags(trim(input('post.native_place'))));
			$case_data['education_code'] = input('post.education_code');
			$case_data['permit_time'] = trim(input('post.permit_time'));
			$case_data['permit_code'] = input('post.permit_code');
			$case_data['age'] = addslashes(strip_tags(trim(input('post.age'))));
			$case_data['url'] = trim(input('post.url'));
			$case_data['content'] = htmlspecialchars(input('post.content'));
			$case_data['seo_title'] = htmlspecialchars(input('post.seo_title'));
			$case_data['seo_keyword'] = htmlspecialchars(input('post.seo_keyword'));
			$case_data['seo_description'] = htmlspecialchars(input('post.seo_description'));
			$case_data['add_time']    =  input('post.add_time');
			$case_data['modify_time'] =  date('Y-m-d H:i:s',time()); 
			$case_data['is_valid']    = input('post.is_valid');
			//**验证数据
			$rules = [
				'name|户主名称' =>['require','max'=>200,'min'=>2],
				'native_place|户主籍贯'    =>['require','max'=>100,'min'=>1],
			    'permit_time|入户时间'    =>['require','regex'=>'/^((((19|20)\d{2})-(0?[13-9]|1[012])-(0?[1-9]|[12]\d|30))|(((19|20)\d{2})-(0?[13578]|1[02])-31)|(((19|20)\d{2})-0?2-(0?[1-9]|1\d|2[0-8]))|((((19|20)([13579][26]|[2468][048]|0[48]))|(2000))-0?2-29))$/'],
				'age|年龄'    =>['require','integer','max'=>120,'gt:0'],
				'url|外链地址'    =>['url'],
				'content|案列内容'    =>['require','min'=>3],
				'seo_title|优化标题'    =>['min'=>1,'max'=>200],
				'seo_keyword|优化关键词'    =>['min'=>1,'max'=>200],
				'seo_description|优化描述'    =>['min'=>1,'max'=>2000],
			];
			$message = $this->validate($case_data,$rules);
			if($message!==true) {
				$this->error($message);die;
			}
			//更新数据并判断（图片路径不会更改）
			if( CasesModel::update($case_data) !== false ) {
		    	$this->success('更改案列成功！',url('admin/cases/index'));die;
			}else{
				$this->error('更改案列失败！' );die;
			}
		}	
	}


	//删除案列
	public function del(Request $request) {
		//接收get传递过来的id
		if($request->isGet()) {
			$current_case_id  = input('id');
			$info 			  = casesModel::get($current_case_id); //根据id获取当前新闻信息
			$thumb_image_path = '.'.$info->image; //获取存储图片的路径

			$status = casesModel::destroy($current_case_id); //删除此文章的数据库信息
			if($status!==false) {
				//删除信息的同时删除图片
				if( file_exists($thumb_image_path )&&chmod($thumb_image_path,0777)  ) {
					unlink( $thumb_image_path );
				}
			    $this->success('案列删除成功！','admin/cases/index',1);die;
			}else{
				$this->error('案列删除失败!');die;
			}
		}		
	}


	//是否有效，切换
	public function valid(Request $request) {
		$casesModel      = new CasesModel();
		$current_case_id = input('id');
		$case_data_obj   = $casesModel->where('id',$current_case_id)->field('is_valid')->select();
		$case_data       = $case_data_obj->toArray();
		if($case_data[0]['is_valid']=='Y') {
			$casesModel->where('id',$current_case_id)->update(['is_valid'=>'N']);
		}else{
			$casesModel->where('id',$current_case_id)->update(['is_valid'=>'Y']);	
		}
		$this->redirect('/admin/cases/index');die;
	}


	//导出excel表格
	public function outexcel() {
		//手动引入类文件
		import('outexcel.PHPExcel',EXTEND_PATH);
		import('outexcel.PHPExcel.Writer.Excel5',EXTEND_PATH);
		//实例化对象
		$excel_obj = new \PHPExcel();
		$write_obj = new \PHPExcel_Writer_Excel5($excel_obj);
		//halt($write_obj);

        //设置sheet名称
        $sheets=$excel_obj->getActiveSheet()->setTitle('成功案列信息');
        //设置sheet列头信息
        $excel_obj->setActiveSheetIndex()
        			->setCellValue('A1', '案列ID')
        			->setCellValue('B1', '姓名')
        			->setCellValue('C1', '籍贯')
        			->setCellValue('D1', '学历')
        			->setCellValue('E1', '年龄')
        			->setCellValue('F1', '入户时间')
        			->setCellValue('G1', '入户方式')
        			->setCellValue('H1', '外链地址')
        			->setCellValue('I1', '创建时间')
        			->setCellValue('J1', '修改时间');
        //查询表中的所有信息
        $casesModel     = new CasesModel();
        $cases_data_obj = $casesModel->select();
        $cases_data = $cases_data_obj->toArray();
        $i = 2;
        foreach($cases_data as $v) {
        	$sheets=$excel_obj->getActiveSheet()->setCellValue('A'.$i,$v['id']);
        	$sheets=$excel_obj->getActiveSheet()->setCellValue('B'.$i,$v['name']);
        	$sheets=$excel_obj->getActiveSheet()->setCellValue('C'.$i,$v['native_place']);
        	if($v['education_code']== '1') {
        		$sheets=$excel_obj->getActiveSheet()->setCellValue('D'.$i,"中专");
        	}elseif($v['education_code']== '2') {
        		$sheets=$excel_obj->getActiveSheet()->setCellValue('D'.$i,"大专");
        	}elseif($v['education_code']== '3') {
        		$sheets=$excel_obj->getActiveSheet()->setCellValue('D'.$i,"本科");
        	}elseif($v['education_code']== '4') {
        		$sheets=$excel_obj->getActiveSheet()->setCellValue('D'.$i,"本科以上");
        	}else{
        		$sheets=$excel_obj->getActiveSheet()->setCellValue('D'.$i,"其他");
        	}
        	$sheets=$excel_obj->getActiveSheet()->setCellValue('E'.$i,$v['age']);
        	$sheets=$excel_obj->getActiveSheet()->setCellValue('F'.$i,$v['permit_time']);
        	if($v['permit_code']=='1'){
        		$sheets=$excel_obj->getActiveSheet()->setCellValue('G'.$i,"积分入户");
        	}elseif($v['permit_code']=='2'){
        		$sheets=$excel_obj->getActiveSheet()->setCellValue('G'.$i,"技能入户");
        	}elseif($v['permit_code']=='3'){
        		$sheets=$excel_obj->getActiveSheet()->setCellValue('G'.$i,"学历入户");
        	}else{
        		$sheets=$excel_obj->getActiveSheet()->setCellValue('G'.$i,"毕业生接受入户");
        	}
        	$sheets=$excel_obj->getActiveSheet()->setCellValue('H'.$i,$v['url']);
        	$sheets=$excel_obj->getActiveSheet()->setCellValue('I'.$i,$v['add_time']);
        	$sheets=$excel_obj->getActiveSheet()->setCellValue('J'.$i,$v['modify_time']);
        	$i++;
        }


        //整体设置字体和字体大小
        $excel_obj->getDefaultStyle()->getFont()->setName( 'Arial');
        $excel_obj->getDefaultStyle()->getFont()->setSize(10);
        //单元格宽度自适应
        $excel_obj->getActiveSheet()->getColumnDimension('A')->setAutoSize(true); 
        $excel_obj->getActiveSheet()->getColumnDimension('B')->setAutoSize(true); 
        $excel_obj->getActiveSheet()->getColumnDimension('C')->setAutoSize(true); 
        $excel_obj->getActiveSheet()->getColumnDimension('D')->setAutoSize(true); 
        $excel_obj->getActiveSheet()->getColumnDimension('E')->setAutoSize(true); 
        $excel_obj->getActiveSheet()->getColumnDimension('F')->setAutoSize(true); 
        $excel_obj->getActiveSheet()->getColumnDimension('G')->setAutoSize(true); 
        $excel_obj->getActiveSheet()->getColumnDimension('H')->setAutoSize(true); 
        $excel_obj->getActiveSheet()->getColumnDimension('I')->setAutoSize(true); 
        $excel_obj->getActiveSheet()->getColumnDimension('J')->setAutoSize(true);
        // 输出Excel表格到浏览器下载
        header('Content-Type: application/vnd.ms-excel');
        header('Content-Disposition: attachment;filename="成功案列信息表.xls"'); //excel表格名称
        header('Cache-Control: max-age=0');
        header('Cache-Control: max-age=1');
        header('Expires: Mon, 26 Jul 1997 05:00:00 GMT'); // Date in the past
        header('Last-Modified: ' . gmdate('D, d M Y H:i:s') . ' GMT'); // always modified
        header('Cache-Control: cache, must-revalidate'); // HTTP/1.1
        header('Pragma: public'); // HTTP/1.0
        $write_obj->save('php://output');        
	}


}