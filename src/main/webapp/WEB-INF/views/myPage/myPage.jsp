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
				<h4 class="page_title">마이페이지</h4>
			</div>
			<div class="bd-highlight page_subtitle">
				<nav aria-label="breadcrumb">
					<ol class="breadcrumb p-0 bg bg-transparent">
						<li class="breadcrumb-item"><a href="${contextPath }/main.do">홈</a></li>
						<li class="breadcrumb-item active" aria-current="page">마이페이지</li>
					</ol>
				</nav>
			</div>
		</div>

		<div class="d-flex justify-content-between bd-highlight mt-2 py-3 border-top">
			<div class="bd-highlight">
				<div class="pt-1">
					환영합니다. <strong>${memberInf.name }</strong> 회원님!
				</div>
			</div>
			<div class="bd-highlight">
				<a href="${contextPath }/memberEditChk.do" class="btn btn-outline-success btn-sm">회원정보 수정</a>
			</div>
		</div>
		<div class="d-flex bd-highlight bg-light" style="font-size: 1.1rem;">
			<div class="p-3 flex-fill flex-column bd-highlight border border-right-0 text-center">
				<div class="bd-highlight font-weight-bold text-black-50">총 주문</div>
				<div class="bd-highlight mt-3"><span>10000</span>원(<span>1</span>회)</div> 
			</div>
			<div class="p-3 flex-fill flex-column bd-highlight border border-right-0 text-center">
				<div class="bd-highlight font-weight-bold text-black-50">가용 적립금</div>
				<div class="d-flex justify-content-center bd-highlight mt-3">
					<div class="bd-highlight">
						<span>${memberInf.mileage }</span>원
					</div>
					<div class="bd-highlight ml-2">
						<a href="#" class="btn btn-outline-success btn-sm">조회</a>
					</div>
				</div>
			</div>
			<div class="p-3 flex-fill flex-column bd-highlight border border-right-0 text-center">
				<div class="bd-highlight font-weight-bold text-black-50">총 적립금</div>
				<div class="bd-highlight mt-3"><span>1000</span>원</div>
			</div>
			<div class="p-3 flex-fill flex-column bd-highlight border text-center">
				<div class="bd-highlight font-weight-bold text-black-50">사용 적립금</div>
				<div class="bd-highlight mt-3"><span>1000</span>원</div>
			</div>
		</div>
		<div class="row text-center my-3">
			<div class="col-3 pr-0">
				<div class="py-2 font-weight-bold border border-left-0" style="font-size: 1.1rem; height: 46px;">
						회원님의 혜택정보
				</div>
			</div>
			<div class="col-9 pl-0">
				<div class="py-2 border border-left-0 border-right-0" style="height: 46px;">
					저희 쇼핑몰을 이용해주셔서 감사합니다. 홍길동 회원님은 <strong>[${memberInf.grade }]</strong> 등급 회원이십니다.
				</div>
			</div>
		</div>

		<div class="row mt-5">
			<div class="col">
				<h6 class="font-weight-bold">주문처리 현황(3개월)</h6>
			</div>
		</div>
		<div class="d-flex bd-highlight bg-light" style="font-size: 1.1rem;">
			<div class="d-flex flex-fill bd-highlight">
				<div class="p-3 flex-fill flex-column bd-highlight text-center">
					<div class="bd-highlight font-weight-bold text-black-50">입금 전</div>
					<div class="bd-highlight mt-3">0</div>
				</div>
				<div class="d-flex bd-highlight">
					<img src="${contextPath }/resources/img/chevron-compact-right.svg" alt=">" style="width: 26px; opacity: .3;">
				</div>
			</div>
			<div class="d-flex flex-fill bd-highlight">
				<div class="p-3 flex-fill flex-column bd-highlight text-center">
					<div class="bd-highlight font-weight-bold text-black-50">배송준비중</div>
					<div class="bd-highlight mt-3">0</div>
				</div>
				<div class="d-flex bd-highlight">
					<img src="${contextPath }/resources/img/chevron-compact-right.svg" alt=">" style="width: 26px; opacity: .3;">
				</div>
			</div>
			<div class="d-flex flex-fill bd-highlight">
				<div class="p-3 flex-fill flex-column bd-highlight text-center">
					<div class="bd-highlight font-weight-bold text-black-50">배송중</div>
					<div class="bd-highlight mt-3">0</div>
				</div>
				<div class="d-flex bd-highlight">
					<img src="${contextPath }/resources/img/chevron-compact-right.svg" alt=">" style="width: 26px; opacity: .3;">
				</div>
			</div>
			<div class="d-flex flex-fill bd-highlight">
				<div class="p-3 flex-fill flex-column bd-highlight text-center">
					<div class="bd-highlight font-weight-bold text-black-50">배송완료</div>
					<div class="bd-highlight mt-3">0</div>
				</div>
			</div>
			<div class="d-flex flex-fill bd-highlight border-left">
				<div class="p-3 flex-fill flex-column bd-highlight text-center" style="font-size: .9rem;">
					<div class="bd-highlight">취소 : <span>0</span> 건</div>
					<div class="bd-highlight my-1">교환 : <span>0</span> 건</div>
					<div class="bd-highlight">반품 : <span>0</span> 건</div>
				</div>
			</div>
		</div>

		<div class="row mt-5">
			<div class="col">
				<h6 class="font-weight-bold">주문 상품 정보</h6>
			</div>
		</div>
		<table class="table table-hover m-0 border-top">
			<thead class=" border-bottom-0 bg-light">
				<tr>
					<th class="text-center border-bottom-0 align-middle border-top-0 px-1" style="width: 100px">
						주문번호
					</th>
					<th class="text-center border-bottom-0 border-top-0 px-2" style="width: 120px">
						이미지
					</th>
					<th class="text-center border-bottom-0 border-top-0 px-2" style="width: auto">
						상품정보
					</th>
					<th class="text-center border-bottom-0 border-top-0 px-2" style="width: 100px">
						수량
					</th>
					<th class="text-center border-bottom-0 border-top-0 px-2" style="width: 150px">
						구매금액
					</th>
					<th class="text-center border-bottom-0 border-top-0 px-2" style="width: 170px">
						주문처리상태
					</th>
				</tr>
			</thead>
			<tbody class="border-bottom">
					<tr id="${list.productId }" class="">
						<td class="text-center align-middle align-middle px-1">
							12345678
						</td>
						<td class="text-center align-middle px-2">
							<img src="${contextPath}/resources/img/${list.p_group }/${list.imgURL }" class="img-thumbnail" alt="#">
						</td>
						<td class="align-middle flex-column">
							<div class="font-weight-bold pb-1 bd-highlight">
								케이스 타이틀
							</div>
							<!-- 상품 옵션 -->
							<div class="bd-highlight">
								빨강색 1
							</div>
						</td>
						<td class="text-center align-middle px-2">
							1
						</td>
						<td class="text-center align-middle px-2">
							100000원
						</td>
						<td class="text-center align-middle px-2">
							배송준비중
						</td>
					</tr>
			</tbody>
		</table>

		<div class="row mt-5">
			<div class="col">
				<h6 class="font-weight-bold">내 쿠폰 목록</h6>
			</div>
		</div>
		<table class="table table-hover m-0 border-top mb-5">
			<thead class=" border-bottom-0 bg-light">
				<tr>
					<th class="text-center border-bottom-0 align-middle border-top-0 px-1" style="width: 160px">
						번호
					</th>
					<th class="text-center border-bottom-0 border-top-0 px-2" style="width: 300px">
						쿠폰명
					</th>
					<th class="text-center border-bottom-0 border-top-0 px-2" style="width: auto">
						해택
					</th>
					<th class="text-center border-bottom-0 border-top-0 px-2" style="width: 200px">
						사용기간
					</th>
				</tr>
			</thead>
			<tbody class="border-bottom">
				<tr id="${list.productId }" class="">
					<td class="text-center align-middle align-middle px-1">
						12345678
					</td>
					<td class="align-middle">
						쿠폰명 회원가입 축하쿠폰
					</td>
					<td class="text-center align-middle px-2">
						1만원 이상 구매시 무료배송
					</td>
					<td class="text-center align-middle px-2" style="font-size: .8rem;">
						2021.06.21까지
					</td>
				</tr>
			</tbody>
		</table>

	</div>
</main>