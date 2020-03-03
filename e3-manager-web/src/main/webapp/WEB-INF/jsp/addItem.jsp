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
		<div>
			<button data-method="offset" data-type="auto" class="layui-btn layui-btn-sm layui-btn-normal" type="button" id="selectcid">选择类目</button>
			<form class="layui-form" action="">
				<div class="layui-form-item">
					<label class="layui-form-label">选择类目</label>
					<div class="layui-input-block">
						<input type="hidden" name="cid" required  lay-verify="required"class="layui-input">
						<span></span>
					</div>
				</div>
				<script src="../../js/layui/layui.js"></script>
				<div class="layui-form-item">
					<label class="layui-form-label">密码框</label>
					<div class="layui-input-inline">
						<input type="password" name="password" required lay-verify="required" placeholder="请输入密码" autocomplete="off" class="layui-input">
					</div>
					<div class="layui-form-mid layui-word-aux">辅助文字</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">选择框</label>
					<div class="layui-input-block">
						<select name="city" lay-verify="required">
							<option value=""></option>
							<option value="0">北京</option>
							<option value="1">上海</option>
							<option value="2">广州</option>
							<option value="3">深圳</option>
							<option value="4">杭州</option>
						</select>
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">复选框</label>
					<div class="layui-input-block">
						<input type="checkbox" name="like[write]" title="写作">
						<input type="checkbox" name="like[read]" title="阅读" checked>
						<input type="checkbox" name="like[dai]" title="发呆">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">开关</label>
					<div class="layui-input-block">
						<input type="checkbox" name="switch" lay-skin="switch">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">单选框</label>
					<div class="layui-input-block">
						<input type="radio" name="sex" value="男" title="男">
						<input type="radio" name="sex" value="女" title="女" checked>
					</div>
				</div>
				<div class="layui-form-item layui-form-text">
					<label class="layui-form-label">商品描述</label>
					<div class="layui-input-block">
						<textarea name="desc" placeholder="请输入内容" class="layui-textarea"></textarea>
					</div>
				</div>
				<div class="layui-form-item">
					<div class="layui-input-block">
						<button class="layui-btn" lay-submit lay-filter="formDemo">立即提交</button>
						<button type="reset" class="layui-btn layui-btn-primary">重置</button>
					</div>
				</div>
			</form>
		</div>

		<script>
			layui.use('layer', function(){ //独立版的layer无需执行这一句
				var layer = layui.layer; //独立版的layer无需执行这一句
				$("#selectcid").on('click',function () {
					layer.open({
						type: 1
						,title:"添加商品"
						,content: '<div style="padding: 20px 100px;">'+ "选择商品" +'</div>'
						,btn: '关闭全部'
						,btnAlign: 'c' //按钮居中
						,yes: function(){
							layer.closeAll();
						}
					});
				});
			});
		</script>
		<script>
			//Demo
			layui.use('form', function(){
				var form = layui.form;

				//监听提交
				form.on('submit(formDemo)', function(data){
					layer.msg(JSON.stringify(data.field));
					return false;
				});
			});
		</script>
	</div>
	<div class="layui-footer">
		<!-- 底部固定区域 -->
		© layui.com - 底部固定区域
	</div>
	</div>


</body>
</html>