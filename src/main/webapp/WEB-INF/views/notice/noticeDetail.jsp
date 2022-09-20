<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% pageContext.setAttribute("replaceChar", "\n"); %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<fmt:requestEncoding value="utf-8"/> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항[상세보기]</title>
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
	.header_info{
		height:50px;
		width:45%;
		display:inline-block;
		padding-top:5%;
	}
	#noticeDetail_btnArea{
		width:123px;
		height:auto;
		margin: 0 auto;
		margin-bottom: 7%
	}
</style>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script src="https://developers.google.com/web/ilt/pwa/working-with-the-fetch-api" type="text/javascript"></script>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function(){
		var noticeno = ${param.noticeno}
		$("#notice_uptbtn").click(function(){
			location.href="uptNoticePage.do?noticeno="+noticeno;
		})
		$("#notice_delbtn").click(function(){
			location.href="delNotice.do?noticeno="+noticeno;
		})
	});
	var proc = "${proc}"
	if(proc!=""){
		if(proc=="del"){
			alert("공지사항이 삭제되었습니다.");
			location.href="noticePage.do";
		}
		if(proc=="err"){
			alert("잘못된 요청입니다.");
			location.href="noticePage.do";
		}
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
		<h1>공지사항 상세보기</h1>
		<nav>
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="MainPage.do"><i class="bi bi-house-door"></i></a></li>
				<li class="breadcrumb-item">Notice</li>
				<li class="breadcrumb-item active">Notice Detail</li>
			</ol>
		</nav>
	</div>
	
	<div class="container">
		<div class="card">
		
			<div class="card-header">
				<div class="pagetitle" style="padding-top:80px;">
					<h1 align="center" style="font-size:40px">${noticeDetail.title}</h1>
				</div>
				<div class="header_info">
					<span>&nbsp;&nbsp;&nbsp; ${noticeDetail.nickname}</span>
				</div>
				<div class="header_info" style="text-align:right">
					<c:choose>
						<c:when test="${noticeDetail.regdate == noticeDetail.uptdate}">
							<span style="align:right"><fmt:formatDate value="${noticeDetail.regdate }" pattern="yyyy-MM-dd"/> </span>
						</c:when>
						<c:when test="${noticeDetail.regdate != noticeDetail.uptdate}">
							<span style="align:right"><fmt:formatDate value="${noticeDetail.uptdate }" pattern="yyyy-MM-dd"/> (수정됨)</span>
						</c:when>
					</c:choose>
				</div>
				
			</div>
			<div class="card-body">
				<span style="display:block;padding-top:20px;padding-left:20px;padding-right:20px;">${fn:replace(noticeDetail.content, replaceChar, "<br/>")}</span>
			</div>
			<div class="card-footer">
				댓글 보기
			</div>
		</div>
		
	</div>
	
	<c:if test="${userAuth_session != 'user'}">
	<div id="noticeDetail_btnArea">
		<button id="notice_uptbtn" class="btn btn-outline-primary" type="button">수정</button>
		<button id="notice_delbtn" class="btn btn-outline-danger" type="button">삭제</button>
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