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
<title>마이페이지</title>
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
<style>
	#myPage_title{
		font-size:40px;
	}
	.profile-box-info{
		border:1px solid red;
		margin-left:30px;
		display:inline-block;
		width:70%;
	}
	.profile-box-title{
		border: 1px solid black;
		display:inline-block;
	}
	.profile-box-content{
		border: 1px solid black;
		display:inline-block;
		margin-left: 10px;
	}
	.part-icon{
		padding-left:10px;
		padding-right:10px;
		color:gray;
		cursor:pointer;
	}
	#profile-nickname{
		margin-top:30px;
	}
	.user-detail-info{
		padding-top:20px;
	}
	.label-info{
		font-weight:bold;
	}
	.user-detail-banner{
		width:100%;
		height:177px;
		text-align:center;
		padding-top:130px;
	}
	#profile-change-link{
		cursor:pointer;
		font-weight:bold;
	}
	#profile-change-link:hover{
		color:blue;
	}
</style>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script src="https://developers.google.com/web/ilt/pwa/working-with-the-fetch-api" type="text/javascript"></script>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function(){
		devInfoAjax()
		$("#front-icon").click(function(){
			var jobtype=$("#dev_hidden").val();
			if(jobtype=="frontend"){
				alert("이미 선택된 직군입니다.")
				return
			}
			if(confirm("직군을 변경하시겠습니까?")){
				frontIconSelect()
				$("#dev_hidden").val("frontend")
				$("#dev_frm").attr("action","uptDevPart.do").submit()
			}
		})
		$("#back-icon").click(function(){
			var jobtype=$("#dev_hidden").val();
			if(jobtype=="backend"){
				alert("이미 선택된 직군입니다.")
				return
			}
			if(confirm("직군을 변경하시겠습니까?")){
				backIconSelect()
				$("#dev_hidden").val("backend")
				$("#dev_frm").attr("action","uptDevPart.do").submit()
			}
		})
		$("#full-icon").click(function(){
			var jobtype=$("#dev_hidden").val();
			if(jobtype=="fullstack"){
				alert("이미 선택된 직군입니다.")
				return
			}
			if(confirm("직군을 변경하시겠습니까?")){
				fullIconSelect()
				$("#dev_hidden").val("fullstack")
				$("#dev_frm").attr("action","uptDevPart.do").submit()
			}
		})
		$("#detail-upt-btn").click(function(){
			var input_nickname = $("#inputNickname").val()
			var emailPattern = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
			var input_email = $("#inputEmail").val()
			if(input_nickname.length<2 || input_nickname>16){
				alert("닉네임은 2~16자리 사이로 입력해주세요")
				$("#inputNickname").focus()
				return
			}
			if(!input_email.match(emailPattern)){
				alert("이메일 형식이 올바르지 않습니다.")
				$("#inputEmail").focus()
				return
			}
			$("#detail-upt-form").attr("action","uptUserDetail.do").submit()
		})
		
		var pwPattern = /^(?=.*[a-z])(?=.*\d)[a-z0-9_-]{8,16}$/
		$("#pw-upt-btn").click(function(){
			if($("#curPassword").val()==""){
				alert("현재 비밀번호를 입력해주세요")
				$("#curPassword").focus()
				return
			}
			if($("#inputPassword").val()==""){
				alert("새 비밀번호를 입력해주세요")
				$("#curPassword").focus()
				return
			}
			if($("#rePassword").val()==""){
				alert("비밀번호 확인을 입력해주세요")
				$("#curPassword").focus()
				return
			}
			if($("#pw-valid-result").val()!="y"){
				alert("새 비밀번호를 확인해주세요")
				$("#rePassword").focus()
				return
			}			
			$("#pw-upt-form").attr("action","uptUserPw.do").submit()
		})
		$("#inputPassword").keyup(function(){
			var inputPw = $("#inputPassword").val()
			$("#input-repw-valid-text").text("")
			$("#pw-valid-result").val("n")
			if(!inputPw.match(pwPattern)){
				$("#input-pw-valid-text").text("8~16자리 영어+숫자 조합입니다.").css("color","red")
			}else{
				$("#input-pw-valid-text").text("사용가능한 비밀번호입니다.").css("color","green")
				
			}
		})
		$("#rePassword").keyup(function(){
			var inputPw = $("#inputPassword").val()
			var rePw = $("#rePassword").val()
			if(inputPw!="" && inputPw.match(pwPattern)){
				if(inputPw!=rePw){
					$("#input-repw-valid-text").text("비밀번호가 일치하지 않습니다.").css("color","red")
					$("#pw-valid-result").val("n")
				}else{
					$("#input-repw-valid-text").text("비밀번호가 일치합니다").css("color","green")
					$("#pw-valid-result").val("y")
				}
			}
			
		})
		$("#profile-change-link").click(function(){
			$("[name=report]").click()
		})
		$("[name=report]").change(function(){
			$("#profile-form").attr("action","mypageFileUpload.do").submit()
		})
	});
	
	if("${userId_session}"==""){
		alert("로그인 후 이용해주세요")
		location.href="login.do";
	}
	if("${proc}"=="upt"){
		alert("개인정보가 수정되었습니다.")
		location.href="goMyPage.do";
	}
	if("${proc}"=="uptPw"){
		alert("비밀번호가 변경되었습니다.")
		location.href="goMyPage.do";
	}
	if("${proc}"=="falsePw"){
		alert("현재 비밀번호가 다릅니다.")
		location.href="goMyPage.do";
	}
	if("${proc}"=="sPw"){
		alert("현재 비밀번호와 새 비밀번호가 같습니다.")
		location.href="goMyPage.do";
	}
	function frontIconSelect(){
		$("#front-icon").css("color","blue")
		$("#back-icon").css("color","gray")
		$("#full-icon").css("color","gray")
	}
	function backIconSelect(){
		$("#front-icon").css("color","gray")
		$("#back-icon").css("color","blue")
		$("#full-icon").css("color","gray")
	}
	function fullIconSelect(){
		$("#front-icon").css("color","gray")
		$("#back-icon").css("color","gray")
		$("#full-icon").css("color","blue")
	}
	function devInfoAjax(){
		$.ajax({
			url:"devInfoJson.do",
			dataType:"json",
			success:function(data){
				var type = data.jobtype
				if(type=="frontend"){
					$("#dev_info").text("Front-end")
					$("#dev_hidden").val("frontend")
				}
				if(type=="backend"){
					$("#dev_info").text("Back-end")
					$("#dev_hidden").val("backend")
				}
				if(type=="fullstack"){
					$("#dev_info").text("Full-stack")
					$("#dev_hidden").val("fullstack")
				}
				var jobtype=$("#dev_hidden").val();
				if(jobtype=="frontend"){
					frontIconSelect()
				}
				if(jobtype=="backend"){
					backIconSelect()
				}
				if(jobtype=="fullstack"){
					fullIconSelect()
				}
			}
		})
	}
</script>
</head>
<body>
<jsp:include page="nav.jsp"/>
<main id="main" class="main">
	<div class="pagetitle">
		<h1>마이페이지</h1>
		<nav>
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="MainPage.do"><i class="bi bi-house-door"></i></a></li>
				<li class="breadcrumb-item active">My Page</li>
			</ol>
		</nav>
	</div>
	
	<section class="section">
		<div class="row align-items-top">
			<div class="col-lg-12">
				<div class="card">
					<div class="card-body">		
				            <!-- Bordered Tabs Justified -->
						<ul class="nav nav-tabs nav-tabs-bordered d-flex" id="borderedTabJustified" role="tablist">
							<li class="nav-item flex-fill" role="presentation">
							<button class="nav-link w-100 active" id="home-tab" data-bs-toggle="tab" data-bs-target="#bordered-justified-home" type="button" role="tab" aria-controls="home" aria-selected="true" style="cursor:default"><span id="myPage_title">마이페이지</span></button>
							</li>
						</ul>
					</div>
				</div>
			</div>
			<div class="col-xl-3">
				<div class="card">
					<div class="card-body profile-card pt-4 d-flex flex-column align-items-center">
						<h5 class="card-title" id="profile-change-link">프로필</h5>
						<form id="profile-form" enctype="multipart/form-data" method="post">
							<input type="hidden" name="userno" value="${user_Info.userno}"/>
							<input type="file" name="report" style="display:none"/>
						</form>
						<c:choose>
							<c:when test="${not empty user_Info.pfimg}">
								<img src="${path}/resources/common/img/profile/${user_Info.pfimg}" alt="profile" class="rounded-circle"/>
							</c:when>
							<c:when test="${empty user_Info.pfimg}">
								<img src="${path}/resources/NiceAdmin/assets/img/profile/default.png" alt="profile" class="rounded-circle"/>
							</c:when>
						</c:choose>
						<h3 id="profile-nickname">${user_Info.nickname}</h3>
						<h6 id="dev_info"></h6>
						<form id="dev_frm" method="post">
							<input type="hidden" id="dev_hidden" name="jobtype" value=""/>
						</form>
						<div class="social-links mt-2">
							<i id="front-icon" class="bi bi bi-laptop fs-2 part-icon"></i>
							<i id="back-icon" class="bi bi-hdd-rack fs-2 part-icon"></i>
							<i id="full-icon" class="bi bi-intersect fs-2 part-icon"></i>
						</div>
					</div>
				</div>
			</div>
			
			<div class="col-lg-6">
				<div class="card">
					<div class="card-body">
						<h5 class="card-title" style="font-weight:bold;">개인정보</h5><hr>

						<div class="row user-detail-info">
							<div class="col-lg-3 col-md-4 label-info ">닉네임</div>
							<div class="col-lg-9 col-md-8">${user_Info.nickname}</div>
						</div>
						
						<div class="row user-detail-info">
							<div class="col-lg-3 col-md-4 label-info">아이디</div>
							<div class="col-lg-9 col-md-8">${user_Info.id}</div>
						</div>
						
						<div class="row user-detail-info">
							<div class="col-lg-3 col-md-4 label-info">이메일</div>
							<div class="col-lg-9 col-md-8">${user_Info.email}</div>
						</div>
						
						<div class="row user-detail-info">
							<div class="col-lg-3 col-md-4 label-info">가입일</div>
							<div class="col-lg-9 col-md-8"><fmt:formatDate value="${user_Info.joindate}" pattern="yyyy. MM. dd"/> </div>
						</div>
						
						<div class="user-detail-banner">
							<button id="userDetail-detailUptBtn" class="btn btn-primary" type="button" data-bs-toggle="modal" data-bs-target="#userDetail-detailUptModal">개인정보 수정</button>
							<button id="userDetail-pwUptBtn" class="btn btn-primary" type="button" data-bs-toggle="modal" data-bs-target="#userDetail-pwUptModal">비밀번호 변경</button>
						</div>
						<%-- detailUpt Modal --%>
						<div class="modal fade" id="userDetail-detailUptModal" tabindex="-1">
							<div class="modal-dialog modal-dialog-centered">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title">개인정보 수정</h5>
										<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
									</div>
									<div class="modal-body">
										<form id="detail-upt-form" method="post">
											<input type="hidden" name="id" value="${user_Info.id}"/>
											<div class="row mb-3">
												<label for="inputNickname" class="col-sm-2 col-form-label">닉네임</label>
												<div class="col-sm-10">
													<input type="text" class="form-control" name="nickname" id="inputNickname" value="${user_Info.nickname}">
												</div>
											</div>
											<div class="row mb-3">
												<label for="inputEmail" class="col-sm-2 col-form-label">이메일</label>
												<div class="col-sm-10">
													<input type="text" class="form-control" name="email" id="inputEmail" value="${user_Info.email}">
												</div>
											</div>
										</form>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
										<button id="detail-upt-btn" type="button" class="btn btn-primary">수정</button>
									</div>
								</div>
							</div>
						</div>
						<%-- pwUpt Modal --%>
						<div class="modal fade" id="userDetail-pwUptModal" tabindex="-1">
							<div class="modal-dialog modal-dialog-centered">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title">비밀번호 변경</h5>
										<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
									</div>
									<div class="modal-body">
									    <form id="pw-upt-form" method="post">
									    	<input type="hidden" name="id" value="${user_Info.id}"/>
											<div class="row mb-3">
												<label for="curPassword" class="col-sm-4 col-form-label">현재 비밀번호</label>
												<div class="col-sm-7">
													<input type="password" class="form-control" name="pw" id="curPassword" value="">
												</div>
											</div>
											<div class="row mb-3">
												<label for="inputPassword" class="col-sm-4 col-form-label">새 비밀번호</label>
												<div class="col-sm-7">
													<input type="password" class="form-control" name="newpw" id="inputPassword" value="">
													&nbsp;<span id="input-pw-valid-text"></span>
												</div>
											</div>
											<div class="row mb-3"> 
												<label for="rePassword" class="col-sm-4 col-form-label">비밀번호 확인</label>
												<div class="col-sm-7">
													<input type="password" class="form-control" id="rePassword" value="">
													&nbsp;<span id="input-repw-valid-text"></span>
													<input type="hidden" id="pw-valid-result" value="" />
												</div>
											</div>
										</form>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
										<button id="pw-upt-btn" type="button" class="btn btn-primary">변경</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			
			<div class="col-lg-3">
				<div class="card">
					<div class="card-header">
						<h5 class="card-title" style="font-weight:bold;">활동내역</h5>
						
						
						
					</div>
					<div class="card-body">
							<div class="row" style="margin-top:30px;">
							<div class="col-lg-3 col-md-4 label " style="color:rgb(119, 133, 169)">
								게시글
							</div>
							<div class="col-lg-9 col-md-8" style="color:black;margin-bottom:10px">
								${wb} 회
							</div>
							<div class="col-lg-3 col-md-4 label " style="color:rgb(119, 133, 169)">
								댓글
							</div>
							<div class="col-lg-9 col-md-8" style="color:black;">
								${wc} 회
							</div>
						</div>
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
<script type="text/javascript">

</script>
</body>
</html>