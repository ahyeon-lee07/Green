<!--규찬10-->
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
	<c:when test="${param.msg == 'joinNo' }">
		<script>
			window.onload = function () {
				alert("비빌번호를 다시 확인해 주세요.");
			}
		</script>
	</c:when>
</c:choose>
<!-- 메인 -->
<main class="mainH">
	<div class="container py-1">
		<!-- 페이지 타이틀 부분 -->
		<div class="d-flex justify-content-between mt-5">
			<div class="bd-highlight">
				<h4 class="page_title">비밀번호 확인</h4>
			</div>
			<div class="bd-highlight page_subtitle">
				<nav aria-label="breadcrumb">
					<ol class="breadcrumb p-0 bg bg-transparent">
						<li class="breadcrumb-item"><a href="${contextPath }/main.do">홈</a></li>
						<li class="breadcrumb-item active" aria-current="page">비밀번호 확인</li>
					</ol>
				</nav>
			</div>
		</div>
		${pageMaker.makeQueryPage(bList.IDX, pageMaker.cri.page) }
		<c:choose>
			<c:when test="${param.communityType == 'qna' }">
				<form action="${contextPath}/communityChk.do?communityType=${param.communityType}&communityNum=${param.communityNum}" name="loginForm" method="POST">
			</c:when>
			<c:otherwise>
				<form action="${contextPath}/member/pwChk.do" name="loginForm" method="POST">
			</c:otherwise>
		</c:choose>
		
            <div class="d-flex justify-content-center mt-5">
                <div class="bd-highlight rounded border" style="width: 480px;">
                    <div class="d-flex flex-row bd-highlight py-3 px-5"  >
                        <div class="bd-highlight">
                            <div class="bd-highlight d-flex flex-column">
                                <div class="bd-highlight d-flex flex-row">
                                    <label for="inputPassword" class="bd-highlight col-form-label font-weight-bold" style="width: 90px;">비밀번호</label>
                                    <div>
										<input id="inputId" class="form-control" name="id" type="text" style="display: none;" value="${member.id}">
                                        <input id="inputPassword" class="form-control" name="pw" type="password">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="bd-highlight d-flex align-items-stretch ml-3">
                            <div class="bd-highlight d-flex align-items-stretch" style="width: 70px;">
                                <input type="submit" class="btn btn-success btn-lg btn-block font-weight-bold btn-sm" value="확인">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </form>
</main>