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
<title>城市公交管理系统</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/pages/mfan/static/admin/layui/css/layui.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/pages/mfan/static/admin/css/admin.css" />
</head>
<body>
	<div class="main-layout" id='main-layout'>
		<!--侧边栏-->
		<div class="main-layout-side">
			<div class="m-logo">城市公交管理系统</div>
			<ul class="layui-nav layui-nav-tree" lay-filter="leftNav">
				<c:if test="${userinfo.admin != '1' }">
					<li class="layui-nav-item"><a href="javascript:;"
						data-url="${pageContext.request.contextPath}/pages/lost/lost_rec.jsp"
						data-id="1" data-text="失物招领"><i class="iconfont">&#xe60a;</i>失物信息页面
					</a></li>

					<li class="layui-nav-item"><a href="javascript:;"
						data-url="${pageContext.request.contextPath}/pages/view/view_query.jsp"
						data-id="2" data-text="景点查看"><i class="iconfont">&#xe60d;</i>公交景点页面</a></li>

					<li class="layui-nav-item"><a href="javascript:;"
						data-url="${pageContext.request.contextPath}/pages/map/map_query.jsp"
						data-id="3" data-text="实时公交"><i class="iconfont">&#xe60c;</i>实时公交</a></li>

					<li class="layui-nav-item"><a href="javascript:;"
						data-url="${pageContext.request.contextPath}/pages/bus/bus_query1.jsp"
						data-id="4" data-text="公交查询"><i class="iconfont">&#xe60b;</i>公交系统查询</a></li>

					<li class="layui-nav-item"><a href="javascript:;"><i
							class="iconfont">&#xe607;</i>我要充值</a>
						<dl class="layui-nav-child">
							<dd>
								<a href="javascript:;"
									data-url="${pageContext.request.contextPath}/pages/bus/add_account.jsp"
									data-id="7" data-text="我要充值"><span class="l-line"></span>我要充值</a>
							</dd>
							<dd>
								<a href="javascript:;"
									data-url="${pageContext.request.contextPath}/pages/bus/query_account.jsp"
									data-id="8" data-text="交易查询"><span class="l-line"></span>交易查询</a>
							</dd>
						</dl></li>

					<li class="layui-nav-item"><a href="javascript:;"
						data-url="${pageContext.request.contextPath}/pages/public/public_query1.jsp"
						data-id="5" data-text="公告页面"><i class="iconfont">&#xe608;</i>公告页面</a></li>

					<li class="layui-nav-item"><a href="javascript:;"
						data-url="${pageContext.request.contextPath}/pages/about/aboutus.jsp"
						data-id="6" data-text="关于我们"><i class="iconfont">&#xe603;</i>关于我们</a></li>
				</c:if>
				<c:if test="${userinfo.admin == '1' }">
					<li class="layui-nav-item"><a href="javascript:;"><i
							class="iconfont">&#xe60a;</i>失物信息页面</a>
						<dl class="layui-nav-child">
							<dd>
								<a href="javascript:;"
									data-url="${pageContext.request.contextPath}/pages/lost/lost_add.jsp"
									data-id="1" data-text="失物发布"><span class="l-line"></span>失物发布</a>
							</dd>
							<dd>
								<a href="javascript:;"
									data-url="${pageContext.request.contextPath}/pages/lost/lost_query.jsp"
									data-id="2" data-text="发布撤回"><span class="l-line"></span>发布撤回</a>
							</dd>
						</dl></li>

					<li class="layui-nav-item"><a href="javascript:;"><i
							class="iconfont">&#xe60d;</i>公交景点页面</a>
						<dl class="layui-nav-child">
							<dd>
								<a href="javascript:;"
									data-url="${pageContext.request.contextPath}/pages/view/view_manage.jsp"
									data-id="3" data-text="景点管理"><span class="l-line"></span>景点管理</a>
							</dd>
							<dd>
								<a href="javascript:;"
									data-url="${pageContext.request.contextPath}/pages/view/view_query.jsp"
									data-id="4" data-text="景点查看"><span class="l-line"></span>景点查看</a>
							</dd>
						</dl></li>

					<li class="layui-nav-item"><a href="javascript:;"
						data-url="${pageContext.request.contextPath}/pages/map/map_query.jsp"
						data-id="5" data-text="实时公交"><i class="iconfont">&#xe60c;</i>实时公交</a></li>

					<li class="layui-nav-item"><a href="javascript:;"><i
							class="iconfont">&#xe60b;</i>公交系统查询</a>
						<dl class="layui-nav-child">
							<dd>
								<a href="javascript:;"
									data-url="${pageContext.request.contextPath}/pages/bus/bus_query.jsp"
									data-id="6" data-text="公交管理"><span class="l-line"></span>公交管理</a>
							</dd>
							<dd>
								<a href="javascript:;"
									data-url="${pageContext.request.contextPath}/pages/bus/bus_query1.jsp"
									data-id="7" data-text="公交查询"><span class="l-line"></span>公交查询</a>
							</dd>
						</dl></li>

					<li class="layui-nav-item"><a href="javascript:;"><i
							class="iconfont">&#xe608;</i>公告页面</a>
						<dl class="layui-nav-child">
							<dd>
								<a href="javascript:;"
									data-url="${pageContext.request.contextPath}/pages/public/public_query.jsp"
									data-id="8" data-text="公告管理"><span class="l-line"></span>公告管理</a>
							</dd>
							<dd>
								<a href="javascript:;"
									data-url="${pageContext.request.contextPath}/pages/public/public_query1.jsp"
									data-id="9" data-text="公告页面"><span class="l-line"></span>公告页面</a>
							</dd>
						</dl></li>

					<li class="layui-nav-item"><a href="javascript:;"
						data-url="${pageContext.request.contextPath}/pages/about/aboutus.jsp"
						data-id="10" data-text="关于我们"><i class="iconfont">&#xe603;</i>关于我们</a></li>
				</c:if>
			</ul>
		</div>
		<!--右侧内容-->
		<div class="main-layout-container">
			<!--头部-->
			<div class="main-layout-header">
				<div class="menu-btn" id="hideBtn">
					<a href="javascript:;"> <span class="iconfont">&#xe60e;</span>
					</a>
				</div>
				<ul class="layui-nav" lay-filter="rightNav">
					<li class="layui-nav-item">&nbsp;</li>
					<li class="layui-nav-item"><a href="javascript:;">尊敬的
							${userinfo.username}【${userinfo.admin eq '1' ? '管理员': '普通用户'}】 您好</a>
					</li>
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
						<li class="layui-this welcome">个人信息</li>
					</ul>
					<div class="layui-tab-content">
						<div class="layui-tab-item layui-show"
							style="background: #f5f5f5;">
							<!--1-->
							<iframe src="${pageContext.request.contextPath}/user/userdetail"
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
	<script type="text/javascript">
		var scope = {
			link : './welcome.html'
		}
	</script>
	<script
		src="${pageContext.request.contextPath}/pages/mfan/static/admin/layui/layui.js"
		type="text/javascript" charset="utf-8"></script>
	<script
		src="${pageContext.request.contextPath}/pages/mfan/static/admin/js/common.js"
		type="text/javascript" charset="utf-8"></script>
	<script
		src="${pageContext.request.contextPath}/pages/mfan/static/admin/js/main.js"
		type="text/javascript" charset="utf-8"></script>
	<script type="text/javascript">
		var interval = setInterval(
				function() {
					var $ = layui.jquery;
					$
							.get(
									"${pageContext.request.contextPath}/user/check",
									function(rs) {
										if (rs == "-1") {
											alert("登陆超时！");
											location.href = "${pageContext.request.contextPath}";
										}
									})
				}, 3000);
	</script>
</body>
</html>
