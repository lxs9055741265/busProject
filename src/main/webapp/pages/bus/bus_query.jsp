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
	<div class="layui-tab page-content-wrap">
		<form class="layui-form" style="width: 90%; padding-top: 20px;"
			action="${pageContext.request.contextPath }/lost/save" method="post">
			<div class="layui-form-item">
				<div class="layui-col-sm3">
					<input type="text" name="busname" autocomplete="off"
						class="layui-input" placeholder="请输入线路名称">
				</div>
				<div class="layui-col-sm3">
					<input type="text" name="spot" autocomplete="off"
						class="layui-input" placeholder="站点名称">
				</div>
			</div>
			<div class="layui-form-item">
				<button class="layui-btn layui-btn-normal" lay-submit
					lay-filter="query">查询</button>
				<a class="layui-btn layui-btn-normal"
					href="${pageContext.request.contextPath}/pages/bus/bus_add.jsp">新增线路</a>
			</div>
		</form>
	</div>
	<table id="result"></table>
	<script
		src="${pageContext.request.contextPath }/pages/static/admin/layui/layui.js"
		type="text/javascript" charset="utf-8"></script>
	<script type="text/html" id="edit">
 <a class="layui-btn layui-btn-sm layui-btn-normal" href="${pageContext.request.contextPath}/bus/delete?id={{d.id}}">删除线路</a>
 <a class="layui-btn layui-btn-sm layui-btn-normal" href="${pageContext.request.contextPath}/bus/edit?id={{d.id}}">编辑</a>
 <a class="layui-btn layui-btn-sm layui-btn-normal" href="${pageContext.request.contextPath}/bus/show?id={{d.id}}">查看线路</a>
 <a class="layui-btn layui-btn-sm layui-btn-normal" href="${pageContext.request.contextPath}/pages/bus/bus_driver.jsp?busid={{d.id}}">查看司机</a>
 <a class="layui-btn layui-btn-sm layui-btn-normal" href="${pageContext.request.contextPath}/bus/dirver?id={{d.id}}">司机管理</a>
</script>
	<script>
		layui.use([ 'laydate', 'form', 'table' ], function() {
			var laydate = layui.laydate;
			var $ = layui.jquery;
			var form = layui.form;
			form.render();

			laydate.render({
				elem : '#losttime',
				format : 'yyyy/MM/dd',
				theme : '#128fed',
				range : true
			});

			//监听密码提交
			form.on('submit(query)', function(data) {
				query(data.field);
				return false;
			});
		});

		function query(data) {
			var url = "${pageContext.request.contextPath }/bus/queryByName";
			var $ = layui.jquery;
			$.post(url, data, function(rs) {
				layui.table.render({
					elem : '#result',
					cols : [ [ //表头
					{
						field : 'busname',
						title : '线路名称',
						width : 100
					}, {
						field : 'money',
						title : '票价',
						width : 100
					}, {
						field : 'begtime',
						title : '首班车时间',
						width : 100
					}, {
						field : 'endtime',
						title : '末班车时间',
						width : 100
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