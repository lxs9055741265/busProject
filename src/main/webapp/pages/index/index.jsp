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
<title>公交管理系统</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/pages/static/admin/layui/css/layui.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/pages/static/admin/css/admin.css" />
</head>
<body>
	<div class="main-layout" id='main-layout'>
		<!--侧边栏-->
		<div class="main-layout-side">
			<div class="m-logo">公交管理系统</div>
			<ul class="layui-nav layui-nav-tree" lay-filter="leftNav">
				<c:if test="${userinfo.admin != 1 }">
					<li class="layui-nav-item layui-nav-itemed"><a
						href="javascript:openTable('个人信息','${pageContext.request.contextPath}/user/userdetail');"><i
							class="iconfont">&#xe606;</i>个人信息</a></li>
					<li class="layui-nav-item layui-nav-itemed"><a
						href="javascript:openTable('失物招领','${pageContext.request.contextPath}/pages/lost/lost_rec.jsp');"><i
							class="iconfont">&#xe607;</i>失物信息页面</a></li>
					<li class="layui-nav-item"><a
						href="javascript:openTable('景点查看','${pageContext.request.contextPath}/pages/view/view_query.jsp');"><i
							class="iconfont">&#xe608;</i>公交景点页面</a></li>
					<li class="layui-nav-item"><a
						href="javascript:openTable('实时公交','${pageContext.request.contextPath}/pages/map/map_query.jsp');"><i
							class="iconfont">&#xe604;</i>实时公交</a></li>
					<li class="layui-nav-item"><a
						href="javascript:openTable('公交查询','${pageContext.request.contextPath}/pages/bus/bus_query1.jsp');"><i
							class="iconfont">&#xe60c;</i>公交系统查询</a></li>
					<li class="layui-nav-item"><a
						href="javascript:openTable('公告页面','${pageContext.request.contextPath}/pages/public/public_query1.jsp');"><i
							class="iconfont">&#xe60a;</i>公告页面</a></li>
					<li class="layui-nav-item"><a
						href="javascript:openTable('关于我们','${pageContext.request.contextPath}/pages/about/aboutus.jsp');"><i
							class="iconfont">&#xe603;</i>关于我们</a></li>
				</c:if>
				<c:if test="${userinfo.admin == 1 }">
					<li class="layui-nav-item layui-nav-itemed"><a
						href="javascript:openTable('个人信息','${pageContext.request.contextPath}/user/userdetail');"><i
							class="iconfont">&#xe606;</i>个人信息</a></li>
					<li class="layui-nav-item layui-nav-itemed"><a
						href="javascript:;"><i class="iconfont">&#xe607;</i>失物信息页面</a>
						<dl class="layui-nav-child">
							<dd>
								<a
									href="javascript:openTable('失物发布','${pageContext.request.contextPath}/pages/lost/lost_add.jsp');"
									data-id='1'><span class="l-line"></span>失物发布</a>
							</dd>
							<dd>
								<a
									href="javascript:openTable('发布撤回','${pageContext.request.contextPath}/pages/lost/lost_query.jsp');"
									data-id='1'><span class="l-line"></span>发布撤回</a>
							</dd>
						</dl></li>
					<li class="layui-nav-item"><a href="javascript:;"><i
							class="iconfont">&#xe608;</i>公交景点页面</a>
						<dl class="layui-nav-child">
							<dd>
								<a
									href="javascript:openTable('景点管理','${pageContext.request.contextPath}/pages/view/view_manage.jsp');"
									data-id='3'><span class="l-line"></span>景点管理</a>
							</dd>
							<dd>
								<a
									href="javascript:openTable('景点查看','${pageContext.request.contextPath}/pages/view/view_query.jsp');"
									data-id='9'><span class="l-line"></span>景点查看</a>
							</dd>
						</dl></li>
					<li class="layui-nav-item"><a
						href="javascript:openTable('实时公交','${pageContext.request.contextPath}/pages/map/map_query.jsp');"><i
							class="iconfont">&#xe604;</i>实时公交</a></li>
					<li class="layui-nav-item"><a href="javascript:;"><i
							class="iconfont">&#xe60c;</i>公交系统查询</a>
						<dl class="layui-nav-child">
							<dd>
								<a
									href="javascript:openTable('公交管理','${pageContext.request.contextPath}/pages/bus/bus_query.jsp');"
									data-id='3'><span class="l-line"></span>公交管理</a>
							</dd>
							<dd>
								<a
									href="javascript:openTable('公交查询','${pageContext.request.contextPath}/pages/bus/bus_query1.jsp');"
									data-id='3'><span class="l-line"></span>公交查询</a>
							</dd>
						</dl></li>
					<li class="layui-nav-item"><a href="javascript:;"><i
							class="iconfont">&#xe60a;</i>公告页面</a>
						<dl class="layui-nav-child">
							<dd>
								<a
									href="javascript:openTable('公告管理','${pageContext.request.contextPath}/pages/public/public_query.jsp');"
									data-id='3'><span class="l-line"></span>公告管理</a>
							</dd>
							<dd>
								<a
									href="javascript:openTable('公告页面','${pageContext.request.contextPath}/pages/public/public_query1.jsp');"
									data-id='3'><span class="l-line"></span>公告页面</a>
							</dd>
						</dl></li>
					<li class="layui-nav-item"><a
						href="javascript:openTable('关于我们','${pageContext.request.contextPath}/pages/about/aboutus.jsp');"><i
							class="iconfont">&#xe603;</i>关于我们</a></li>
				</c:if>

			</ul>
		</div>
		<!--右侧内容-->
		<div class="main-layout-container">
			<!--头部-->
			<div class="main-layout-header">
				<ul class="layui-nav" lay-filter="rightNav">
					<li class="layui-nav-item"><a data-id='5' data-text="个人信息">尊敬的
							【${userinfo.username}】 您好</a></li>
					<li class="layui-nav-item"><a
						href="${pageContext.request.contextPath}/user/logout">退出</a></li>
				</ul>
			</div>
			<!--主体内容-->
			<div class="main-layout-body">
				<!--tab 切换-->
				<div class="layui-tab layui-tab-brief main-layout-tab"
					lay-filter="tab" lay-allowClose="true">
					<ul class="layui-tab-title">
						<li class="layui-this welcome" id="title">个人信息</li>
					</ul>
					<div class="layui-tab-content">
						<div class="layui-tab-item layui-show"
							style="background: #f5f5f5;">
							<!--1-->
							<iframe id="content"
								src="${pageContext.request.contextPath}/user/userdetail"
								width="100%" height="100%" name="iframe" scrolling="auto"
								class="iframe" framborder="0"></iframe>
							<!--1end-->
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--遮罩-->
		<div class="main-mask"></div>
	</div>
	<script
		src="${pageContext.request.contextPath }/pages/static/admin/layui/layui.js"
		type="text/javascript" charset="utf-8"></script>
	<script
		src="${pageContext.request.contextPath }/pages/static/admin/js/common.js"
		type="text/javascript" charset="utf-8"></script>
	<script type="text/javascript">
		var scope = {
			link : '${pageContext.request.contextPath}/user/userdetail'
		}
		layui.use('element', function() {
		});

		function openTable(title, src) {
			var $ = layui.jquery;
			$("#title").html(title);
			$("#content").attr('src', src);
		}
	</script>

</body>
</html>
