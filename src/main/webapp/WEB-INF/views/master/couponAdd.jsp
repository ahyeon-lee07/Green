<!--아연3 상진4 규찬3-->
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
				<h4 class="page_title">쿠폰등록</h4>
			</div>
			<div class="bd-highlight page_subtitle">
				<nav aria-label="breadcrumb">
					<ol class="breadcrumb p-0 bg bg-transparent">
						<li class="breadcrumb-item"><a href="${contextPath }/main.do">홈</a></li>
						<li class="breadcrumb-item active" aria-current="page">쿠폰등록</li>
					</ol>
				</nav>
			</div>
		</div>
		<div class="bd-highlight" style="text-align: right;">
			<img src="${contextPath }/resources/img/require.png"> <span
				class="">필수입력사항</span>
		</div>
		<div class="row border-bottom pm-2"></div>
		<div class="row mb-4">
			<div class="col-12">
				<form name="couponAdd" method="POST">
				<div class="row border-bottom py-2">
							<div class="col p-0">
								<div class="d-flex bd-highlight">
									<label for="inputUseYN" class="bd-highlight col-form-label pl-2" style="width: 140px;">사용여부</label>
									<div class="d-flex flex-row bd-highlight pr-2">
										<div class="custom-control custom-switch pt-2">
											<input type="checkbox" class="custom-control-input YNChk" id="inputUseYN" value="Y" checked>
											<input id="useYN_V" class="input_V" type="text" name="useYN" value="Y" style="display: none;">
											<label id="inputUseYNLabel" class="custom-control-label" for="inputUseYN" style="width: 70px;">활성화</label>
										</div>
									</div>
								</div>
							</div>
						</div>
					<div class="row border-bottom py-2">
						<div class="col p-0">
							<div class="d-flex bd-highlight">
								<label for="inputMasterYN" class="bd-highlight col-form-label pl-2" style="width: 140px;">쿠폰 사용기간</label>
								<div class="d-flex flex-row bd-highlight pr-2">
									<input id="couponPeroid_start" class="mr-2 form-control" type='date' value='' style="width: 170px;"/>
									<input id="couponPeroid_start_V" type='text' name='couponPeroid_start' value='0000-00-00' style="display:none"/>
									 ~
									<input id="couponPeroid_end" class="ml-2 form-control"  type='date' value='' style="width: 170px;"/>
									<input id="couponPeroid_end_V" type='text' name='couponPeroid_end' value='0000-00-00' style="display:none"/>
									<button id="" type="button" class="btn btn-outline-primary ml-2" onclick="btn_resset()" style="width: 80px;">초기화</button>
								</div>
							</div>
						</div>
					</div>
					<div class="row border-bottom py-2">
						<div class="col p-0">
							<div class="d-flex bd-highlight">
								<label for="inputCouponName" class="bd-highlight col-form-label pl-2" style="width: 140px;"><img src="${contextPath }/resources/img/require.png">쿠폰명</label>
								<div class="d-flex flex-row bd-highlight pr-2">
									<input type="text" class="form-control" id="inputCouponName" name="couponName" value="">
								</div>
							</div>
						</div>
					</div>
					<div class="row border-bottom py-2">
						<div class="col p-0">
							<div class="d-flex bd-highlight">
								<label for="inputCouponContent" class="bd-highlight col-form-label pl-2" style="width: 140px;">쿠폰혜택</label>
								<div class="d-flex flex-row bd-highlight pr-2">
									<input type="text" class="form-control" id="inputCouponContent" name="couponContent" value="">
								</div>
							</div>
						</div>
					</div>
					<div class="row border-bottom py-2">
						<div class="col p-0">
							<div class="d-flex bd-highlight">
								<label for="inputCouponPay" class="bd-highlight col-form-label pl-2" style="width: 140px;"><img src="${contextPath }/resources/img/require.png">쿠폰 할인금액</label>
								<div class="d-flex flex-row bd-highlight pr-2">
									<select id="inputState" class="form-control mr-2" name="discountType" style="width: 98px;">
										<option value="normal" selected>가격</option>
										<option value="percent" >퍼센트</option>
									</select>
									<input type="number" class="form-control" id="inputCouponPay" name="couponPay" min="0" max="" value="" style="width:120px">
									<span style="padding:6px">원</span>
								</div>
							</div>
						</div>
					</div>
					 
					<!-- Button trigger modal -->
					<div class="row py-2 mt-3">
						<div class="d-flex flex-fill justify-content-between">
							<div class="bd-highlight">
								<a href="${contextPath }/couponList.do"><button type="button"
										class="btn btn-outline-secondary">취소</button></a>
							</div>
							<div class="d-highlight">
								
								<button id="btn_memberEdit" type="submit"
									class="btn btn-success ml-2" onclick="return checkAdd()">쿠폰등록</button>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</main>
<script>

	// 활성화 여부
	var showYN = document.getElementById('inputUseYN');
	showYN.addEventListener('click', function () {
		var showYN_V = showYN.value;
		var Label = document.getElementById('inputUseYNLabel');
		var V = document.getElementById('useYN_V');

		if (showYN_V != "N") {
			showYN.value = "N";
			V.value = "N";
			Label.innerHTML = "비활성화";
		} else {
			showYN.value = "Y";
			V.value = "Y";
			Label.innerHTML = "활성화";
		}
	});

	//할인 금액 타입 체크
	var inputState = document.getElementById('inputState');
	inputState.addEventListener('change', function(){

		var Type = inputState.value;
		
		document.getElementById('inputCouponPay').value = '';

		if(Type == 'normal'){
			document.getElementById('inputCouponPay').max = '';
			document.getElementById('inputCouponPay').nextSibling.nextSibling.innerText = '원';
		
		}else if(Type == 'percent') {
			document.getElementById('inputCouponPay').max = '100';
			document.getElementById('inputCouponPay').nextSibling.nextSibling.innerText = '%';
		}
	});

	//날짜 번경에 따른 input값 변경
	function inputValueChk(VALUE) {
		var input_N = document.getElementById(VALUE);
		var input_V = document.getElementById(VALUE+"_V");

		input_N.addEventListener('change', function(){
			input_V.value = input_N.value;

			if(input_N.value == ''){
				input_V.value.value ='0000-00-00';
			}
		});
	}
	inputValueChk('couponPeroid_start');
	inputValueChk('couponPeroid_end');

	//날짜 입력값 비우기
	function btn_resset(){
		document.getElementById('couponPeroid_start').value = '';
		document.getElementById('couponPeroid_start_V').value = '0000-00-00';
		document.getElementById('couponPeroid_end').value = '';
		document.getElementById('couponPeroid_end_V').value = '0000-00-00';
	}

	//쿠폰 유효성검사
	function checkAdd(){
		var form = document.couponAdd;
		var Type = inputState.value;
		form.action = "${contextPath }/couponList/couponAdd.do";

		var couponPeroidStart = document.getElementById('couponPeroid_start');
		var couponPeroidEnd = document.getElementById('couponPeroid_end');

		if(couponPeroidStart.value == "" && couponPeroidEnd.value == "" || couponPeroidStart.value != "" && couponPeroidEnd.value != ""){
			
			if(form.couponName.value == ""){
				alert("쿠폰명을 입력해 주세요.");
				return false;
			}else if(form.couponPay.value == ""){
				alert("할인 금액을 입력해 주세요.");
				return false;
			}else if(Type == "normal"){
				if(form.couponPay.value < 0){
					alert("양수로 입력해 주세요.");
					return false;
				}else{
				form.submit();
			}
			}else if(Type == "percent"){
				if(form.couponPay.value > 100){
					alert("퍼센트는 100보다 작게 입력해야 합니다.");
					return false;
				}else{
				form.submit();
				}
			}
		}else {
			alert("시작일과 종료일중 하나만 입력 하실수 없습니다.");
            return false;
		}

		
	}

</script>