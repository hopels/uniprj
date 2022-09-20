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
<title>자유게시판[게시글 작성]</title>
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
	.ck-editor__editable { height: 700px; }
	hr{
		background:rgb(65,84,241);
		height:2px;
		border:0;
	}
</style>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script src="https://developers.google.com/web/ilt/pwa/working-with-the-fetch-api" type="text/javascript"></script>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js" type="text/javascript"></script>
<script src="https://cdn.ckeditor.com/ckeditor5/35.0.1/classic/ckeditor.js"></script>
<script src="https://cdn.ckeditor.com/ckeditor5/34.0.0/classic/translations/ko.js"></script>
<script src="https://ckeditor.com/apps/ckfinder/3.5.0/ckfinder.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#board_insBtn").click(function(){
			if($("#input_title").val()==""){
				alert("제목을 입력해주세요");
				$("#input_title").focus();
				return;
			}
			if(editor.getData().length<10){
				alert("내용이 너무 짧습니다.");
				editor.focus();
				return;
			}
			$("[name=content]").val(editor.getData());
			$("#insBoard_form").attr("action","boardFileUpload.do").submit();
		})
	});
	if("${proc}"=="ins"){
		alert("게시글이 등록되었습니다.");
		location.href="boardList.do";
	}
	if("${userId_session}"==""){
		alert("로그인 후 이용해주세요");
		location.href="login.do";
	}
</script>
</head>
<body>
<jsp:include page="../config/nav.jsp"/>
<main id="main" class="main">
	<div class="pagetitle">
		<h1>자유게시판</h1>
		<nav>
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="MainPage.do"><i class="bi bi-house-door"></i></a></li>
				<li class="breadcrumb-item">Board</li>
				<li class="breadcrumb-item active">New Board</li>
			</ol>
		</nav>
	</div>

	<div class="container">
		<div class="card">
			<div class="card-header">
				<div class="pagetitle" style="padding-top:80px;">
					<h1 align="center" style="font-size:30px">자유게시판</h1>
				</div>
			</div>
			<hr>
			<div class="card-body mt-4" style="padding-top:3%">
				<form id="insBoard_form" enctype="multipart/form-data" class="row g-3" method="post">
					<input id="input_userno" type="hidden" name="userno" value="${userno}"/>
					<div class="row mb-3">
						<label for="input_title" class="col-sm-1 col-form-label">제목</label>
						<div class="col-sm-5">
							<input id="input_title" class="form-control" name="title"/>
						</div>
					</div>
					
					<div class="row mb-3">
						<label for="input_title" class="col-sm-1 col-form-label">첨부파일</label>
						<div class="col-sm-5">
							<input multiple="multiple" type="file" id="input_file" class="form-control" name="report"/>
						</div>
					</div>
					
					<div class="col-md12 mt-4" style="height:770px;">
						<label for="editor" class="form-label">내용</label>
						<textarea id="editor" rows="500" cols="500"></textarea>
					</div>
					<input type="hidden" name="content" value=""/>
					<button id="board_insBtn" class="form-control btn btn-primary" type="button">작성</button>
				</form>
			</div>
			<div class="card-footer">
			
			</div>
		</div>
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
<script src="${path}/resources/common/js/ckeditor.js"></script>
</body>
</html>