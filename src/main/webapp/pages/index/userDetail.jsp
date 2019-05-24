<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
<title>注册界面</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/pages/static/admin/layui/css/layui.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/pages/static/admin/css/admin.css" />
</head>
<body>
	<div class="layui-tab page-content-wrap" class="layui-form">
		<div class="layui-form-item">
			<label class="layui-form-label">用户名：</label> <label
				class="layui-form-label">${userinfo.username}</label>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">姓名：</label> <label
				class="layui-form-label">${userdetail.name}</label>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">邮箱：</label> <label
				class="layui-form-label">${userdetail.mail}</label>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">性别：</label> <label
				class="layui-form-label">${userdetail.sex =='1'? '男': '女'}</label>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">生日：</label> <label
				class="layui-form-label">${userdetail.bthdate}</label>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">身份证号：</label> <label
				class="layui-form-label">${userdetail.pid}</label>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">电话：</label> <label
				class="layui-form-label">${userdetail.phone}</label>
		</div>
		<div class="layui-form-item">
			<div class="layui-input-block">
				<a class="layui-btn layui-btn-normal" href="${pageContext.request.contextPath}/user/userdetailmodify">修改</a>
			</div>
		</div>
	</div>
	<script
		src="${pageContext.request.contextPath }/pages/static/admin/layui/layui.js"
		type="text/javascript" charset="utf-8"></script>
	<script>
		//Demo
		layui.use([ 'form'], function() {
			var form = layui.form;
			form.render();
		});
	</script>
</body>
</html>