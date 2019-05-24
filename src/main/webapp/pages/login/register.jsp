<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
<title>注册界面</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/pages/static/admin/layui/css/layui.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/pages/static/admin/css/admin.css" />
</head>
<body>
	<div class="layui-tab page-content-wrap">
		<form class="layui-form" style="width: 90%; padding-top: 20px;"
			action="${pageContext.request.contextPath }/user/register"
			method="post">
			<div class="layui-form-item">
				<label class="layui-form-label">用户名：</label>
				<div class="layui-input-block">
					<input type="text" name="username" autocomplete="off"
						lay-verify="required|username" class="layui-input" value=""
						placeholder="请输入用户名">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">姓名：</label>
				<div class="layui-input-block">
					<input type="text" name="name" autocomplete="off"
						lay-verify="required" class="layui-input" value=""
						placeholder="请输入姓名">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">密码：</label>
				<div class="layui-input-block">
					<input type="password" name="password" required
						lay-verify="required|password|pwdconfirm" placeholder="请输入密码" autocomplete="off"
						class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">重复密码：</label>
				<div class="layui-input-block">
					<input type="password" id="password2" required
						lay-verify="required" placeholder="请输入密码" autocomplete="off"
						class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<div class="layui-input-block">
					<button class="layui-btn layui-btn-normal" lay-submit
						lay-filter="adminPassword">立即提交</button>
					<button class="layui-btn layui-btn-normal" onclick="location.href='${pageContext.request.contextPath}/pages/login/login.jsp';">返回登陆</button>
				</div>
			</div>
		</form>
	</div>
	<script
		src="${pageContext.request.contextPath }/pages/static/admin/layui/layui.js"
		type="text/javascript" charset="utf-8"></script>
	<script>
		//Demo
		layui.use([ 'form', 'element' ], function() {
			var $ = layui.jquery;
			var form = layui.form;
			var element = layui.element;
			form.render();
			
			//自定义验证规则
			form.verify({
				username: function(value) {
					if(value.length < 5) {
						return '用户名不能小于6位';
					}
					var dbdata;
					var rs=$.ajax({url:"${pageContext.request.contextPath }/user/getUser", cache:false, data:{username:value},async:false,success: function(rs) {
						dbdata = rs;
					}});
					if (dbdata) {
						return '用户已经存在';
					}
				},
				password: [/(.+){6,12}$/, '密码必须6到12位'],
				pwdconfirm: function(value) {
					if($("#password2").val() != value) {
						return "确认密码和密码不一致";
					}
				},
				
			});
			
			//监听密码提交
			form.on('submit(adminPassword)', function(data) {
				var url = "${pageContext.request.contextPath }/user/register";
				var targetUrl = '${pageContext.request.contextPath}/pages/login/login.jsp';
				$.post(url,
						data.field, function(rs) {
							if (rs == '-1') {
								layer.msg('用户注册失败');
							} else {
								location.href=targetUrl;
							}
						});
				return false;
			});
		});
	</script>
</body>
</html>