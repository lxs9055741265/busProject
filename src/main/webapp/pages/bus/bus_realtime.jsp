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
<script
	src="${pageContext.request.contextPath }/pages/static/admin/layui/layui.js"
	type="text/javascript" charset="utf-8"></script>
<style type="text/css">
.blueColor {
	color: #1E9FFF !important;
}

.redColor {
	color: #FF5722 !important;
}
</style>
<script type="text/javascript">
	layui.use([ 'form' ], function() {
		var form = layui.form;
		form.render();
	});

	function prevObj(curr) {
		return curr.parents(".layui-timeline-item").prevUntil(
				".layui-timeline-title").first().find(".layui-timeline-title");
	}

	function nextObj(curr) {
		return curr.parents(".layui-timeline-item").nextUntil(
				".layui-timeline-title").first().find(".layui-timeline-title");
	}

	function findSpot(spot) {
		var $ = layui.jquery;
		return $(".layui-timeline-title:contains('" + spot + "')");
	}

	function nextColor(cls, cls1) {
		var next = nextObj(findClass(cls));
		if (next.size() > 0) {
			clearColor(cls1 ? cls1 : cls);
			next.addClass(cls1 ? cls1 : cls);
		}
	}

	function prevColor(cls, cls1) {
		var next = prevObj(findClass(cls));
		if (next.size() > 0) {
			clearColor(cls1 ? cls1 : cls);
			next.addClass(cls1 ? cls1 : cls);
		}
	}

	function findClass(cls) {
		var $ = layui.jquery;
		return $("." + cls + ":first");
	}

	function firstColor() {
		var $ = layui.jquery;
		$(".layui-timeline-title:first").addClass("blueColor");
	}

	function clearColor(cls) {
		clearClass(cls);
	}

	function clearClass(cls) {
		var $ = layui.jquery;
		$(".layui-timeline-title").removeClass(cls);
	}

	function reverse() {
		var $ = layui.jquery;
		reverseObj($(".layui-timeline"));
	}

	function reverseObj(obj) {
		var childs = obj.children();
		for (var i = childs.size() - 1; i >= 0; i--) {
			obj.append(childs[i]);
		}
	}

	function getIndex(spot) {
		var $ = layui.jquery;
		var spotObj = findSpot(spot).get(0);
		var spots = $(".layui-timeline-title");
		for (var i = 0; i < spots.length; i++) {
			var e = spots[i];
			if (e == spotObj) {
				return i;
			}
		}
		return -1;
	}

	function getSpot(index) {
		var $ = layui.jquery;
		return $($(".layui-timeline-title").get(index)).text();
	}

	var begIndex;
	var endIndex;
	var currIndex;
	function mock() {
		var $ = layui.jquery;
		var beg = $("#beg").val();
		var end = $("#end").val();

		if (!beg || !end) {
			alert("请录入起点站和终点站");
			return;
		}

		var url = "${pageContext.request.contextPath }/account/queryBalance";
		$.post(url, function(rs) {
			if (rs.money <= 0) {
				layer.alert("账户余额不足！");
			} else {
				var url = "${pageContext.request.contextPath }/account/by";
				$.post(url, {
					username : "${userinfo.username}",
					money : "-${businfo.money }"
				}, function(rs) {
				});
				if (getIndex(beg) > getIndex(end)) {
					reverse();
				}

				findSpot(beg).addClass('redColor');
				findSpot(end).addClass('redColor');
				begIndex = getIndex(beg);
				endIndex = getIndex(end);

				currIndex = begIndex + 1;

				setTimeout("setColor()", 3000);
			}
		});

	}

	function setColor() {
		clearClass('blueColor');
		findSpot(getSpot(currIndex)).addClass('blueColor');
		if (currIndex == endIndex - 1) {
			layer.open({
				content : '还有一站'
			});
			setTimeout("setColor()", 3000);
		} else if (currIndex == endIndex) {
			layer.open({
				content : '已到站'
			});
			clearClass('redColor');
			clearClass('blueColor');
		} else {
			setTimeout("setColor()", 3000);
		}
		currIndex++;
	}
</script>
</head>
<body>
	<div class="layui-tab page-content-wrap">
		<div class="layui-col-sm4">
			<div class="layui-form-item">
				<label class="layui-form-label">线路名称：</label>
				<div class="layui-input-block">
					<label class="layui-form-label">${businfo.busname }</label>
				</div>
			</div>
		</div>
		<div class="layui-col-sm8">
			<div class="layui-form-item">
				<label class="layui-form-label">票价：</label>
				<div class="layui-input-block">
					<label class="layui-form-label">${businfo.money } （元）</label>
				</div>
			</div>
		</div>
		<!-- 		<div class="layui-form-item"> -->
		<!-- 			<div class="layui-input-block"> -->
		<!-- 				<a class="layui-btn layui-btn-normal" href="javascript:firstColor()">第一个标色</a> -->
		<!-- 				<a class="layui-btn layui-btn-normal" -->
		<!-- 					href="javascript:clearColor('blueColor')">清除所有颜色</a> <a -->
		<!-- 					class="layui-btn layui-btn-normal" -->
		<!-- 					href="javascript:prevColor('blueColor')">上一个标色</a> <a -->
		<!-- 					class="layui-btn layui-btn-normal" -->
		<!-- 					href="javascript:nextColor('blueColor')">下一个标色</a> <a -->
		<!-- 					class="layui-btn layui-btn-normal" href="javascript:reverse();">反转</a> -->
		<!-- 			</div> -->
		<!-- 		</div> -->
		<div class="layui-form-item">
			<div class="layui-input-block layui-form">
				<div class="layui-col-sm2">
					<select id="beg">
						<option value="">请选择起点站</option>
						<c:forEach items="${businfo.spot }" var="spot">
							<option value="${spot }">${spot }</option>
						</c:forEach>
					</select>
				</div>
				<div class="layui-col-sm2">
					<select id="end">
						<option value="">请选择终点站</option>
						<c:forEach items="${businfo.spot }" var="spot">
							<option value="${spot }">${spot }</option>
						</c:forEach>
					</select>
				</div>
				<a class="layui-btn layui-btn-normal" href="javascript:mock();">上车</a>
			</div>
		</div>
		<div class="layui-form-item" id="sopts">
			<ul class="layui-timeline">
				<c:forEach items="${businfo.spot }" var="spot">
					<li class="layui-timeline-item"><i
						class="layui-icon layui-timeline-axis">&#xe63f;</i>
						<div class="layui-timeline-content layui-text">
							<h3 class="layui-timeline-title">${spot }</h3>
						</div></li>
				</c:forEach>
			</ul>
		</div>
		<div class="layui-form-item">
			<div class="layui-input-block">
				<a class="layui-btn layui-btn-normal"
					href="${pageContext.request.contextPath}/pages/bus/bus_query1.jsp">返回查询</a>
			</div>
		</div>
	</div>
</body>
</html>