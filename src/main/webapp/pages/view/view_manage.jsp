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
<title>景点管理</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/pages/static/admin/layui/css/layui.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/pages/static/admin/css/admin.css" />
</head>
<body>
	<div class="layui-tab page-content-wrap">
		<div class="layui-form-item">
			<div class="layui-col-sm3">
				<input type="text" name="viewname" autocomplete="off" id="viewname"
					class="layui-input" placeholder="请输入景点名称">
			</div>
			<div class="layui-col-sm3">
				<button class="layui-btn layui-btn-normal" onclick="query();">查询</button>
			</div>
		</div>
	</div>
	<table id="result"></table>
	<div class="layui-form-item" style="text-align: center;">
		<div class="layui-input-block">
			<a class="layui-btn layui-btn-normal"
				href="${pageContext.request.contextPath}/pages/view/view_add.jsp">发布景点</a>
		</div>
	</div>
	<script
		src="${pageContext.request.contextPath }/pages/static/admin/layui/layui.js"
		type="text/javascript" charset="utf-8"></script>
	<script type="text/html" id="edit">
 <a class="layui-btn layui-btn-sm" href="${pageContext.request.contextPath}/view/delete/{{d.viewid}}">删除</a>
</script>
	<script type="text/html" id="content">
 <a href="${pageContext.request.contextPath}/pages/map/map_query.jsp?beg={{d.viewname}}">{{d.content}}</a>
</script>
	<script>
		layui.use([ 'table' ], function() {

		});

		function query() {
			var url = "${pageContext.request.contextPath }/view/query?time="
					+ new Date().getTime();
			var $ = layui.jquery;
			$.get(url, {
				viewname : $("#viewname").val()
			}, function(rs) {
				layui.table.render({
					elem : '#result',
					cols : [ [ //表头
					{
						field : 'viewname',
						title : '景点名称'
					}, {
						field : 'content',
						title : '景点描述'
					}, {
						field : 'edit',
						title : '操作',
						templet : '#edit'
					} ] ],
					data : rs
					,page: true
				});
			});
		}
	</script>
</body>
</html>