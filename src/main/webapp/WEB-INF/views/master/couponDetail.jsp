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
				<h4 class="page_title">쿠폰상세</h4>
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
				<form action="${contextPath }/couponList/couponUpdate.do?couponId=${couponInf.couponId }" name="couponAdd" method="POST">
				<div class="row border-bottom py-2">
							<div class="col p-0">
								<div class="d-flex bd-highlight">
									<label for="inputUseYN" class="bd-highlight col-form-label pl-2" style="width: 140px;">사용여부</label>
									<div class="d-flex flex-row bd-highlight pr-2">
										<div class="custom-control custom-switch pt-2">
											<c:choose>
												<c:when test="${couponInf.useYN == 'Y' }">
													<input type="checkbox" class="custom-control-input YNChk" id="inputUseYN" value="Y" checked>
													<input id="useYN_V" class="input_V" type="text" name="useYN" value="Y" style="display: none;">
													<label id="inputUseYNLabel" class="custom-control-label" for="inputUseYN" style="width: 70px;">활성화</label>
												</c:when>
												<c:when test="${couponInf.useYN == 'N' }">
													<input type="checkbox" class="custom-control-input YNChk" id="inputUseYN" value="N">
													<input id="useYN_V" class="input_V" type="text" name="useYN" value="N" style="display: none;">
													<label id="inputUseYNLabel" class="custom-control-label" for="inputUseYN" style="width: 70px;">비활성화</label>
												</c:when>
											</c:choose>
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
									<c:choose>
										<c:when test="${couponInf.couponPeriod_start != '' && couponInf.couponPeriod_end != '' }">
											<input id="couponPeriod_start" class="mr-2 form-control" type='date' value='${couponInf.couponPeriod_start }'  style="width: 170px;"/>
											<input id="couponPeriod_start_V" type='text' name='couponPeriod_start' value='${couponInf.couponPeriod_start }' style="display:none"/>
											 ~
											<input id="couponPeriod_end" class="ml-2 form-control"  type='date' value='${couponInf.couponPeriod_end }'  style="width: 170px;"/>
											<input id="couponPeriod_end_V" type='text' name='couponPeriod_end' value='${couponInf.couponPeriod_end }' style="display:none"/>
										</c:when>
										<c:otherwise>
											<input id="couponPeriod_start" class="mr-2 form-control" type='date' value=''  style="width: 170px;"/>
											<input id="couponPeriod_start_V" type='text' name='couponPeriod_start' value='0000-00-00' style="display:none"/>
											 ~
											<input id="couponPeriod_end" class="ml-2 form-control"  type='date' value=''  style="width: 170px;"/>
											<input id="couponPeriod_end_V" type='text' name='couponPeriod_end' value='0000-00-00' style="display:none"/>
										</c:otherwise>
									</c:choose>
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
									<input type="text" class="form-control" id="inputCouponName" name="couponName" value="${couponInf.couponName }">
								</div>
							</div>
						</div>
					</div>
					<div class="row border-bottom py-2">
						<div class="col p-0">
							<div class="d-flex bd-highlight">
								<label for="inputCouponContent" class="bd-highlight col-form-label pl-2" style="width: 140px;">쿠폰혜택</label>
								<div class="d-flex flex-row bd-highlight pr-2">
									<input type="text" class="form-control" id="inputCouponContent" name="couponContent" value="${couponInf.couponContent }">
								</div>
							</div>
						</div>
					</div>
					<div class="row border-bottom py-2">
						<div class="col p-0">
							<div class="d-flex bd-highlight">
								<label for="inputCouponPay" class="bd-highlight col-form-label pl-2" style="width: 140px;"><img src="${contextPath }/resources/img/require.png">쿠폰 할인금액</label>
								<div class="d-flex flex-row bd-highlight pr-2">
									<c:choose>
										<c:when test="${couponInf.discountType == 'normal'}">
											<select id="inputState" class="form-control mr-2" name="discountType" style="width: 98px;">
												<option value="normal" selected>가격</option>
												<option value="percent" >퍼센트</option>
											</select>
											<input type="number" class="form-control" id="inputCouponPay" name="couponPay" min="0" max="" value="${couponInf.couponPay }" style="width:120px">
											<span style="padding:6px">원</span>
										</c:when>
										<c:otherwise>
											<select id="inputState" class="form-control mr-2" name="discountType" style="width: 98px;">
												<option value="normal" >가격</option>
												<option value="percent" selected>퍼센트</option>
											</select>
											<input type="number" class="form-control" id="inputCouponPay" name="couponPay" min="0" max="" value="${couponInf.couponPay }" style="width:120px">
											<span style="padding:6px">%</span>
										</c:otherwise>
									</c:choose>
									
								</div>
							</div>
						</div>
					</div>
					 
					<!-- Button trigger modal -->
					<div class="row justify-content-between my-3">
						<div class="">
					    	<a class="" href="${contextPath }/couponList.do${pageMaker.makeQueryPage(bList.IDX, pageMaker.cri.page) }">
					        	<button type="button" class="btn btn-secondary">목록</button>
					        	</a>	
						</div>
						<div class="text-center d-flex justify-content-end">
					    	<a href="#" onclick="productDelete()">
					    		<button type="button" class="btn bg-danger text-white" >삭제 </button>
					        </a>
					   	
					        	<button type="submit" class="btn btn-success ml-3" onclick="return checkEdit()">수정</button>
						</div>
					</div>
				</form>
			</div>
		</div>

		<!-- 회원 관련 리스트 -->
		<div class="row mb-5">
			<div class="col-6 p-0 pr-2">
				<div class="row">
					<div class="col">
						<h6 class="font-weight-bold">회원리스트</h6>
					</div>
				</div>
				<table class="table table-hover m-0">
					<thead class=" border-bottom border-top bg-light">
						<tr>
							<th class="text-center border-bottom-0 align-middle border-top-0 px-1" style="width: 36px"></th>
							<th class="text-center border-bottom-0 align-middle border-top-0 px-1" style="width: 170px">이름</th>
							<th class="text-center border-bottom-0 border-top-0 px-2" style="width: auto">아이디</th>
							<th class="text-center border-bottom-0 border-top-0 px-2" style="width: 156px">가입일</th>
						</tr>
					</thead>
					<tbody class="border-bottom" id="memberList">
						<c:forEach items="${memberList }" var="list">
							<tr id="${list.id }" class="">
								<td class="text-center align-middle align-middle px-1">
									<c:choose>
										<c:when test="${list.hasCoupon == 'Y' }">
											<div>
												<input class="checkbox" type='checkbox' name='useYN' value='Y' onclick="fn_couponYN()" checked />
											</div>
										</c:when>
										<c:otherwise>
											<div>
												<input class="checkbox" type='checkbox' name='useYN' value='N' onclick="fn_couponYN()" />
											</div>
										</c:otherwise>
									</c:choose>
									
								</td>
								<td class="text-center align-middle align-middle px-1">
									${list.name }
								</td>
								<td class="text-center align-middle align-middle px-1">
									${list.id }
								</td>
								<td class="text-center align-middle align-middle px-1" style="font-size: .8rem">
									${list.joinDate }
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>

			<div class="col-6 p-0 pl-2">
				<div class="row">
					<div class="col">
						<h6 class="font-weight-bold">쿠폰 보유 회원</h6>
					</div>
				</div>
				<table class="table table-hover m-0">
					<thead class=" border-bottom border-top bg-light">
						<tr>
							<th class="text-center border-bottom-0 align-middle border-top-0 px-1" style="width: 36px"></th>
							<th class="text-center border-bottom-0 align-middle border-top-0 px-1" style="width: 170px">이름</th>
							<th class="text-center border-bottom-0 border-top-0 px-2" style="width: auto">아이디</th>
							<th class="text-center border-bottom-0 border-top-0 px-2" style="width: 156px">사용일</th>
						</tr>
					</thead>
					<tbody class="border-bottom" id="hasCouponList">
						<c:forEach items="${hasCoupon }" var="list">
							<tr id="${list.id }" class="">
								<td class="text-center align-middle align-middle px-1">
									<div>
										<input class="checkbox" type='checkbox' name='useYN' value='Y' onclick="fn_couponYN()" checked />
									</div>
								</td>
								<td class="text-center align-middle align-middle px-1">
									${list.name }
								</td>
								<td class="text-center align-middle align-middle px-1">
									${list.id }
								</td>
								<td class="text-center align-middle align-middle px-1" style="font-size: .8rem">
									${list.couponUseDate }
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
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
	inputValueChk('couponPeriod_start');
	inputValueChk('couponPeriod_end');

	//날짜 입력값 비우기
	function btn_resset(){
		document.getElementById('couponPeriod_start').value = '';
		document.getElementById('couponPeriod_start_V').value = '0000-00-00';
		document.getElementById('couponPeriod_end').value = '';
		document.getElementById('couponPeriod_end_V').value = '0000-00-00';
	}

	function productDelete(){
		if(confirm("정말 삭제 하시겠습니까?") == true){
			//location.href = "${contextPath }/couponList/couponDelete_M.do${pageMaker.makeQueryPage(bList.IDX, pageMaker.cri.page) }&productId=${ProductVO.productId }";
			return true;
		}else {
			return false;
		}
	}
	
	function checkEdit(){
		if(confirm("입력한 내용으로 수정 하시겠습니까?") == true){
			
			var form = document.couponAdd;
			var Type = inputState.value;

			var couponPeriodStart = document.getElementById('couponPeriod_start');
			var couponPeriodEnd = document.getElementById('couponPeriod_end');

			if(couponPeriodStart.value == "" && couponPeriodEnd.value == "" || couponPeriodStart.value != "" && couponPeriodEnd.value != ""){
				
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
	
		}else {
			return false;
		}
	}

	function fn_couponYN() {
			var userId = event.currentTarget.parentNode.parentNode.parentNode.id;
			var useYNChk = event.currentTarget.value;
			var couponId = "${couponInf.couponId }";
			
			var useYNChk_V;

			if (useYNChk == 'Y') {
				useYNChk_V = 'N';
			} else {
				useYNChk_V = 'Y';
			}
			$.ajax({
				type: "POST",
				async: true,
				url: "${contextPath }/couponList/hasCouponYN.do",
				dataType: "json",
				data: {
					couponId: couponId,
					value: useYNChk_V,
					userId: userId
				},
				success: function (list) {

					var memberList="";

					for(var i=0; i< list["memberList"].length; i++){

						memberList += '<tr id="' + list["memberList"][i]['id'] +'" class="">';
						memberList += '	<td class="text-center align-middle align-middle px-1">';
						
						if(list["memberList"][i]["hasCoupon"] == 'Y'){
						memberList += '<div><input class="checkbox" type="checkbox" name="useYN" value="Y" onclick="fn_couponYN()" checked /></div>';
						}else {
						memberList += '<div><input class="checkbox" type="checkbox" name="useYN" value="N" onclick="fn_couponYN()" /></div>';
						}

						memberList += '</td>';
						memberList += '<td class="text-center align-middle align-middle px-1">' + list["memberList"][i]['name'] +'</td>';
						memberList += '<td class="text-center align-middle align-middle px-1">' + list["memberList"][i]['id'] +'</td>';
						memberList += '	<td class="text-center align-middle align-middle px-1" style="font-size: .8rem">' + list["memberList"][i]['joinDate'] +'</td>';
						memberList += '</tr>';

					}
					document.getElementById('memberList').innerHTML = memberList;

					var hasCouponList = "";

					for (var i = 0; i < list["hasCoupon"].length; i++) {

						hasCouponList +='<tr id="' + list["hasCoupon"][i]['id'] +'" class="">';
						hasCouponList +='<td class="text-center align-middle align-middle px-1">';
						hasCouponList +='<div><input class="checkbox" type="checkbox" name="useYN" value="Y" onclick="fn_couponYN()" checked /></div>';
						hasCouponList +='</td>';
						hasCouponList +='<td class="text-center align-middle align-middle px-1">' + list["hasCoupon"][i]['name'] +'</td>';
						hasCouponList +='<td class="text-center align-middle align-middle px-1">' + list["hasCoupon"][i]['id'] +'</td>';

						if(list["hasCoupon"][i]['couponUseDate'] != undefined ){
							hasCouponList += '<td class="text-center align-middle align-middle px-1" style="font-size: .8rem">' + list["hasCoupon"][i]['couponUseDate'] + '</td>';
						}else{
							hasCouponList += '<td class="text-center align-middle align-middle px-1" style="font-size: .8rem"></td>';
						}
						
						hasCouponList +='</tr>';
					}

					document.getElementById('hasCouponList').innerHTML = hasCouponList;
				},
				error: function (data, textStatus) {

				},
				complete: function (data, textStatus) {

				}
			});
		}

</script>