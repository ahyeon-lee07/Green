<!--규찬5 아연3 상진2-->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
request.setCharacterEncoding("UTF-8");
%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<header id="header" class="bg-white ftco-navbar-light">
	<!-- sticky-top  -->
	<div class="border-bottom topNav">
		<div class="container bg-white">
			<div class="d-flex justify-content-between py-1">
				<!-- 탑 메뉴 sticky-top -->
				<div class="bd-highlight ">
					<ul class="navbar-nav mr-auto flex-row">
						<li class="nav-item mr-3"><a class="nav-link text-secondary"
							href="${contextPath }/main.do">홈</a></li>
						<c:choose>
							<c:when test="${isLogOn != true && member == null }">
								<li class="nav-item mr-3"><a
									class="nav-link text-secondary" href="${contextPath }/login.do">로그인</a>
								</li>
								<li class="nav-item mr-3"><a
									class="nav-link text-secondary" href="${contextPath }/join.do">회원가입</a>
								</li>
							</c:when>
						</c:choose>

						<li class="nav-item mr-3"><a class="nav-link text-secondary"
							href="${contextPath }/cart.do">장바구니</a></li>
						<c:choose>
							<c:when test="${isLogOn == true && member != null }">
								<li class="nav-item dropdown mr-3"><a
									class="nav-link text-secondary" href="#" id="navbarDropdown"
									role="button" data-toggle="dropdown" aria-haspopup="true"
									aria-expanded="false"> 마이페이지 </a>
									<div class="dropdown-menu mt-2"
										aria-labelledby="navbarDropdown">
										<a class="dropdown-item" href="${contextPath }/myPage.do">마이페이지</a>
										<a class="dropdown-item"
											href="${contextPath }/memberEditChk.do">회원정보 수정/탈퇴</a> <a
											class="dropdown-item" href="${contextPath }/purchaseList.do">구매내역조회</a>
										<a class="dropdown-item" href="${contextPath }/wish_list.do">관심상품내역조회</a>
									</div></li>
							</c:when>
						</c:choose>

						<li class="nav-item dropdown mr-3"><a
							class="nav-link text-secondary" href="#" id="navbarDropdown"
							role="button" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false"> 커뮤니티 </a>
							<div class="dropdown-menu mt-2" aria-labelledby="navbarDropdown">
								<a class="dropdown-item" href="${contextPath }/community.do?communityType=notice">공지사항</a>
								<a class="dropdown-item" href="${contextPath }/community.do?communityType=event">이벤트 게시판</a>
								<a class="dropdown-item" href="${contextPath }/community.do?communityType=qna">Q&A</a>
								<a class="dropdown-item" href="${contextPath }/community.do?communityType=review">Review</a>
							</div>
						</li>
						<c:choose>
							<c:when test="${member.masterYN == 'M' }">
								<li class="nav-item dropdown mr-3"><a
									class="nav-link text-secondary" href="#" id="navbarDropdown"
									role="button" data-toggle="dropdown" aria-haspopup="true"
									aria-expanded="false"> 관리자메뉴 </a>
									<div class="dropdown-menu mt-2" aria-labelledby="navbarDropdown">
										<a class="dropdown-item" href="${contextPath }/memberList.do">회원관리</a>
										<a class="dropdown-item" href="${contextPath }/productList.do?options=">상품등록</a>
										<a class="dropdown-item" href="${contextPath }/couponList.do">쿠폰관리</a>
									</div>
								</li>
							</c:when>
						</c:choose>
						<c:choose>
							<c:when test="${isLogOn == true && member != null }">
								<li class="nav-item mr-3 ml-3">
									<div class="top_memberName">
										<span>"${member.name}"</span> 님 환영합니다
									</div>
								</li>
								<li class="nav-item mr-3">
									<button id="btn_logout" type="button"
										class="btn btn-outline-danger btn-sm mt-1">로그아웃</button>
								</li>
							</c:when>
						</c:choose>

					</ul>
				</div>
				<!-- 탑 검색 -->
				<div class="top_find bd-highlight">
					<form class="form-inline border rounded">
						<input class="form-control border-0" type="text" placeholder="검색"
							aria-label="Search">
						<button class="btn btn-outline-success border-0 btn_search"
							type="submit"></button>
					</form>
				</div>
			</div>
		</div>
	</div>

	<!--　로고 -->
	<div id="logoBox" class="border-bottom logoBox">
		<p style="text-align: center; padding: 20px 0px;">
			<a href="${contextPath }/main.do"> <img
				src="${contextPath}/resources/img/logo.png" alt="그린케이스" /></a>
		</p>
	</div>

	<!-- gnb -->
	<div id="gnbBox" class="gnb_bar">
		<nav class="container">
			<div class=" py-2">
				<ul
					class="d-flex justify-content-between navbar-nav mr-auto flex-row ">
					<li class="nav-item dropdown mr-4 mx-auto"><a
						class="nav-link text-secondary btn_menu" href="#"
						id="navbarDropdown" role="button" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false"> <img
							src="${contextPath }/resources/img/list.svg" alt="">
					</a>
						<div class="dropdown-menu all_menu"
							aria-labelledby="navbarDropdown" style="padding: 0;">
							<div class="d-flex justify-content-between">
								<div class="bd-highlight btn_menu_L">
									<div
										class="d-flex justify-content-start flex-wrap px-3 pt-3 pb-0">
										<div class="bd-highlight btn_menu_L_W">
											<a class="nav-link font-weight-bold text-dark p-3"
												href="${contextPath }/prodList.do?p_group=hard">하드
												케이스</a>
										</div>
										<div class="bd-highlight btn_menu_L_W">
											<a class="nav-link font-weight-bold text-dark p-3"
												href="${contextPath }/prodList.do?p_group=gel">젤
												케이스</a>
										</div>
										<div class="bd-highlight btn_menu_L_W">
											<a class="nav-link font-weight-bold text-dark p-3"
												href="${contextPath }/prodList.do?p_group=card">카드
												케이스</a>
										</div>
										<div class="bd-highlight btn_menu_L_W">
											<a class="nav-link font-weight-bold text-dark p-3"
												href="${contextPath }/prodList.do?p_group=airPods">에어팟
												케이스</a>
										</div>
										<div class="bd-highlight btn_menu_L_W">
											<a class="nav-link font-weight-bold text-dark p-3"
												href="${contextPath }/prodList.do?p_group=buds">버즈
												케이스</a>
										</div>
										<div class="bd-highlight btn_menu_L_W">
											<a class="nav-link font-weight-bold text-dark p-3"
												href="${contextPath }/prodList.do?p_group=${listProduct.p_group}">액세서리</a>
											<a class="dropdown-item py-1 text-black-50"
												style="text-align: left;"
												href="${contextPath }/prodList.do?p_group=keyRing">키링</a>
											<a class="dropdown-item py-1 text-black-50"
												style="text-align: left;"
												href="${contextPath }/prodList.do?p_group=smart">스마트톡</a>
										</div>
									</div>
								</div>
								<div class="bd-highlight btn_menu_R">
									<div
										class="d-flex flex-column bd-highlight bg-light px-3 pt-3 pb-0">
										<div class="bd-highlight">
											<div class="d-flex flex-column bd-highlight mb-2">
												<div
													class="bd-highlight border-bottom font-weight-bold py-2">커뮤니티
												</div>
												<a class="pb-1 text-black-50" href="${contextPath }/community.do?communityType=notice">공지사항</a>
												<a class="pb-1 text-black-50" href="${contextPath }/community.do?communityType=event">이벤트 게시판</a>
												<a class="py-1 text-black-50" href="${contextPath }/community.do?communityType=qna">Q&A</a>
												<a class="pb-1 text-black-50" href="${contextPath }/community.do?communityType=review">Review</a>
											</div>
										</div>
										<div class="bd-highlight">
											<div class="d-flex flex-column bd-highlight mb-2">
												<div
													class="bd-highlight border-bottom font-weight-bold py-2">쇼핑몰정보
												</div>
												<a class="py-1 text-black-50 "
													href="${contextPath }/company.do">회사소개</a> <a
													class="pb-1 text-black-50"
													href="${contextPath }/agreement.do">이용약관</a> <a
													class="pb-1 text-black-50"
													href="${contextPath }/privacyPolicy.do">개인정보취급방침</a>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div></li>
					<li class="nav-item mr-4 mx-auto font-weight-bold"><a
						class="nav-link text-secondary"
						href="${contextPath }/prodList.do?p_group=hard">하드
							케이스</a></li>
					<li class="nav-item mr-4 mx-auto font-weight-bold"><a
						class="nav-link text-secondary"
						href="${contextPath }/prodList.do?p_group=gel">젤
							케이스</a></li>
					<li class="nav-item mr-4 mx-auto font-weight-bold"><a
						class="nav-link text-secondary"
						href="${contextPath }/prodList.do?p_group=card">카드
							케이스</a></li>
					<li class="nav-item mr-4 mx-auto font-weight-bold"><a
						class="nav-link text-secondary"
						href="${contextPath }/prodList.do?p_group=airPods">에어팟
							케이스</a></li>
					<li class="nav-item mr-4 mx-auto font-weight-bold"><a
						class="nav-link text-secondary"
						href="${contextPath }/prodList.do?p_group=buds">버즈
							케이스</a></li>
					<li class="nav-item dropdown mr-4 mx-auto"><a
						class="nav-link text-secondary font-weight-bold" href="#"
						id="navbarDropdown" role="button" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false"> 액세서리</a>
						<div class="dropdown-menu mt-2" aria-labelledby="navbarDropdown">
							<a class="dropdown-item"
								href="${contextPath }/prodList.do?p_group=keyRing">키링</a>
							<a class="dropdown-item"
								href="${contextPath }/prodList.do?p_group=smart">스마트톡</a>
						</div></li>
				</ul>
			</div>
		</nav>
</header>

<script>
	var btnLogOut = document.getElementById('btn_logout');
	// 로그인 버튼이 있을 경우만 실행
	if (btnLogOut != null) {
		btnLogOut.addEventListener('click', function() {
			if (confirm("정말 로그아웃 하시겠습니까?") == true) {
				location.href = "${ contextPath }/member/logout.do";
			} else {
				return;
			}
		});
	}
	
	document.addEventListener('scroll', function(){
		var Y = window.pageYOffset;
		
			if (Y > 226) {
				if ( !document.getElementById('header').classList.contains('scrolled') ) {
					document.getElementById('header').classList.add('scrolled');
					document.getElementById('logoBox').style.display = 'none';
				}
			} 
			if (Y < 226) {
				if ( document.getElementById('header').classList.contains('scrolled') ) {
					document.getElementById('header').classList.remove('scrolled');
					document.getElementById('header').classList.remove('sleep');
					document.getElementById('logoBox').style.display = 'block';
				}
			} 
			if ( Y > 310 ) {
				if ( !document.getElementById('header').classList.contains('awake') ) {
					document.getElementById('header').classList.add('awake');
					
				}
			}
			if ( Y < 310 ) {
				if ( document.getElementById('header').classList.contains('awake') ) {
					document.getElementById('header').classList.remove('awake');
					document.getElementById('header').classList.add('sleep');
				}
			}
	})
</script>