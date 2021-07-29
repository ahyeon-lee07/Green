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
				<h4>상품 상세창</h4>
			</div>
			<div class="bd-highlight">
				<nav aria-label="breadcrumb">
					<ol class="breadcrumb p-0 bg bg-transparent">
						<li class="breadcrumb-item"><a href="${contextPath}/main.do">홈</a></li>
						<li class="breadcrumb-item"><a
							href="${contextPath}/prodList.do?p_group=${prodList.p_group}">상품
								목록</a></li>
						<li class="breadcrumb-item active" aria-current="page">상품
							상세페이지</li>
					</ol>
				</nav>
			</div>
		</div>
		<div>
			<div class="container px-4 px-lg-5 my-5">
				<div class="row gx-4 gx-lg-5 align-items-center">
					<div class="col-md-6">
						<img class="card-img-top mb-5 mb-md-0"
							src="${contextPath}/resources/img/${prodList.p_group}/${product_M}"
							alt="${prodList.productName}" />
					</div>
					<div class="col-md-6">
						<!-- 상품명 -->
						<div class="row">
							<div class="col-md-3">상품명 :</div>
							<div class="col-md-9" id="prodName">${prodList.productName}</div>
						</div>
						<br>
						<!-- 상품가격-->
						<div class="row">
							<div class="col-md-3">상품가격 :</div>
							<div class="col-md-9" id="price">
								<fmt:formatNumber value="${prodList.price}" pattern="#,###" />
								원
							</div>
						</div>
						<br>
						<!-- 배송비 -->
						<div class="row">
							<div class="col-md-3">배송비 :</div>
							<div class="col-md-9">2,500원</div>
						</div>
						<hr>
						<!-- 색상/기종 -->
						<div id="item_option">
							<table width="500" align="center">
								<tr>
									<td align="left" width="120">색상/기종</td>
									<td width="400"><select name="p_option" id="p_option">
											<option value="">=== (필수)옵션 : 색상/기종 선택 ===</option>
											<c:forEach var="prodOption" items="${prodOption}"
												varStatus="index">
												<option value="${prodOption.p_option}">${prodOption.p_option}</option>
											</c:forEach>
									</select></td>
								</tr>
							</table>
							<hr>
							<!-- 선택한 상품-->
							<form id="frm" name="frm" method="post">
								<div>
									<table width="100%" id="dynamicTable" border=1>
										<thead align="center">
											<tr>
												<td>색상/기종</td>
												<td>수량</td>
												<td>가격</td>
											</tr>
										</thead>
										<tbody align="center" id="dynamicTbody">
										</tbody>
									</table>
								</div>
							</form>
							<!-- 총 가격-->
							<div class="totals-item totals-item-total"
								style="float: left; margin-left: 400px;">
								<label class="total_price">총상품금액</label>&nbsp;&nbsp;
								<div class="total_price" style="float: right;">원</div>
								<div class="totals-value" id="cart-total" style="float: right;">0</div>
							</div>
							<br>
							<!-- 바로구매/장바구니/관심상품 버튼-->
							<table>
								<tr>
									<td><hr style="border-top: 1px solid #bbb;" width=670px>
									<td>
								</tr>
							</table>

							<button style="width: 150px; height: 58px;"
								class="btn btn-outline-success" id="insertWish"
								onclick="fn_InsertWish()">관심상품</button>
							<button style="width: 150px; height: 58px;"
								class="btn btn-outline-success" id="insertCart"
								onclick="fn_InsertCart()">장바구니</button>
							<button style="width: 150px; height: 58px;"
								class="btn btn-outline-success" id="prodOrder"
								onclick="fn_ProdOrder()">바로구매</button>
							<br>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Related items section-->
	<section class="py-5 bg-light">
		<div class="container px-4 px-lg-3">
			<h2 class="fw-bolder mb-4">Recommend Items</h2>
			<div
				class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
				<div class="col mb-5">
					<div class="card h-100">
						<!-- Product image-->
						<img class="card-img-top"
							src="${contextPath }/resources/img/케이스이미지2.PNG" alt="케이스이미지" />
						<!-- Product details-->
						<div class="card-body p-4">
							<div class="text-center">
								<!-- Product name-->
								<h5 class="fw-bolder">귤곰 케이스</h5>
								<!-- Product price-->
								12000원
							</div>
						</div>
						<!-- Product actions-->
						<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
							<div class="text-center">
								<a class="btn btn-outline-success mt-auto" href="#">자세히보기</a>
							</div>
						</div>
					</div>
				</div>
				<div class="col mb-5">
					<div class="card h-100">
						<!-- Sale badge-->
						<div class="badge bg-dark text-white position-absolute"
							style="top: 0.5rem; right: 0.5rem">Sale</div>
						<!-- Product image-->
						<img class="card-img-top"
							src="${contextPath}/resources/img/케이스이미지3.PNG" alt="케이스이미지" />
						<!-- Product details-->
						<div class="card-body p-4">
							<div class="text-center">
								<!-- Product name-->
								<h5 class="fw-bolder">곰귤 케이스</h5>
								<!-- Product price-->
								12000원
							</div>
						</div>
						<!-- Product actions-->
						<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
							<div class="text-center">
								<a class="btn btn-outline-success mt-auto" href="#">자세히보기</a>
							</div>
						</div>
					</div>
				</div>
				<div class="col mb-5">
					<div class="card h-100">
						<!-- Sale badge-->
						<div class="badge bg-dark text-white position-absolute"
							style="top: 0.5rem; right: 0.5rem">Sale</div>
						<!-- Product image-->
						<img class="card-img-top"
							src="${contextPath}/resources/img/케이스이미지4.PNG" alt="케이스이미지" />
						<!-- Product details-->
						<div class="card-body p-4">
							<div class="text-center">
								<!-- Product name-->
								<h5 class="fw-bolder">귤곰 케이스</h5>
								<!-- Product price-->
								12000원
							</div>
						</div>
						<!-- Product actions-->
						<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
							<div class="text-center">
								<a class="btn btn-outline-success mt-auto" href="#">자세히보기</a>
							</div>
						</div>
					</div>
				</div>
				<div class="col mb-5">
					<div class="card h-100">
						<!-- Product image-->
						<img class="card-img-top"
							src="${contextPath}/resources/img/케이스이미지.PNG" alt="케이스이미지" />
						<!-- Product details-->
						<div class="card-body p-4">
							<div class="text-center">
								<!-- Product name-->
								<h5 class="fw-bolder">곰귤 케이스</h5>
								<!-- Product price-->
								12000원
							</div>
						</div>
						<!-- Product actions-->
						<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
							<div class="text-center">
								<a class="btn btn-outline-success mt-auto" href="#">자세히보기</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- 상세설명란 -->
	<div class="py-5">
		<nav>
			<div class="d-flex justify-content-center mt-5">
				<div class="nav nav-tabs" id="nav-tab" role="tablist">
					<a class="nav-item nav-link active" id="nav-home-tab"
						data-toggle="tab" href="#nav-home" role="tab"
						aria-controls="nav-home" aria-selected="true">상품 상세정보</a> <a
						class="nav-item nav-link" id="nav-profile-tab" data-toggle="tab"
						href="#nav-profile" role="tab" aria-controls="nav-profile"
						aria-selected="false">구매 가이드</a> <a class="nav-item nav-link"
						id="nav-contact-tab1" data-toggle="tab" href="#nav-contact1"
						role="tab" aria-controls="nav-contact" aria-selected="false">REVIEW</a>
					<a class="nav-item nav-link" id="nav-contact-tab2"
						data-toggle="tab" href="#nav-contact2" role="tab"
						aria-controls="nav-contact" aria-selected="false">Q&A</a>
				</div>
			</div>
		</nav>
		<div class="text-center">
			<div class="tab-content" id="nav-tabContent">
				<div class="tab-pane fade show active" id="nav-home" role="tabpanel"
					aria-labelledby="nav-home-tab">
					<img hspace="5" vspace="0"
						src="${contextPath}/resources/img/${prodList.p_group}/${product_S}"
						alt="${prodList.productName}">
				</div>
				<div class="tab-pane fade" id="nav-profile" role="tabpanel"
					aria-labelledby="nav-profile-tab">
					<div class="d-flex justify-content-center mt-5">
						<div
							class="bd-highlight border d-flex flex-column text-center rounded py-3 px-5"
							style="width: 94%; max-width: 1060px; border: 1px solid #e7e7e7; border-radius: 7px; margin: 50px auto 85px; box-sizing: border-box;">
							<!-- 결제 정보 -->
							[상품 결제정보]<br> 고액결제의 경우 안전을 위해 카드사에서 확인전화를 드릴 수도 있습니다.<br>
							확인과정에서 도난 카드의 사용이나 타인 명의의 주문등 정상적인 주문이<br> 아니라고 판단될 경우 임의로
							주문을 보류 또는 취소할 수 있습니다.<br> <br> 무통장 입금은 상품 구매 대금은 PC뱅킹,
							인터넷뱅킹, 텔레뱅킹 혹은 가까운 은행에서 직접 입금하시면 됩니다.<br> 주문시 입력한 입금자명과
							실제입금자의 성명이 반드시 일치하여야 하며,<br> 7일 이내로 입금을 하셔야 하며 입금되지 않은 주문은
							자동취소 됩니다.<br> <br>
							<!-- 배송 안내 -->
							[배송 안내]<br> - 그린케이스는 우체국택배를 이용하며, 출고 이후 1-3일의 배송일이 소요됩니다.
							(주말제외)<br> <br> - 산간지역이나 도서지방은 별도의 추가금액을 지불하셔야 하는 경우가
							있습니다.<br> 고객님께서 주문하신 상품은 입금 확인후 배송해 드립니다.<br> 다만, 상품종류에
							따라서 상품의 배송이 다소 지연될 수 있습니다.<br> <br>
							<!-- 교환 및 반품 안내 -->
							[교환 및 반품 안내]<br> 교환 및 반품이 가능한 경우<br> - 업체측의 오배송 / 불량상품
							수령시 교환 및 반품이 가능합니다.<br> (불량 사유가 아닌 경우 : 1. 각 기종별 사출(공케이스)을
							달리 사용함으로서 동일한 프린팅에도 미세한 색감차이가 발생할 수 있습니다.<br> 2. 곡선(카메라,
							옆면)은 열처리로 인하여 발생하는 폰케이스 안쪽의 잉크스밈이 발생할 수 있습니다.<br> 3. 주문확인 후
							1:1 수작업으로 제작이 되기에 중앙에서 1-3mm의 이미지 오차가 생길 수 있습니다.<br> 4. 미세한
							먼지(작은점 포함)와 스크래치는 공정상 발생할 수 있으며, 필름지 찍힘은 불량에 해당되지 않습니다.<br>
							5. 전사 특성상 색상이 늘어지는 현상 및 연해지는 현상이 일어날 수 있으며, 모서리 부분 색이 입혀지지 않은 것은
							불량이 아닙니다.)<br> <br> 교환 및 반품이 불가능한 경우<br> - 모든 주문건은
							주문제작으로 진행이 되기에 제작에 들어간 이후 교환 및 환불이 어렵습니다.<br> - 고객님의 사용 또는
							일부 소비에 의하여 상품의 가치가 현저히 감소한 경우 교환 및 환불이 어렵습니다.<br> - 시간의 경과에
							의하여 재판매가 곤란할 정도로 상품등의 가치가 현저히 감소한 경우 교환 및 환불이 어렵습니다.<br> -
							불량사유에 해당되지 않는 경우<br> (불량 사유가 아닌 경우 : 1. 각 기종별 사출(공케이스)을 달리
							사용함으로서 동일한 프린팅에도 미세한 색감차이가 발생할 수 있습니다.<br> 2. 곡선(카메라, 옆면)은
							열처리로 인하여 발생하는 폰케이스 안쪽의 잉크스밈이 발생할 수 있습니다.<br> 3. 주문확인 후 1:1
							수작업으로 제작이 되기에 중앙에서 1-3mm의 이미지 오차가 생길 수 있습니다.<br> 4. 미세한
							먼지(작은점 포함)와 스크래치는 공정상 발생할 수 있으며, 필름지 찍힘은 불량에 해당되지 않습니다.<br>
							5. 전사 특성상 색상이 늘어지는 현상 및 연해지는 현상이 일어날 수 있으며, 모서리 부분 색이 입혀지지 않은 것은
							불량이 아닙니다.)<br> - 고객의 단순변심 혹은 주문실수(옵션선택)에 의한 교환 및 환불은 어렵습니다.<br>
							<br>
							<!-- 기타 안내 -->
							[기타 안내]<br> 언제나 성심성의껏 답해드리겠습니다!<br> 저희 그린케이스를 찾아주셔서
							감사합니다~ :D
						</div>
					</div>
				</div>
				<div class="tab-pane fade" id="nav-contact1" role="tabpanel"
					aria-labelledby="nav-contact-tab1">
					<iframe src="http://localhost:8080/green/review.do" width="90%"
						name="review" height="90%" frameborder="0" marginheight="0"
						marginwidth="0" scrolling="auto"></iframe>
				</div>
				<div class="tab-pane fade" id="nav-contact2" role="tabpanel"
					aria-labelledby="nav-contact-tab2">
					<iframe src="http://localhost:8080/green/product.do" width="90%"
						name="review" height="90%" frameborder="0" marginheight="0"
						marginwidth="0" scrolling="auto"></iframe>
				</div>
			</div>
		</div>
	</div>
</main>

<!-- 장바구니 -->
<script type="text/javascript">
	function cart_checkform() {
		alert("해당 상품을 장바구니에 담았습니다!");
	}
	
	<!-- 옵션 js -->
	$('#p_option').change(function() {
		
		var html = "";
		var option = document.getElementById('p_option').value;
		var cnt = 1;
		var price = ${prodList.price};

		html += '<tr>';
		html += '<td>'+option+'</td>'
		html += '<td>'+cnt+'</td>';
		html += '<td>'+price+'</td>';
		html += '</tr>';

		$("#dynamicTable").append(html);

		}
	)
	
	<!--
	
	function fn_InsertWish() { // 좋아요
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/wish_list.do'/>");
			comSubmit.addParam("GOODS_NO", ${list.GOODS_NO});
			comSubmit.submit();
		}
	
	
	function fn_ProdOrder() { // 구매하기
		if(doubleSubmitCheck()) return; // 중복클릭 방지
			var arraycode = document.getElementsByName("BASKET_GOODS_AMOUNT");
			var len = arraycode.length;
			if(len==0){
				alert("상품을 추가해 주세요.");
			} else{
				var comSubmit = new ComSubmit("frm");
				comSubmit.setUrl("<c:url value='/orderList.do'/>");
				comSubmit.submit();
			}
	}
	
	
	function fn_InsertCart() { // 장바구니

		if(doubleSubmitCheck()) return; // 중복클릭 방지
			var arraycode = document.getElementsByName("BASKET_GOODS_AMOUNT");
			var len = arraycode.length;
			if(len==0){
				alert("상품을 추가해 주세요.");
			} else{
				var url = "/stu/shop/basketPopUp.do";
				var name = "popup";
				var option = "width=382, height=227, top=500, left=800, location=no";
		
			    var comSubmit = new ComSubmit("frm");
				comSubmit.setUrl("<c:url value='/cart.do'/>");
				window.open(url,name,option);
				comSubmit.submit();
			}
	}
	
	-->
	
</script>