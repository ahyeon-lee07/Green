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
<c:choose>
	<c:when test="${param.findId == 'NotFind' }">
		<script>
			window.onload = function () {
				alert("일치하는 정보가 없습니다.");
			}
		</script>
	</c:when>
	<c:when test="${param.findId != null }">
		<script>
			window.onload = function () {
				alert("회원 님의 아이디는 '${param.findId}' 입니다." );
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
				<h4 class="page_title">아이디 찾기</h4>
			</div>
			<div class="bd-highlight page_subtitle">
				<nav aria-label="breadcrumb">
					<ol class="breadcrumb p-0 bg bg-transparent">
						<li class="breadcrumb-item"><a href="${contextPath }/main.do">홈</a></li>
						<li class="breadcrumb-item"><a href="${contextPath }/login.do">로그인</a></li>
						<li class="breadcrumb-item"><a href="${contextPath }/member.do">기존회원 로그인</a></li>
						<li class="breadcrumb-item active" aria-current="page">아이디 찾기</li>
					</ol>
				</nav>
			</div>
		</div>

		<form action="${contextPath}/member/fintId.do" name="loginForm" method="POST">
            <div class="d-flex justify-content-center mt-5">
                <div class="bd-highlight rounded border" style="width: 480px; height: 185px;">
                    <div class="d-flex flex-row bd-highlight py-3 px-5"  >
                        <div class="bd-highlight mt-4">
                            <div class="bd-highlight d-flex flex-column">
                                <div class="bd-highlight d-flex flex-row">
                                    <label for="inputName" class="bd-highlight col-form-label font-weight-bold" style="width: 90px;">이름</label>
                                    <div class="placeholderText">
                                        <input id="inputName" class="form-control" name="name" type="text">
                                    </div>
                                </div>
                                <div class="bd-highlight d-flex flex-row mt-4 mb-2">
                                    <label for="inputEmail" class="bd-highlight col-form-label font-weight-bold" style="width: 90px;">이메일</label>
                                    <div>
                                        <input id="inputEmail" class="form-control"  type="text">
										<input id="email1" name="email1" type="text" style="display: none;">
										<input  id="email2" name="email2" type="text" style="display: none;">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="bd-highlight d-flex align-items-stretch ml-3 mt-4 mb-2">
                            <div class="bd-highlight d-flex align-items-stretch ">
                                <input type="button" class="btn btn-success btn-lg btn-block font-weight-bold" value="확인" onclick="checkLogin()" style="width: 94px;">
                            </div>
                        </div>
                    </div>
   		</form>
	</div>
</main>

<script type="text/javascript">
	
	//유효성 검사
	function checkLogin() {
		//이메일
		var inEamil = document.getElementById('inputEmail')
		var form = document.loginForm;
		//영문 한글 공백 허용
		var nameExp = document.getElementById('inputName').value.search(/^[ㄱ-ㅎ|가-힣|a-z|A-Z|]*$/);
		//이메일 형식
		var emailExp = document.getElementById('inputEmail').value.search(/^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i);
		if (form.name.value == "") {
			alert("이름을 입력해주세요!");
			form.name.focus();
			return false;
		} else if (nameExp) {
			alert("이름에 숫자는 입력 할수 없습니다.");
			form.name.focus();
			return false;
		} else if (inEamil.value == "") {
			alert("이메일을 입력해주세요!");
			inEamil.focus();
			return false;
		} else if (emailExp) {
			alert("이메일을 양식이 아닙니다.");
			inEamil.focus();
			return false;
		}

		//이메일 @ 기준으로 나누기
		var fullEmail = document.getElementById('inputEmail').value.split('@');
		document.getElementById('email1').value = fullEmail[0];
		document.getElementById('email2').value = fullEmail[1];
		form.submit();
	}
</script>