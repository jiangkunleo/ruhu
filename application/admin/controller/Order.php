<?php
namespace app\admin\controller;
use app\admin\controller\Common;
use think\Request;
use app\admin\model\Order as OrderModel;
/**
 *  客户预约信息 控制器
 */

class Order extends Common{
	//预约信息列表
	public function index(Request $request) {
		$orderModel = new OrderModel();
		//分页信息
		$list  = $orderModel->order('add_time','desc')->paginate(12); //分页数据
		$count = $orderModel->count(); //总记录书
		$page  = $list->render(); //页码数据
		$currentPage =$list->currentPage(); //当前页码数值
		return $this->fetch('index',['list'=>$list,'page'=>$page,'count'=>$count,'currentPage'=>$currentPage]);
	}

	//删除客户信息
	public function del(Request $request) {
		//接收get传递过来的id
		if($request->isGet()) {
			$current_order_id   = input('id');
			$status = OrderModel::destroy($current_order_id); //删除此文章的数据库信息
			if($status!==false) {
			    $this->success('预约信息删除成功！','admin/order/index',1);die;
			}else{
				$this->error('删除失败!');die;
			}
		}
	}



	//导出所有预约信息到Excel表格中
	public function outexcel() {
		//手动引入类文件
		import('outexcel.PHPExcel',EXTEND_PATH);
		import('outexcel.PHPExcel.Writer.Excel5',EXTEND_PATH);
		//实例化对象
		$excel_obj = new \PHPExcel();
		$write_obj = new \PHPExcel_Writer_Excel5($excel_obj);

        //设置sheet名称
        $sheets=$excel_obj->getActiveSheet()->setTitle('用户预约信息列表');
        //设置sheet列头信息
        $excel_obj->setActiveSheetIndex()
        			->setCellValue('A1','客户ID')
        			->setCellValue('B1', '姓名')
        			->setCellValue('C1', '年龄')
        			->setCellValue('D1', '学历')
        			->setCellValue('E1', '手机号码')
        			->setCellValue('F1', '社保年限')
        			->setCellValue('G1', '是否有超生')
        			->setCellValue('H1', '创建时间')
        			->setCellValue('I1', '备注');

        //查询表中的所有信息
        $orderModel   = new OrderModel();
        $order_data_obj = $orderModel->select();
        $order_data = $order_data_obj->toArray();
        $i = 2;
        foreach($order_data as $v) {
        	$sheets=$excel_obj->getActiveSheet()->setCellValue('A'.$i,$v['id']);
        	$sheets=$excel_obj->getActiveSheet()->setCellValue('B'.$i,$v['name']);
        	$sheets=$excel_obj->getActiveSheet()->setCellValue('C'.$i,$v['age']);

        	if($v['education_code']=='-1') {
        		$sheets=$excel_obj->getActiveSheet()->setCellValue('D'.$i,"未选择");
        	}elseif($v['education_code']=='1'){
        		$sheets=$excel_obj->getActiveSheet()->setCellValue('D'.$i,"硕士");
        	}elseif($v['education_code']=='2'){
        		$sheets=$excel_obj->getActiveSheet()->setCellValue('D'.$i,"本科");
        	}elseif($v['education_code']=='3'){
        		$sheets=$excel_obj->getActiveSheet()->setCellValue('D'.$i,"专科");
        	}elseif($v['education_code']=='4'){
        		$sheets=$excel_obj->getActiveSheet()->setCellValue('D'.$i,"其他");
        	}

        	$sheets=$excel_obj->getActiveSheet()->setCellValue('E'.$i,$v['phone']);
        	$sheets=$excel_obj->getActiveSheet()->setCellValue('F'.$i,$v['insurance']);

        	if($v['is_overbirth']=='Y'){
	        	$sheets=$excel_obj->getActiveSheet()->setCellValue('G'.$i,"超生");
        	}elseif($v['is_overbirth']=='N') {
	        	$sheets=$excel_obj->getActiveSheet()->setCellValue('G'.$i,"未超生");
        	}

        	$sheets=$excel_obj->getActiveSheet()->setCellValue('H'.$i,$v['add_time']);
        	$sheets=$excel_obj->getActiveSheet()->setCellValue('I'.$i,$v['comment']);
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
        // 输出Excel表格到浏览器下载
        header('Content-Type: application/vnd.ms-excel');
        header('Content-Disposition: attachment;filename="用户预约信息列表.xls"'); //excel表格名称
        header('Cache-Control: max-age=0');
        header('Cache-Control: max-age=1');
        header('Expires: Mon, 26 Jul 1997 05:00:00 GMT'); // Date in the past
        header('Last-Modified: ' . gmdate('D, d M Y H:i:s') . ' GMT'); // always modified
        header('Cache-Control: cache, must-revalidate'); // HTTP/1.1
        header('Pragma: public'); // HTTP/1.0
        $write_obj->save('php://output');        
	}

   //备注信息
   public function comment(Request $request) {
      if($request->isGet()) {
         $order_id       = input('id');
         $orderModel     = new OrderModel();
         $order_data_obj = $orderModel->find($order_id);
         $order_data     = $order_data_obj->toArray();
         $this->assign('order_data',$order_data);
         return $this->fetch();
      }elseif($request->isPost()) {
         $order_id      = input('post.id');
         $order_comment = htmlspecialchars(trim(input('post.comment')));
         $orderModel    = new OrderModel();
         $status = $orderModel->where('id',$order_id)->update(['comment'=>$order_comment]);
         if( $status !== false ) {
            $this->success('添加备注完成！',url('admin/order/index'));die;
         }else{
            $this->error('添加备注失败！');die;
         }
      }
   } 

}