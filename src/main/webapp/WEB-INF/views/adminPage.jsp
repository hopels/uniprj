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
<title>관리자페이지</title>
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
	#adminPage_title{
		font-size:30px;
		font-weight:bold;
	}
	.list-tr:hover{
		background-color:rgb(239,239,239);
	}
</style>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script src="https://developers.google.com/web/ilt/pwa/working-with-the-fetch-api" type="text/javascript"></script>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js" type="text/javascript"></script>
<script type="text/javascript">
	if("${userAuth_session}"!="admin" || "${userAuth_session}"==""){
		alert("접근 권한이 없습니다.")
		location.href="MainPage.do"
	}
	function hoverUser(userno){
		$("[name=userno]").val(userno)
	}
	const change = (target) => {
		$("[name=auth]").val(target.value)
		if(confirm("권한을 변경하시겠습니까?")){
			$("#auth-change-frm").attr("action","uptAuth.do").submit()
		}
	}
	if("${proc}"=="uptAuth"){
		alert("권한이 변경되었습니다.")
		location.href="adminPage.do"
	}
</script>

</head>
<body>
<jsp:include page="nav.jsp"/>
<main id="main" class="main">
	<div class="pagetitle">
		<h1>관리자 페이지</h1>
		<nav>
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="MainPage.do"><i class="bi bi-house-door"></i></a></li>
				<li class="breadcrumb-item active">Admin Page</li>
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
							<button class="nav-link w-100 active" id="home-tab" data-bs-toggle="tab" data-bs-target="#bordered-justified-home" type="button" role="tab" aria-controls="home" aria-selected="true" style="cursor:default"><span id="adminPage_title">관리자 페이지</span></button>
							</li>
						</ul>
					</div>
				</div>
			</div>
			
			
			<div class="col-lg-9">
				<div class="card">
					<div class="card-body">
						<h5 class="card-title" style="font-weight:bold;">회원목록</h5>
						<table class="datatable">
							<col width="10%">
							<col width="25%">
							<col width="30%">
							<col width="20%">
							<col width="15%">
							<thead>
								<tr>
									<th>No</th>
									<th>Id</th>
									<th>Name</th>
									<th>Join</th>
									<th>Auth</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="user" items="${userList}">
									<tr class="list-tr" onmouseover="hoverUser(${user.userno})">
										<td>${user.userno}</td>
										<td>${user.id}</td>
										<td>${user.nickname}</td>
										<td><fmt:formatDate value="${user.joindate}" pattern="yyyy-MM-dd"/></td>
										<td>
											<select class="auth-select" onchange="change(this)">
												<option value="" selected disabled>${user.auth}</option>
												<option value="user">user</option>
												<option value="manager">manager</option>
												<option value="admin">admin</option>
											</select> 
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<div class="col-lg-3">
				<div class="card">
					<div class="card-header">
						<h5 class="card-title" style="font-weight:bold;">권한 관리</h5>
					</div>
					<div class="card-body">
						<div class="row" style="margin-top:30px;">
							<div class="col-lg-6 col-md-6 label " style="color:rgb(119, 133, 169)">
								admin
							</div>
							<div class="col-lg-6 col-md-6" style="color:black;margin-bottom:10px">
								${authCnt.acnt} 명
							</div>
							<div class="col-lg-6 col-md-6 label " style="color:rgb(119, 133, 169)">
								manager
							</div>
							<div class="col-lg-6 col-md-6" style="color:black;margin-bottom:10px">
								${authCnt.mcnt} 명
							</div>
							<div class="col-lg-6 col-md-6 label " style="color:rgb(119, 133, 169)">
								user
							</div>
							<div class="col-lg-6 col-md-6" style="color:black;">
								${authCnt.ucnt} 명
							</div>
						</div>
					</div>
				</div>
			</div>
			<form id="auth-change-frm" method="post">
				<input type="hidden" name="userno" value=""/>
				<input type="hidden" name="auth" value=""/>
			</form>
			
			
			
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