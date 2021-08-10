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
				<h4 class="page_title">상품 상세창</h4>
			</div>
			<div class="bd-highlight page_subtitle">
				<nav aria-label="breadcrumb">
					<ol class="breadcrumb p-0 bg bg-transparent">
						<li class="breadcrumb-item"><a href="${contextPath }/main.do">홈</a></li>
						<li class="breadcrumb-item"><a href="${contextPath}/prodList.do?p_group=${prodList.p_group}">상품목록</a></li>
						<li class="breadcrumb-item active" aria-current="page">상품상세페이지</li>
					</ol>
				</nav>
			</div>
		</div>

		<form action="" name="prodForm" method="POST">
			<div class="row mt-2 mb-5">
				<div class="col d-flex flex-row flex-wrap bd-highlight">
					<div class="bd-highlight prodDetailPageOderBox mb-4 mb-md-0 pr-0 pr-md-5">
						<img class="card-img-top" src="${contextPath}/resources/img/${prodList.p_group}/${product_M}"  alt="${prodList.productName}" />
					</div>
					<div class="flex-fill bd-highlight prodDetailPageOderBox border-top border-secondary" style="border-width: 2px !important;">
						<div class="bd-highlight border-bottom py-2 mb-3">
							<input type="text" class="form-control inputReadonly font-weight-bold" name="productName" value="${prodList.productName}" readonly>
							<input type="text" class="form-control inputReadonly" name="productId" value="${prodList.productId}" style="display: none;" readonly>
						</div>				
						<c:choose>
							<c:when test="${prodList.discountYN == 'Y'}">
								<div class="bd-highlight d-flex flex-row">
									<label for="discount" class="bd-highlight col-form-label pl-2" style="width: 140px; font-weight: normal;">할인판매가</label>
									<input type="text" class="form-control text-danger inputReadonly font-weight-bold" id="discount" value="" readonly>
									<input type="text" id="discount_V" name="discount" value="" style="display: none;">	
								</div>
								<div class="bd-highlight d-flex flex-row">
									<label for="price" class="bd-highlight col-form-label pl-2" style="width: 140px; font-weight: normal;">판매가</label>
									<input type="text" class="form-control inputReadonly text-black-50" id="price" value="" style="text-decoration: line-through;" readonly>
									<input type="text" id="price_V" name="price" value=""  style="display: none;">	
								</div>
							</c:when>
							<c:otherwise>
								<div class="bd-highlight d-flex flex-row">
									<label for="price" class="bd-highlight col-form-label pl-2" style="width: 140px; font-weight: normal;">판매가</label>
									<input type="text" class="form-control inputReadonly " id="price" value="" readonly>
									<input type="text" id="price_V" name="price" value=""  style="display: none;">	
								</div>
							</c:otherwise>
						</c:choose>
						<div class="bd-highlight d-flex flex-row">
							<label for="shipTotal" class="bd-highlight col-form-label pl-2" style="width: 140px; font-weight: normal;">배송비</label>
							<input type="text" class="form-control inputReadonly" id="shipTotal" value="" readonly>
							<input type="text" id="shipTotal_V" name="shipTotal" value="" style="display: none;">	
						</div>

						<div class="bd-highlight d-flex flex-row border-top border-bottom mt-3 mb-2 py-2">
							<label for="shipTotal" class="bd-highlight col-form-label pl-2" style="width: 140px; font-weight: normal;">색상/기종</label>
							<select id="p_optionList" class="form-control form-control-sm" style="width: 100%; height: 38px" >
								<option value="null">=== (필수)옵션 : 색상/기종 선택 ===</option>
								<c:forEach var="prodOption" items="${prodOption}" varStatus="index">
									<option value="${prodOption.p_optionId}[^]${prodOption.p_option}[^]${prodOption.p_stock}" data-optionName="${prodOption.p_option}">${prodOption.p_option}</option>
								</c:forEach>
							</select>	
						</div>
						<div class="bd-highlight d-flex flex-column">
							<label for="shipTotal" class="bd-highlight col-form-label text-black-50" style="font-size: .8rem;">최소 주문 수량 1개 이상</label>
							
							<table class="table table-hover m-0">
								<thead class=" border-bottom-0 border-top bg-light">
									<tr>
										<th class="text-left border-bottom-0 border-top-0 p-2" style="width: auto">색상/기종</th>
										<th class="text-center border-bottom-0 border-top-0 p-2" style="width: 120px">수량</th>
										<th class="text-center border-bottom-0 border-top-0 p-2" style="width: 90px">가격</th>
									</tr>
								</thead>
								<tbody id="oderListBox" class="border-bottom">
									
								</tbody>
							</table>
							<div class="d-flex justify-content-end border-bottom py-2">
								<div class="bd-highlight p-1 mr-1">TOTAL: </div>
								<div class="bd-highlight font-weight-bold" style="font-size: 1.4rem;"><span id="inputPriceTotal">0</span>원</div>
								<div class="bd-highlight text-black-50 pt-2 pl-1" style="font-size: .8rem;">(<span id="inputCount">0</span>개)</div>
								<input type="text" class="bd-highlight form-control" id="priceTotal" name="priceTotal" value="" style="display: none;">
							</div>
						</div>
						<div class="d-flex justify-content-end py-3">
							<c:if test="${member != null }">
								<c:choose>
									<c:when test="${prodList.cartType == 'wish'}">
										<button class="btn btn-outline-secondary flex-fill bd-highlight mx-1 ${prodList.productId}" type="button" id="insertWish" onclick="btn_wishYN('${prodList.productId}')" style=" height: 46px;">
											<img class="icon_wish" data-value="Y" src="${contextPath }/resources/img/heart-fill.svg" alt="" style="padding-right: 6px">관심상품
										</button>		
									</c:when>
									<c:otherwise>
										<button class="btn btn-outline-secondary flex-fill bd-highlight mx-1 ${prodList.productId}" type="button" id="insertWish" onclick="btn_wishYN('${prodList.productId}')" style=" height: 46px;">
											<img class="icon_wish" data-value="N" src="${contextPath }/resources/img/heart.svg" alt="" style="padding-right: 6px">관심상품
										</button>	
									</c:otherwise>
								</c:choose>
								
							</c:if>
							<button class="btn btn-outline-secondary flex-fill bd-highlight mx-1" id="insertCart" onclick="return fn_InsertCart()" style=" height: 46px;">장바구니</button>
							<button class="btn btn-success flex-fill bd-highlight mx-1" id="prodOrder" type="button" onclick="return fn_ProdOrder()"style="height: 46px;">바로구매</button>
						</div>
						
					</div>
				</div>
			</div>
		</form>
	</div>

	<!-- Related items section-->
	<section class="py-5 bg-light">
		<div class="container px-4 px-lg-3">
			<h2 class="fw-bolder mb-4 text-center">Recommend Items</h2>
			<div class="d-flex flex-wrap bd-highlight justify-content-center">
				<c:forEach items="${RecommendProduct}" var="product" >
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
								<div class="d-flex bd-highlight flex-column text-left mt-3" style="height: 46px;">
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
								<a class="bd-highlight flex-grow-1 btn btn-sm btn-outline-secondary mr-1 btn_product" href="${contextPath}/prodList/prodDetail.do${pageMaker.makeQueryPage(bList.IDX, pageMaker.cri.page) }&productId=${product.productId}">바로구매</a>
								
								<c:choose>
									<c:when test="${RecommendProductwishList != 'N' }">
										<c:choose>
											<c:when test="${product.cartType == 'wish'}">
												<div class="bd-highlight btn btn-sm btn-link btn_product btn_wish ${product.productId}" onclick="btn_wishYN('${product.productId}')" style="width: 40px;">
													<img class="icon_wish ${product.productId}" data-value="Y" src="${contextPath }/resources/img/heart-fill.svg" alt="">
												</div>
											</c:when>
											<c:otherwise>
												<div class="bd-highlight btn btn-sm btn-link btn_product btn_wish ${product.productId}" onclick="btn_wishYN('${product.productId}')" style="width: 40px;">
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
	</section>

	<!-- 상세설명란 -->
	<div class="py-5">
		<nav class="mb-4">
			<div class="d-flex justify-content-center">
				<div class="nav nav-tabs" id="nav-tab" role="tablist">
					<a class="nav-item nav-link active" id="nav-home-tab" data-toggle="tab" href="#nav-home" role="tab" aria-controls="nav-home" aria-selected="true">상품 상세정보</a> 
					<a class="nav-item nav-link" id="nav-profile-tab" data-toggle="tab" href="#nav-profile" role="tab" aria-controls="nav-profile" aria-selected="false">구매 가이드</a> 
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
					<div class="d-flex justify-content-center">
						<div  class="bd-highlight d-flex flex-column text-center rounded py-3" style="max-width: 1060px;">
							<!-- 결제 정보 -->
							<div class="mb-1" style="font-size: 1.1rem; font-weight: bold;">
								[상품 결제정보] 
							</div>
							<div style="opacity: .6;">
								고액결제의 경우 안전을 위해 카드사에서 확인전화를 드릴 수도 있습니다.<br>
								확인과정에서 도난 카드의 사용이나 타인 명의의 주문등 정상적인 주문이<br> 
								아니라고 판단될 경우 임의로 주문을 보류 또는 취소할 수 있습니다.
								<br> <br> 
								무통장 입금은 상품 구매 대금은 PC뱅킹, 인터넷뱅킹, 텔레뱅킹 혹은 가까운 은행에서 직접 입금하시면 됩니다.<br> 
								주문시 입력한 입금자명과 실제입금자의 성명이 반드시 일치하여야 하며,<br> 
								7일 이내로 입금을 하셔야 하며 입금되지 않은 주문은 자동취소 됩니다.<br> <br>
							</div>
							<!-- 배송 안내 -->
							<div class="mb-1" style="font-size: 1.1rem; font-weight: bold;">
								[배송 안내]
							</div>
							<div style="opacity: .6;">
								- 그린케이스는 우체국택배를 이용하며, 출고 이후 1-3일의 배송일이 소요됩니다. (주말제외)
								<br>
								- 산간지역이나 도서지방은 별도의 추가금액을 지불하셔야 하는 경우가 있습니다.<br> 
								고객님께서 주문하신 상품은 입금 확인후 배송해 드립니다.<br> 
								다만, 상품종류에 따라서 상품의 배송이 다소 지연될 수 있습니다.<br> <br>
							</div>

							<!-- 교환 및 반품 안내 -->
							<div class="mb-1" style="font-size: 1.1rem; font-weight: bold;">
								[교환 및 반품 안내]
							</div>
							<div style="opacity: .6;">
								교환 및 반품이 가능한 경우<br> - 업체측의 오배송 / 불량상품
								수령시 교환 및 반품이 가능합니다.<br> (불량 사유가 아닌 경우 : 1. 각 기종별 사출(공케이스)을
								달리 사용함으로서 동일한 프린팅에도 미세한 색감차이가 발생할 수 있습니다.<br> 2. 곡선(카메라,
								옆면)은 열처리로 인하여 발생하는 폰케이스 안쪽의 잉크스밈이 발생할 수 있습니다.<br> 3. 주문확인 후
								1:1 수작업으로 제작이 되기에 중앙에서 1-3mm의 이미지 오차가 생길 수 있습니다.<br> 4. 미세한
								먼지(작은점 포함)와 스크래치는 공정상 발생할 수 있으며, 필름지 찍힘은 불량에 해당되지 않습니다.<br>
								5. 전사 특성상 색상이 늘어지는 현상 및 연해지는 현상이 일어날 수 있으며, 모서리 부분 색이 입혀지지 않은 것은
								불량이 아닙니다.)<br> <br> 교환 및 반품이 불가능한 경우<br> - 모든 주문건은
								주문제작으로 진행이 되기에 제작에 들어간 이후 교환 및 환불이 어렵습니다.<br> - 고객님의 사용 또는
								일부 소비에 의하여 상품의 가치가 현저히 감소한 경우 교환 및 환불이 어렵습니다.<br> - 시간의 경과에
								의하여 재판매가 곤란할 정도로 상품등의 가치가 현저히 감소한 경우 교환 및 환불이 어렵습니다.<br><br> -
								불량사유에 해당되지 않는 경우<br> (불량 사유가 아닌 경우 : 1. 각 기종별 사출(공케이스)을 달리
								사용함으로서 동일한 프린팅에도 미세한 색감차이가 발생할 수 있습니다.<br> 2. 곡선(카메라, 옆면)은
								열처리로 인하여 발생하는 폰케이스 안쪽의 잉크스밈이 발생할 수 있습니다.<br> 3. 주문확인 후 1:1
								수작업으로 제작이 되기에 중앙에서 1-3mm의 이미지 오차가 생길 수 있습니다.<br> 4. 미세한
								먼지(작은점 포함)와 스크래치는 공정상 발생할 수 있으며, 필름지 찍힘은 불량에 해당되지 않습니다.<br>
								5. 전사 특성상 색상이 늘어지는 현상 및 연해지는 현상이 일어날 수 있으며, 모서리 부분 색이 입혀지지 않은 것은
								불량이 아닙니다.)<br> - 고객의 단순변심 혹은 주문실수(옵션선택)에 의한 교환 및 환불은 어렵습니다.<br>
								<br>
							</div>

							<!-- 기타 안내 -->
							<div class="mb-1" style="font-size: 1.1rem; font-weight: bold;">
								[기타 안내]
							</div>
							<div style="opacity: .6;">
								언제나 성심성의껏 답해드리겠습니다!<br> 저희 그린케이스를 찾아주셔서
								감사합니다~ :D
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</main>

<!-- 장바구니 -->
<script type="text/javascript">
document.addEventListener('keydown', function(event) {
	  if (event.keyCode === 13) {
	    event.preventDefault();
	  };
	}, true);
	
	
	//로딩시 금액 입력
	window.onload = function(){

		var discountYN =  '${prodList.discountYN}';

		if(discountYN == "Y"){
			var discount_O =  ${prodList.discount};
			var price_O =  ${prodList.price};
			var discount =  discount_O.toLocaleString();
			var price =  price_O.toLocaleString();

			document.getElementById('discount').value = discount+" 원";
			document.getElementById('price').value = price+" 원";

			document.getElementById('discount_V').value = discount_O;
			document.getElementById('price_V').value = price_O;
		}else if(discountYN == "N"){
			var price_O =  ${prodList.price};
			var price =  price_O.toLocaleString();;
			document.getElementById('price').value = price+" 원";
			document.getElementById('price_V').value = price_O;
		}

		var shipTotal_O = 2500;
		var shipTotal =  shipTotal_O.toLocaleString();
		document.getElementById('shipTotal').value = shipTotal+" 원";
		document.getElementById('shipTotal_V').value = shipTotal_O;

		
	}

	function cart_checkform() {
		alert("해당 상품을 장바구니에 담았습니다!");
	}
	
	//옵션 js 
	var optionList = document.getElementById('p_optionList');
	optionList.addEventListener('change', function(){
		
		var optionId = document.getElementById('p_optionList').value.split("[^]")[0];
		var optionName = document.getElementById('p_optionList').value.split("[^]")[1];
		var optionCount = document.getElementById('p_optionList').value.split("[^]")[2];
		var totalStock = Number(document.getElementById('inputCount').innerText);
		var totalPrice = Number(document.getElementById('inputPriceTotal').innerText);

		var discountYN = '${prodList.discountYN}';

		if (discountYN == "Y") {
			var price = ${ prodList.discount };
			var priceText = price.toLocaleString();
			
		} else if (discountYN == "N") {
			var price = ${ prodList.price };
			var priceText = price.toLocaleString();
		}


		var src = '';
		var src = document.createElement("tr");
		src.id = "optionId_"+optionId;
		src.setAttribute('class', 'optionList');

		var listCount = document.getElementsByClassName('optionList').length;

		if(document.getElementById('p_optionList').value == "null" || document.getElementById("optionId_" + optionId) != null){
			return false;
		}else if(document.getElementById("optionId_" + optionId) == null){
			src.innerHTML = '<td class="text-left align-middle p-2">\
			<input type="text" class="form-control" name="p_optionId[' + listCount +']" value="'+ optionId + '" style="display:none;">\
			<input type="text" class="form-control inputReadonly" id="p_option_'+ optionId +'" name="option[' + listCount +']" value="'+ optionName + '" readonly>\
			</td>\
			<td class="text-center align-middle p-2">\
			<div class="bd-highlight d-flex flex-row">\
			<input type="number" class="form-control totalCount" id="p_stock_'+optionId+'" name="stock[' + listCount +']" min="1" max="'+ optionCount + '" value="1">\
			<img class="icon_wish" data-value="Y" src="${contextPath }/resources/img/x-circle-fill.svg" onclick="optionDelete(\'optionId_'+optionId+'\')" style="width: 40px; padding: 6px; opacity: .6; cursor: pointer;">\
			</div>\
			</td>\
			<td class="text-center align-middle p-2">\
			'+ priceText+' <span>원</span>\
			</td>';
			totalStock += 1;
			totalPrice = price * totalStock;
			var totalPriceText = totalPrice.toLocaleString();
			document.getElementById('priceTotal').value = totalPrice;
		}
		

		document.getElementById('oderListBox').append(src);

		document.getElementById('inputCount').innerText = totalStock;
		document.getElementById('inputPriceTotal').innerText = totalPriceText;

		document.getElementById("p_stock_"+optionId).addEventListener('input', function(){
			var max_V = document.getElementById("p_stock_" + optionId).max;

			if(document.getElementById("p_stock_" + optionId).value > max_V){
				alert("\""+optionName + "\" 의 재고 수량은 \"" + max_V +"\" 개 입니다.");
				document.getElementById("p_stock_" + optionId).value = max_V;
			}

			priceChk(price);
		});
		
		
	});

	//옵션 삭제
	function optionDelete(id){
		document.getElementById(id).remove();

		var discountYN = '${prodList.discountYN}';

		if (discountYN == "Y") {
			var price = ${ prodList.discount };
			var priceText = price.toLocaleString();

		} else if (discountYN == "N") {
			var price = ${ prodList.price };
			var priceText = price.toLocaleString();
		}

		priceChk(price);
	};

	//토탈 가격 체크
	function priceChk(price){
		var totalCount = document.getElementsByClassName('totalCount');
		totalStock = 0;
		totalPrice = price;
		for (var i = 0; i < totalCount.length; i++) {
			totalStock += Number(totalCount[i].value);
		}

		totalPrice = totalPrice * totalStock;

		var totalPriceText = totalPrice.toLocaleString();

		document.getElementById('inputCount').innerText = totalStock;
		document.getElementById('inputPriceTotal').innerText = totalPriceText;

		document.getElementById('priceTotal').value = totalPrice;
	};


	 // 장바구니
	function fn_InsertCart() {
		var form = document.prodForm;

		if(formChk() == false){
			return false;
		}
		
		form.action = "${contextPath}/prodList/prodDetail/cartAdd.do";
		comSubmit.submit();
	}

	//바로구매
	function fn_ProdOrder(){
		var form = document.prodForm;

		if(formChk() == false){
			return false;
		}
		
		var optionList = document.getElementsByClassName('optionList');
        var choiceProductList = [];
        
        for(var i=0; i<optionList.length; i++){

			var p_optionId = optionList[i].id.split('_')[1];
            var choiceProduct = new Map(); 
            choiceProduct.set("p_optionId",p_optionId);
            choiceProduct.set("stock",document.getElementById("p_stock_"+p_optionId).value);
            choiceProductList.push(choiceProduct);
            
        }

		post_to_url("${contextPath}/product/productOrder.do", choiceProductList);
	}

	function post_to_url(path, params, method) {
        method = method || "post"; 
        var form = document.createElement("form");
        form.setAttribute("method", method);
        form.setAttribute("action", path);

        for(var i=0; i<params.length; i++){
            var hiddenField = document.createElement("input");
            hiddenField.setAttribute("type", "hidden");
            hiddenField.setAttribute("name", "p_optionId["+i+"]");
            hiddenField.setAttribute("value", params[i].get("p_optionId"));

            var hiddenField2 = document.createElement("input");
            hiddenField2.setAttribute("type", "hidden");
            hiddenField2.setAttribute("name", "stock[" + i + "]");
            hiddenField2.setAttribute("value", params[i].get("stock"));

            form.appendChild(hiddenField);
            form.appendChild(hiddenField2);

        }
        console.log(form);
        document.body.appendChild(form);
        form.submit();
    }
	
	function formChk(){
		var optionList = document.getElementsByClassName('optionList');

		if(optionList.length <= 0){
			alert("생상 및 기종을 선택해 주세요.")
			return false;
		}
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