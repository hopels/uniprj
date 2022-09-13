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
<title>자유게시판[상세보기]</title>
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
	#boardDetail_btnArea{
		width:123px;
		height:auto;
		margin: 0 auto;
		margin-bottom: 7%
	}
	.ck-editor__editable { height : 150px;}
	.comment-header-left{
		width:400px;
		height:auto;
		display:inline-block;
		
	}
	.comment-header-right{
		width:75px;
		height:auto;
		display:inline-block;
		float:right;
		cursor:pointer;
	}
	.comment-card-title{
		padding:2px 0 2px 0;
	}
	.comment-card-body{
		padding:30px;
	}
	#ins-btn-area{
		width:100%;
		padding:10px;
		text-align:center;
	}
</style>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script src="https://developers.google.com/web/ilt/pwa/working-with-the-fetch-api" type="text/javascript"></script>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js" type="text/javascript"></script>
<script src="https://cdn.ckeditor.com/ckeditor5/35.0.1/classic/ckeditor.js"></script>
<script src="https://cdn.ckeditor.com/ckeditor5/34.0.0/classic/translations/ko.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		var boardno = ${param.boardno}
		commentListajax();
		$("#board_uptbtn").click(function(){
			if("${userAuth_session}"!='admin' && "${userAuth_session}"!='manager'){
				if("${userno}"!="${boardDetail.userno}"){
					alert("작성자만 수정이 가능합니다.")
					return
				}
			}
			location.href="uptBoardPage.do?boardno="+boardno
		})
		$("#board_delbtn").click(function(){
			if("${userAuth_session}"!='admin' && "${userAuth_session}"!='manager'){
				if("${userno}"!="${boardDetail.userno}"){
					alert("작성자만 삭제가 가능합니다.")
					return
				}
			}
			if(confirm("게시글을 삭제하시겠습니까?")){
				location.href="delBoard.do?boardno="+boardno	
			}
		})
		$("#comment-ins-btn").click(function(){
			if(editor2.getData().length<1){
				alert("내용을 입력해주세요")
				$("#editor2").focus()
				return
			}
			if(confirm("댓글을 등록하시겠습니까?")){
				$.ajax({
					url:"insComment.do",
					data:"boardno="+${param.boardno}+"&content="+editor2.getData(),
					dataType:"json",
					success:function(data){
						alert(data.proc)
						editor2.setData("")
						commentListajax()
						goPage(1)
					}
				})
			}
		})
		$("#comment-upt-btn").click(function(){
			if(editor3.getData().length<1){
				alert("내용을 입력해주세요")
				return
			}
			var content = editor3.getData()
			var commentno = $("#upt-commentno").val()
			if(confirm("댓글을 수정하시겠습니까?")){
				$.ajax({
					url:"uptComment.do",
					data:"content="+content+"&commentno="+commentno,
					dataType:"json",
					success:function(data){
						alert(data.proc)
						commentListajax()
						$(".btn-close").click()
					}
				})
			}
		})
	});
	var proc = "${proc}"
	if(proc!=""){
		if(proc=="del"){
			alert("게시글이 삭제되었습니다.")
			location.href="boardList.do"
		}
		if(proc=="err"){
			alert("잘못된 요청입니다.")
			location.href="boardList.do"
		}
	}
	
	if("${userId_session}"==""){
		alert("로그인 후 이용해주세요")
		location.href="login.do";
	}
	function goPage(cnt){
		$("[name=curPage]").val(cnt);
		commentListajax();
		var offset = $("#flush-headingOne").offset();
		$('html').animate({scrollTop : offset.top}, 200);
	}
	function uptEditor(idx){
		var comment_content=$("#comment-idx-"+idx).html()
		editor3.setData(comment_content)
		$("#upt-commentno").val(idx)
	}
	function delComment(commentno){
		if(confirm("댓글을 삭제하시겠습니까?")){
			$.ajax({
				url:"delComment.do",
				data:"commentno="+commentno,
				dataType:"json",
				success:function(data){
					alert("댓글이 삭제되었습니다.")
					commentListajax()
				}
			})
		}
	}
	function commentListajax(){
		var input_curPage = $("[name=curPage]").val()
		$.ajax({
			url:"getCommentList.do",
			data:"boardno="+${param.boardno}+"&curPage="+input_curPage,
			dataType:"json",
			success:function(data){
				addHtml = "";
				$(data).each(function(idx,cmt){
					addHtml += "<div class='card'><div class='card-header'><div class='comment-div'><div class='comment-header-left'>"
								+ "<h5 class='card-title comment-card-title' style='display:inline-block;'>"+cmt.nickname+"</h5><small> ("+cmt.id+") </small></div>"
					if(cmt.regdate!=cmt.uptdate){
						addHtml += "(수정됨)"
					}
					if("${userAuth_session}"=='user'){
						if("${userId_session}"==cmt.id){
							addHtml += "<div class='comment-header-right'><span><small onclick='delComment("+cmt.commentno+")'>삭제</small></span>"
										+ "</div><div class='comment-header-right' onclick='uptEditor("+cmt.commentno+")' data-bs-toggle='modal' data-bs-target='#comment-upt-modal'><span><small>수정</small></span></div>"
						}	
					}else{
						addHtml += "<div class='comment-header-right'><span><small onclick='delComment("+cmt.commentno+")'>삭제</small></span>"
							+ "</div><div class='comment-header-right'><span><small onclick='uptEditor("+cmt.commentno+")' data-bs-toggle='modal' data-bs-target='#comment-upt-modal'>수정</small></span></div>"
					}
					
					addHtml += "</div></div><div id='comment-idx-"+cmt.commentno+"' class='card-body comment-card-body'>"+cmt.content+"</div></div>"
				})
				$("#commentList-contents").html(addHtml)
				
			}
		})
		$.ajax({
			url:"getCommentSchInfo.do",
			data:"boardno="+${param.boardno}+"&curPage="+input_curPage,
			dataType:"json",
			success:function(data){
				if(data.count!=0){
					var addHTML2 = "";
					var isActive = "";
					var startB = data.startBlock;
					var endB = data.endBlock;
					addHTML2 += '<li class="page-item"><a class="page-link" href="javascript:goPage('+(startB-1)+')" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a></li>'
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
					addHTML2 += '<li class="page-item"><a class="page-link" href="javascript:goPage('+(endB+1)+')" aria-label="Next"><span aria-hidden="true">&raquo;</span></a></li>'
					$("#comment_list_block").html(addHTML2)
				}else{
					var addHTML3 = "<div class='card'><div class='card-header'><div class='comment-div'><div class='comment-header-left'>"
									+ "<h5 class='card-title comment-card-title' style='display:inline-block;'>아직 댓글이 없습니다!</h5>"
									+ "</div></div></div><div class='card-body comment-card-body'><p></p></div></div>";		
					$("#commentList-contents").html(addHTML3)
					console.log(addHTML3)
				}
				
			},
			error:function(request,status,error){
				alert("code:"+request.satus+"\n message:"+request.responseText+"\n error:"+error)
			}
		})
	}
</script>
</head>
<body>
<jsp:include page="nav.jsp"/>
<main id="main" class="main">
	<div class="pagetitle">
		<h1>자유게시판 상세보기</h1>
		<nav>
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="MainPage.do"><i class="bi bi-house-door"></i></a></li>
				<li class="breadcrumb-item">Board</li>
				<li class="breadcrumb-item active">Board Detail</li>
			</ol>
		</nav>
	</div>
	
	<div class="container">
		<div class="card">
		
			<div class="card-header">
				<div class="pagetitle" style="padding-top:80px;">
					<h1 align="center" style="font-size:40px">${boardDetail.title}</h1>
				</div>
				<div class="header_info">
					<span>&nbsp;&nbsp;&nbsp; ${boardDetail.nickname}</span>
				</div>
				<div class="header_info" style="text-align:right">
					<c:choose>
						<c:when test="${boardDetail.regdate == boardDetail.uptdate}">
							<span style="align:right"><fmt:formatDate value="${boardDetail.regdate }" pattern="yyyy-MM-dd"/> </span>
						</c:when>
						<c:when test="${boardDetail.regdate != boardDetail.uptdate}">
							<span style="align:right"><fmt:formatDate value="${boardDetail.uptdate }" pattern="yyyy-MM-dd"/> (수정됨)</span>
						</c:when>
					</c:choose>
				</div>
				
			</div>
			<div class="card-body">
				<span style="display:block;padding-top:20px;padding-left:20px;padding-right:20px;">${boardDetail.content}</span>
			</div>
			<div class="card-footer">
				<div class="accordion accordion-flush" id="accordionFlushExample">
					<div class="accordion-item">
						<h2 class="accordion-header" id="flush-headingOne">
						<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#commentList-accordion" aria-expanded="false" aria-controls="commentList-accordion">
						댓글 보기
						</button>
						</h2>
						<div id="commentList-accordion" class="accordion-collapse collapse" aria-labelledby="flush-headingOne" data-bs-parent="#accordionFlushExample">
							<div id="commentList-contents" class="accordion-body">
								
							</div>
							<nav aria-label="Page navigation example">
								<ul class="pagination justify-content-center" id="comment_list_block">
									
								</ul>
							</nav>
							<form id="comment-page-form">
								<input type="hidden" name="curPage" value="0"/>
							</form>
						</div>
					</div>
				</div>
				<div class="alert alert-light border-light alert-dismissible fade show">
					<h4 class="alert-heading">댓글 작성</h4>
					<small>욕설 또는 비방 목적의 댓글은 작성자의 동의 없이 <span style="color:red;">삭제</span>처리 됩니다.</small>
						<hr>
					<div class="col-md12 mt-4">
						<textarea id="editor2"></textarea>
					</div>
					<div id="ins-btn-area">
					<button id="comment-ins-btn"class="btn btn-primary right" type="button" style="width:20%">등록</button>
					<form id="comment-ins-form">
						<input type="hidden" name="boardno" value="${param.boardno}"/>
						<input type="hidden" name="content" value=""/>
					</form>
					</div>
				</div>
			</div>
			

			
		</div>
		
	</div>
	
	
	<div id="boardDetail_btnArea">
		<button id="board_uptbtn" class="btn btn-outline-primary" type="button">수정</button>
		<button id="board_delbtn" class="btn btn-outline-danger" type="button">삭제</button>
	</div>
	<div class="modal fade" id="comment-upt-modal" tabindex="-1">
		<div class="modal-dialog modal-dialog-centered modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">댓글 수정</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<textarea id="editor3"></textarea>
					<input id="upt-commentno" type="hidden" value=""/>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
					<button id="comment-upt-btn" type="button" class="btn btn-primary">수정</button>
				</div>
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
<script src="${path}/resources/common/js/ckeditor2.js"></script>
<script src="${path}/resources/common/js/ckeditor3.js"></script>
</body>
</html>