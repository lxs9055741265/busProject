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
			method="post"></form>
		<table id="result"></table>
	</div>
	<script
		src="${pageContext.request.contextPath }/pages/static/admin/layui/layui.js"
		type="text/javascript" charset="utf-8"></script>
	<script>
		layui
				.use(
						[ 'form', 'laydate', 'table' ],
						function() {
							var $ = layui.jquery;
							var form = layui.form;
							form.render();
							var table = layui.table;

							var url = "${pageContext.request.contextPath }/account/queryDetail";
							var $ = layui.jquery;
							$.post(url, function(rs) {
								layui.table.render({
									elem : '#result',
									
									cols : [ [ //表头
									{
										field : 'acct',
										title : '交易金额'
									}, {
										field : 'money',
										title : '余额'
									}, {
										field : 'acctime',
										title : '交易时间'
									}, {
										field : 'detail',
										title : '交易详情'
									} ] ],
									data : rs,
									page: true
								});
							});
						});
	</script>
</body>
</html>