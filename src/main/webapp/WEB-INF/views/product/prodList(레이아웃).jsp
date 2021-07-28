<!--희원5 상진5-->
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
				<h4 class="page_title">상품 목록</h4>
			</div>
			<div class="bd-highlight page_subtitle">
				<nav aria-label="breadcrumb">
					<ol class="breadcrumb p-0 bg bg-transparent">
						<li class="breadcrumb-item"><a href="${contextPath }/main.do">홈</a></li>
						<li class="breadcrumb-item active" aria-current="page">상품 목록</li>
					</ol>
				</nav>
			</div>
		</div>

		<div class="d-flex flex-row-reverse bd-highlight">
			<div class="p-2 bd-highlight">
				<a href="#">높은가격</a>
			</div>
			<div class="p-2 bd-highlight">
				<a href="#">낮은가격</a>
			</div>
			<div class="p-2 bd-highlight">
				<a href="#">신상품</a>
			</div>
			<div class="p-2 bd-highlight">
				<a href="#">인기순</a>
			</div>
		</div>
		<div class="d-flex flex-wrap">
			<div class="bd-highlight border prodList">
				<div class="d-flex flex-column border m-2 text-center">
					<div class="bd-highlight">
						<!-- Product image-->
						<a href="${contextPath}/prodList/prodDetail.do?productId=${product.productId}" class="productImgBox"> 
							<img class="card-img-top" src="${contextPath }/resources/img/귤곰과 나비.png" / style="
							background-repeat: no-repeat;
							background-position: center;
							background-size: cover;">
						</a>
					</div>
					<div class="bd-highlight">
						2
					</div>
					<div class="bd-highlight">
						3
					</div>		
				</div>
			</div>
			<div class="p-2 bd-highlight border prodList">>Flex item</div>
			<div class="p-2 bd-highlight border prodList">>Flex item</div>
			<div class="p-2 bd-highlight border prodList">>Flex item</div>
			<div class="p-2 bd-highlight border prodList">>Flex item</div>
			<div class="p-2 bd-highlight border prodList">>Flex item</div>
			<div class="p-2 bd-highlight border prodList">>Flex item</div>
			<div class="p-2 bd-highlight border prodList">>Flex item</div>
			<div class="p-2 bd-highlight border prodList">>Flex item</div>
			<div class="p-2 bd-highlight border prodList">>Flex item</div>
			<div class="p-2 bd-highlight border prodList">>Flex item</div>
			<div class="p-2 bd-highlight border prodList">>Flex item</div>
			<div class="p-2 bd-highlight border prodList">>Flex item</div>
			<div class="p-2 bd-highlight border prodList">>Flex item</div>
		</div>
		
		<div>
			<div class="px-4 px-lg-5 mt-3">
				<div
					class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
					<c:forEach var="product" items="${productsList}">

						<div class="col mb-5">
							<div class="card h-100">
								<!-- Product image-->
								<a href="${contextPath}/prodList/prodDetail.do?productId=${product.productId}"> <img
									class="card-img-top"
									src="${contextPath }/resources/img/${product.p_group}/${product.imgURL}"
									alt="${product.productName}" />
								</a>
								<!-- Product details-->
								<div class="card-body p-4">
									<div class="text-center">
										<!-- Product name-->
										<a href="${contextPath}/prodList/prodDetail.do?productId=${product.productId}">
											<p>${product.productName}</p>
										</a>
										<!-- Product price-->
										<!-- ${product.price} -->
										<fmt:formatNumber value="${product.price}" pattern="##,###" />
										<!-- 가격을 표시하기 위해서 사용함. 0이 3개 있을 때마다 ,를 하나씩 찍게 한다. -->
									</div>
								</div>
								<!-- Product actions-->
								<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
									<div class="text-center">
										<a class="btn btn-sm btn-outline-success"
											href="${contextPath}/orderList.do" role="button">바로구매</a> <a
											href="${contextPath}/wist_list.do"
											class="btn btn-sm btn-outline-success">관심상품</a>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
</main>