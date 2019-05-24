<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
<title>景点发布</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/pages/static/admin/layui/css/layui.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/pages/static/admin/css/admin.css" />
</head>
<body>
	<div class="layui-tab page-content-wrap">
		<form class="layui-form" style="width: 90%; padding-top: 20px;"
			action="${pageContext.request.contextPath }/view/save" method="post">
			<div class="layui-form-item">
				<label class="layui-form-label">景点名称：</label>
				<div class="layui-input-block">
					<input type="text" name="viewname" autocomplete="off"
						lay-verify="required" class="layui-input" placeholder="请输入景点名称">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">景点介绍：</label>
				<div class="layui-input-block">
					<textarea name="content" class="layui-textarea"
						placeholder="请输入景点介绍" lay-verify="required"></textarea>
				</div>
			</div>
			<div class="layui-form-item">
				<div class="layui-input-block">
					<button class="layui-btn layui-btn-normal" lay-submit
						lay-filter="change">发布景点</button>
					<a class="layui-btn layui-btn-normal"
						href="${pageContext.request.contextPath}/pages/view/view_manage.jsp">返回查询</a>
				</div>
			</div>
		</form>
	</div>
	<script
		src="${pageContext.request.contextPath }/pages/static/admin/layui/layui.js"
		type="text/javascript" charset="utf-8"></script>
	<script>
		layui.use([ 'form' ], function() {
			var $ = layui.jquery;
			var form = layui.form;
			form.render();
		});
	</script>
</body>
</html>