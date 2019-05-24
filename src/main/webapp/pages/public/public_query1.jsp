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
<title>公告管理</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/pages/static/admin/layui/css/layui.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/pages/static/admin/css/admin.css" />
</head>
<body>
	<table id="result"></table>
	<script
		src="${pageContext.request.contextPath }/pages/static/admin/layui/layui.js"
		type="text/javascript" charset="utf-8"></script>
	<script>
		layui.use([ 'table' ], function() {

			var url = "${pageContext.request.contextPath }/public/query?time="
					+ new Date().getTime();
			var $ = layui.jquery;
			$.get(url, function(rs) {
				layui.table.render({
					elem : '#result',
					cols : [ [ //表头
				 {
						field : 'title',
						title : '标题'
					}, {
						field : 'content',
						title : '公告内容'
					}, {
						field : 'pubtime',
						title : '发布时间'
					} ] ],
					data : rs
					,page: true
				});
			});

		});
	</script>
</body>
</html>