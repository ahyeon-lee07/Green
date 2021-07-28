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
				<h4>마이페이지</h4>
			</div>
			<div class="bd-highlight">
				<nav aria-label="breadcrumb">
					<ol class="breadcrumb p-0 bg bg-transparent">
						<li class="breadcrumb-item"><a href="${contextPath }/main.do">홈</a></li>
						<li class="breadcrumb-item active" aria-current="page">마이페이지</li>
					</ol>
				</nav>
			</div>
		</div>


		<div class="container px-4 my-5">
			<div class="row">
				<div class="col-md-2">
					<div class="row">
						<center>
							<img src="${contextPath }/resources/img/userIcon.png"
								style="width: 120px; height: 130px;">
							<p style="text-align: center; font-size: 0.75rem;">홍길동</p>
						</center>
					</div>
				</div>
				<div class="col-md-10">
					<div class="row">
						<div class="col-md-7">
							<div class="row">
								<h6>
									환영합니다. <strong>홍길동</strong>회원님!
								</h6>
								<div class="d-flex justify-content-around">
									<div class="p-2 bd-highlight">
										<p class="fs-7">주문내역</p>
									</div>
									<div class="p-2 bd-highlight">
										<p class="fs-7">장바구니</p>
									</div>
									<div class="p-2 bd-highlight">
										<p class="fs-7">관심상품</p>
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-5">
							<a href="http://localhost:8080/green/memberEdit.do" class="btn btn-outline-success btn-sm">회원정보 수정</a> <a
								href="#" class="btn btn-outline-success btn-sm">배송주소록 관리</a>
						</div>
					</div>
					<div class="row bg-light ">
						<div class="col-md-3 border ">
							<div class="row">총 주문</div>
							<br>
							<div class="row">10000원(1회)</div>
						</div>
						<div class="col-md-3 border">
							<div class="row">가용 적립금</div>
							<br>
							<div class="row">
								1000원 <a href="#" class="btn btn-outline-success btn-sm">조회</a>
							</div>
						</div>
						<div class="col-md-3 border">
							<div class="row">총 적립금</div>
							<br>
							<div class="row">1000원</div>
						</div>
						<div class="col-md-3 border">
							<div class="row">사용 적립금</div>
							<br>
							<div class="row">1000원</div>
						</div>
					</div>
				</div>
			</div>
			<br>
			<div class="row bg-light">
				<div class="col-md-3 border">
					<p style="text-align: center; font-size: 1rem;">회원님의 혜택정보</p>
				</div>
				<div class="col-md-9 border">
					<p style="text-align: center; font-size: 1rem;">
						저희 쇼핑몰을 이용해주셔서 감사합니다. 홍길동 회원님은 <strong>[일반회원]</strong> 등급 회원이십니다.
					</p>
				</div>
			</div>
			<br>
			<h6>
				<strong>주문처리 현황(3개월)</strong>
			</h6>
			<div class="row bg-light">
				<div class="col-md-10">
					<div class="row">
						<div class="col-md-2">
							<div class="row">입금 전</div>
							<div class="row">0</div>
						</div>
						<div class="col-md-1">
							<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
								fill="currentColor" class="bi bi-chevron-compact-right"
								viewBox="0 0 16 16">
                <path fill-rule="evenodd"
									d="M6.776 1.553a.5.5 0 0 1 .671.223l3 6a.5.5 0 0 1 0 .448l-3 6a.5.5 0 1 1-.894-.448L9.44 8 6.553 2.224a.5.5 0 0 1 .223-.671z" />
              </svg>
						</div>
						<div class="col-md-2">
							<div class="row">배송준비중</div>
							<div class="row">0</div>
						</div>
						<div class="col-md-1">
							<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
								fill="currentColor" class="bi bi-chevron-compact-right"
								viewBox="0 0 16 16">
                <path fill-rule="evenodd"
									d="M6.776 1.553a.5.5 0 0 1 .671.223l3 6a.5.5 0 0 1 0 .448l-3 6a.5.5 0 1 1-.894-.448L9.44 8 6.553 2.224a.5.5 0 0 1 .223-.671z" />
              </svg>
						</div>
						<div class="col-md-2">
							<div class="row">배송중</div>
							<div class="row">0</div>
						</div>
						<div class="col-md-1">
							<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
								fill="currentColor" class="bi bi-chevron-compact-right"
								viewBox="0 0 16 16">
                <path fill-rule="evenodd"
									d="M6.776 1.553a.5.5 0 0 1 .671.223l3 6a.5.5 0 0 1 0 .448l-3 6a.5.5 0 1 1-.894-.448L9.44 8 6.553 2.224a.5.5 0 0 1 .223-.671z" />
              </svg>
						</div>
						<div class="col-md-2">
							<div class="row">배송완료</div>
							<div class="row">0</div>
						</div>
						<div class="col-md-1"></div>
					</div>
				</div>
				<div class="col-md-2">
					<div class="row">
						<div class="col-sm-8">취소 :</div>
						<div class="col-sm-4">0 건</div>
					</div>
					<div class="row">
						<div class="col-sm-8">교환 :</div>
						<div class="col-sm-4">0 건</div>
					</div>
					<div class="row">
						<div class="col-sm-8">반품 :</div>
						<div class="col-sm-4">0 건</div>
					</div>
				</div>
			</div>
			<br>
			<h6>
				<strong>주문 상품 정보</strong>
			</h6>
			<div class="row bg-light" style="text-align: center;">
				<div class="col-md-1">
					<div class="row bg-secondary">주문번호</div>
					<div class="row">12345678</div>
				</div>
				<div class="col-md-2">
					<div class="row bg-secondary">이미지</div>
					<div class="row">
						<img src="${contextPath }/resources/img/케이스이미지.PNG" style="width: 120px; height: 130px;">
					</div>
				</div>
				<div class="col-md-4">
					<div class="row bg-secondary">상품정보</div>
					<div class="row">귤곰 케이스 (아이폰XS)</div>
				</div>
				<div class="col-md-1">
					<div class="row bg-secondary">수량</div>
					<div class="row">1</div>
				</div>
				<div class="col-md-1">
					<div class="row bg-secondary">구매금액</div>
					<div class="row">10000원</div>
				</div>
				<div class="col-md-3">
					<div class="row bg-secondary">주문처리상태</div>
					<div class="row">배송준비중</div>
				</div>
			</div>
			<br>
			<h6>
				<strong>내 쿠폰 목록</strong>
			</h6>
			<div class="row" style="text-align: center;">
				<div class="col-md-2">
					<div class="row bg-secondary">번호</div>
					<div class="row bg-light">12345678</div>
				</div>
				<div class="col-md-4">
					<div class="row bg-secondary">쿠폰명</div>
					<div class="row">회원가입 축하쿠폰</div>
				</div>
				<div class="col-md-4">
					<div class="row bg-secondary">혜택</div>
					<div class="row">1만원 이상 구매시 무료배송</div>
				</div>
				<div class="col-md-2">
					<div class="row bg-secondary">사용기간</div>
					<div class="row">2021.06.21까지</div>
				</div>
			</div>
		</div>

	</div>
</main>