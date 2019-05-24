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
<title>关于我们</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/pages/static/admin/layui/css/layui.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/pages/static/admin/css/admin.css" />
<style type="text/css">
.about{
	margin-top: 40px;
}
.about p {
	line-height: 40px;
	font-size: 20px;
	text-indent: 2em;
}
</style>
</head>
<body>
	<div class="layui-col-sm5">
		<img src="${pageContext.request.contextPath }/pages/about/bus.jpg"
			class="layui-col-sm12" style="height: 480px;" />
	</div>
	<div class="layui-col-sm7 about">
		<p>城市公交网(www.citybus.com)是专业权威使用人数最多,数据最准确的交查询网站，提供完善的线路查询功能和服务，为您的出行助力。</p>
		<p>联系电话：123456</p>
		<p>邮箱：123456@web.com</p>
	</div>
</body>
</html>
