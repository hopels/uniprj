<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script>
	var isLogout = "${isLogout}";
	if(isLogout=="logout"){
		alert("페이지에서 로그아웃 되었습니다.");
		location.href="login.do";
	}
</script>
  <!-- ======= Header ======= -->
  <header id="header" class="header fixed-top d-flex align-items-center">

    <div class="d-flex align-items-center justify-content-between">
      <a href="MainPage.do" class="logo d-flex align-items-center">
        <img src="${path}/resources/NiceAdmin/assets/img/logo.png" alt="">
        <span class="d-none d-lg-block">UNI Community</span>
      </a>
      <i class="bi bi-list toggle-sidebar-btn"></i>
    </div><!-- End Logo -->

    <nav class="header-nav ms-auto">
      <ul class="d-flex align-items-center">

        <li class="nav-item dropdown pe-3">
		<c:if test="${userId_session != null}">
			<a class="nav-link nav-profile d-flex align-items-center pe-0" href="#" data-bs-toggle="dropdown">
            <c:choose>
				<c:when test="${not empty userPf_session}">
					<img src="${path}/resources/common/img/profile/${userPf_session}" alt="profile" class="rounded-circle"/>
				</c:when>
				<c:when test="${empty userPf_session}">
					<img src="${path}/resources/NiceAdmin/assets/img/profile/default.png" alt="profile" class="rounded-circle"/>
				</c:when>
			</c:choose>
            <span class="d-none d-md-block dropdown-toggle ps-2">${userId_session}</span>
          	</a><!-- End Profile Iamge Icon -->

          <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow profile">
            <li class="dropdown-header">
              <h6>${userId_session}</h6>
            </li>
            <li>
              <hr class="dropdown-divider">
            </li>

            <li>
              <a class="dropdown-item d-flex align-items-center" href="http://localhost:5080/goMyPage.do">
                <i class="bi bi-person"></i>
                <span>마이페이지</span>
              </a>
            </li>
            
            <li>
              <hr class="dropdown-divider">
            </li>

            <li>
              <a class="dropdown-item d-flex align-items-center" href="http://localhost:5080/logout.do">
                <i class="bi bi-box-arrow-right"></i>
                <span>로그아웃</span>
              </a>
            </li>
          </ul>
		</c:if>
		<c:if test="${userId_session == null}">
		<a href="login.do">로그인</a>
		</c:if>
          <!-- End Profile Dropdown Items -->
        </li><!-- End Profile Nav -->

      </ul>
    </nav><!-- End Icons Navigation -->

  </header><!-- End Header -->

  <!-- ======= Sidebar ======= -->
  <aside id="sidebar" class="sidebar">

    <ul class="sidebar-nav" id="sidebar-nav">

      <li class="nav-item">
        <a class="nav-link collapsed" href="http://localhost:5080/MainPage.do">
          <i class="bi bi-grid"></i>
          <span>메인</span>
        </a>
      </li>
      
      <li class="nav-item">
        <a class="nav-link collapsed" href="http://localhost:5080/noticePage.do">
          <i class="bi bi-megaphone"></i>
          <span>공지사항</span>
        </a>
      </li>
      
      <li class="nav-item">
        <a class="nav-link collapsed" href="http://localhost:5080/boardList.do">
          <i class="bi bi-chat-right-text"></i>
          <span>자유게시판</span>
        </a>
      </li>

      <li class="nav-item">
      	<a class="nav-link collapsed" data-bs-target="#components-nav" data-bs-toggle="collapse" href="#">
		<i class="bi bi-menu-button-wide"></i><span>고객지원</span><i class="bi bi-chevron-down ms-auto"></i>
		</a>
		<ul id="components-nav" class="nav-content collapse" data-bs-parent="#sidebar-nav">
        <li>
	        <a class="nav-link collapsed" href="http://localhost:5080/center/map.do">
	          <i class="bi bi-map"></i>
	          <span>지점안내</span>
	        </a>
      	</li>
      
      	<li>
	        <a class="nav-link collapsed" href="http://localhost:5080/center/boxPage">
	          <i class="bi bi-box"></i>
	          <span>셀렉트박스</span>
	        </a>
      	</li>
      </ul>
    </ul>

  </aside><!-- End Sidebar-->

