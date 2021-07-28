<!--규찬10-->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
request.setCharacterEncoding("UTF-8");
%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!-- 메인 -->
<main class="mainH">
	<div class="container py-1">
		<!-- 페이지 타이틀 부분 -->
		<div class="d-flex justify-content-between mt-5">
			<div class="bd-highlight">
				<h4 class="page_title">회사소개</h4>
			</div>
			<div class="bd-highlight page_subtitle">
				<nav aria-label="breadcrumb">
					<ol class="breadcrumb p-0 bg bg-transparent">
						<li class="breadcrumb-item"><a href="${contextPath }/main.do">홈</a></li>
						<li class="breadcrumb-item active" aria-current="page">회사소개</li>
					</ol>
				</nav>
			</div>
		</div>

		<div class="text-wrap text-center border p-5 bg-light rounded">
			그린케이스의 포커스는 눈으로 즐기는 다양한 즐거움에서 시작한 라이프스타일 브랜드입니다.<br>유니크한 스타일과 모던한 감성으로
			일상의 재미를 선사합니다 !</div>

	</div>
</main>