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
				<h4 class="page_title">${pageTitle }</h4>
			</div>
			<div class="bd-highlight page_subtitle">
				<nav aria-label="breadcrumb">
					<ol class="breadcrumb p-0 bg bg-transparent">
						<li class="breadcrumb-item"><a href="${contextPath }/main.do">홈</a></li>
						<li class="breadcrumb-item active" aria-current="page">${pageTitle }</li>
					</ol>
				</nav>
			</div>
		</div>

		<div class="row mb-4 mt-2">
			<div class="col-12">
				<form action="${contextPath }/community/add.do?communityType=${communityType}" name="community" method="POST">
					<c:if test="${communityType == 'qna' }">
						<div class="row border-bottom border-top border-bottom-0 d-flex bd-highlight py-2">
							<label for="inputTitle" class="bd-highlight col-form-label pl-2"
								style="width: 100px;">QnA 구분</label>
							<select id="inputState" class="form-control form-control-sm"  style="width: 100px; height: 38px" >
								<option value="nomal" selected>기타문의</option>
								<option value="product" >상품관련</option>
							</select>
							<button id="btn_product" type="button" class="btn btn-secondary mx-2" onclick="productSearch()" style="display: none">상품검색</button>
							<input id="product_Input_name"  type="text" class="form-control" value="" style="display: none; width: 72%;" readonly>
							<input id="product_Input_id" type="text" class="form-control" name="productId" value="" style="display: none;">
						</div>
					</c:if>
			
					<div class="row border-bottom border-top d-flex bd-highlight py-2">
						<label for="inputTitle" class="bd-highlight col-form-label pl-2" style="width: 100px;">제목</label>
						<div class="flex-grow-1 bd-highlight pr-2">
							<input type="text" class="form-control" id="title" name="title">
						</div>
					</div>
					<div class="row border-bottom d-flex py-2">
						<div class="d-flex bd-highlight">
							<label for="inputUser" class="bd-highlight col-form-label pl-2" style="width: 100px;">작성자</label>
							<div class="flex-grow-1 bd-highlight pr-2">
								<input type="text" class="form-control inputBoxReadonly" id="id" name="id" value="${member.id}" readonly>
							</div>
						</div>
						<c:if test="${communityType == 'qna' }">
							<div class="d-flex bd-highlight ml-4">
								<label for="inputPwYN" class="bd-highlight col-form-label pl-2" style="width: 140px;">비밀글 설정</label>
								<div class="d-flex flex-row bd-highlight pr-2">
									<div class="custom-control custom-switch pt-2">
										<input type="checkbox" class="custom-control-input YNChk" id="inputPwYN" value="N" > 
										<input id="pwYN_V" class="input_V" type="text" name="pwYN" value="N" style="display: none;"> 
										<label id="inputPwYNLabel" class="custom-control-label" for="inputPwYN" style="width: 70px;">공개글</label>
									</div>
									<div class="bd-highlight pr-2" id="pwBox" style="display: none;">
										<input type="text" class="form-control" id="exampleInputPassword1" name="questionPw" maxlength="4">
									</div>
								</div>
							</div>
						</c:if>
					</div>
					<div class="row border-bottom d-flex bd-highlight py-2">
						<label for="content" class="bd-highlight col-form-label pl-2" style="width: 100px;">내용</label>
						<div class="flex-grow-1 bd-highlight pr-2">
							<textarea class="form-control" id="content" name="content" rows="14"></textarea>
						</div>
						
					</div>
				</form>
			</div>
		</div>

		<div class="row justify-content-between mb-5">
			<div class="">
				<a class="" href="${contextPath }/community.do?communityType=${communityType}">
					<button type="button" class="btn btn-secondary">목록</button>
				</a>
			</div>
			<div class="">
				<div class="text-center">
					<button type="submit" class="btn btn-success" onclick="return check_add()">등록</button>
				</div>
			</div>
		</div>
	</div>
</main>


<script>
	<c:if test="${communityType == 'qna' }">
		//Qna 구분
		var inputState = document.getElementById('inputState');
		inputState.addEventListener('change', function(){
			
			var inputState_V = inputState.value;
			var btn_product = document.getElementById('btn_product');
			var product_Input = document.getElementById('product_Input_name');
			
			if(inputState_V == "nomal") {
				btn_product.value = '';
				product_Input.value = '';
				
				btn_product.style.display = "none";
				product_Input.style.display = "none";
			}else if(inputState_V == "product"){
				btn_product.style.display = "block";
				product_Input.style.display = "block";
			}
		});
		
		//상품 검색
		function productSearch(){
			window.open("${contextPath }/productSearch.do", "productSearch", "width=800px, height=500px, left=100, top=50");
		}
		
		//로딩시 스위치 YN 체크
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
		// 비밀글 여부 pwBox
		var showYN = document.getElementById('inputPwYN');
		showYN.addEventListener('click', function() {
			var showYN_V = showYN.value;
			var Label = document.getElementById('inputPwYNLabel');
			var V = document.getElementById('pwYN_V');
			var pwBox = document.getElementById('pwBox');

			if (showYN_V != "N") {
				showYN.value = "N";
				V.value = "N";
				Label.innerHTML = "공개글";
				pwBox.childNodes[1].value = '';
				pwBox.style.display = "none";
			} else {
				showYN.value = "Y";
				V.value = "Y";
				Label.innerHTML = "비밀글";
				pwBox.style.display = "block";
			}
		});
	</c:if>
	
	function check_add() {
		var form = document.community;
		

		<c:if test="${communityType == 'qna' }">
			//숫자, 4~16자
			var pwExp = form.questionPw.value.search(/^[0-9]*$/);
			
			var inputState = document.getElementById('inputState').value;
			var product_Input_id = document.getElementById('product_Input_id').value;
			var pwYN_V = document.getElementById('pwYN_V').value;
	
			
			if(inputState == 'product' && product_Input_id.value == ''){
				alert('상품을 선택해 주세요.');
				return false;
			}
		</c:if>
		 
		if (form.title.value == "") {
			alert("제목을 입력해 주세요.");
			return false;
		} 
		<c:if test="${communityType == 'qna' }">
		else if (pwYN_V == "Y" && form.questionPw.value == '') {
			alert("비밀번호를 입력해주세요.");
			return false;
		} else if (pwExp) {
			alert("비밀번호는 숫자만 입력 가능 합니다.");
			return false;
		} 
		</c:if>
		else if (form.content.value == "") {
			alert("내용을 입력해 주세요.");
			return false;
		}else {
			form.submit();
		}
	};
	
</script>