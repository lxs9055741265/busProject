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
<style type="text/css">
#l-map {
	height: 300px;
	width: 100%;
}

#r-result, #r-result table {
	width: 100%;
	clear: both;
}

#routePanel p {
	float: left;
}
</style>
</head>
<body>
	<div class="layui-tab page-content-wrap">
		<form class="layui-form" style="width: 90%; padding-top: 20px;"
			action="${pageContext.request.contextPath }/lost/save" method="post">
			<div class="layui-form-item">
				<div class="layui-col-sm3">
					<select name="city" id="city" lay-filter="city" lay-search>
					</select>
				</div>
				<div class="layui-col-sm3">
					<input type="text" name="beg" autocomplete="off" value="${param.beg }"
						class="layui-input" placeholder="起点站" lay-verify="required">
				</div>
				<div class="layui-col-sm3">
					<input type="text" name="end" autocomplete="off" value="${param.end }"
						class="layui-input" placeholder="终点站" lay-verify="required">
				</div>
			</div>
			<div class="layui-form-item">
				<button class="layui-btn layui-btn-normal" lay-submit
					lay-filter="query">搜索</button>
			</div>
		</form>
	</div>
	<div id="l-map"></div>
	<div id="r-result" style="display: none;"></div>
	<script
		src="${pageContext.request.contextPath }/pages/static/admin/layui/layui.js"
		type="text/javascript" charset="utf-8"></script>

	<script type="text/javascript"
		src="http://api.map.baidu.com/api?v=2.0&ak=9FxreP0rHG7sn2PR9e2hqfLcRa1cm0bx"></script>
	<script src="http://libs.baidu.com/jquery/1.9.0/jquery.js"></script>
	<script>
		layui.use([ 'form' ], function() {
			var $ = layui.jquery;
			var form = layui.form;
			form.render();
			//监听密码提交
			form.on('submit(query)', function(data) {
				search(data.field.beg, data.field.end);
				return false;
			});
			form.on('select(city)', function(data) {
				changeSpotByCity(data.value);
			});
			initMap(116.404, 39.915);

			initSelect();
		});

		function initSelect() {
			var $ = layui.jquery;
			var url = "${pageContext.request.contextPath }/bus/queryCity";
			$.get(url, function(rs) {
				getCityname(function(result) {
					for (var i = 0; i < rs.length; i++) {
						var sel = "";
						if (rs[i].cityname == result.name) {
							sel = "selected='selected'";
						}

						$("#city").append(
								"<option value='"+rs[i].cityname+"' "+sel+">"
										+ rs[i].cityname + "</option>");
					}
					changeSpotByCity(result.name);
					layui.form.render("select");
				});
				layui.form.render();
			});
		}

		function getCityname(func) {
			var myCity = new BMap.LocalCity();
			myCity.get(func);
		}

		function changeSpotByCity(city) {
			map.centerAndZoom(city, 11);
		}

		function changeSpot(lgt, lat) {
			map.centerAndZoom(new BMap.Point(lgt, lat), 12);
		}

		var transit;
		var map;
		function initMap(lgt, lat) {
			map = new BMap.Map("l-map");
			map.centerAndZoom(new BMap.Point(lgt, lat), 12);
			map.enableScrollWheelZoom();
			transit = new BMap.TransitRoute(map, {
				renderOptions : {
					map : map,
					panel : "r-result"
				},
				onResultsHtmlSet : function() {
					$("#r-result").show()
				}
			});
		}

		function search(beg, end) {
			transit.search(beg, end);
		}
	</script>
</body>
</html>