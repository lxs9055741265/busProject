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
<title>公交新增</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/pages/static/admin/layui/css/layui.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/pages/static/admin/css/admin.css" />
</head>
<body>
	<div class="layui-tab page-content-wrap">
		<form class="layui-form" style="width: 90%; padding-top: 20px;"
			action="${pageContext.request.contextPath }/bus/updatedriver"
			method="post">
			<div class="layui-form-item">
				<label class="layui-form-label">公交线路：</label>
				<div class="layui-input-block">
					<div class="layui-col-sm3">
						<label class="layui-form-label">${businfo.busname }<input
							type="hidden" name="id" value="${businfo.id }"></label>
					</div>
					<div class="layui-col-sm9">
						<a class="layui-btn layui-btn-normal" href="javascript:addobj();">新增司机</a>
					</div>
				</div>
			</div>
			<div class="layui-form-item" id="sopts">
				<c:forEach items="${driver }" var="d">
					<div class="layui-col-sm12">
						<div class="layui-col-sm3">
							<input type="text" name="drivername" autocomplete="off"
								lay-verify="required" class="layui-input"
								value="${d.drivername }" placeholder="请输入司机名称">
						</div>
						<div class="layui-col-sm3">
							<input type="text" name="driverid" autocomplete="off"
								lay-verify="required" class="layui-input" value="${d.driverid }"
								placeholder="请输入司机驾照">
						</div>
						<div class="layui-col-sm6">
							<input type="button" class="layui-btn layui-btn-normal"
								value="删除" onclick="deleteObj(this);">
						</div>
					</div>
				</c:forEach>
			</div>
			<div class="layui-form-item">
				<div class="layui-input-block">
					<button class="layui-btn layui-btn-normal" lay-submit
						lay-filter="change">变更</button>
					<a class="layui-btn layui-btn-normal"
						href="${pageContext.request.contextPath}/pages/bus/bus_query.jsp">返回查询</a>
				</div>
			</div>
		</form>
	</div>
	<script
		src="${pageContext.request.contextPath }/pages/static/admin/layui/layui.js"
		type="text/javascript" charset="utf-8"></script>
	<script>
		layui
				.use(
						[ 'form' ],
						function() {
							var $ = layui.jquery;
							var form = layui.form;
							form.render();

							//自定义验证规则
							form
									.verify({
										busname : function(value) {
											if (value == '${businfo.busname }') {
												return "";
											}
											var dbdata;
											var rs = $
													.ajax({
														url : "${pageContext.request.contextPath }/bus/queryBaseByName",
														cache : false,
														data : {
															busname : value
														},
														async : false,
														success : function(rs) {
															dbdata = rs;
														}
													});
											if (dbdata) {
												return '站点已经存在';
											}
										}
									});

							//监听密码提交
							form.on('submit(adminPassword)', function(data) {
							});
						});

		function addobj() {
			var $ = layui.jquery;
			$("#sopts")
					.append(
							'<div class="layui-col-sm12">'
									+ '<div class="layui-col-sm3"> <input type="text" name="drivername" autocomplete="off" '+
									'lay-verify="required" class="layui-input" placeholder="请输入司机名称"> </div> <div class="layui-col-sm3">'
									+ '<input type="text" name="driverid" autocomplete="off" lay-verify="required" class="layui-input"'+
									' placeholder="请输入司机驾照"> </div><div class="layui-col-sm6"><input type="button" class="layui-btn layui-btn-normal" value="删除" onclick="deleteObj(this);"></div></div>');
		}

		function deleteObj(obj) {
			var $ = layui.jquery;
			$(obj).parent("div").parent("div").remove();
		}
	</script>
</body>
</html>