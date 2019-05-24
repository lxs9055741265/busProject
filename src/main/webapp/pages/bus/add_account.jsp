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
			action="${pageContext.request.contextPath }/account/next"
			method="post">
			<div class="layui-form-item">
				<label class="layui-form-label">充值金额：</label>
				<div class="layui-input-block">
					<div class="layui-col-sm3">
						<input type="text" name="money" autocomplete="off"
							lay-verify="required|number|money" class="layui-input" placeholder="请输入充值金额">
					</div>
					<div class="layui-col-sm3">
						<button class="layui-btn layui-btn-normal" lay-submit
							lay-filter="change">下一步</button>
					</div>
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
			
			form.verify({
				money : function(value) {
					if (parseFloat(value) <= 0) {
						return "充值金额必须大于等于0";	
					}
				}
			});
		});
	</script>
</body>
</html>