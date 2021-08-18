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
				<form
					action="${contextPath }/couponList/couponUpdate.do?couponId=${couponInf.couponId }"
					name="couponAdd" method="POST">
					<div class="row border-bottom py-2">
						<div class="col p-0">
							<div class="d-flex bd-highlight">
								<label for="inputUseYN" class="bd-highlight col-form-label pl-2"
									style="width: 140px;">사용여부</label>
								<div class="d-flex flex-row bd-highlight pr-2">
									<div class="custom-control custom-switch pt-2">
										<c:choose>
											<c:when test="${couponInf.useYN == 'Y' }">
												<input type="checkbox" class="custom-control-input YNChk"
													id="inputUseYN" value="Y" checked>
												<input id="useYN_V" class="input_V" type="text" name="useYN"
													value="Y" style="display: none;">
												<label id="inputUseYNLabel" class="custom-control-label"
													for="inputUseYN" style="width: 70px;">활성화</label>
											</c:when>
											<c:when test="${couponInf.useYN == 'N' }">
												<input type="checkbox" class="custom-control-input YNChk"
													id="inputUseYN" value="N">
												<input id="useYN_V" class="input_V" type="text" name="useYN"
													value="N" style="display: none;">
												<label id="inputUseYNLabel" class="custom-control-label"
													for="inputUseYN" style="width: 70px;">비활성화</label>
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
								<label for="inputMasterYN"
									class="bd-highlight col-form-label pl-2" style="width: 140px;">쿠폰
									사용기간</label>
								<div class="d-flex flex-row bd-highlight pr-2">
									<c:choose>
										<c:when
											test="${couponInf.couponPeriod_start != '' && couponInf.couponPeriod_end != '' }">
											<input id="couponPeriod_start" class="mr-2 form-control"
												type='date' value='${couponInf.couponPeriod_start }'
												style="width: 170px;" />
											<input id="couponPeriod_start_V" type='text'
												name='couponPeriod_start'
												value='${couponInf.couponPeriod_start }'
												style="display: none" />
											 ~
											<input id="couponPeriod_end" class="ml-2 form-control"
												type='date' value='${couponInf.couponPeriod_end }'
												style="width: 170px;" />
											<input id="couponPeriod_end_V" type='text'
												name='couponPeriod_end'
												value='${couponInf.couponPeriod_end }' style="display: none" />
										</c:when>
										<c:otherwise>
											<input id="couponPeriod_start" class="mr-2 form-control"
												type='date' value='' style="width: 170px;" />
											<input id="couponPeriod_start_V" type='text'
												name='couponPeriod_start' value='0000-00-00'
												style="display: none" />
											 ~
											<input id="couponPeriod_end" class="ml-2 form-control"
												type='date' value='' style="width: 170px;" />
											<input id="couponPeriod_end_V" type='text'
												name='couponPeriod_end' value='0000-00-00'
												style="display: none" />
										</c:otherwise>
									</c:choose>
									<button id="" type="button"
										class="btn btn-outline-primary ml-2" onclick="btn_resset()"
										style="width: 80px;">초기화</button>
								</div>
							</div>
						</div>
					</div>
					<div class="row border-bottom py-2">
						<div class="col p-0">
							<div class="d-flex bd-highlight">
								<label for="inputCouponName"
									class="bd-highlight col-form-label pl-2" style="width: 140px;"><img
									src="${contextPath }/resources/img/require.png">쿠폰명</label>
								<div class="d-flex flex-row bd-highlight pr-2" style="width: 463px;">
									<input type="text" class="form-control" id="inputCouponName"
										name="couponName" value="${couponInf.couponName }">
								</div>
							</div>
						</div>
					</div>
					<div class="row border-bottom py-2">
						<div class="col p-0">
							<div class="d-flex bd-highlight">
								<label for="inputCouponContent"
									class="bd-highlight col-form-label pl-2" style="width: 140px;">쿠폰혜택</label>
								<div class="d-flex flex-row bd-highlight pr-2" style="width: 463px;">
									<input type="text" class="form-control" id="inputCouponContent"
										name="couponContent" value="${couponInf.couponContent }">
								</div>
							</div>
						</div>
					</div>
					<div class="row border-bottom py-2">
						<div class="col p-0">
							<div class="d-flex bd-highlight">
								<label for="inputCouponPay"
									class="bd-highlight col-form-label pl-2" style="width: 140px;"><img
									src="${contextPath }/resources/img/require.png">쿠폰 할인금액</label>
								<div class="d-flex flex-row bd-highlight pr-2">
									<c:choose>
										<c:when test="${couponInf.discountType == 'normal'}">
											<select id="inputState" class="form-control mr-2"
												name="discountType" style="width: 98px;">
												<option value="normal" selected>가격</option>
												<option value="percent">퍼센트</option>
											</select>
											<input type="number" class="form-control" id="inputCouponPay"
												name="couponPay" min="0" max=""
												value="${couponInf.couponPay }" style="width: 120px">
											<span style="padding: 6px">원</span>
										</c:when>
										<c:otherwise>
											<select id="inputState" class="form-control mr-2"
												name="discountType" style="width: 98px;">
												<option value="normal">가격</option>
												<option value="percent" selected>퍼센트</option>
											</select>
											<input type="number" class="form-control" id="inputCouponPay"
												name="couponPay" min="0" max=""
												value="${couponInf.couponPay }" style="width: 120px">
											<span style="padding: 6px">%</span>
										</c:otherwise>
									</c:choose>

								</div>
							</div>
						</div>
					</div>

					<!-- Button trigger modal -->
					<div class="row justify-content-between my-3">
						<div class="">
							<a class=""
								href="${contextPath }/couponList.do${pageMaker.makeQueryPage(bList.IDX, pageMaker.cri.page) }">
								<button type="button" class="btn btn-secondary">목록</button>
							</a>
						</div>
						<div class="text-center d-flex justify-content-end">
							<a href="#" onclick="productDelete()">
								<button type="button" class="btn btn-outline-danger">삭제
								</button>
							</a>

							<button type="submit" class="btn btn-success ml-3"
								onclick="return checkEdit()">수정</button>
						</div>
					</div>
				</form>
			</div>
		</div>

		<!-- 회원 관련 리스트 -->
		<div class="row mb-5">
			<div class="col-5 p-0 pr-2">
				<div class="d-flex justify-content-between mb-2">
					<div class="bd-highlight">
						<h6 class="font-weight-bold ml-2 mt-2 mb-0">회원리스트</h6>
					</div>
					<div class="bd-highlight btn-group btn-group-toggle " data-toggle="buttons" onclick="orderByGroup()">
						<label class="btn btn-outline-secondary" >
							<input type="radio" name="options" value="All" checked/>All
						</label> 
						<label class="btn btn-outline-secondary"> 
							<input type="radio" name="options" value="new"/>new
						</label> 
						<label class="btn btn-outline-secondary"> 
							<input type="radio" name="options" value="general"/>general
						</label> 
						<label class="btn btn-outline-secondary"> 
							<input type="radio" name="options" value="vip"/>vip
						</label>
					</div>
				</div>
				<div class="border-bottom" style="height: 470px; overflow: auto;">
					<table class="table table-hover m-0">
						<thead class=" border-bottom border-top bg-light">
							<tr>
								<th
									class="text-center border-bottom-0 align-middle border-top-0 px-1"
									style="width: 36px"><input type='checkbox'
									name='selectall1' value='selectall'
									onclick='selectAll(this, "terms1")' /></th>
								<th
									class="text-center border-bottom-0 align-middle border-top-0 px-1"
									style="width: 100px">이름</th>
								<th class="text-center border-bottom-0 border-top-0 px-2"
									style="width: auto">아이디</th>
								<th class="text-center border-bottom-0 border-top-0 px-2"
									style="width: 100px">등급</th>

							</tr>
						</thead>
						<tbody class="border-bottom" id="memberList">
							<c:forEach items="${memberList}" var="list">
								<c:if test="${list.hasCoupon == null }">
									<tr id="${list.id }">
										<td class="text-center align-middle align-middle px-1">
											<div>
												<input class="terms1" type='checkbox' name='terms1'
													onclick='checkSelectAll("selectall1", "terms1")' />
											</div>
										</td>
										<td class="text-center align-middle align-middle px-1">
											${list.name }</td>
										<td
											class="text-center align-middle align-middle px-1 terms1_userId">
											${list.id }</td>
										<td class="text-center align-middle align-middle px-1">
											${list.grade }</td>
									</tr>
								</c:if>

							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
			<div class="col-1 d-flex align-items-center">
				<div class="d-flex flex-column">
					<button type="button" class="btn btn-outline-secondary mb-2"
						name='useYN' value='Y' onclick="fn_couponYN('terms1')"
						style="font-size: .8rem">발급▶</button>
					<button type="button" class="btn btn-outline-secondary"
						name='useYN' value='N' onclick="fn_couponYN('terms2')"
						style="font-size: .8rem">◀회수</button>
				</div>

			</div>
			<div class="col-6 p-0 pl-2">
				<div class="d-flex justify-content-between mb-2">
					<div class="bd-highlight">
						<h6 class="font-weight-bold ml-2 mt-2 mb-0">쿠폰 보유 회원</h6>
					</div>
					<div class="bd-highlight" style="height: 38px"></div>
				</div>
				<div class="border-bottom" style="height: 470px; overflow: auto;">
					<table class="table table-hover m-0">
						<thead class=" border-bottom border-top bg-light">
							<tr>
								<th
									class="text-center border-bottom-0 align-middle border-top-0 px-1"
									style="width: 36px"><input type='checkbox'
									name='selectall2' value='selectall'
									onclick='selectAll(this, "terms2")' /></th>
								<th
									class="text-center border-bottom-0 align-middle border-top-0 px-1"
									style="width: 100px">이름</th>
								<th class="text-center border-bottom-0 border-top-0 px-2"
									style="width: auto">아이디</th>
								<th class="text-center border-bottom-0 border-top-0 px-2"
									style="width: 100px">등급</th>
								<th class="text-center border-bottom-0 border-top-0 px-2"
									style="width: 150px">사용일</th>
							</tr>
						</thead>
						<tbody class="border-bottom" id="hasCouponList">
							<c:forEach items="${hasCoupon}" var="list">
								<tr id="${list.id }">
									<td class="text-center align-middle align-middle px-1">
										<div>
											<input class="terms2" type='checkbox' name='terms2'
												onclick='checkSelectAll("selectall2", "terms2")' />
										</div>
									</td>
									<td class="text-center align-middle align-middle px-1">
										${list.name }</td>
									<td
										class="text-center align-middle align-middle px-1 terms2_userId">
										${list.id }</td>
									<td class="text-center align-middle align-middle px-1">
										${list.grade }</td>
									<td class="text-center align-middle align-middle px-1"
										style="font-size: .8rem">${list.couponUseDate }</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
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
	
	//초를 Date로 변환
	function addZero(data){
	    return (data<10) ? "0"+data : data;
	}
	function getTimestampToDate(timestamp){
	    var date = new Date(timestamp);
	    var chgTimestamp = date.getFullYear().toString()+"-"
	        +addZero(date.getMonth()+1)+"-"
	        +addZero(date.getDate().toString())+" "
	        +addZero(date.getHours().toString())+":"
	        +addZero(date.getMinutes().toString())+":"
	        +addZero(date.getSeconds().toString())+".0";
	    return chgTimestamp;
	}
	
	function orderByGroup() {

		var gradeList = document.getElementsByName('options');
		var grade;

		for(var i=0; i<gradeList.length; i++){
			
			if(gradeList[i].checked == true){
				grade = gradeList[i].value;
			}
		}

		var couponId = "${couponInf.couponId }";
		
		$.ajax({
			type: "POST",
			async: true,
			url: "${contextPath}/couponList/orderByGrade.do",
			dataType: "json",
			data: {
				couponId: couponId,
				grade: grade
			},
			success: function (list) {
				var memberList="";
				for(var i=0; i< list["memberList"].length; i++){
					
					if(list["memberList"][i]["hasCoupon"] == null){
							memberList += '<tr id="' + list["memberList"][i]['id'] +'" >';
							memberList += '<td class="text-center align-middle align-middle px-1">';
							memberList += '<div><input class="terms1" type="checkbox" name="terms1" onclick="checkSelectAll(\'selectall1\', \'terms1\')" /></div>';
							memberList += '</td>';
							memberList += '<td class="text-center align-middle align-middle px-1">' + list["memberList"][i]['name'] +'</td>';
							memberList += '<td class="text-center align-middle align-middle px-1 terms1_userId">' + list["memberList"][i]['id'] +'</td>';
							memberList += '<td class="text-center align-middle align-middle px-1">' + list["memberList"][i]['grade'] +'</td>';
							memberList += '</tr>';
						}
					document.getElementById('memberList').innerHTML = memberList;
				}
			},
			error: function (data, textStatus) {
			},
			complete: function (data, textStatus) {
			}
		})
	}
	 
	// 쿠폰 발급&회수
	function fn_couponYN(terms) {
			var termsList = document.getElementsByClassName(terms);
			var userId = document.getElementsByClassName(terms+'_userId');
			var chk_arr=[];
			for(var i=0; i<termsList.length; i++){
				if(termsList[i].checked){
					chk_arr.push(userId[i].innerText);
				}
			}
			var couponId = "${couponInf.couponId }";
			
			var hasCouponYN;
			if(terms == "terms1"){
				hasCouponYN = "Y";
			}else if(terms == "terms2"){
				hasCouponYN = "N";
			}
			$.ajax({
				type: "POST",
				async: true,
				url: "${contextPath }/couponList/hasCouponYN.do",
				dataType: "json",
				data: {
					couponId: couponId,
					value: hasCouponYN,
					userId: chk_arr
				},
				success: function (list) {
					var memberList="";
					for(var i=0; i< list["memberList"].length; i++){
						
						if(list["memberList"][i]["hasCoupon"] == null){
							memberList += '<tr id="' + list["memberList"][i]['id'] +'" >';
							memberList += '<td class="text-center align-middle align-middle px-1">';
							memberList += '<div><input class="terms1" type="checkbox" name="terms1" onclick="checkSelectAll(\'selectall1\', \'terms1\')" /></div>';
							memberList += '</td>';
							memberList += '<td class="text-center align-middle align-middle px-1">' + list["memberList"][i]['name'] +'</td>';
							memberList += '<td class="text-center align-middle align-middle px-1 terms1_userId">' + list["memberList"][i]['id'] +'</td>';
							memberList += '<td class="text-center align-middle align-middle px-1">' + list["memberList"][i]['grade'] +'</td>';
							memberList += '</tr>';
						}
					}
					document.getElementById('memberList').innerHTML = memberList;
					var hasCouponList = "";
					for (var i = 0; i < list["hasCoupon"].length; i++) {
						
						var useDate = getTimestampToDate(list["hasCoupon"][i]['couponUseDate']);
						hasCouponList +='<tr id="' + list["hasCoupon"][i]['id'] +'" class="">';
						hasCouponList +='<td class="text-center align-middle align-middle px-1">';
						hasCouponList +='<div><input class="terms2" type="checkbox" name="terms2" onclick="checkSelectAll(\'selectall2\', \'terms2\')" /></div>';
						hasCouponList +='</td>';
						hasCouponList +='<td class="text-center align-middle align-middle px-1">' + list["hasCoupon"][i]['name'] +'</td>';
						hasCouponList +='<td class="text-center align-middle align-middle px-1 terms2_userId">' + list["hasCoupon"][i]['id'] +'</td>';
						hasCouponList +='<td class="text-center align-middle align-middle px-1">' + list["hasCoupon"][i]['grade'] +'</td>';
						if(list["hasCoupon"][i]['couponUseDate'] != undefined ){
							hasCouponList += '<td class="text-center align-middle align-middle px-1" style="font-size: .8rem">' + useDate + '</td>';
						}else{
							hasCouponList += '<td class="text-center align-middle align-middle px-1" style="font-size: .8rem"></td>';
						}
						
						hasCouponList +='</tr>';
					}
					document.getElementById('hasCouponList').innerHTML = hasCouponList;
					document.getElementsByName('selectall1')[0].checked = false;
					document.getElementsByName('selectall2')[0].checked = false;
				},
				error: function (data, textStatus) {
				},
				complete: function (data, textStatus) {
				}
			});
		}
	//전체 선택 "selectall1", "terms1"
	function checkSelectAll(selectall, terms) {
		// 전체 체크박스
		const checkboxes
			= document.querySelectorAll('input[name='+terms+']');
		// 선택된 체크박스
		const checked
			= document.querySelectorAll('input[name='+terms+']:checked');
		// select all 체크박스
		const selectAll
			= document.querySelector('input[name='+selectall+']');
		if (checkboxes.length === checked.length) {
			selectAll.checked = true;
		} else {
			selectAll.checked = false;
		}
	}
	function selectAll(selectAll, terms) {
		const checkboxes
			= document.getElementsByName(terms);
		checkboxes.forEach((checkbox) => {
			checkbox.checked = selectAll.checked
		})
	}
</script>