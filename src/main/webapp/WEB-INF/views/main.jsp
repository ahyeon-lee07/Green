<!--아연4 규찬6-->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
request.setCharacterEncoding("UTF-8");
%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />


<!-- 메인 -->
<main class="mainH">
	<div id="carouselExampleIndicators" class="carousel slide"
		data-ride="carousel">
		<ol class="carousel-indicators">
			<li data-target="#carouselExampleIndicators" data-slide-to="0"
				class="active"></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
		</ol>
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img src="${contextPath}/resources/img/main1.jpg" class="d-block w-100 carousel-size"
					alt="...">
			</div>
			<div class="carousel-item">
				<img src="${contextPath}/resources/img/main2.jpg" class="d-block w-100 carousel-size"
					alt="...">
			</div>
			<div class="carousel-item">
				<img src="${contextPath}/resources/img/main3.jpg" class="d-block w-100 carousel-size" alt="...">
			</div>
		</div>
		<a class="carousel-control-prev" href="#carouselExampleIndicators"
			role="button" data-slide="prev"> <span
			class="carousel-control-prev-icon" aria-hidden="true"></span> <span
			class="sr-only">Previous</span>
		</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
			role="button" data-slide="next"> <span
			class="carousel-control-next-icon" aria-hidden="true"></span> <span
			class="sr-only">Next</span>
		</a>
	</div>
	<div class="container">
		<!-- 이벤트 -->
		<div class="d-flex justify-content-between my-5">
			<div class="bd-highlight mx-2 flex-fill flex-column" style="width: 50%;">
				<div class="bd-highlight d-flex justify-content-between pb-2 mb-2 border-bottom">
					<div class="bd-highlight font-weight-bold">이벤트</div>
					<div class="bd-highlight">
						<a href="${contextPath }/community.do?communityType=event"> <img src="${contextPath }/resources/img/plus.svg" alt="">
						</a>
					</div>
				</div>
				<div class="p-0 bd-highlight">
					<ul class="list-group">
						<c:forEach items="${eventList}" var="eventList">
							<a href="${contextPath}/communityDerail/derailPage.do${pageMaker.makeQueryPage(bList.IDX, pageMaker.cri.page) }&communityNum=${eventList.num }&communityType=event"> 
								<li class="list-group-item list-group-item-action p-0 pb-1 border-0 eventOver">
									${eventList.title } 
								</li>
							</a>
						</c:forEach>
					</ul>
				</div>
			</div>
			<!-- 공지사항 -->
			<div class="bd-highlight mx-2 flex-fill flex-column" style="width: 50%;">
				<div class="bd-highlight d-flex justify-content-between pb-2 mb-2 border-bottom">
					<div class="bd-highlight font-weight-bold">공지사항</div>
					<div class="bd-highlight">
						<a href="${contextPath }/community.do?communityType=notice"> <img src="${contextPath }/resources/img/plus.svg" alt="">
						</a>
					</div>
				</div>
				<div class="p-0 bd-highlight">
					<ul class="list-group">
						<c:forEach items="${noticeList}" var="noticeList">
							<a href="${contextPath}/communityDerail/derailPage.do${pageMaker.makeQueryPage(bList.IDX, pageMaker.cri.page) }&communityNum=${noticeList.num }&communityType=notice"> 
								<li class="list-group-item list-group-item-action p-0 pb-1 border-0 noticeOver">
									${noticeList.title } 
								</li>
							</a>
						</c:forEach>
					</ul>
				</div>
			</div>
		</div>
	</div>

	<!-- 신상품 -->
	<div class="bg-light">
		<div class="container">
			<div class="row">
				<div class="col">
					<div class="row mt-5 mb-3">
						<div class="col">
							<h3 class="font-weight-bold text-center">신상품</h3>
						</div>
					</div>
					<div class="d-flex flex-wrap bd-highlight justify-content-center mb-4">
						<c:forEach items="${newProduct}" var="product" >
							<div class="bd-highlight prodList">
								<div class="d-flex flex-column mx-3 my-2 p-3 text-center prodbox">
									<a href="${contextPath}/prodList/prodDetail.do${pageMaker.makeQueryPage(bList.IDX, pageMaker.cri.page) }&productId=${product.productId}">
										<div class="bd-highlight productImgBox">
											<!-- Product image-->
											<img class="card-img-top" src="${contextPath }/resources/img/${product.p_group}/${product.imgURL}" alt="${product.productName}"
												style="object-fit: cover; height:180px;">
										</div>
										<div class="bd-highlight font-weight-bold text-secondary text-left productListTitle mt-2">
											<p class="ell">${product.productName}</p>
										</div>
										<div class="d-flex bd-highlight flex-column text-left my-3" style="height: 46px;">
											<c:choose>
												<c:when test="${product.discountYN == 'Y'}">
													<div class="bd-highlight text-black-50 discountBox" style="font-size:.9rem; width: 50%;">
														<fmt:formatNumber value="${product.price}" pattern="##,###" /><span>원</span>		
													</div>
													<div class="bd-highlight text-danger font-weight-bold">
														<fmt:formatNumber value="${product.discount}" pattern="##,###" /><span>원</span>		
													</div>
												</c:when>
												<c:otherwise>
													<div class="bd-highlight text-danger font-weight-bold">
														<fmt:formatNumber value="${product.price}" pattern="##,###" /><span>원</span>		
													</div>
												</c:otherwise>
											</c:choose>
										</div>
									</a>
									<div class="d-flex justify-content-center mt-2">
										<div class="bd-highlight flex-grow-1 btn btn-sm btn-outline-secondary mr-1 btn_product" href="${contextPath}/wist_list.do">바로구매</div>
										
										<c:choose>
											<c:when test="${newProductwishList != 'N' }">
												<c:choose>
													<c:when test="${product.cartType == 'wish'}">
														<div class="bd-highlight btn btn-sm btn-outline-success ml-1 btn_product btn_wish" onclick="btn_wishYN('${product.productId}')" style="width: 40px;">
															<img class="icon_wish ${product.productId}" data-value="Y" src="${contextPath }/resources/img/heart-fill.svg" alt="">
														</div>
													</c:when>
													<c:otherwise>
														<div class="bd-highlight btn btn-sm btn-outline-success ml-1 btn_product btn_wish" onclick="btn_wishYN('${product.productId}')" style="width: 40px;">
															<img class="icon_wish ${product.productId}" data-value="N" src="${contextPath }/resources/img/heart.svg" alt="">
														</div>
													</c:otherwise>
												</c:choose>
											</c:when>
										</c:choose>
										
									</div>
								</div>	
							</div>
									
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- 베스트상품 -->
	<div class="">
		<div class="container">
			<div class="row">
				<div class="col">
					<div class="row mt-5 mb-3">
						<div class="col">
							<h3 class="font-weight-bold text-center">베스트상품</h3>
						</div>
					</div>
					<div class="d-flex flex-wrap bd-highlight justify-content-center mb-4">
						<c:forEach items="${bestProduct}" var="product" >
							<div class="bd-highlight prodList">
								<div class="d-flex flex-column mx-3 my-2 p-3 text-center prodbox">
									<a href="${contextPath}/prodList/prodDetail.do${pageMaker.makeQueryPage(bList.IDX, pageMaker.cri.page) }&productId=${product.productId}">
										<div class="bd-highlight productImgBox">
											<!-- Product image-->
											<img class="card-img-top" src="${contextPath }/resources/img/${product.p_group}/${product.imgURL}" alt="${product.productName}"
												style="object-fit: cover; height:180px;">
										</div>
										<div class="bd-highlight font-weight-bold text-secondary text-left productListTitle mt-2">
											<p class="ell">${product.productName}</p>
										</div>
										<div class="d-flex bd-highlight flex-column text-left my-3" style="height: 46px;">
											<c:choose>
												<c:when test="${product.discountYN == 'Y'}">
													<div class="bd-highlight text-black-50 discountBox" style="font-size:.9rem; width: 50%;">
														<fmt:formatNumber value="${product.price}" pattern="##,###" /><span>원</span>		
													</div>
													<div class="bd-highlight text-danger font-weight-bold">
														<fmt:formatNumber value="${product.discount}" pattern="##,###" /><span>원</span>		
													</div>
												</c:when>
												<c:otherwise>
													<div class="bd-highlight text-danger font-weight-bold">
														<fmt:formatNumber value="${product.price}" pattern="##,###" /><span>원</span>		
													</div>
												</c:otherwise>
											</c:choose>
										</div>
									</a>
									<div class="d-flex justify-content-center mt-2">
										<div class="bd-highlight flex-grow-1 btn btn-sm btn-outline-secondary mr-1 btn_product" href="${contextPath}/wist_list.do">바로구매</div>
										
										<c:choose>
											<c:when test="${bestProductwishList != 'N' }">
												<c:choose>
													<c:when test="${product.cartType == 'wish'}">
														<div class="bd-highlight btn btn-sm btn-outline-success ml-1 btn_product btn_wish" onclick="btn_wishYN('${product.productId}')" style="width: 40px;">
															<img class="icon_wish ${product.productId}" data-value="Y" src="${contextPath }/resources/img/heart-fill.svg" alt="">
														</div>
													</c:when>
													<c:otherwise>
														<div class="bd-highlight btn btn-sm btn-outline-success ml-1 btn_product btn_wish" onclick="btn_wishYN('${product.productId}')" style="width: 40px;">
															<img class="icon_wish ${product.productId}" data-value="N" src="${contextPath }/resources/img/heart.svg" alt="">
														</div>
													</c:otherwise>
												</c:choose>
											</c:when>
										</c:choose>
										
									</div>
								</div>	
							</div>
									
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- 세일상품 -->
	<div class="bg-light">
		<div class="container">
			<div class="row">
				<div class="col">
					<div class="row mt-5 mb-3">
						<div class="col">
							<h3 class="font-weight-bold text-center">세일상품</h3>
						</div>
					</div>
					<div class="d-flex flex-wrap bd-highlight justify-content-center mb-4">
						<c:forEach items="${discountProduct}" var="product" >
							<div class="bd-highlight prodList">
								<div class="d-flex flex-column mx-3 my-2 p-3 text-center prodbox">
									<a href="${contextPath}/prodList/prodDetail.do${pageMaker.makeQueryPage(bList.IDX, pageMaker.cri.page) }&productId=${product.productId}">
										<div class="bd-highlight productImgBox">
											<!-- Product image-->
											<img class="card-img-top" src="${contextPath }/resources/img/${product.p_group}/${product.imgURL}" alt="${product.productName}"
												style="object-fit: cover; height:180px;">
										</div>
										<div class="bd-highlight font-weight-bold text-secondary text-left productListTitle mt-2">
											<p class="ell">${product.productName}</p>
										</div>
										<div class="d-flex bd-highlight flex-column text-left my-3" style="height: 46px;">
											<c:choose>
												<c:when test="${product.discountYN == 'Y'}">
													<div class="bd-highlight text-black-50 discountBox" style="font-size:.9rem; width: 50%;">
														<fmt:formatNumber value="${product.price}" pattern="##,###" /><span>원</span>		
													</div>
													<div class="bd-highlight text-danger font-weight-bold">
														<fmt:formatNumber value="${product.discount}" pattern="##,###" /><span>원</span>		
													</div>
												</c:when>
												<c:otherwise>
													<div class="bd-highlight text-danger font-weight-bold">
														<fmt:formatNumber value="${product.price}" pattern="##,###" /><span>원</span>		
													</div>
												</c:otherwise>
											</c:choose>
										</div>
									</a>
									<div class="d-flex justify-content-center mt-2">
										<div class="bd-highlight flex-grow-1 btn btn-sm btn-outline-secondary mr-1 btn_product" href="${contextPath}/wist_list.do">바로구매</div>
										
										<c:choose>
											<c:when test="${discountProductwishList != 'N' }">
												<c:choose>
													<c:when test="${product.cartType == 'wish'}">
														<div class="bd-highlight btn btn-sm btn-outline-success ml-1 btn_product btn_wish" onclick="btn_wishYN('${product.productId}')" style="width: 40px;">
															<img class="icon_wish ${product.productId}" data-value="Y" src="${contextPath }/resources/img/heart-fill.svg" alt="">
														</div>
													</c:when>
													<c:otherwise>
														<div class="bd-highlight btn btn-sm btn-outline-success ml-1 btn_product btn_wish" onclick="btn_wishYN('${product.productId}')" style="width: 40px;">
															<img class="icon_wish ${product.productId}" data-value="N" src="${contextPath }/resources/img/heart.svg" alt="">
														</div>
													</c:otherwise>
												</c:choose>
											</c:when>
										</c:choose>
										
									</div>
								</div>	
							</div>
									
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
	</div>


</main>
<script>
	//관심 상품 등록
	function btn_wishYN(productId){
	
	var tarGetImg = event.currentTarget.firstElementChild;
	var tarGet_class = tarGetImg.classList.item(1);
	var tarGet_V = tarGetImg.dataset['value'];
	var wishList = document.getElementsByClassName(tarGet_class);
	
	$.ajax({
		type: "POST",
		async: true,
		url: "${contextPath}/wish_list/wishAdd.do",
		dataType: "text",
		data: { productId: productId },
		success: function (result) {						
			if(result == 0){
				alert("죄송합니다. 잠시후 다시 시도해 주세요.");
			}else if(result == 1){
				if(tarGet_V == 'Y'){

					for(var i=0; i<wishList.length; i++){
						wishList[i].dataset.value = 'N';
						wishList[i].src = "${contextPath }/resources/img/heart.svg";
					}
				}else {

					for(var i=0; i<wishList.length; i++){
						wishList[i].dataset.value = 'Y';
						wishList[i].src = "${contextPath }/resources/img/heart-fill.svg";
						}
	
				}
			}
		},
		error: function (data, textStatus) {

		},
		complete: function (data, textStatus) {

		}
	});
}


</script>