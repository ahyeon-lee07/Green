<!--희원5 상진5-->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
	<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
		<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
			<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
				<% request.setCharacterEncoding("UTF-8"); %>
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

							<div class="d-flex justify-content-between bd-highlight border-bottom">
								<div class="d-flex bd-highlight">
									<div class="p-2 bd-highlight">
										<a class="btn_array" href="#" onclick="btn_array('popular')">인기순</a>
									</div>
									<div class="p-2 bd-highlight">
										<a class="btn_array" href="#" onclick="btn_array('newProd')">신상품</a>
									</div>
									<div class="p-2 bd-highlight">
										<a class="btn_array" href="#" onclick="btn_array('lowPrice')">낮은가격</a>
									</div>
									<div class="p-2 bd-highlight">
										<a class="btn_array" href="#" onclick="btn_array('highPrice')">높은가격</a>
									</div>
								</div>
								<div class="d-flex bd-highlight">
									<form action="${contextPath }/prodList/search.do" method="GET" name="searchBox">
										<div class="form-row">
											<div class="form-group d-flex justify-content-start ">
												<select id="inputState" class="form-control form-control-sm" name="searchKeyWordOption"
													style="width: 98px;">
													<option value="productName" selected>상품명</option>
												</select>
												<input class="form-control form-control-sm mx-2" type="text" placeholder="" name="keyWord">
												<button type="submit" class="btn btn-secondary btn-sm col-2" onclick="return search()">검색</button>
											</div>
										</div>
										<input type="text" name="searchOptions" value="${options }" style="display:none">
									</form>
								</div>
							</div>

							<div class="d-flex flex-wrap mb-2" id="chan">
								<c:forEach var="product" items="${productsList}">
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
													<c:when test="${wishList != 'N' }">
														<c:choose>
															<c:when test="${product.cartType == 'wish'}">
																<div class="bd-highlight btn btn-sm btn-outline-success ml-1 btn_product btn_wish" onclick="btn_wishYN('${product.productId}')" style="width: 40px;">
																	<img class="icon_wish" data-value="Y" src="${contextPath }/resources/img/heart-fill.svg" alt="">
																</div>
															</c:when>
															<c:otherwise>
																<div class="bd-highlight btn btn-sm btn-outline-success ml-1 btn_product btn_wish" onclick="btn_wishYN('${product.productId}')" style="width: 40px;">
																	<img class="icon_wish" data-value="N" src="${contextPath }/resources/img/heart.svg" alt="">
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
							<!-- 페이징 영역 -->
							<nav aria-label="Page navigation example row">
								<ul class="pagination d-flex justify-content-center">
									<c:if test="${pageMaker.prev }">
										<li class="page-item"><a class="page-link"
												href='<c:url value="/prodList.do?page=${pageMaker.startPage-1 }"/>'
												aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
											</a></li>
									</c:if>
									<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }"
										var="pageNum">
										<li class="page-item">
											<a class="page-link" href='${contextPath }/prodList.do?page=${pageNum }&options=${options }'>${pageNum}</a>
										</li>
									</c:forEach>
									<c:if test="${pageMaker.next && pageMaker.endPage >0 }">
										<li class="page-item"><a class="page-link"
												href='<c:url value="/prodList.do?page=${pageMaker.endPage+1 }"/>'
												aria-label="Next"> <span aria-hidden="true">&raquo;</span>
											</a></li>
									</c:if>
								</ul>
							</nav>

						</div>
					</main>

					<script>
						function btn_array(keyWord){
							// url p_group 값 가져오디
							var p_group = getParameterByName('p_group');

							//window.location.href = '${contextPath}/prodList.do?p_group='+ p_group + '&keyWord='+ keyWord;
							$.ajax({
								type: "POST",
								async: true,
								url: "${contextPath}/productList/array.do",
								dataType: "json",
								data: { p_group: p_group, keyWord: keyWord },
								success: function (result) {
									console.log(result);

									var wishList = result["wishList"];
									var result = result['result'];
									
									var str = '';
									for(var i=0; i<result.length; i++){
							
										var price = result[i]['price'].toLocaleString('ko-KR');
										var discount = result[i]['discount'].toLocaleString('ko-KR');
										var productId = result[i]['productId'];
										
										
										str += '<div class="bd-highlight prodList">';
										str += '<div class="d-flex flex-column mx-3 my-2 p-3 text-center prodbox">';
										str += '<a href="${contextPath}/prodList/prodDetail.do${pageMaker.makeQueryPage(bList.IDX, pageMaker.cri.page) }&productId='+result[i]['productId']+'">';
										str += '<div class="bd-highlight productImgBox">';
										str += '<img class="card-img-top" src="${contextPath }/resources/img/' + result[i]['p_group'] +'/' + result[i]['imgURL'] +'" alt="' + result[i]['productName'] +'" style="object-fit: cover; height:180px;">';
										str += '</div>';
										str += '<div class="bd-highlight font-weight-bold text-secondary text-left productListTitle mt-2">';
										str += '<p class="ell">' + result[i]['productName'] +'</p>';
										str += '</div>';
										str += '<div class="d-flex bd-highlight flex-column text-left my-3" style="height: 46px;">';

										if(result[i]['discountYN'] == 'Y'){
											str += '<div class="bd-highlight text-black-50 discountBox" style="font-size:.9rem; width: 50%;">';
											str +=  price + '<span>원</span>';
											str += '</div>';
											str += '<div class="bd-highlight text-danger font-weight-bold">';
											str += discount + '<span>원</span>';
											str += '</div>';
										}else {
											str += '<div class="bd-highlight text-danger font-weight-bold">';
											str += price + '<span>원</span>';
											str += '</div >';
										}
										str += '</div >';
										
										str += '</a >';
										str += '<div class="d-flex justify-content-center mt-2">';
										str += '<div class="bd-highlight flex-grow-1 btn btn-sm btn-outline-secondary mr-1 btn_product" href="${contextPath}/wist_list.do">바로구매</div>';
							
										if(wishList != 'N'){
											if(result[i]['cartType'] == 'wish'){
												str += '<div class="bd-highlight btn btn-sm btn-outline-success ml-1 btn_product btn_wish" onclick="btn_wishYN(\''+productId+'\')" style="width: 40px;">';
												str += '<img class="icon_wish" data-value="Y" src="${contextPath }/resources/img/heart-fill.svg" alt="">';
												str += '</div>';
											}else {
												str += '<div class="bd-highlight btn btn-sm btn-outline-success ml-1 btn_product btn_wish" onclick="btn_wishYN(\''+productId+'\')" style="width: 40px;">';
												str += '<img class="icon_wish" data-value="N" src="${contextPath }/resources/img/heart.svg" alt="">';
												str += '</div>';
											}
										}

										str += '</div></div ></div >';
									}

									document.getElementById('chan').innerHTML = str;
									
								},
								error: function (data, textStatus) {

								},
								complete: function (data, textStatus) {

								}
							});
						};

						// url 에서 파라미터 가져 오기
						function getParameterByName(name) {
							name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
							var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
								results = regex.exec(location.search);
							return results == null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
						}

						//관심 상품 등록
						function btn_wishYN(productId){
	
							var tarGetImg = event.currentTarget.firstElementChild;
							var tarGet_V = tarGetImg.dataset['value'];
							
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
											tarGetImg.dataset.value = 'N';
											tarGetImg.src = "${contextPath }/resources/img/heart.svg";
										}else {
											tarGetImg.dataset.value  = 'Y';
											tarGetImg.src = "${contextPath }/resources/img/heart-fill.svg";
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