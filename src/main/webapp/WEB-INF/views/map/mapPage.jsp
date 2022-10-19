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
	.page_title{
		text-align: center;
		margin-top: 25px;
		margin-bottom: 65px;
	}

	.page_title_contents{
		font-weight: bold;
	}
	
	.tab-menu-area{
		text-align: center;
		display: inline-block;
		width:33%;
		height:auto;
		padding-bottom: 25px;
		cursor:pointer;
	}
	
	.tab-menu-title{
		font-weight: bold;
	}
	
	.tab-menu{
		background-color: #ffffff;
		padding-top:50px;
	}
	
	.sch-area{
		padding:30px;
	}
	
	.sch-contents{
		height:45px;
	}
	
	.input-sch-bar{
		width:40%;
		font-size:12px;
		padding:10px;
	}
	
	.sch-btn{
		width:7%;
		border-radius: 5px;
		border:none;
		background-color: rgb(84, 88, 90);
		color:white;
		font-weight: bold;
	}
	
	.sch-area-select{
		margin-left: 20%;
		padding:10px;
		width:30%;
		color:gray;
	}
	
	#map{
		 width:45%;
		 height:700px;
		 display:inline-block;
		 margin-left:40px;
	}
	
	#co-list{
		width:45%;
		height:700px;
		display:inline-block;
		background-color: rgb(250, 250, 250);
		padding-top:15px;
		overflow: scroll;
	}	
	.co-list-contents{
		height:120px;
		width:90%;
		border:1px solid gray;
		border-radius:5px;
		margin:0 auto;
		margin-top:15px;
		padding-top:15px;
	}
	
	.co-list-contents:hover{
		border:1px solid red;
		cursor:pointer;
	}
	
	.contents-title{
		font-size: 17px;
		font-weight: bold;
		margin-left:30px;
		margin-top: 15px;
	}
	
	.contents-address{
		font-size: 12px;
		margin-left:30px;
	}
	
	.tel-num{
		font-size: 12px;
		margin-left:30px;
	}
	
	.first-active{
		border-bottom : 5px solid red;
		color : red;
	}
	.modal-header{
		padding:30px;
	}
	.modal-title-text{
		margin-left:30px;
		font-weight: bold;
		font-size: 20px;
	}
	#map2{
		width:350px;
		height:400px;
		border: 1px solid red;
		display:inline-block;
		margin-right:30px;
	}
	#info-area{
		width:350px;
		height:auto;
		border:1px solid green;
		display:inline-block;
	}
	.modal-body{
		padding:30px;
		
	}
</style>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script src="https://developers.google.com/web/ilt/pwa/working-with-the-fetch-api" type="text/javascript"></script>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js" type="text/javascript"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3a65db9319018ab553053f588b8af05e&libraries=services,clusterer,drawing"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$(".tab-menu-area").eq(0).click();
		$(".tab-menu-area").click(function(){
			$(".tab-menu-area").css({"border":"none","color":"black"});
			$(this).css({"border-bottom":"5px solid red","color":"red"});
		})
		var addHtml = "";
		var comList = ${comList2};
		$(comList).each(function(idx,data){
			addHtml += '<div class="co-list-contents" data-bs-toggle="modal" data-bs-target="#verticalycentered">' +
						'<div class="contents-title"><i class="bi bi-heart"></i>&nbsp;'+data.comname+'</div>' +
						'<div class="contents-address"><i class="bi bi-bookmark-check"></i>&nbsp;&nbsp;'+data.comaddress+'</div>' +
						'<div class="tel-num"><i class="bi bi-telephone"></i>&nbsp;&nbsp;'+data.comtel+'</div>' +
					'</div>';
		});
		$("#sch-btn").click(function(){
			alert("미구현");
		});
		$("#co-list").html(addHtml);
		$(".co-list-contents").click(function(){
			var title = $(this).find(".contents-title").text();
			var address = $(this).find(".contents-address").text();
			var telNum = $(this).find(".tel-num").text();
			$(".modal-title-text").text(title+"지점");
			setTimeout(loadmapcallback(address, title, loadmap), 1000);
			
			// 주소-좌표 변환 객체 생성
			
		})
	});
	
	//call back func
	var loadmapcallback = (address, title, callback) => {
		callback(address, title);
	}
	var loadmap = (address, title) => {
		var geocoder2 = new kakao.maps.services.Geocoder();
		geocoder2.addressSearch(address, function(result, status){
			if(status == kakao.maps.services.Status.OK){
				var coords2 = new kakao.maps.LatLng(result[0].y, result[0].x);
				// 마커 표시
				var marker2 = new kakao.maps.Marker({
					map: map2,
					position: coords2
				});
				
				// 장소에 대한 설명
				var infowindow2 = new kakao.maps.InfoWindow({
					content:'<div style="width:150px;height:100%;text-align:center;padding:6px 0;border:3px solid red;border-radius:10px;"><i class="ri ri-car-line" style="color:red;"></i>&nbsp;&nbsp;&nbsp;'+title+'지점</div>'
				});
				infowindow2.open(map2, marker2);
				
				map2.setCenter(coords2);
			}
		})
	}
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
	
	<div class="page_title">
		<h1 class="page_title_contents">전국지점안내</h1>
	</div>
	
	<div class="tab-menu">
		<div id="click-active"  class="tab-menu-area first-active">
			<h4 class="tab-menu-title">전체</h4>
		</div>
		<div class="tab-menu-area">
			<h4 class="tab-menu-title">단기렌터카 지점</h4>
		</div>
		<div class="tab-menu-area">
			<h4 class="tab-menu-title">딜리버리 서비스</h4>
		</div>
	</div>
	
	<div class="card">
		<div class="card-haeder">
			<div class="sch-area">
				<input class="input-sch-bar sch-contents" name="cname" type="text" placeholder="지역으로 검색하시거나, 지점명을 검색하시면 가까운 매장을 찾으실 수 있습니다."/>
				<button id="sch-btn" class="sch-btn sch-contents" type="button">검색</button>
				<select class="sch-area-select sch-contents" name="region">
					<option>지역-전체보기</option>
					<option>서울</option>
					<option>인천/경기</option>
					<option>강원</option>
					<option>충청/대전/세종</option>
					<option>전라/광주</option>
					<option>경상/대구/부산/울산</option>
					<option>제주</option>
					<option>공항지점</option>
					<option>역사지점</option>
					<option>24시간지점</option>
				</select>
				
			</div>
		</div>
		<div class="card-body">
			<div id="co-list">
			</div>
			<div id="map"></div>	
		</div>
		<div class="card-footer"></div>
	</div>
	
	<div class="modal fade" id="verticalycentered" tabindex="-1">
		<div class="modal-dialog modal-dialog-centered modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title"><img src="https://www.lotterentacar.net/lrhp/pc/images/common/logo-header.png"/></h5>
					<span class="modal-title-text"></span>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div id="map2"></div>
					<div id="info-area">
						<span>지점주소</span>
						<span>지점주소</span>
						<span>지점주소</span>
						<span>지점주소</span>
						<span>지점주소</span>
						<span>지점주소</span>
						<span>지점주소</span>
						<span>지점주소</span>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary">Save changes</button>
				</div>
			</div>
		</div>
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
		
		// 주소-좌표 변환 객체 생성
		var geocoder = new kakao.maps.services.Geocoder();
		
		var comList = ${comList2};
		$(comList).each(function(idx, data){
			geocoder.addressSearch(data.comaddress, function(result, status){
				if(status == kakao.maps.services.Status.OK){
					var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
					
					// 마커 표시
					var marker = new kakao.maps.Marker({
						map: map,
						position: coords
					});
					
					// 장소에 대한 설명
					var infowindow = new kakao.maps.InfoWindow({
						content:'<div style="width:150px;text-align:center;padding:6px 0;border:3px solid red;border-radius:10px;"><i class="ri ri-car-line" style="color:red;"></i>&nbsp;&nbsp;&nbsp;'+data.comname+'</div>'
					});
					infowindow.open(map, marker);
					
					map.setCenter(coords);
				}
			})
		})
		
		var mapContainer2 = document.getElementById('map2'),
		mapOption2={
			center:new kakao.maps.LatLng(37.481618, 126.882554),
			level:3
		};
		var map2 = new kakao.maps.Map(mapContainer2, mapOption2);
		
		
		
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