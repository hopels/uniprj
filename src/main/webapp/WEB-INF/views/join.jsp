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
<title>회원가입</title>
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
<style>
	td{text-align:center;}
	label{
		padding-top: 15px;
	}
	#id_valid_feedback{
		margin-left: 15px;
	}
</style>
<script type="text/javascript">
	$(document).ready(function(){
		var idPattern = /^(?=.*[a-z])(?=.*\d)[a-z0-9_-]{6,16}$/
		var pwPattern = /^(?=.*[a-z])(?=.*\d)[a-z0-9_-]{8,16}$/
		var emailPattern = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		$("#id_valid_btn").click(function(){
			var userid = $("#userid").val()
			if(userid==""){
				alert("아이디를 입력해주세요")
				return
			}
			if(!userid.match(idPattern)){
				alert("아이디는 8~16자 영문+숫자 조합입니다.")
				return
			}
			idValidCheck()
		})
		$("#userid").keyup(function(){
			$("#id_valid_feedback").text("")
			$("id_valid_result").val("n")
		})
		$("#userpw").keyup(function(){
			var userpw=$("#userpw").val()
			$("#pw_corr_feedback").text("")
			$("#pw_corr_result").val("n")
			if(userpw.match(pwPattern)){
				$("#pw_valid_feedback").text("사용가능한 비밀번호입니다.").css("color","green")
				$("#pw_valid_result").val("y")
			}else{
				$("#pw_valid_feedback").text("비밀번호는 영문+숫자 조합 8~16자리입니다.").css("color","red")
				$("#pw_valid_result").val("n")
			}
		})
		$("#userpw_re").keyup(function(){
			var userpwre=$("#userpw_re").val()
			if(userpwre==$("#userpw").val()){
				$("#pw_corr_feedback").text("비밀번호가 일치합니다").css("color","green")
				$("#pw_corr_result").val("y")
			}else{
				$("#pw_corr_feedback").text("비밀번호가 일치하지 않습니다.").css("color","red")
				$("#pw_corr_result").val("n")
			}
		})
		
		
		$("#join_btn").click(function(){
			var input_nickname = $("#user_nickname").val()
			var input_email = $("#user_email").val()
			if(input_nickname==""){
				alert("닉네임을 입력해주세요")
				return
			}
			if(input_nickname.length<2 || input_nickname>16){
				alert("닉네임은 2~16자리 사이로 입력해주세요")
				return
			}
			if(input_email==""){
				alert("이메일을 입력해주세요")
				return
			}
			if(!input_email.match(emailPattern)){
				alert("이메일 형식이 올바르지 않습니다.")
				return
			}
			if($("#id_valid_result").val()!="y"){
				alert("아이디 중복체크를 해주세요")
				return
			}
			if($("#pw_valid_result").val()!="y"){
				alert("비밀번호 형식이 올바르지 않습니다.")
				return
			}
			if($("#pw_corr_result").val()!="y"){
				alert("두 비밀번호가 일치하지 않습니다.")
				return
			}
			$("#join_frm").attr("action","userReg.do")
			$("#join_frm").submit()
		})
		
	});
	
	function idValidCheck(){
		var inputid= $("#userid").val()
		$.ajax({
			url:"idValidCheck.do",
			data:"id="+inputid,
			dataType:"json",
			success:function(data){
				console.log(data.valid)
				if(data.valid=='nonId'){
					$("#id_valid_feedback").text("사용가능한 아이디입니다.").css("color","green")
					$("#id_valid_result").val("y")
				}
				if(data.valid=='nonPw'){
					$("#id_valid_feedback").text("이미 사용중인 아이디입니다.").css("color","red")
					$("#id_valid_result").val("n")
				}
			}
		})
	}
	var proc = "${proc}"
	if(proc!=""){
		if(proc=="Y"){
			alert("회원가입이 완료되었습니다.\n로그인 페이지로 이동합니다.")
			location.href="login.do"
		}
	}

</script>
</head>
<body>

<main>
	<div class="container">
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
									<h5 class="card-title text-center pb-0 fs-4">회원가입</h5>
									<p class="text-center small">회원정보를 입력하세요</p>
								</div>
								<form id="join_frm" class="row g-3 needs-validation"  method="post" novalidate>
							  		<div class="col-12">
								  		<label for="userid" class="form-label">아이디</label>
									    <input id="userid" name="id" class="form-control mr-sm-2" placeholder="아이디" /><br>
									    <button id="id_valid_btn" class="btn btn-primary w-30" type="button">중복체크</button><span id="id_valid_feedback"></span>
									    <input id="id_valid_result" type="hidden" value=""/>
								    </div>
								    
								    <div class="col-12">
									    <label for="userpw" class="form-label">비밀번호</label>
									    <input type="password" id="userpw" name="pw" class="form-control mr-sm-2" placeholder="비밀번호" />
									    <span id="pw_valid_feedback"></span><br>
									    <input id="pw_valid_result" type="hidden" value=""/>
								    </div>
								    
								    <div class="col-12">
									    <label for="userpw_re" class="form-label">비밀번호 확인</label>
									    <input type="password" id="userpw_re" class="form-control mr-sm-2" placeholder="비밀번호 확인" />
									    <span id="pw_corr_feedback"></span><br>
									    <input id="pw_corr_result" type="hidden" value=""/>
								    </div>
								    
								    <div class="col-12">
									    <label for="user_nickname" class="label">닉네임</label>
									    <input id="user_nickname" name="nickname" class="form-control mr-sm-2" placeholder="닉네임" />
								    </div>
								    
								    <div class="col-12">
									    <label for="user_email" class="label">이메일</label>
									    <input id="user_email" name="email" class="form-control mr-sm-2" placeholder="이메일" />
								    </div>
								    
							    	<button class="btn btn-primary w-100" id="join_btn" type="button">가입하기</button><br><br>
									<a href="login.do" style="text-align:center;margin-top:30px;">로그인페이지로 이동</a>
								</form>
								
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
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