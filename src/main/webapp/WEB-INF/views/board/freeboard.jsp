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
<title>자유게시판</title>
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
	#free_title{
		font-size:40px;
	}
	.noticeListpart:hover{
		cursor:pointer;
	}
	#boardForm{
		padding-top:40px;
		padding-bottom:30px;
	}
	.boradList-img{
		width:200px;
		height:160px;
	}
	td{
		vertical-align: middle;
	}
	.boardList-title{
		font-weight:bold;
	}
	.boardList-readcnt{
		text-align:center;
	}
	tbody:hover{
		cursor:pointer;
	}
</style>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script src="https://developers.google.com/web/ilt/pwa/working-with-the-fetch-api" type="text/javascript"></script>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("[name=pageSize]").val("${boardSch.pageSize}");
		$("[name=pageSize]").change(function(){
			$("[name=curPage]").val("1");
			$("#boardForm").submit();
		})
		$("#board_schBtn").click(function(){
			$("#boardForm").attr("action","boardList.do").submit();
		})
		$("#inputTitle").keyup(function(){
			if(event.keyCode==13){
				$("#boardForm").submit();
			}
		})
		$("#board_insBtn").click(function(){
			location.href="newBoard.do";
		})
	});
function goPage(cnt){
	$("[name=curPage]").val(cnt);
	$("#boardForm").submit();
}
function goDetail(boardno){
	location.href="boardDetail.do?boardno="+boardno;
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
				<li class="breadcrumb-item active">Board</li>
			</ol>
		</nav>
	</div>
	
	<div class="container">
	
		<div class="card">
			<div class="card-body">		
		            <!-- Bordered Tabs Justified -->
				<ul class="nav nav-tabs nav-tabs-bordered d-flex" id="borderedTabJustified" role="tablist">
					<li class="nav-item flex-fill" role="presentation">
					<button class="nav-link w-100 active" id="home-tab" data-bs-toggle="tab" data-bs-target="#bordered-justified-home" type="button" role="tab" aria-controls="home" aria-selected="true" style="cursor:default"><span id="free_title">자유게시판</span></button>
					</li>
				</ul>
				
				<form id="boardForm" action="boardList.do" class="row g-3"  method="get">
					<input type="hidden" name="curPage" value="0"/>
					<div class="col-md-4 mt-4">
						<input type="hidden"/>
					    <input id="inputTitle" class="form-control" name="title" placeholder="제목" value="${param.title}" />
				    </div>
				    <div class="col-md-1 mt-4">
				    	<button class="form-control btn btn-outline-primary" id="board_schBtn" type="button">검색</button>
				    </div>
					<div class="col-md-2 mt-4">
						<select class="form-select" name="pageSize" aria-label="Default select example">
							<option value="5" selected>5</option>
							<option value="15">15</option>
							<option value="30">30</option>
						</select>
				    </div>
				    <c:if test="${not empty userAuth_session}">
				    <div class="col-md-2 mt-4 rightBtn">
				    	<button id="board_insBtn" class="form-control btn btn-primary" type="button">글작성</button>
				    </div>
				    </c:if>
				</form>
				
				<div class="tab-content pt-2" id="borderedTabJustifiedContent">
					<div class="tab-pane fade show active" id="bordered-justified-home" role="tabpanel" aria-labelledby="home-tab">
						<table class="table table-hover">
							<col width="10 %">
							<col width="50%">
							<col width="15%">
							<col width="15%">
							<col width="10%">
							<thead>
								<tr>
									<th scope="col" style="text-align:center;">이미지</th>
									<th scope="col">제목</th>
									<th scope="col">작성자</th>
									<th scope="col" style="text-align:center;">작성일</th>
									<th scope="col" style="text-align:center;">조회수</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="board" items="${blist}">
									<tr onclick="goDetail(${board.boardno})">
										<c:choose>
											<c:when test="${empty board.fname}">
												<td><img class="boradList-img" src="${path}/resources/NiceAdmin/assets/img/board/default_image.png" alt=""></td>
											</c:when>
											<c:when test="${not empty board.fname}">
												<td><img class="boradList-img" src="${path}/resources/NiceAdmin/assets/img/board/${board.fname}" alt=""></td>
											</c:when>
										</c:choose>
										<td class="boardList-title">${board.title}</td>
										<td>${board.nickname}</td>
										<td style="text-align:center;"><fmt:formatDate value="${board.regdate}" pattern="yyyy-MM-dd"/></td>
										<td class="boardList-readcnt">${board.readcnt}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					<nav aria-label="Page navigation example">
						<ul class="pagination justify-content-center" id="notice_list_block">
							<li class="page-item"><a class="page-link" href="javascript:goPage(${boardSch.startBlock-1})" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a></li>
							<c:forEach var="cnt" begin="${boardSch.startBlock}" end="${boardSch.endBlock}">
							<li class="page-item"><a class="page-link ${boardSch.curPage==cnt?'active':''}" href="javascript:goPage(${cnt})">${cnt}</a></li>
							</c:forEach>
							<li class="page-item"><a class="page-link" href="javascript:goPage(${boardSch.endBlock+1})" aria-label="Next"><span aria-hidden="true">&raquo;</span></a></li>
						</ul>
					</nav>
				</div>
			</div>
		</div>
	</div>
	<a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>
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