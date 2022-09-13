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
<title>공지사항</title>
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
	#notice_title{
		font-size:40px;
	}
	.noticeListpart:hover{
		cursor:pointer;
	}
	#noticeForm{
		padding-top:40px;
		padding-bottom:30px;
	}
</style>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script src="https://developers.google.com/web/ilt/pwa/working-with-the-fetch-api" type="text/javascript"></script>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function(){
		noticeListajax()
		$("#mainPageBtn").click(function(){
			location.href="MainPage.do"
		})
		$("#notice_schBtn").click(function(){
			noticeListajax()
		})
		$("[name=pageSize]").change(function(){
			$("[name=curPage]").val("1");
			noticeListajax()
		})
		$("#inputTitle").keyup(function(){
			if(event.keyCode==13){
				noticeListajax()
			}
		})
		$("#notice_insBtn").click(function(){
			location.href="newNoticePage.do"
		})
	});
	function goPage(cnt){
		$("[name=curPage]").val(cnt);
		noticeListajax()
	}
	function noticeListajax(){
		var input_title = $("[name=title]").val()
		var input_pageSize = $("[name=pageSize]").val()
		var input_curPage = $("[name=curPage]").val()
		$.ajax({
			url:"getNoticeList.do",
			data:"curPage="+input_curPage+"&pageSize="+input_pageSize+"&title="+input_title,
			dataType:"json",
			success:function(data){
				var addHTML = "";
				$(data).each(function(idx, data){
					regdate = data.regdate.substring(0,10)
					addHTML+= "<tr class='noticeListpart' onclick='noticeDetail("+data.noticeno+")'><td scope='col'>"+data.noticeno+"</td><td scope='col'>"+data.title+"</td><td scope='col'>"+data.nickname+"</td><td scope='col'>"+regdate+"</td></tr>"
				})
				$("#notice_data_list").html(addHTML)
			}
		})
		$.ajax({
			url:"getNoticePagingInfo.do",
			data:"curPage="+input_curPage+"&pageSize="+input_pageSize+"&title="+input_title,
			dataType:"json",
			success:function(data){
				var addHTML2 = "";
				var isActive = "";
				var startB = data.startBlock;
				var endB = data.endBlock;
				addHTML2 += '<li class="page-item"><a class="page-link" href="javascript:goPage('+startB+')" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a></li>'
				for(var cnt=startB; cnt<=endB; cnt++){
					if(data.curPage==cnt){
						isActive='active'
					}else{
						isActive=''
					}
					if(cnt>0){
						addHTML2 += '<li class="page-item"><a class="page-link '+isActive+'" href="javascript:goPage('+cnt+')">'+cnt+'</a></li>'
					}
				}
				addHTML2 += '<li class="page-item"><a class="page-link" href="javascript:goPage('+endB+')" aria-label="Next"><span aria-hidden="true">&raquo;</span></a></li>'
				console.log(addHTML2)
				$("#notice_list_block").html(addHTML2)
				$("[name=pageSize]").val(data.pageSize)
			},
			error:function(request,status,error){
				alert("code:"+request.satus+"\n message:"+request.responseText+"\n error:"+error)
				console.log("error")
			}
		})
	}
	function noticeDetail(noticeno){
		location.href="noticeDetailPage.do?noticeno="+noticeno
	}
</script>
</head>
<body>
<jsp:include page="nav.jsp"/>
<main id="main" class="main">
	<div class="pagetitle">
		<h1>공지사항</h1>
		<nav>
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="MainPage.do"><i class="bi bi-house-door"></i></a></li>
				<li class="breadcrumb-item active">Notice</li>
			</ol>
		</nav>
	</div>
	
	<div class="container">
	
		<div class="card">
			<div class="card-body">		
		            <!-- Bordered Tabs Justified -->
				<ul class="nav nav-tabs nav-tabs-bordered d-flex" id="borderedTabJustified" role="tablist">
					<li class="nav-item flex-fill" role="presentation">
					<button class="nav-link w-100 active" id="home-tab" data-bs-toggle="tab" data-bs-target="#bordered-justified-home" type="button" role="tab" aria-controls="home" aria-selected="true" style="cursor:default"><span id="notice_title">공지사항</span></button>
					</li>
				</ul>
				
				<form id="noticeForm" class="row g-3"  method="post" onsubmit="return false">
					<input type="hidden" name="curPage" value="0"/>
					<div class="col-md-4 mt-4">
						<input type="hidden"/>
					    <input id="inputTitle" class="form-control" name="title" placeholder="제목" />
				    </div>
				    <div class="col-md-1 mt-4">
				    	<button class="form-control btn btn-outline-primary" id="notice_schBtn" type="button">검색</button>
				    </div>
					<div class="col-md-2 mt-4">
						<select class="form-select" name="pageSize" aria-label="Default select example">
							<option value="5" selected>5</option>
							<option value="10">10</option>
							<option value="30">30</option>
						</select>
				    </div>
				    <c:if test="${userAuth_session != 'user'}">
					    <div class="col-md-2 mt-4 rightBtn">
					    	<button id="notice_insBtn" class="form-control btn btn-primary" type="button">글작성</button>
					    </div>
				    </c:if>
				</form>
				
				<div class="tab-content pt-2" id="borderedTabJustifiedContent">
					<div class="tab-pane fade show active" id="bordered-justified-home" role="tabpanel" aria-labelledby="home-tab">
						<table class="table table-hover">
							<col width="5%">
							<col width="45%">
							<col width="20%">
							<col width="20%">
							<thead>
								<tr>
									<th scope="col">No.</th>
									<th scope="col">제목</th>
									<th scope="col">작성자</th>
									<th scope="col">작성일</th>
								</tr>
							</thead>
							<tbody id="notice_data_list">
							</tbody>
						</table>
					</div>
					<nav aria-label="Page navigation example">
						<ul class="pagination justify-content-center" id="notice_list_block">
						</ul>
					</nav>
				</div><!-- End Bordered Tabs Justified -->
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
</body>
</html>