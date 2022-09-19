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
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/a00_com/bootstrap.min.css" >
<style>
	td{text-align:center;}
</style>
<script src="${pageContext.request.contextPath}/resources//a00_com/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources//a00_com/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script src="https://developers.google.com/web/ilt/pwa/working-with-the-fetch-api" type="text/javascript"></script>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function(){
		var vm = new Vue({
			el:".container",
			data:{msg:"index"}
		});
		$.ajax({
			url:"userlist.do",
			dataType:"json",
			success:function(data){
				var addHTML = "";
				$(data).each(function(idx, user){
					addHTML +="<tr><td>"+user.userno+"</td><td>"+user.id+"</td><td>"+user.pw+"</td><td>"+user.nickname+"</td></tr>"
					$("#userlist").html(addHTML);
				})
			}
		})
		location.href="MainPage.do"
	});
</script>
</head>
<body>

<div class="container">
	<div class="jumbotron text-center">
	  <h2 >{{msg}}</h2>
	</div>
	<form id="frm01" class="form-inline"  method="post">
  	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
	    <input class="form-control mr-sm-2" placeholder="제목" />
	    <input class="form-control mr-sm-2" placeholder="내용" />
	    <button class="btn btn-info" type="submit">Search</button>
 	</nav>
	</form>
   <table class="table table-hover table-striped">
   	<col width="25%">
   	<col width="25%">
   	<col width="25%">
   	<col width="25%">
    <thead>
    
      <tr class="table-success text-center">
        <th>유저번호</th>
        <th>아이디</th>
        <th>비밀번호</th>
        <th>이름</th>
      </tr>
    </thead>	
    <tbody id="userlist">
    	
    </tbody>
	</table>       
</div>
</body>
</html>