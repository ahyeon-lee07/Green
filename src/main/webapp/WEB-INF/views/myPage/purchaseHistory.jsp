<!--희원10-->
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
				<h4 class="page_title">구매내역 조회</h4>
			</div>
			<div class="bd-highlight page_subtitle">
				<nav aria-label="breadcrumb">
					<ol class="breadcrumb p-0 bg bg-transparent">
						<li class="breadcrumb-item"><a href="${contextPath }/main.do">홈</a></li>
						<li class="breadcrumb-item active" aria-current="page">구매내역
							조회</li>
					</ol>
				</nav>
			</div>
		</div>

		<!-- 필터영역 ${contextPath }/productList.do -->
		<form action="" method="GET" name="purchaseHistory" class="">
			<div class="d-flex justify-content-between mt-2">
				<div class="d-flex flex-row bd-highlight">
					<div class="bd-highlight mr-2">
						<select id="orderStatus" class="form-control"
							style="width: 150px;" name="email2">
							<option value="" selected>주문처리 상태</option>
							<option value="1">입금전</option>
							<option value="2">상품 준비중</option>
							<option value="3">배송 중</option>
							<option value="4">배송 완료</option>
						</select>
					</div>
					<div class="bd-highlight btn-group btn-group-toggle mb-2"
						data-toggle="buttons" onclick="listFilter()">
						<label class="btn btn-outline-secondary active"> <input
							type="radio" name="options" value="today" checked> 오늘
						</label> <label class="btn btn-outline-secondary"> <input
							type="radio" name="options" value="week"> 일주일
						</label> <label class="btn btn-outline-secondary"> <input
							type="radio" name="options" value="one-month"> 1개월
						</label> <label class="btn btn-outline-secondary"> <input
							type="radio" name="options" value="three-month"> 3개월
						</label> <label class="btn btn-outline-secondary"> <input
							type="radio" name="options" value="six-month"> 6개월
						</label>
					</div>
				</div>
			</div>
		</form>

		<table class="table table-hover m-0">
			<thead class=" border-bottom border-top bg-light">
				<tr>
					<th
						class="text-center border-bottom-0 align-middle border-top-0 px-1"
						style="width: 150px">주문번호</th>
					<th class="text-center border-bottom-0 border-top-0 px-2"
						style="width: 140px">이미지</th>
					<th class="text-center border-bottom-0 border-top-0 px-2"
						style="width: auto">상태 정보</th>
					<th class="text-center border-bottom-0 border-top-0 px-2"
						style="width: 70px">수량</th>
					<th class="text-center border-bottom-0 border-top-0 px-2"
						style="width: 110px">구매금액</th>
					<th class="text-center border-bottom-0 border-top-0 px-2"
						style="width: 150px">주문처리 상태</th>
					<th class="text-center border-bottom-0 border-top-0 px-2"
						style="width: 160px">취소 / 교환 / 반품</th>
				</tr>
			</thead>
			<tbody class="border-bottom">
				<tr id="${list.couponId }" class="">
					<td class="text-center align-middle align-middle px-1"><a
						href="${contextPath }/purchaseDetails.do">O-2021072220001</a></td>
					<td class="text-center align-middle px-2"><img
						src="${contextPath}/resources/img/${list.p_group }/${list.imgURL }"
						class="img-thumbnail" alt="상품"></td>
					<td class="text-center align-middle align-middle px-1"><a
						href="${contextPath }/purchaseDetails.do">귤곰 케이스 외 2중</a></td>
					<td class="text-center align-middle align-middle px-1"
						style="font-size: .8rem;">1</td>
					<td class="text-center align-middle align-middle px-1"
						style="font-size: .8rem;">10,000원</td>

					<td class="text-center align-middle align-middle px-1"
						style="font-size: .8rem;">배송 준비중</td>
					<td class="text-center align-middle px-2">
						<div class="d-flex justify-content-cente">
							<button type="button" class="btn btn-outline-danger btn-sm"
								style="font-size: 0.7rem; width: 100%; display: block;">
								취소</button>
							<button type="button"
								class="btn btn-outline-secondary btn-sm mx-2"
								style="font-size: 0.7rem; width: 100%; display: block;">
								교환</button>
							<button type="button" class="btn btn-outline-secondary btn-sm"
								style="font-size: 0.7rem; width: 100%; display: block;">
								반품</button>
						</div>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
</main>

<script>
    //필터 버튼 활성화 처리
	// window.onload = function() {
	// 	var filterV = document.getElementById('filterV').innerText;
	// 	var optins = document.getElementsByName('options');

	// 	for (var i = 0; i < optins.length; i++) {
	// 		var optin = optins[i];
	// 		optin.parentNode.setAttribute('class', 'btn btn-outline-secondary');
	// 		if (optin.value == filterV) {
	// 			optin.parentNode.setAttribute('class',
	// 					'btn btn-outline-secondary active');
	// 			optin.checked = true;
	// 		}
	// 	}

	// }

    //날짜 입력값 비우기
	function btn_resset(){
		document.getElementById('couponPeroid_start').value = '';
		document.getElementById('couponPeroid_start_V').value = '0000-00-00';
		document.getElementById('couponPeroid_end').value = '';
		document.getElementById('couponPeroid_end_V').value = '0000-00-00';
	}

</script>