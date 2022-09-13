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
<title>로그인</title>
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
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script src="https://developers.google.com/web/ilt/pwa/working-with-the-fetch-api" type="text/javascript"></script>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#login_btn").click(function(){
			loginfunc()
		})
		$("#userpw").keyup(function(){
			if(event.keyCode==13){
				loginfunc()
			}
		})
		$("#join_btn").click(function(){
			location.href="joinPage.do"
		})
	});
	
	var proc = "${proc}";
	if(proc!=""){
		if(proc=="nonId"){
			alert("존재하지 않는 아이디입니다.")
			location.href="login.do"
		}
		if(proc=="nonPw"){
			alert("비밀번호가 일치하지 않습니다.")
			location.href="login.do"
		}
		if(proc=="pass"){
			location.href="MainPage.do"
		}
	}
	function loginfunc(){
		if($("#userid").val()==""){
			alert("아이디를 입력해주세요")
			$("#userid").focus()
			return
		}
		if($("#userpw").val()==""){
			alert("비밀번호를 입력해주세요")
			$("#userpw").focus()
			return
		}
		$("#frm01").attr("action","loginCheck.do")
		$("#frm01").submit()
	}
</script>
</head>
<body>

<section class="section register min-vh-100 d-flex flex-column align-items-center justify-content-center py-4">
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-lg-4 col-md-6 d-flex flex-column align-items-center justify-content-center">
				<div class="d-flex justify-content-center py-4">
					<a href="login.do" class="logo d-flex align-items-center w-auto">
						<img src="${path}/resources/NiceAdmin/assets/img/logo.png" alt="">
						<span class="d-none d-lg-block">UNI Community</span>
					</a>
				</div><!-- End Logo -->
				<div class="card mb-3">
					<div class="card-body">
						<div class="pt-4 pb-2">
							<h5 class="card-title text-center pb-0 fs-4" style="font-weight:bold">로그인</h5>
							<p class="text-center small">아이디 & 비밀번호를 입력하세요</p>
						</div>
					
						<form id="frm01" class="row g-3 needs-validation"  method="post">
							
							<div class="col-12">
						  		<label for="userid" class="form-label">아이디</label>
							    <input id="userid" name="id" class="form-control mr-sm-2" placeholder="아이디" />
						    </div>
						    
						    <div class="col-12">
							    <label for="userpw" class="form-label">비밀번호</label>
							    <input type="password" id="userpw" name="pw" class="form-control mr-sm-2" placeholder="비밀번호" />
						    </div>
						    
						    <button class="btn btn-primary w-100" id="login_btn" type="button">로그인</button>
							<div class="col-12">
								<p class="small mb-0 text-center"><a href="MainPage.do" style="font-weight:bold;">비로그인으로 이용하기</a></p>
							</div>
						</form>
					</div>
				</div>
				<div class="credits">
                아직 회원이 아니신가요?&nbsp;&nbsp;&nbsp;&nbsp;<a href="joinPage.do">회원가입하기</a>
              </div>
			</div>
		</div>
	</div>
</section>

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