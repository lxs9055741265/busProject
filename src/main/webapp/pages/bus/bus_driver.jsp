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
<title>公交查询</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/pages/static/admin/layui/css/layui.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/pages/static/admin/css/admin.css" />
</head>
<body>
	<table id="result"></table>

	<div class="layui-form-item">
		<div class="layui-input-block">
			<a class="layui-btn layui-btn-normal"
				href="${pageContext.request.contextPath}/pages/bus/bus_query1.jsp">返回查询</a>
		</div>
	</div>
	<script
		src="${pageContext.request.contextPath }/pages/static/admin/layui/layui.js"
		type="text/javascript" charset="utf-8"></script>
	<script type="text/html" id="edit">
 <a class="layui-btn layui-btn-sm layui-btn-normal" href="${pageContext.request.contextPath}/bus/delete?id={{d.id}}">删除线路</a>
 <a class="layui-btn layui-btn-sm layui-btn-normal" href="${pageContext.request.contextPath}/bus/edit?id={{d.id}}">编辑</a>
 <a class="layui-btn layui-btn-sm layui-btn-normal" href="${pageContext.request.contextPath}/bus/show?id={{d.id}}">查看线路</a>
 <a class="layui-btn layui-btn-sm layui-btn-normal" href="${pageContext.request.contextPath}/bus/driver?id={{d.id}}">司机管理</a>
</script>
	<script>
		layui.use([ 'table' ], function() {
			var laydate = layui.laydate;
			var $ = layui.jquery;
			query();
		});

		function query() {
			var url = "${pageContext.request.contextPath }/bus/querydriver";
			var $ = layui.jquery;
			$.post(url, {
				busid : '${param.busid}'
			}, function(rs) {
				layui.table.render({
					elem : '#result',
					cols : [ [ //表头
					{
						field : 'drivername',
						title : '司机名称'
					}, {
						field : 'driverid',
						title : '驾驶证',
					} ] ],
					data : rs
					,page: true
				});
			});
		}
	</script>
</body>
</html>