<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="utf-8">
	<title>Layui</title>
	<meta name="renderer" content="webkit">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<link rel="stylesheet" href="../../js/layui/css/layui.css" media="all">
</head>

<body class="layui-layout-body">
	<%@ include file="top.jsp"%>

	<%@ include file="sider.jsp"%>
	<div class="layui-body" style="padding: 15px">
		<form action="/getItem" method="post" id="itemform">
		<div  style="padding: 15px; border:1px solid #eeeeee;width: 96%;margin-left: 15px"  >
			<div class="layui-row">
				<div class="layui-icon layui-icon-search layui-col-md8">筛选搜索</div>
				<div class="layui-col-md4">
					<button class="layui-btn layui-btn-sm" lay-event="getCheckData" style="float: right;margin-left: 10px" type="reset">重置</button>
					<button class="layui-btn layui-btn-sm" lay-event="getCheckData" style="float: right" id="qurey" type="submit">查询结果</button>
				</div>
			</div>
			<div>
				<div class="layui-row" style="margin-top: 10px">
					<div class="layui-col-md4">
						<label class="layui-form-label">输入搜索：</label>
						<div class="layui-input-block">
							<input type="text" style="width: 80%" name="title" lay-verify="title" autocomplete="off" placeholder="请输入标题" class="layui-input">
						</div>
					</div>
					<div class="layui-col-md4">
						<label class="layui-form-label">商品货号：</label>
						<div class="layui-input-block">
							<input type="text" style="width: 80%" name="num" id="num" lay-verify="title" autocomplete="off" placeholder="请输入标题" class="layui-input" value="${num eq null? "":num}">
						</div>
					</div>
					<div class="layui-col-md4">
						<label class="layui-form-label">商品分类：</label>
						<div class="layui-input-block">
							<input type="text" style="width: 80%" name="fenlei" lay-verify="title" autocomplete="off" placeholder="请输入标题" class="layui-input">
						</div>
					</div>
				</div>
				<div  class="layui-row"  style="margin-top: 10px">
					<div class="layui-col-md4">
						<label class="layui-form-label">商品品牌：</label>
						<div class="layui-input-block">
							<input type="text" style="width: 80%" name="brand" lay-verify="title" autocomplete="off" placeholder="请输入标题" class="layui-input">
						</div>
					</div>
					<div class="layui-col-md4">
						<label class="layui-form-label">上架状态：</label>
						<div class="layui-input-block">
							<input type="text" style="width: 80%" name="status" id="status" lay-verify="title" autocomplete="off" placeholder="请输入标题" class="layui-input" value="${status eq null ? "":status}">
						</div>
					</div>
					<div class="layui-col-md4">
						<label class="layui-form-label">审核状态：</label>
						<div class="layui-input-block">
							<input type="text" style="width: 80%" name="shenhe" lay-verify="title" autocomplete="off" placeholder="请输入标题" class="layui-input">
						</div>
					</div>
				</div>
			</div>
		</div>
		</form>
		<!-- 内容主体区域 -->
		<div style="padding: 15px;">
			<table id="demo" lay-filter="demo"></table>
			<script type="text/html" id="toolbarDemo">
				<div class="layui-btn-container">
					<button class="layui-btn layui-btn-sm" lay-event="getCheckData">添加</button>
				</div>
			</script>
			<script type="text/html" id="barDemo">
				<a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
				<a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a><br>
				<a class="layui-btn layui-btn-xs" lay-event="edit">日志</a>
				<a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">查看</a>
			</script>
			<script type="text/html" id="checkboxTpl">
				<!--这里的 checked 的状态只是演示 -->
				<button class="layui-icon   layui-icon-edit" lay-event="getCheckData"></button>

			</script>
			<script src="../../js/layui/layui.js"></script>
			<script>
				//JavaScript代码区域
				layui.use('element', function(){
					var element = layui.element;

				});
			</script>

			<script>
				layui.use('table', function(){
					var num = "${num}";
					var status = "${status}";
					var table = layui.table;
					table.render({
						elem: '#demo'
						,url: 'item' //数据接口
						,where:{status:status,num:num}
						,toolbar:'#toolbarDemo'
						,done: function (res, curr, count) {
							$("table").css("width", "100%");
							$("table").css("height", "100%");
						}
						,parseData: function(res){ //res 即为原始返回的数据
							return {
								"code": 0, //解析接口状态
								"msg": "", //解析提示文本
								"count": res.count, //解析数据长度
								"data": res.data.list //解析数据列表
							};
						}
						,page: true //开启分页
						,  cols: [
							[
								{type: 'checkbox'}
								,{field: 'id', title: '商品ID',sort: true}
								, {field: 'title', title: '商品标题'}
								, {field: 'cid', title: '叶子类目', width: 150}
								, {field: 'sell_point', title: '卖点'}
								,{field:'price', title:'价格', width:85}
								, {field: 'num', title: '库存数量'}
								,{field:'barcode', title:'条形码', width:110}
								, {field: 'status', title: '状态'}
								, {field: 'created', title: '创建日期'}
								, {field: 'updated', title: '更新日期'}
								,{fixed: 'right', title:'操作', toolbar: '#barDemo', width:150,align:'center'}
							]
						]
						, limit: 10   //默认十条数据一页
						, limits: [10, 20, 30, 50]  //数据分页条
					});
					//监听行工具事件
					table.on('tool(demo)', function(obj){
						var data = obj.data;
						//console.log(obj)
						if(obj.event === 'del'){
							layer.confirm('真的删除行么', function(index){
								obj.del();
								layer.close(index);
							});
						} else if(obj.event === 'edit'){
							layer.prompt({
								formType: 2
								,value: data.email
							}, function(value, index){
								obj.update({
									email: value
								});
								layer.close(index);
							});
						}
					});
				});
			</script>
		</div>
	</div>
	<div class="layui-footer">
		<!-- 底部固定区域 -->
		© layui.com - 底部固定区域
	</div>
</div>
</body>
</html>