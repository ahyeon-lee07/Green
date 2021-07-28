<!--상진8 규찬2-->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
request.setCharacterEncoding("UTF-8");
%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<c:choose>
	<c:when test="${result ==  'loginFailed' }">
	
	</c:when>
</c:choose>


<!-- 메인 -->
<main class="mainH">
	<div class="container py-1">
		<!-- 페이지 타이틀 부분 -->
		<div class="d-flex justify-content-between mt-5">
			<div class="bd-highlight">
				<h4 class="page_title">회원가입</h4>
			</div>
			<div class="bd-highlight page_subtitle">
				<nav aria-label="breadcrumb">
					<ol class="breadcrumb p-0 bg bg-transparent">
						<li class="breadcrumb-item"><a href="${contextPath }/main.do">홈</a></li>
						<li class="breadcrumb-item active" aria-current="page">회원가입</li>
					</ol>
				</nav>
			</div>
		</div>

		 <div class="d-flex justify-content-center mt-5">
                <div class="bd-highlight border d-flex flex-column text-center rounded py-3 px-5" style="width: 360px; height: 200px;">
                    <a class="mt-4" href="${contextPath }/normalJoin.do">
                        <button class="btn btn-success btn-lg btn-block" >일반 회원가입</button>
                    </a>
                    <a class="mt-4" href="${contextPath }/snsJoin.do">
                        <button class="btn btn-success btn-lg btn-block" >SNS계정으로 회원가입</button>
                    </a>
                </div>
         </div>
	</div>
</main>