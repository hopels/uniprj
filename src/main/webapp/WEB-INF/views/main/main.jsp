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
	.chating{
		background-color: rgb(238,238,238);
		width: 100%;
		height: 500px;
		overflow: auto;
		padding-top: 25px;
		margin-top: 25px;
	}
	.chating p{
		color: black;
		text-align: left;
		padding-left: 15px;
	}
	input{
		width: 330px;
		height: 25px;
	}
	#chat-header{
		cursor:pointer;
	}
	.banner-text{
		font-weight:bold;
		color:white;
	}
</style>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script src="https://developers.google.com/web/ilt/pwa/working-with-the-fetch-api" type="text/javascript"></script>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#notice-tab").click(function(){
			location.href="noticePage.do";
		})
		$("#board-tab").click(function(){
			location.href="boardList.do";
		})
		if("${userId_session}"!="") {
			chatName();
		}
		$(".chatting-area").hide();
		$("#chat-header").click(function(){
			if("${userId_session}"!=""){
				$(".chatting-area").slideToggle();
			}else{
				alert("로그인 후 이용 가능합니다.");
			}
		})
	});
	
	function goNoticeDetail(noticeno){
		location.href="noticeDetailPage.do?noticeno="+noticeno;
	}
	function goBoardDetail(boardno){
		location.href="boardDetail.do?boardno="+boardno;
	}

	<%-- 채팅 js --%>
	var ws;
	
	function wsOpen(){
		ws = new WebSocket("ws://" + location.host + "/chating");
		wsEvt();
	}
	
	function wsEvt(){
		ws.onopen = function(data){
			// 소켓이 열리면 초기화 세팅
			sendEnter()
		}
		
		ws.onmessage = function(data){
			var msg = data.data;
			if(msg != null && msg.trim() != ""){
				$("#chating").append("<p>" + msg + "</p>");
				scrollcont();
			}
		}
		
		document.addEventListener("keypress", function(e){
			if(e.keyCode == 13){
				send();
				scrollcont();
			}
		})
	}
	
	function chatName(){
		var userName = $("#userName").val();
		if(userName == null || userName.trim() == ""){
			alert("사용자 이름을 입력해주세요.");
			$("#userName").focus();
		}else{
			wsOpen();
			$("#yourName").hide();
			$("#yourMsg").show();
			$("#chatting").focus();
		}
	}
	
	function send(){
		var uN = $("#userName").val();
		var msg = $("#chatting").val();
		ws.send(uN+" : "+msg);
		$("#chatting").val("");
	}
	
	function scrollcont(){
		var chat = document.querySelector("#chating");
		chat.scrollTop = chat.scrollHeight;
	}
	
	function sendEnter(){
		var uN = $("#userName").val();
		var msg = $("#chatting").val();
		ws.send(uN+"님이 채팅방에 입장하셨습니다.");
		$("#chatting").val("");
	}
</script>
</head>
<body>
<jsp:include page="../config/nav.jsp"/>
<main id="main" class="main">
	<div class="card">
		<div class="card-body">
			<div id="carouselExampleCaptions" class="carousel slide" data-bs-ride="carousel">
				<div class="carousel-indicators">
					<button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
					<button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1" aria-label="Slide 2"></button>
                  	<button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2" aria-label="Slide 3"></button>
				</div>
				<div class="carousel-inner">
					<div class="carousel-item active">
						<img src="https://png.pngtree.com/thumb_back/fh260/background/20210902/pngtree-blue-sky-and-white-clouds-pure-sky-image_786707.jpg" class="d-block w-100" alt="..." style="margin-top: 30px;max-height:360px">
						<div class="carousel-caption d-none d-md-block">
							<h4 class="banner-text">UNI Community</h4>
							<p class="banner-text">개발자 커뮤니티</p>
						</div>
					</div>
					<div class="carousel-item">
						<img src="https://t1.daumcdn.net/cfile/blog/2249E83E57E755F60D" class="d-block w-100" alt="..." style="margin-top: 30px;max-height:360px">
						<div class="carousel-caption d-none d-md-block">
							<h4 class="banner-text">UNI Community</h4>
							<p class="banner-text">개발자 커뮤니티</p>
						</div>
					</div>
					<div class="carousel-item">
						<img src="https://p0.pikist.com/photos/392/544/vung-tau-panorama-scenery-the-sea-mountain-clouds-hdr-tr%E1%BB%8Bnh-patience-s-kien.jpg" class="d-block w-100" alt="..." style="margin-top: 30px;max-height:360px">
						<div class="carousel-caption d-none d-md-block">
							<h4 class="banner-text">UNI Community</h4>
							<p class="banner-text">개발자 커뮤니티</p>
						</div>
					</div>
				</div>
				<button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
					<span class="carousel-control-prev-icon" aria-hidden="true"></span>
					<span class="visually-hidden">Previous</span>
				</button>
				<button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
					<span class="carousel-control-next-icon" aria-hidden="true"></span>
					<span class="visually-hidden">Next</span>
				</button>
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
								<button class="nav-link w-100 active" id="notice-tab" data-bs-toggle="tab" data-bs-target="#bordered-justified-home" type="button" role="tab" aria-controls="home" aria-selected="true" style="cursor:default"><span class="main_title">공지사항</span></button>
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
								<button class="nav-link w-100 active" id="board-tab" data-bs-toggle="tab" data-bs-target="#bordered-justified-home" type="button" role="tab" aria-controls="home" aria-selected="true" style="cursor:default"><span class="main_title">자유게시판</span></button>
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
	<c:if test="${not empty userId_session}">
		<div class="col-lg-6 chatting-card">
			<div class="card">
				<div class="card-header" id="chat-header">
					<h5 class="card-title" style="font-weight:bold;">
						채팅
					</h5>
				</div>
				<div class="card-body chatting-area">
					<div id="chating" class="chating"></div>
					<div id="yourName">
						<table class="">
							<tr>
								<th><input type="hidden" name="userName" id="userName" value="${user_info.nickname}"/></th>
								<th><button onclick="chatName()" id="startBtn">채팅방 입장</button></th>
							</tr>
						</table>
					</div>
					<div id="yourMsg" style="background-color:rgb(220,220,220)">
						<input id="chatting" style="width:80%;height:40px;">
						<button class="btn btn-outline-primary"onclick="send()" id="sendBtn" style="border:none">보내기</button>
					</div>
				</div>
			</div>
		</div>
	</c:if>
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