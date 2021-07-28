<!--상진8 규찬2-->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
request.setCharacterEncoding("UTF-8");
%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!-- 로그인 실패시 알림  -->
<c:choose>
	<c:when test="${param.result == 'loginFailed' }">
		<script>
			window.onload = function(){
				alert("입력한 정보가 일치 하지 안습니다. 다시 시도해 주세요!");
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
				<h4 class="page_title">기존회원 로그인</h4>
			</div>
			<div class="bd-highlight page_subtitle">
				<nav aria-label="breadcrumb">
					<ol class="breadcrumb p-0 bg bg-transparent">
						<li class="breadcrumb-item"><a href="${contextPath }/main.do">홈</a></li>
						<li class="breadcrumb-item"><a href="${contextPath }/login.do">로그인</a></li>
						<li class="breadcrumb-item active" aria-current="page">기존회원 로그인</li>
					</ol>
				</nav>
			</div>
		</div>

        <form action="${contextPath}/member/login.do" name="loginForm" method="POST">
            <div class="d-flex justify-content-center mt-5">
                <div class="bd-highlight rounded border" style="width: 480px;">
                    <div class="d-flex flex-row bd-highlight py-3 px-5"  >
                        <div class="bd-highlight mt-4">
                            <div class="bd-highlight d-flex flex-column">
                                <div class="bd-highlight d-flex flex-row">
                                    <label for="inputId" class="bd-highlight col-form-label font-weight-bold" style="width: 90px;">아이디</label>
                                    <div class="placeholderText">
                                        <input id="inputId" class="form-control" name="id" type="text">
                                    </div>
                                </div>
                                <div class="bd-highlight d-flex flex-row my-2">
                                    <label for="inputPassword" class="bd-highlight col-form-label font-weight-bold" style="width: 90px;">비밀번호</label>
                                    <div>
                                        <input id="inputPassword" class="form-control" name="pw" type="password">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="bd-highlight d-flex align-items-stretch ml-3 mt-4 mb-2">
                            <div class="bd-highlight d-flex align-items-stretch ">
                                <input type="button" class="btn btn-success btn-lg btn-block font-weight-bold" value="로그인" onclick="checkLogin()">
                            </div>
                        </div>
                    </div>
                    <div class="d-flex bd-highlight justify-content-center py-2 border-top">
                        <div class="bd-highlight ">
                            <a href="${contextPath}/find_id.do" class="btn text-primary">아이디 찾기</a>
                        </div>
                        <div class="bd-highlight ">
                            <a href="${contextPath}/find_pw.do" class="btn text-primary">비밀번호 찾기</a>
                        </div>
                        <div class="bd-highlight ">
                            <a href="${contextPath}/join.do" class="btn text-primary">회원가입</a>
                        </div>
                    </div>
                </div>
            </div>
        </form>

	</div>
</main>

<!-- 유효성 검사 -->
<script type="text/javascript">
	function checkLogin() {
		var form = document.loginForm;
		if (form.id.value == "") {
			alert("아이디를 입력해주세요!");
			form.id.focus();
			return false;
		}
		else if (form.pw.value == "") {
			alert("비밀번호를 입력해주세요!");
			form.pwd.focus();
			return false;
		}
		form.submit();
	}
</script>