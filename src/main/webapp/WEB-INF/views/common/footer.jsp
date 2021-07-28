<!--규찬10-->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
request.setCharacterEncoding("UTF-8");
%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!-- 푸터 -->
<footer>
	<!-- 푸터 상단메뉴 -->
	<div class="border-top">
		<div class="container">
			<div class="bd-highlight">
				<ul class="navbar-nav mr-auto flex-row fMenu">
					<li class="nav-item mr-4 "><a class="nav-link text-secondary "
						href="${contextPath }/company.do">회사소개</a></li>
					<li class="nav-item mr-4"><a class="nav-link text-secondary"
						href="${contextPath }/agreement.do">이용약관</a></li>
					<li class="nav-item mr-4"><a class="nav-link text-secondary"
						href="${contextPath }/privacyPolicy.do">개인정보취급방침</a></li>
				<!-- 	<li class="nav-item mr-4"><a class="nav-link text-secondary"
						href="#">이용안내</a></li>
					<li class="nav-item mr-4"><a class="nav-link text-secondary"
						href="#">제휴문의</a></li> -->
				</ul>
			</div>
		</div>
	</div>
	<!-- 회사내용 -->
	<div class="bg-dark">
		<div class="container text-white-50">
			<div class="d-flex bd-highlight py-4">
				<!-- 로고 -->
				<div class="p-2 bd-highlight">
					<img class="d-block mx-auto"
						src="${contextPath}/resources/img/logo_2.png" alt="그린케이스" style="height: 50px;">
				</div>
				<div class="p-2 flex-grow-1 bd-highlight d-flex flex-column fMenu">
					<div class="bd-highlight mb-3">COPYRIGHT © DEEPING ALL RIGHTS
						RESERVED.</div>
					<div class="bd-highlight">TEL010-4356-0339</div>
					<div class="bd-highlight mb-3">평일 오전 11:00 ~ 오후 4:00 점심 오후
						12:30 ~ 오후 1:30 토 / 일 / 공휴일 휴무</div>
					<div class="bd-highlight font-weight-bold">ACCOUNT INFO</div>
					<div class="bd-highlight mb-3">KB국민 00000-000 예금주: 그린</div>
					<div class="bd-highlight">그린케이스 yu jeong</div>
					<div class="bd-highlight">ADDRESS 대전 서구 대덕대로 182</div>
				</div>
			</div>
		</div>
	</div>
</footer>