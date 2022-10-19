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
		 height:500px;
		 display:inline-block;
		 margin-left:40px;
	}
	
	#co-list{
		width:45%;
		height:500px;
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
	});
</script>
</head>
<body>
<jsp:include page="../config/nav.jsp"/>
<main id="main" class="main">
	<div class="pagetitle">
		<h1>셀렉트박스</h1>
		<nav>
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="MainPage.do"><i class="bi bi-house-door"></i></a></li>
				<li class="breadcrumb-item active">Select Box</li>
			</ol>
		</nav>
	</div>
	
	<div class="page_title">
		<h1 class="page_title_contents">셀렉트박스</h1>
	</div>
	
	<div class="tab-menu">
		<div id="click-active"  class="tab-menu-area">
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
				<button class="sch-btn sch-contents" type="button">검색</button>
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
			
		</div>
		<div class="card-footer"></div>
	</div>
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