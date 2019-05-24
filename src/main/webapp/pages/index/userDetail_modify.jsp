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
<title>用户信息修改</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/pages/static/admin/layui/css/layui.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/pages/static/admin/css/admin.css" />
</head>
<body>
	<div class="layui-tab page-content-wrap">
		<form class="layui-form" style="width: 90%; padding-top: 20px;"
			action="${pageContext.request.contextPath }/user/saveUserdetail"
			method="post">
			<div class="layui-form-item">
				<label class="layui-form-label">用户名：</label> <label
					class="layui-form-label">${userinfo.username}<input
					type="hidden" name="username" autocomplete="off"
					value="${userinfo.username}" placeholder="请输入姓名"></label>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">姓名：</label>
				<div class="layui-input-block">
					<input type="text" name="name" autocomplete="off"
						value="${userdetail.name}" class="layui-input" value=""
						placeholder="请输入姓名">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">邮箱：</label>
				<div class="layui-input-block">
					<input type="text" name="mail" autocomplete="off"
						class="layui-input"lay-verify="email" value="${userdetail.mail}" placeholder="请输入邮箱">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">性别：</label>
				<div class="layui-input-block">
					<select name="sex">
						<option value="1"
							<c:if test="${userdetail.sex =='1'}">selected="selected"</c:if>>男</option>
						<option value="2"
							<c:if test="${userdetail.sex =='2'}">selected="selected"</c:if>>女</option>
					</select>
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">生日：</label>
				<div class="layui-input-block">
					<input type="text" name="bthdate" autocomplete="off" id="bthdate"
						class="layui-input" value="${userdetail.bthdate}"
						placeholder="请输入生日">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">身份证号：</label>
				<div class="layui-input-block">
					<input type="text" name="pid" autocomplete="off"
						class="layui-input" lay-verify="identity"
						value="${userdetail.pid}"
						placeholder="请输入身份证号">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">电话：</label>
				<div class="layui-input-block">
					<input type="text" name="phone" autocomplete="off"
					lay-verify="phone"
						class="layui-input" value="${userdetail.phone}"
						placeholder="请输入电话">
				</div>
			</div>
			<div class="layui-form-item">
				<div class="layui-input-block">
					<button class="layui-btn layui-btn-normal" lay-submit
						lay-filter="change">修改</button>
					<a class="layui-btn layui-btn-normal"
						href="${pageContext.request.contextPath}/user/userdetail">返回</a>
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
				elem : '#bthdate',
				format : 'yyyy/MM/dd',
				theme : '#128fed'
			});
		});
	</script>
</body>
</html>