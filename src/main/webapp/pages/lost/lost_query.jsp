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
			action="${pageContext.request.contextPath }/lost/save" method="post">
			<div class="layui-form-item">
				<div class="layui-col-sm3">
					<input type="text" name="losttype" autocomplete="off"
						 class="layui-input" placeholder="请输入物品种类">
				</div>
				<div class="layui-col-sm3">
					<input type="text" name="title" autocomplete="off"
						  placeholder="请输入标题" class="layui-input">
				</div>
				
				<div class="layui-col-sm3">
					<input type="text" name="losttime" autocomplete="off" id="losttime"
						class="layui-input" placeholder="请输入挂失日期" />
				</div>
			</div>
			<div class="layui-form-item" style="text-align: center;">
				<button class="layui-btn layui-btn-normal" lay-submit
					lay-filter="query">查询</button>
			</div>
		</form>
	</div>
	<table id="result"></table>
	<script
		src="${pageContext.request.contextPath }/pages/static/admin/layui/layui.js"
		type="text/javascript" charset="utf-8"></script>
	<script type="text/html" id="edit">
 <a class="layui-btn layui-btn-sm" href="${pageContext.request.contextPath}/lost/delete?id={{d.id}}">删除</a>
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
			var url = "${pageContext.request.contextPath }/lost/query";
			var $ = layui.jquery;
			$.post(url, data, function(rs) {
				layui.table.render({
					elem : '#result',
					cols : [ [ //表头
					 {
						field : 'losttype',
						title : '失物类型'
					}, {
						field : 'title',
						title : '标题'
					},{ 
					field : 'desc',
					title : '具体描述'
				    },{
						field : 'losttime',
						title : '遗失时间'
					},
					{ 
						field : 'mail',
						title : '邮箱'
					    },
					    { 
							field : 'phone',
							title : '电话'
						    },{
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