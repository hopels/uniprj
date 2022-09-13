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
<title>UNI Community</title>
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
	.main_title{
		font-size:30px;
	}
	tbody{
		cursor:pointer;
	}
</style>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script src="https://developers.google.com/web/ilt/pwa/working-with-the-fetch-api" type="text/javascript"></script>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function(){
		
	});
	
function goNoticeDetail(noticeno){
	location.href="noticeDetailPage.do?noticeno="+noticeno
}
function goBoardDetail(boardno){
	location.href="boardDetail.do?boardno="+boardno
}

</script>
</head>
<body>
<jsp:include page="nav.jsp"/>
<main id="main" class="main">
	<div class="card">
		<div class="card-body">
			<div id="carouselExampleCaptions" class="carousel slide" data-bs-ride="carousel">
				<div class="carousel-indicators">
					<button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
				</div>
				<div class="carousel-inner">
					<div class="carousel-item active">
						<img src="https://png.pngtree.com/thumb_back/fh260/background/20210902/pngtree-blue-sky-and-white-clouds-pure-sky-image_786707.jpg" class="d-block w-100" alt="..." style="margin-top: 30px;max-height:360px">
						<div class="carousel-caption d-none d-md-block">
							<h4 style="color:black;font-weight:bold;">UNI Community</h4>
							<p style="color:gray;">개발자 커뮤니티</p>
						</div>
					</div>
				</div>
			</div><!-- End Slides with captions -->
		</div>
	</div>
	
	<section class="section">
		<div class="row align-items-top">
			<div class="col-lg-6">
				<div class="card">
					<div class="card-body">	
						<ul class="nav nav-tabs nav-tabs-bordered d-flex" id="borderedTabJustified" role="tablist">
							<li class="nav-item flex-fill" role="presentation">
								<button class="nav-link w-100 active" id="home-tab" data-bs-toggle="tab" data-bs-target="#bordered-justified-home" type="button" role="tab" aria-controls="home" aria-selected="true" style="cursor:default"><span class="main_title">공지사항</span></button>
							</li>
						</ul>
						<table class="table table-hover">
							<col width="60%">
							<col width="20%">
							<col width="20%">
							<thead>
								<tr>
									<th scope="col">제목</th>
									<th scope="col">작성자</th>
									<th scope="col">작성일</th>
								</tr>
							</thead>
							<tbody id="notice_data_list">
								<c:forEach var="cnt" begin="0" end="4">
									<tr onclick="goNoticeDetail(${notice_list[cnt].noticeno})">
										<td>${notice_list[cnt].title}</td>
										<td>${notice_list[cnt].nickname}</td>
										<td><fmt:formatDate value="${notice_list[cnt].regdate}" pattern="MM-dd"/> </td>
									<tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>      
			</div>
			<div class="col-lg-6">
				<div class="card">
					<div class="card-body">	
						<ul class="nav nav-tabs nav-tabs-bordered d-flex" id="borderedTabJustified" role="tablist">
							<li class="nav-item flex-fill" role="presentation">
								<button class="nav-link w-100 active" id="home-tab" data-bs-toggle="tab" data-bs-target="#bordered-justified-home" type="button" role="tab" aria-controls="home" aria-selected="true" style="cursor:default"><span class="main_title">자유게시판</span></button>
							</li>
						</ul>
						<table class="table table-hover">
							<col width="60%">
							<col width="20%">
							<col width="20%">
							<thead>
								<tr>
									<th scope="col">제목</th>
									<th scope="col">작성자</th>
									<th scope="col">작성일</th>
								</tr>
							</thead>
							<tbody id="board_data_list">
								<c:forEach var="cnt" begin="0" end="4">
									<tr onclick="goBoardDetail(${board_list[cnt].boardno})">
										<td>${board_list[cnt].title}</td>
										<td>${board_list[cnt].nickname}</td>
										<td><fmt:formatDate value="${board_list[cnt].regdate}" pattern="MM-dd"/> </td>
									<tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>      
			</div>
		</div>
	</section>
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