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
<title>充值</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/pages/static/admin/layui/css/layui.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/pages/static/admin/css/admin.css" />
</head>
<body>
	<div class="layui-tab page-content-wrap">
		<form class="layui-form" style="width: 90%; padding-top: 20px;"
			action="${pageContext.request.contextPath }/account/finish"
			method="post">
			<div class="layui-form-item">
				<label class="layui-form-label">充值金额：</label>
				<div class="layui-input-block">
					<label class="layui-form-label reds">${param.money }元<input type="hidden" name="money" value="${param.money }"/></label>
				</div>
			</div>
			<div class="layui-form-item">
				<input type="radio" name="paytype" value="1" /><img
					style="width: 40px; height: 40px;"
					src="${pageContext.request.contextPath }/pages/bus/zhifubao.png">
				&nbsp;&nbsp;&nbsp; <input type="radio" name="paytype" value="2" /><img
					style="width: 40px; height: 40px;"
					src="${pageContext.request.contextPath }/pages/bus/weixin.png">
				&nbsp;&nbsp;&nbsp; <input type="radio" name="paytype" value="3" /><img
					style="width: 40px; height: 40px;"
					src="${pageContext.request.contextPath }/pages/bus/yue.png">
			</div>
			<div class="layui-form-item">
				<div class="layui-input-block">
					<button class="layui-btn layui-btn-normal" lay-submit
						lay-filter="change">下一步</button>
				</div>
			</div>
		</form>
	</div>
	<script
		src="${pageContext.request.contextPath }/pages/static/admin/layui/layui.js"
		type="text/javascript" charset="utf-8"></script>
	<script>
		layui.use([ 'form', 'laydate' ], function() {
			var $ = layui.jquery;
			var form = layui.form;
			form.render();
		});
	</script>
</body>
</html>