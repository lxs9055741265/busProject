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
<title>失物发布</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/pages/static/admin/layui/css/layui.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/pages/static/admin/css/admin.css" />
</head>
<body>
	<div class="layui-tab page-content-wrap">
		<form class="layui-form" style="width: 90%; padding-top: 20px;"
			action="${pageContext.request.contextPath }/lost/save"
			method="post">
			<div class="layui-form-item">
				<label class="layui-form-label">物品种类：</label>
				<div class="layui-input-block">
					<input type="hidden" name="username" autocomplete="off"
						value="${userinfo.username}" placeholder="请输入姓名"> <input
						type="text" name="losttype" autocomplete="off"
						lay-verify="required" class="layui-input" placeholder="请输入物品种类">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">标题：</label>
				<div class="layui-input-block">
					<input type="text" name="title" autocomplete="off"
						class="layui-input" lay-verify="required" placeholder="请输入标题">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">详细描述：</label>
				<div class="layui-input-block">
					<textarea name="desc" class="layui-input" placeholder="请输入详细描述"
						lay-verify="required"></textarea>
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">日期：</label>
				<div class="layui-input-block">
					<input type="text" name="losttime" autocomplete="off" id="losttime"
						class="layui-input" placeholder="请输入日期" lay-verify="required">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">邮箱：</label>
				<div class="layui-input-block">
					<input type="text" name="mail" autocomplete="off"
						class="layui-input" placeholder="请输入邮箱，便于失主联系"
						lay-verify="required|email">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">电话：</label>
				<div class="layui-input-block">
					<input type="text" name="phone" autocomplete="off"
						class="layui-input" lay-verify="required|phone" placeholder="请输入联系电话">
				</div>
			</div>
			<div class="layui-form-item">
				<div class="layui-input-block">
					<button class="layui-btn layui-btn-normal" lay-submit
						lay-filter="change">提交</button>
					<a class="layui-btn layui-btn-normal"
						href="${pageContext.request.contextPath}/user/userdetail">返回主页</a>
				</div>
			</div>
		</form>
	</div>
	<script
		src="${pageContext.request.contextPath }/pages/static/admin/layui/layui.js"
		type="text/javascript" charset="utf-8"></script>
	<script>
		layui.use([ 'laydate', 'form' ], function() {
			var laydate = layui.laydate;
			var $ = layui.jquery;
			var form = layui.form;
			form.render();

			laydate.render({
				elem : '#losttime',
				format : 'yyyy/MM/dd',
				theme : '#128fed'
			});
		});
	</script>
</body>
</html>