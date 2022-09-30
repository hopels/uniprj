<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<fmt:requestEncoding value="utf-8"/> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>UNI map</title>
  <link href="${path}/resources/NiceAdmin/assets/img/favicon.png" rel="icon">
  <link href="${path}/resources/NiceAdmin/assets/img/apple-touch-icon.png" rel="apple-touch-icon">
  <link href="https://fonts.gstatic.com" rel="preconnect">
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">
  <link href="${path}/resources/NiceAdmin/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="${path}/resources/NiceAdmin/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="${path}/resources/NiceAdmin/assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="${path}/resources/NiceAdmin/assets/vendor/quill/quill.snow.css" rel="stylesheet">
  <link href="${path}/resources/NiceAdmin/assets/vendor/quill/quill.bubble.css" rel="stylesheet">
  <link href="${path}/resources/NiceAdmin/assets/vendor/remixicon/remixicon.css" rel="stylesheet">
  <link href="${path}/resources/NiceAdmin/assets/vendor/simple-datatables/style.css" rel="stylesheet">
  <link href="${path}/resources/NiceAdmin/assets/css/style.css" rel="stylesheet">
<style type="text/css">
	
</style>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script src="https://developers.google.com/web/ilt/pwa/working-with-the-fetch-api" type="text/javascript"></script>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js" type="text/javascript"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3a65db9319018ab553053f588b8af05e&libraries=services,clusterer,drawing"></script>
<script type="text/javascript">
	$(document).ready(function(){
		
	});
</script>
</head>
<body>
<jsp:include page="../config/nav.jsp"/>
<main id="main" class="main">
	<div class="pagetitle">
		<h1>지도</h1>
		<nav>
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="MainPage.do"><i class="bi bi-house-door"></i></a></li>
				<li class="breadcrumb-item active">Map</li>
			</ol>
		</nav>
	</div>
	
	<div class="card">
		<div class="card-haeder">
			<div class="card-title">&nbsp;</div>
		</div>
		<div class="card-body">
			<div id="map" style="width:100%;height:700px;"></div>	
		</div>
		<div class="card-footer"></div>
	</div>
	
	<script type="text/javascript">
		var mapContainer = document.getElementById('map'),
		mapOption={
			center:new kakao.maps.LatLng(37.481618, 126.882554),
			level:3
		};
		var map = new kakao.maps.Map(mapContainer, mapOption);
		
		// 지도 타입 컨트롤러
		var mapTypeControl = new kakao.maps.MapTypeControl();
		map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
		
		// 줌 컨트롤러
		var zoomControl = new kakao.maps.ZoomControl();
		map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
	</script>
</main>

<!-- Vendor JS Files -->
<script src="${path}/resources/NiceAdmin/assets/vendor/apexcharts/apexcharts.min.js"></script>
<script src="${path}/resources/NiceAdmin/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="${path}/resources/NiceAdmin/assets/vendor/chart.js/chart.min.js"></script>
<script src="${path}/resources/NiceAdmin/assets/vendor/echarts/echarts.min.js"></script>
<script src="${path}/resources/NiceAdmin/assets/vendor/quill/quill.min.js"></script>
<script src="${path}/resources/NiceAdmin/assets/vendor/simple-datatables/simple-datatables.js"></script>
<script src="${path}/resources/NiceAdmin/assets/vendor/tinymce/tinymce.min.js"></script>
<script src="${path}/resources/NiceAdmin/assets/vendor/php-email-form/validate.js"></script>

<!-- Template Main JS File -->
<script src="${path}/resources/NiceAdmin/assets/js/main.js"></script>
</body>
</html>