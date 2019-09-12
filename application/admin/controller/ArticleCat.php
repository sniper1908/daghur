<?php 
namespace app\admin\controller;

// use think\Request;
// 软删除
use traits\model\SoftDelete;
use app\admin\controller\AdminPlatform;
use app\admin\model\ArticleCat as ArticleCatModel;
use app\admin\model\AdminLog;
use app\admin\model\ArticleModel;

/**
* 文章分类
*/
class ArticleCat extends AdminPlatform
{
	# 软删除
	use SoftDelete;
	
	# 面包屑导航
	protected $breadcrumb = [
		[
			'url' => '',
			'name' => '文章分类'
		]
	];
	
	public function _initialize()
	{
		parent::_initialize();
		// 检查权限
		$this->checkPermissionForMsg('article_cat_manage');
	}
	
	public function index()
	{
		# 标题
		$title = '文章分类';

		$this->assign('title',$title);
		$this->assign('breadcrumb',$this->breadcrumb);
		$this->assign('isForm',0);

		$ArticleCatModel = new ArticleCatModel;
		$catTree = $ArticleCatModel->getTree();
		// print_r($catTree);

		$this->assign('catTree',$catTree);

		return $this->fetch();
	}

	public function add()
	{
		# 标题
		$title = '添加文章分类';
		#面包屑导航
		$this->breadcrumb[0]['url'] = 'index';
		$this->breadcrumb[1]['url'] = '';
		$this->breadcrumb[1]['name'] = $title;

		$this->assign('title',$title);
		$this->assign('breadcrumb',$this->breadcrumb);
		$this->assign('isForm',1);
		$this->assign('actionName','insert');

		$ArticleCatModel = new ArticleCatModel;
		$catTree = $ArticleCatModel->getTree2();

		$this->assign('catTree',$catTree);
		$this->assign('editData',[]);
		$this->assign('id',0);

		return $this->fetch();
	}

	public function edit()
	{
		# 标题
		$title = '编辑文章分类';
		#面包屑导航
		$this->breadcrumb[0]['url'] = 'index';
		$this->breadcrumb[1]['url'] = '';
		$this->breadcrumb[1]['name'] = $title;

		$this->assign('title',$title);
		$this->assign('breadcrumb',$this->breadcrumb);
		$this->assign('isForm',1);
		$this->assign('actionName','update');

		$ArticleCatModel = new ArticleCatModel;
		$catTree = $ArticleCatModel->getTree2();
		$id = input('id');
		$editData = $ArticleCatModel->find($id);

		$this->assign('catTree',$catTree);
		$this->assign('editData',$editData);
		$this->assign('id',$id);

		return $this->fetch('add');
	}

	public function insert()
	{
		// $request = Request::instance();
		$session = session('admin');
		$postData = input('post.');
		$catData = $postData['cat'];
		// 添加文章分类数据
		$cat_id = ArticleCatModel::insertGetId($catData);
		// 添加管理日志
		$AdminLogModel = new AdminLog;
		$AdminLogModel->admin_id = $session['admin_uid'];
		$AdminLogModel->log_type = 1;
		$AdminLogModel->log_info = '添加文章分类成功，分类id='.$cat_id.'|ArticleCat';
		$AdminLogModel->admin_ip = request()->ip();
		$AdminLogModel->save();

		if ($cat_id) {
			return $this->success('文章分类添加成功！','index');
		}
		return $this->error('文章分类添加失败！');
	}

	public function update()
	{
		// $request = Request::instance();
		$session = session('admin');
		$postData = input('post.');
		$catData = $postData['cat'];
		// 编辑文章分类数据
		$ArticleCatModel = new ArticleCatModel;
		$res = $ArticleCatModel->save($catData,['id'=>$postData['id']]);
		// 编辑管理日志
		$AdminLogModel = new AdminLog;
		$AdminLogModel->admin_id = $session['admin_uid'];
		$AdminLogModel->log_type = 2;
		$AdminLogModel->log_info = '编辑文章分类成功，分类id='.$postData['id'].'|ArticleCat';
		$AdminLogModel->admin_ip = request()->ip();
		$AdminLogModel->save();

		if ($res) {
			return $this->success('文章分类编辑成功！','index');
		}
		return $this->error('文章分类编辑失败！');
	}

	public function del()
	{
		$session = session('admin');
		$id = input('id');
		$ArticleCatModel = new ArticleCatModel;
		$data = $ArticleCatModel->where(['parent_id'=>$id])->find();
		if (!empty($data)) {
			# 该分类有子分类
			return $this->error('该分类下存在子分类，请删除子分类后再删除');
		}
		# 该分类下如果有文章也不能删除
		$ArticleModel = new ArticleModel;
		$count = $ArticleModel->where(['cat_id'=>$id])->count();
		if ($count>0) {
			return $this->error('该分类下存在文章，请清空文章后再删除');
		}

		# 删除分类
		$res = $ArticleCatModel::destroy($id);

		if ($res) {
			return $this->success('删除成功');
		}
		return $this->error('删除失败');
	}
}