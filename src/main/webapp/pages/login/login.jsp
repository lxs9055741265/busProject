<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>城市公交管理系统</title>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/pages/static/admin/layui/css/layui.css" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/pages/static/admin/css/login.css" />
	</head>

	<body>
		<div class="m-login-bg">
			<div class="m-login">
				<h3>城市公交管理系统</h3>
				<div class="m-login-warp">
					<form class="layui-form" action="${pageContext.request.contextPath}/user/index" method="post">
						<div class="layui-form-item">
							<input type="text" name="username" required lay-verify="required|login" placeholder="用户名" autocomplete="off" class="layui-input">
						</div>
						<div class="layui-form-item">
							<input type="password" name="password" id="password" required lay-verify="required" placeholder="密码" autocomplete="off" class="layui-input">
						</div>
						<div class="layui-form-item m-login-btn">
							<div class="layui-inline">
								<button class="layui-btn layui-btn-normal" lay-submit lay-filter="login">登录</button>
							</div>
							<div class="layui-inline">
								<button class="layui-btn layui-btn-normal"  onclick="location.href='${pageContext.request.contextPath}/pages/login/register.jsp';">注册</button>
							</div>
						</div>
					</form>
				</div>
				<p class="copyright">&copy; 2019 bus</p>
			</div>
		</div>
		<script src="${pageContext.request.contextPath }/pages/static/admin/layui/layui.js" type="text/javascript" charset="utf-8"></script>
		<script>
			layui.use(['form'], function() {
				var $ = layui.jquery;
				var form = layui.form,
					layer = layui.layer;

				//自定义验证规则
				form.verify({
					login: function(value) {
						var dbdata;
						var rs=$.ajax({url:"${pageContext.request.contextPath }/user/login", cache:false, data:{username:value,password:$("#password").val()},async:false,success: function(rs) {
							dbdata = rs;
						}});
						return dbdata;
					}
					
				});

			});
		</script>
	</body>

</html>