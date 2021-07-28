<!--규찬9 상진1-->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
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
				<h4>Q&A 글쓰기</h4>
			</div>
			<div class="bd-highlight">
				<nav aria-label="breadcrumb">
					<ol class="breadcrumb p-0 bg bg-transparent">
						<li class="breadcrumb-item"><a href="${contextPath }/listQnA.do">Q&A</a></li>
						<li class="breadcrumb-item active" aria-current="page">Q&A 글쓰기</li>
					</ol>
				</nav>
			</div>
		</div>

		<div class="row mb-4">
			<div class="col-12">
				<form action="#">
					<div class="row border-bottom border-top d-flex bd-highlight py-2">
						<label for="inputTitle" class="bd-highlight col-form-label pl-2"
							style="width: 100px;">제목</label>
						<div class="flex-grow-1 bd-highlight pr-2">
							<input type="text" class="form-control" id="questionTitle"
								name="questionTitle">
						</div>
					</div>
					<div class="row border-bottom py-2">
						<div class="col p-0">
							<div class="d-flex bd-highlight">
								<label for="inputUser" class="bd-highlight col-form-label pl-2"
									style="width: 100px;">작성자</label>
								<div class="flex-grow-1 bd-highlight pr-2">
									<input type="text" class="form-control" id="inputUser"
										value="${member.id}" readonly>
								</div>
							</div>
						</div>
						<div class="col p-0">
							<div class="d-flex bd-highlight">
								<label for="inputDay" class="bd-highlight col-form-label pl-2"
									style="width: 100px;">작성일</label>
								<div class="flex-grow-1 bd-highlight pr-2">
									<input type="text" class="form-control" id="questionDate"
										readonly>
								</div>
							</div>
						</div>
					</div>
					<div class="row border-bottom p-2">
						<textarea class="form-control" id="exampleFormControlTextarea1"
							id="questionContent" name="questionContent" rows="14"></textarea>
					</div>
					<!--  
					<div class="row border-bottom py-2">
						<label for="inputCk" class="bd-highlight col-form-label pl-2"
							style="width: 100px;">비밀글설정</label>
						<div class="flex-grow-1 bd-highlight pr-2">
							<div class="d-flex flex-row p-2">
								<div class="custom-control custom-radio">
									<input id="credit" name="paymentMethod" type="radio"
										class="custom-control-input" checked="" required=""> <label
										class="custom-control-label" for="credit">공개글</label>
								</div>
								<div class="custom-control custom-radio ml-3">
									<input id="debit" name="paymentMethod" type="radio"
										class="custom-control-input" required=""> <label
										class="custom-control-label" for="debit">비밀글</label>
								</div>
							</div>
						</div>
					</div>
-->
					<div class="row border-bottom py-2">
						<div class="col p-0">
							<div class="d-flex bd-highlight">
								<label for="inputShowYN"
									class="bd-highlight col-form-label pl-2" style="width: 140px;">비밀글
									설정</label>
								<div class="d-flex flex-row bd-highlight pr-2">
									<div class="custom-control custom-switch pt-2">
										<input type="checkbox" class="custom-control-input YNChk"
											id="inputShowYN" value="Y" checked> <input
											id="showYN_V" class="input_V" type="text" name="showYN"
											value="Y" style="display: none;"> <label
											id="inputShowYNLabel" class="custom-control-label"
											for="inputShowYN" style="width: 70px;">비밀글</label>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="row border-bottom py-2">
						<label for="exampleInputPassword1"
							class="bd-highlight col-form-label pl-2" style="width: 100px;">비밀번호</label>
						<div class="bd-highlight pr-2" style="">
							<input type="password" class="form-control"
								id="exampleInputPassword1">
						</div>
					</div>

				</form>
			</div>
		</div>

		<div class="row justify-content-between mb-5">
			<div class="">
				<a class="" href="${contextPath }/listQnA.do">
					<button type="button" class="btn btn-outline-secondary btn-sm">목록</button>
				</a>
			</div>
			<div class="">
				<div class="text-center">
					<button type="submit" class="btn btn-outline-success btn-sm"
						onclick="return check_add()">등록</button>
				</div>
			</div>
		</div>
	</div>
</main>

<!-- 유효성 검사 -->
<script type="text/javascript">
	function check_add() {
		var form = document.addNewQnA;

		//상품 옵션. 이미지 필수 체크 추가 되어야 함.  
		if (form.questionTitle.value == "") {
			alert("제목을 입력해 주세요.");
			return false;
		} else if (form.questionContent.value == "") {
			alert("내용을 입력해 주세요.");
			return false;
		} else {
			form.submit();
		}
	}

	//스위치 YN 체크
	window.onload = function() {
		var YNChk = document.getElementsByClassName('YNChk');
		var input_V = document.getElementsByClassName('input_V');

		for (var i = 0; i <= YNChk.length; i++) {
			var Chk = YNChk[i];
			var IV = input_V[i];

			if (YNChk.value == "Y") {
				YNChk.value = "Y"
				IV.value = "Y"
			} else {
				YNChk.value = "N"
				YNChk.value = "N"
			}
		}
	};
	// 비밀글 여부
	var showYN = document.getElementById('inputShowYN');
	showYN.addEventListener('click', function() {
		var showYN_V = showYN.value;
		var Label = document.getElementById('inputShowYNLabel');
		var V = document.getElementById('showYN_V');

		if (showYN_V != "N") {
			showYN.value = "N";
			V.value = "N";
			Label.innerHTML = "공개글";
		} else {
			showYN.value = "Y";
			V.value = "Y";
			Label.innerHTML = "비밀글";
		}
	});
</script>