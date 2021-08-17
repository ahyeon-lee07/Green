<!-- 상진10 -->
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
				<h4 class="page_title">구매 내역 상세</h4>
			</div>
			<div class="bd-highlight page_subtitle">
				<nav aria-label="breadcrumb">
					<ol class="breadcrumb p-0 bg bg-transparent">
						<li class="breadcrumb-item"><a href="${contextPath }/main.do">홈</a></li>
						<li class="breadcrumb-item"><a
							href="${contextPath }/myPage/purchaseList.do">구매 내역 조회</a></li>
						<li class="breadcrumb-item active" aria-current="page">구매 내역
							상세</li>
					</ol>
				</nav>
			</div>
		</div>
 		${orderDetail.prod}
		<div class="row mt-1" style="padding: 0 15px">
			<div class="col">
				<div class="row">
					<div class="col-2 border">
						<div class="row text-center p-2 border-bottom bg-light">
							<div class="col">주문 번호</div>
						</div>
						<div class="row text-center p-2 bg-light">
							<div class="col">구매 날짜</div>
						</div>
					</div>
					<div class="col-10 border border-left-0">
						<div class="row text-center font-weight-bold p-2 border-bottom">
							<div class="col">${orderDetail.orderInfo.orderNum}</div>
						</div>
						<div class="row text-center p-2">
							<div class="col">${orderDetail.orderInfo.orderDate}</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="row mt-5">
			<div class="col">
				<h6 class="font-weight-bold">구매 상품 정보</h6>
			</div>
		</div>
		<table class="table table-hover m-0 border-top">
			<thead class=" border-bottom-0 bg-light">
				<tr>
					<th class="text-center border-bottom-0 border-top-0 px-2"
						style="width: 80px">이미지</th>
					<th class="text-center border-bottom-0 border-top-0 px-2"
						style="width: 200px">상품명 / 옵션</th>
					<th class="text-center border-bottom-0 border-top-0 px-2"
						style="width: 10px">수량</th>
					<th class="text-center border-bottom-0 border-top-0 px-2"
						style="width: 80px">구매금액</th>
					<th class="text-center border-bottom-0 border-top-0 px-2"
						style="width: 30px">적립금</th>
					<th class="text-center border-bottom-0 border-top-0 px-2"
						style="width: 30px">기타</th>
				</tr>
			</thead>
			<tbody class="border-bottom">
				<c:forEach var="orderDetail" items="${orderDetail}">
					<tr>
						<td class="text-center align-middle px-5">
							<img
							src="${contextPath}/resources/img/${orderDetail.prod.p_group}/${orderDetail.prod.imgURL}"
							class="img-thumbnail" alt="상품">
							<!-- <img
							src=""
							class="img-thumbnail" alt="상품"> -->
						</td>
						<td class="align-middle flex-column">
							<div class="font-weight-bold pb-1 bd-highlight">${orderDetail.prod.productName}</div>
							<!-- 상품 옵션 -->
							<div class="bd-highlight">${orderDetail.prod.p_option}</div>
						</td>
						<td class="text-center align-middle px-2">${orderDetail.orderInfo.s_stock}</td>
						<td class="text-center align-middle px-2">${orderDetail.prod.price}원</td>
						<td class="text-center align-middle px-2">${orderDetail.prod.productMileage}</td>
						<td class="text-center align-middle px-2"><a class=""
							href="${contextPath }/addNewReview.do">
								<button type="button" class="btn btn-outline-success btn-sm">리뷰</button>
						</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

		<div class="row mt-5">
			<div class="col">
				<h6 class="font-weight-bold">배송지 정보</h6>
			</div>
		</div>
		<div class="row mt-1" style="padding: 0 15px">
			<div class="col">
				<div class="row">
					<div class="col-2 border">
						<div class="row text-center p-2 border-bottom bg-light">
							<div class="col">수령인</div>
						</div>
						<div class="row text-center p-2 border-bottom bg-light">
							<div class="col">연락처</div>
						</div>
						<div class="row text-center p-2 border-bottom bg-light">
							<div class="col">배송지</div>
						</div>
						<div class="row text-center p-2 bg-light">
							<div class="col">배송 메모</div>
						</div>
					</div>
					<div class="col-10 border border-left-0">
						<div class="row text-center p-2 border-bottom">
							<div class="col">사용자</div>
						</div>
						<div class="row text-center p-2 border-bottom">
							<div class="col">010-1234-5678</div>
						</div>
						<div class="row text-center p-2 border-bottom">
							<div class="col">대전 서구 대덕대로 182</div>
						</div>
						<div class="row text-center p-2">
							<div class="col">문 앞에 놓아주세요.</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="row mt-5" style="height: 5px;">
			<div class="col">
				<h6 class="font-weight-bold">구매 금액</h6>
			</div>
		</div>
		<div class="row my-4" style="padding: 0 15px">
			<div class="col">
				<div class="row">
					<div class="col-2 border">
						<div class="row text-center bg-light p-3 border-bottom">
							<div class="col">총 상품금액</div>
						</div>
						<div class="row text-center font-weight-bold p-4">
							<div class="col">
								<span class="totalBoxPrice"></span> 20,000 원
							</div>
						</div>
					</div>
					<div class="col-3 border border-left-0">
						<div class="row text-center bg-light p-3 border-bottom">
							<div class="col ">총 배송비</div>
						</div>
						<div class="row text-center font-weight-bold p-4">
							<div class="col">
								+ <span class="totalBoxShip"></span> 2,500 원
							</div>
						</div>
					</div>
					<div class="col-3 border border-left-0">
						<div class="row text-center bg-light p-3 border-bottom">
							<div class="col">총 할인금액</div>
						</div>
						<div class="row text-center font-weight-bold p-4">
							<div class="col">
								- <span class="totalBoxDiscount"></span> 0 원
							</div>
						</div>
					</div>
					<div class="col-4 border border-left-0">
						<div class="row text-center bg-light p-3 border-bottom">
							<div class="col">결제 금액</div>
						</div>
						<div class="row text-center font-weight-bold p-4">
							<div class="col">
								= <span class="duePayment"></span> 22,500 원
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="row mt-5">
			<div class="col">
				<h6 class="font-weight-bold">결제 내용 및 적립금</h6>
			</div>
		</div>
		<table class="table table-hover m-0 border-top">
			<thead class=" border-bottom-0 bg-light">
				<tr>
					<th class="text-center border-bottom-0 border-top-0 px-2"
						style="width: auto">결제 수단</th>
					<th class="text-center border-bottom-0 border-top-0 px-2"
						style="width: auto">쿠폰 및 적립금 사용</th>
					<th class="text-center border-bottom-0 border-top-0 px-2"
						style="width: auto">구매 적립금</th>
				</tr>
			</thead>
			<tbody class="border-bottom">
				<tr>
					<td class="text-center align-middle px-2">
						신한(1234-****-****-****) 일시불</td>
					<td class="text-center align-middle px-2"></td>
					<td class="text-center align-middle px-2">200</td>
				</tr>
			</tbody>
		</table>

		<div class="row mt-4 mb-5">
			<div class="col-12">
				<div class="justify-content-between">
					<div class="bd-highlight mr-3" style='float: right;'>
						<button type="button" class="btn btn-outline-danger mr-2">주문
							취소</button>
						<button type="button" class="btn btn-secondary">상품 교환</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</main>