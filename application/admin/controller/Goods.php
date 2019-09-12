<?php
namespace app\admin\controller;

use \think\Db;
use \think\Request;
use app\admin\controller\AdminPlatform;
use app\admin\model\Category as CategoryModel;
use app\admin\model\Goods as GoodsModel;
use app\admin\model\GoodsArticle as GoodsArticleModel;
use app\admin\model\GoodsAttr as GoodsAttrModel;
use app\admin\model\GoodsCat as GoodsCatModel;
use app\admin\model\GoodsGroup as GoodsGroupModel;
use app\admin\model\GoodsLink as GoodsLinkModel;
use app\admin\model\GoodsGallery as GoodsGalleryModel;
use app\admin\model\GoodsType as GoodsTypeModel;
use app\admin\model\ArticleCat as ArticleCatModel;
use app\admin\model\Brand as BrandModel;

class Goods extends AdminPlatform
{
	# 面包屑导航
	protected $breadcrumb = [
		[
			'url' => '',
			'name' => '属性列表'
		]
	];

	public function index()
	{
		// 检查权限
		// $this->checkPermissionForMsg('goods_add_edit');
		
		# 标题
		$title = '商品列表';

		$this->assign('title',$title);
		$this->assign('breadcrumb',$this->breadcrumb);
		$this->assign('hasScript',1);

		# 分类树
		$CategoryModel = new CategoryModel;
		$catTree = $CategoryModel->getTree2();
		# 商品品牌列表
		$brandList = BrandModel::where('is_show',1)->select();
		$this->assign('catTree',$catTree);
		$this->assign('brandList',$brandList);

		$GoodsModel = new GoodsModel;
		$paginate = 10;
		# 如果是搜索则按照条件查询商品列表
		# 否则查询全部商品
		if (Request::instance()->isPost()) {
			$postData = input('post.');
			$data = $postData['data'];
			$where = [];
			$where['is_delete'] = 0;
			if (isset($data['cat_id']) && $data['cat_id']) {
				// $where['cat_id'] = ['eq',$data['cat_id']];
				$search_cat_id = $CategoryModel->getChildrenIdAndSelf($data['cat_id']);
				// print_r($search_cat_id);
				$where['cat_id'] = ['in',$search_cat_id];
			}
			if (isset($data['brand_id']) && $data['brand_id']) {
				$where['brand_id'] = ['eq',$data['brand_id']];
			}
			if (isset($data['recommend']) && $data['recommend']) {
				if ($data['recommend']!='all_type') {
					switch ($data['recommend']) {
						case 'is_best':
							$where['is_best'] = ['eq',1];
							break;
						case 'is_new':
							$where['is_new'] = ['eq',1];
							break;
						case 'is_hot':
							$where['is_hot'] = ['eq',1];
							break;
						case 'is_promote':
							$where['is_promote'] = ['eq',1];
							break;
					}
				} else {
					$where['is_best|is_new|is_hot|is_promote'] = ['eq',1];
				}
			}
			if (isset($data['is_on_sale']) && $data['is_on_sale']>=0) {
				$where['is_on_sale'] = ['eq',$data['is_on_sale']];
			}
			if (isset($data['keywords']) && trim($data['keywords'])) {
				$where['goods_name'] = ['like','%'.$data['keywords'].'%'];
			}
			if (!empty($where)) {
				$this->assign('searchList',$data);
			}
			// dump($where);
			$listData = $GoodsModel::where($where)->order('id desc')->paginate($paginate);
			// echo $GoodsModel->getLastSql();
		} else {
			$where = [];
			$where['is_delete'] = 0;
			$listData = $GoodsModel::where($where)->order('id desc')->paginate($paginate);
		}

		$this->assign('listData',$listData);

		return $this->fetch();
	}

	public function add()
	{
		# 标题
		$title = '添加商品';
		#面包屑导航
		$this->breadcrumb[0]['url'] = 'index';
		$this->breadcrumb[1]['url'] = '';
		$this->breadcrumb[1]['name'] = $title;

		$this->assign('title',$title);
		$this->assign('breadcrumb',$this->breadcrumb);
		$this->assign('isForm',1);
		$this->assign('isUpload',1);
		$this->assign('actionName','insert');

		# 分类树
		$CategoryModel = new CategoryModel;
		$catTree = $CategoryModel->getTree2();
		# 商品类型列表
		$goodsTypeList = GoodsTypeModel::where('is_enable',1)->select();
		# 商品品牌列表
		$brandList = BrandModel::where('is_show',1)->select();
		# 获取session
		$session = session('admin');
		$admin_id = $session['admin_uid'];
		# 获取goods_link表中admin_id等于当前管理员id，goods_id=0或link_goods_id=0的数据
		$GoodsLinkModel = new GoodsLinkModel;
		$where = [];
		$where['admin_id'] = ['eq',$admin_id];
		$where['goods_id'] = ['eq',0];
		$whereOr = [];
		$whereOr['admin_id'] = ['eq',$admin_id];
		$whereOr['link_goods_id'] = ['eq',0];
		GoodsLinkModel::where($where)->delete();
		GoodsLinkModel::where($whereOr)->delete();
		# 文章分类列表
		$ArticleCatModel = new ArticleCatModel;
		$articleCatTree = $ArticleCatModel->getTree2();
		# 获取goods_link表中admin_id等于当前管理员id，goods_id=0或link_goods_id=0的数据
		$GoodsArticleModel = new GoodsArticleModel;
		$where = [];
		$where['admin_id'] = ['eq',$admin_id];
		$where['goods_id'] = ['eq',0];
		$whereOr = [];
		$whereOr['admin_id'] = ['eq',$admin_id];
		$whereOr['article_id'] = ['eq',0];
		GoodsArticleModel::where($where)->delete();
		GoodsArticleModel::where($whereOr)->delete();
		# 清除goods_group表中parent_id=0或者goods_id=0的数据
		$where = [];
		$where['admin_id'] = ['eq',$admin_id];
		$where['goods_id'] = ['eq',0];
		$whereOr = [];
		$whereOr['admin_id'] = ['eq',$admin_id];
		$whereOr['parent_id'] = ['eq',0];
		GoodsGroupModel::where($where)->delete();
		GoodsGroupModel::where($whereOr)->delete();

		$this->assign('catTree',$catTree);
		$this->assign('goodsTypeList',$goodsTypeList);
		$this->assign('brandList',$brandList);
		$this->assign('editData',[]);
		$this->assign('galleryList',[]);
		$this->assign('galleryImgNumber',0);
		$this->assign('articleCatTree',$articleCatTree);
		$this->assign('id',0);

		return $this->fetch();
	}

	public function edit()
	{
		# 标题
		$title = '编辑商品';
		#面包屑导航
		$this->breadcrumb[0]['url'] = 'index';
		$this->breadcrumb[1]['url'] = '';
		$this->breadcrumb[1]['name'] = $title;

		$this->assign('title',$title);
		$this->assign('breadcrumb',$this->breadcrumb);
		$this->assign('isForm',1);
		$this->assign('isUpload',1);
		$this->assign('actionName','update');

		$id = input('id');
		$GoodsModel = new GoodsModel;
		$editData = $GoodsModel->find($id);
		// 促销
		if ($editData['is_promote']) {
			$editData['promote_start_date'] = date('Y-m-d',$editData['promote_start_date']);
			$editData['promote_end_date'] = date('Y-m-d',$editData['promote_end_date']);
		}
		// 获取扩展分类
		$extendCat = GoodsCatModel::where('goods_id',$id)->find();
		$editData['extend_cat_id'] = 0;
		if (!empty($extendCat)) {
			$editData['extend_cat_id'] = $extendCat['cat_id'];
		}

		# 分类树
		$CategoryModel = new CategoryModel;
		$catTree = $CategoryModel->getTree2();
		# 商品类型列表
		$goodsTypeList = GoodsTypeModel::where('is_enable',1)->select();
		# 商品品牌列表
		$brandList = BrandModel::where('is_show',1)->select();
		# 商品属性列表
		$GoodsAttrModel = new GoodsAttrModel;
		$attributeList = $GoodsAttrModel->getGoodsAttr($id);
		# 多个属性值前的 + - 符号
		$attrTypeGroup = $GoodsAttrModel->getGoodsAttrTypeForGroup($id);
		$attrTypeGroupStr = empty($attrTypeGroup) ? '' : implode(',',$attrTypeGroup);
		// 获取商品相册图片
		$galleryList = GoodsGalleryModel::where('goods_id',$id)->select();
		$galleryImgNumber = count($galleryList);
		# 关联商品列表
		$GoodsLinkModel = new GoodsLinkModel;
		$goodsLinkList = $GoodsLinkModel->getList($id);
		# 关联配件列表
		$GoodsGroupModel = new GoodsGroupModel;
		$goodsGroupList = $GoodsGroupModel->getList($id);
		# 文章分类列表
		$ArticleCatModel = new ArticleCatModel;
		$articleCatTree = $ArticleCatModel->getTree2();
		# 关联配件列表
		$GoodsArticleModel = new GoodsArticleModel;
		$goodsArticleList = $GoodsArticleModel->getList($id);

		$this->assign('catTree',$catTree);
		$this->assign('goodsTypeList',$goodsTypeList);
		$this->assign('brandList',$brandList);
		$this->assign('attributeList',$attributeList);
		$this->assign('attrTypeGroupStr',$attrTypeGroupStr);
		$this->assign('editData',$editData);
		$this->assign('galleryList',$galleryList);
		$this->assign('galleryImgNumber',$galleryImgNumber);
		$this->assign('goodsLinkList',$goodsLinkList);
		$this->assign('goodsGroupList',$goodsGroupList);
		$this->assign('goodsArticleList',$goodsArticleList);
		$this->assign('articleCatTree',$articleCatTree);
		$this->assign('id',$id);

		return $this->fetch('add');
	}

	public function insert()
	{
		$postData = input('post.');
		// 商品数据
		$data = $postData['data'];
		// 促销开始时间
		if (isset($data['is_promote']) && $data['is_promote']==1) {
			$data['promote_start_date'] = strtotime($data['promote_start_date']);
			$data['promote_end_date'] = strtotime($data['promote_end_date']);
			if ($data['promote_start_date']>=$data['promote_end_date']) {
				# 如果结束时间早于开始时间，则为不促销
				$data['is_promote'] = 0;
				$data['promote_start_date'] = 0;
				$data['promote_end_date'] = 0;
			}
		}
		// 商品扩展分类
		$goodsCat = $postData['goodsCat'];
		// 商品属性
		$attrData = [];
		if (isset($postData['attr_id_list']) && !empty($postData['attr_id_list'])) {
			$attr_id_list = $postData['attr_id_list'];
			$attr_value_list = $postData['attr_value_list'];
			$attr_price_list = $postData['attr_price_list'];
			foreach ($attr_id_list as $key => $value) {
				$arr = [];
				$arr['attr_id'] = $value;
				$arr['attr_value'] = $attr_value_list[$key];
				$arr['attr_price'] = $attr_price_list[$key];
				$attrData[] = $arr;
			}
		}

		// 上传图片
		$fileList = request()->file();
		// $file = request()->file('upfile');
		if (isset($fileList['upfile'])) {
			$file = $fileList['upfile'];
			$imgArr = [];
			if (!empty($file)) {
				# 有图片上传
				$imgArr = $this->upFile($file,'image','image',1,[300,150],[400,300]);
				if (!empty($imgArr)) {
					$data['original_img'] = $imgArr['file_original_url'];
					$data['goods_img'] = $imgArr['file_url'];
					$data['goods_thumb'] = $imgArr['file_thumb_url'];
				}
			}
		}

		$create_time = time();
		$data['add_time'] = $create_time;
		$data['last_update'] = $create_time;

		$GoodsModel = new GoodsModel;
		$trans_result = true;
		// 启动事务
		$GoodsModel::startTrans();
		try{
		    // 添加商品数据
			$id = $GoodsModel::insertGetId($data);
			// echo 'id='.$id.'<br>';
			// 添加商品扩展分类
			$extend_cat_id = 0;
			if ($goodsCat['cat_id']) {
				# 有扩展分类
				$goodsCat['goods_id'] = $id;
				$extend_cat_id = GoodsCatModel::insert($goodsCat);
				// echo 'eid='.$extend_cat_id.'<br>';
			}
			// 添加商品属性
			if (!empty($attrData)) {
				foreach ($attrData as $key => $value) {
					$value['goods_id'] = $id;
					$aid = GoodsAttrModel::insert($value);
					// echo 'aid='.$aid.'<br>';
				}
			}
			// 添加相册图片
			// $galleryFileArr = request()->file('imgFile');
			$galleryFileArr = $fileList['imgFile'];
			if (!empty($galleryFileArr)) {
		       	$gallery = [];
		       	foreach ($galleryFileArr as $key => $value) {
		       		$gallery[$key] = $this->upFile($value,'image','gallery',1,[300,150]);
		       		$galleryArr = [];
		       		$galleryArr['goods_id'] = $id;
		       		$galleryArr['img_original'] = $gallery[$key]['file_original_url'];
		       		$galleryArr['img_url'] = $gallery[$key]['file_url'];
		       		$galleryArr['thumb_url'] = $gallery[$key]['file_thumb_url'];
					$gid = GoodsGalleryModel::insert($galleryArr);
					// echo 'gid='.$gid.'<br>';
		       	}
	       	}
	       	// 编辑关联商品
	       	$session = session('admin');
	       	$GoodsLinkModel = new GoodsLinkModel;
	       	$GoodsLinkModel->where(['admin_id'=>$session['admin_uid'],'goods_id'=>0])->setField('goods_id',$id);
	       	// 编辑关联文章
	       	$GoodsArticleModel = new GoodsArticleModel;
	       	$GoodsArticleModel->where(['admin_id'=>$session['admin_uid'],'goods_id'=>0])->setField('goods_id',$id);
	       	// 编辑商品配件
	       	$GoodsGroupModel = new GoodsGroupModel;
	       	$GoodsGroupModel->where(['admin_id'=>$session['admin_uid'],'parent_id'=>0])->setField('parent_id',$id);
		    // 提交事务
		    $GoodsModel::commit();
		} catch (\Exception $e) {
		    $trans_result = false;
		    // 回滚事务
		    $GoodsModel::rollback();		    
		}
		if ($trans_result) {
		    // 管理日志
			$log_info = '添加文章成功，商品id='.$id.'|Goods';
			$this->addAdminLog($log_info,1);
			// 跳转
			return $this->success('商品添加成功！','index');
		} else {
			# 删除商品图片
			if (isset($data['original_img']) && $data['original_img']) {
				@unlink(__DIR__.'/../../../public/'.$data['original_img']);
				@unlink(__DIR__.'/../../../public/'.$data['goods_img']);
				@unlink(__DIR__.'/../../../public/'.$data['goods_thumb']);
			}
			# 删除相册图片
		    if (!empty($gallery)) {
		    	foreach ($gallery as $key => $value) {
		    		@unlink(__DIR__.'/../../../public/'.$value);

		    	}
		    }
			return $this->error('商品添加失败！');
		}
	}

	public function update()
	{
		$postData = input('post.');
		// 商品数据
		$data = $postData['data'];
		// 商品id
		$id = $postData['id'];
		// 商品模型
		$GoodsModel = new GoodsModel;
		// 促销开始时间
		if (isset($data['is_promote']) && $data['is_promote']==1) {
			$data['promote_start_date'] = strtotime($data['promote_start_date']);
			$data['promote_end_date'] = strtotime($data['promote_end_date']);
			if ($data['promote_start_date']>=$data['promote_end_date']) {
				# 如果结束时间早于开始时间，则为不促销
				$data['is_promote'] = 0;
				$data['promote_start_date'] = 0;
				$data['promote_end_date'] = 0;
			}
		}
		// 商品扩展分类
		$goodsCat = $postData['goodsCat'];
		if ($goodsCat['cat_id']) {
			$goodsCat['goods_id'] = $id;
		}
		// 商品属性
		$attrData = [];
		if (isset($postData['attr_id_list']) && !empty($postData['attr_id_list'])) {
			$attr_id_list = $postData['attr_id_list'];
			$attr_value_list = $postData['attr_value_list'];
			$attr_price_list = $postData['attr_price_list'];
			foreach ($attr_id_list as $key => $value) {
				$arr = [];
				$arr['goods_id'] = $id;
				$arr['attr_id'] = $value;
				$arr['attr_value'] = $attr_value_list[$key];
				$arr['attr_price'] = $attr_price_list[$key];
				$attrData[] = $arr;
			}
		}

		// 上传图片
		$fileList = request()->file();
		// dump($fileList);exit;
		// $file = request()->file('upfile');
		$file = isset($fileList['upfile']) ? $fileList['upfile'] : [];
		$imgArr = [];
		if (!empty($file)) {
			# 有图片上传
			$imgArr = $this->upFile($file,'image','image',1,[300,150],[400,300]);
			if (!empty($imgArr)) {
				$data['original_img'] = $imgArr['file_original_url'];
				$data['goods_img'] = $imgArr['file_url'];
				$data['goods_thumb'] = $imgArr['file_thumb_url'];
			}
		}

		$update_time = time();
		$data['last_update'] = $update_time;

		$trans_result = true;
		# 商品数据
		$editData = $GoodsModel->find($id);
		# 扩展分类
		$extendEditData = GoodsCatModel::where('goods_id',$id)->find();
		# 商品属性
		$attrEditData = GoodsAttrModel::where('goods_id',$id)->select();
		// 编辑商品数据
		$goodsRes = $GoodsModel->save($data,['id'=>$id]);
		// 编辑扩展分类
		// 之前没有扩展分类，编辑后也没有，则跳过
		// 之前没有扩展分类，则把扩展分类添加到goods_cat表中
		// 如果之前有，编辑后没有，则删除表中数据
		// 如果之前有，编辑后也有：
		// 编辑前后分类相同则跳过
		// 编辑前后分类不同则修改表中数据
		$GoodsCatModel = new GoodsCatModel;
		if (empty($extendEditData) && $goodsCat['cat_id']) {
			# 原来没有扩展分类，编辑后有扩展分类，则添加数据到goods_cat表
			$extend_cat_id = $GoodsCatModel->insert($goodsCat);
		} else if (!empty($extendEditData) && $extendEditData['cat_id'] && !$goodsCat['cat_id']) {
			# 原来有扩展分类，编辑后没有扩展分类，则删除goods_cat表中数据
			$extend_cat_id = $GoodsCatModel->where('goods_id',$id)->delete();
		} else if (!empty($extendEditData) && $extendEditData['cat_id'] && $goodsCat['cat_id']) {
			# 编辑前后都有扩展分类
			if ($extendEditData['cat_id'] != $goodsCat['cat_id']) {
				# 编辑前后的扩展分类不同，则编辑
				$extend_cat_id = $GoodsCatModel->save($goodsCat,['goods_id'=>$id]);
			}
		}
		// 编辑商品属性
		// $attrEditData 编辑前的属性
		// $attrData 编辑后的属性
		$this->updateGoodsAttr($id,$attrEditData,$attrData);
		// 添加相册图片
		// $galleryFileArr = request()->file('imgFile');
		$galleryFileArr = isset($fileList['imgFile']) ? $fileList['imgFile'] : [];
		if (!empty($galleryFileArr)) {
	       	$gallery = [];
	       	foreach ($galleryFileArr as $key => $value) {
	       		$gallery[$key] = $this->upFile($value,'image','gallery',1,[300,150]);
	       		$galleryArr = [];
	       		$galleryArr['goods_id'] = $id;
	       		$galleryArr['img_original'] = $gallery[$key]['file_original_url'];
	       		$galleryArr['img_url'] = $gallery[$key]['file_url'];
	       		$galleryArr['thumb_url'] = $gallery[$key]['file_thumb_url'];
				$gid = GoodsGalleryModel::insert($galleryArr);
				// echo 'gid='.$gid.'<br>';
	       	}
       	}

       	// 管理日志
		$log_info = '商品数据编辑成功，商品id='.$id.'|Goods';
		$this->addAdminLog($log_info,1);
		# 如果更新了商品图片，则删除旧图片
		if (isset($data['original_img']) && $data['original_img'] && isset($editData['original_img']) && $editData['original_img']) {
			@unlink(__DIR__.'/../../../public/'.$editData['original_img']);
			@unlink(__DIR__.'/../../../public/'.$editData['goods_img']);
			@unlink(__DIR__.'/../../../public/'.$editData['goods_thumb']);
		}
		// 跳转
		return $this->success('商品数据编辑成功！','index');
		
		# 删除商品图片
		// if (isset($data['original_img']) && $data['original_img']) {
		// 	@unlink(__DIR__.'/../../../public/'.$data['original_img']);
		// 	@unlink(__DIR__.'/../../../public/'.$data['goods_img']);
		// 	@unlink(__DIR__.'/../../../public/'.$data['goods_thumb']);
		// }
		// # 删除相册图片
	 //    if (!empty($gallery)) {
	 //    	foreach ($gallery as $key => $value) {
		// 		@unlink(__DIR__.'/../../../public/'.$value['img_original']);
		// 		@unlink(__DIR__.'/../../../public/'.$value['img_url']);
		// 		@unlink(__DIR__.'/../../../public/'.$value['thumb_url']);
	 //    	}
	 //    }
	}

	// 将商品放入回收站
	public function del()
	{
		// 检查权限
		$this->checkPermissionForMsg('goods_remove_back');

		$id = input('id');
		$GoodsModel = new GoodsModel;
		$data = [];
		$data['is_delete'] = 1;
		$res = $GoodsModel->save($data,['id'=>$id]);

		if ($res) {
			return $this->success('数据放入回收站成功');
		}
		return $this->error('数据放入回收站失败');
	}

	public function changeType()
	{
		$postData = input('post.');
		$data = $postData['data'];
		$type = $data['changeType'];
		$goodsId = $postData['goodsId'];
		$flag = 0;
		if (isset($type) && $type) {
			if (!empty($goodsId)) {
				$where = [];
				switch ($type) {
					case 'trash':
						$where['is_delete'] = 1;
						break;
					case 'on_sale':
						$where['is_on_sale'] = 1;
						break;
					case 'not_on_sale':
						$where['is_on_sale'] = 0;
						break;
					case 'best':
						$where['is_best'] = 1;
						break;
					case 'not_best':
						$where['is_best'] = 0;
						break;
					case 'new':
						$where['is_new'] = 1;
						break;
					case 'not_new':
						$where['is_new'] = 0;
						break;
					case 'hot':
						$where['is_hot'] = 1;
						break;
					case 'not_hot':
						$where['is_hot'] = 0;
						break;
					case 'move_to':
						if (isset($data['changeCatId']) && $data['changeCatId']) {
							$where['cat_id'] = $data['changeCatId'];
						} else {
							$flag = 1;
						}
						break;
				}
				if ($flag==1) {
					return $this->error('请选择要改变的分类');
				}
				$GoodsModel = new GoodsModel;
				foreach ($goodsId as $gid) {
					GoodsModel::where(['id'=>$gid])->update($where);
					// echo $GoodsModel->getLastSql();
				}
			}
			return $this->success('数据更新成功');
		}
		return $this->error('请选择要执行的操作');
	}

	public function deleteGalleryForAjax()
	{
		// 获取传递过来的key值，即goods_gallery表的主键id值
		$id = input('key');
		// $id = 11;
		$GoodsGalleryModel = new GoodsGalleryModel;
		$data = $GoodsGalleryModel->find($id);
		$res = $GoodsGalleryModel->where(['id'=>$id])->delete();
		if ($res) {
			# 删除相册图片
			@unlink(__DIR__.'/../../../public/'.$data['img_original']);
			@unlink(__DIR__.'/../../../public/'.$data['img_url']);
			@unlink(__DIR__.'/../../../public/'.$data['thumb_url']);
		}
		return 1;
	}

	// 编辑商品属性
	// 如果编辑前后都没有属性，则跳过
	// 如果之前没有属性，而编辑后  有属性， 则把编辑后的属性直接插入到goods_attr表中
	// 如果之前  有属性，而编辑后没有属性， 则删除goods_attr表中相关数据
	// 如果之前有属性，之后也有属性，
	// 则将之前不存在的属性添加到goods_attr表中
	// 将之前存在，而编辑后不存在的数据删除
	protected function updateGoodsAttr($goods_id,$beforeData=[],$afterData=[])
	{
		# 1 - 编辑前后都没有属性
		if (empty($beforeData) && empty($afterData)) {
			$res = true;
		}
		# 2 - 编辑前没有属性，编辑后有属性，则把数据直接插入到goods_attr表中
		else if (empty($beforeData) && !empty($afterData)) {
			foreach ($afterData as $key => $value) {
				$res = GoodsAttrModel::insert($afterData);
			}
		}
		# 3 - 编辑前有属性，编辑后没有属性，则把goods_attr表中该商品的属性删除
		else if (!empty($beforeData) && empty($afterData)) {
			$res = GoodsAttrModel::where('goods_id',$goods_id)->delete();
		}
		# 4 - 编辑前有属性，编辑后也有属性
		else if (!empty($beforeData) && !empty($afterData)) {
			$beforeId = $afterId = [];
			foreach ($beforeData as $key => $value) {
				$beforeId[] = $value['id'];
			}
			foreach ($afterData as $key => $value) {
				$afterId[] = $value['id'];
			}
			# 编辑前有，编辑后没有的id,即需要删除的id
			$reduceId = array_diff($beforeId,$afterId);
			# 编辑后有，编辑前没有的id，即需要加上的id
			$addId = array_diff($afterId,$beforeId);
			# A - 编辑前有，编辑后没有的属性，需要删除
			foreach ($beforeData as $key => $value) {
				if (in_array($value['id'],$reduceId)) {
					GoodsAttrModel::where('id',$value['id'])->delete();
				}
			}
			# B - 编辑后有，编辑前没有的属性，则将新属性加入到goods_attr表中
			foreach ($afterData as $key => $value) {
				if (in_array($value['id'],$addId)) {
					GoodsAttrModel::insert($value);
				}
			}
		}
		// end
	}

	// 搜索关联商品数据
	public function searchLinkGoods()
	{
		$postData = input('post.');
		$catId = $postData['linkCatId'];
		$linkBrandId = $postData['linkBrandId'];
		$searchLinkKeywords = $postData['searchLinkKeywords'];
		$where = [];
		$arr = [];
		$arr['cat_id'] = $catId ? ['eq',$catId] : '';
		$arr['brand_id'] = $linkBrandId ? ["eq",$linkBrandId] : '';
		$arr['goods_name'] = $searchLinkKeywords ? ["like",'%'.$searchLinkKeywords.'%'] : '';
		$where = array_filter($arr);

		$GoodsModel = new GoodsModel;
		if (!empty($where)) {
			$res = $GoodsModel->field('id,goods_name')->where($where)->select();
		} else {
			$res = $GoodsModel->select();
		}

		echo json_encode($res);
		exit;
	}
}