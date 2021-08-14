<!--규찬2 희원2 상진6-->
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
				<h4 class="page_title">장바구니</h4>
			</div>
			<div class="bd-highlight page_subtitle">
				<nav aria-label="breadcrumb">
					<ol class="breadcrumb p-0 bg bg-transparent">
						<li class="breadcrumb-item"><a href="${contextPath }/main.do">홈</a></li>
						<li class="breadcrumb-item active" aria-current="page">장바구니</li>
					</ol>
				</nav>
			</div>
		</div>

		<div class="row" style="padding: 0 15px">
            <div class="col bg-light border rounded p-2">
                <c:choose>
                    <c:when test="${cartCount != '' }">
                        일반 상품 (<span id="cartCount">${cartCount }</span>)
                    </c:when>
                    <c:otherwise>
                        일반 상품 (<span id="cartCount">0</span>)
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
            
        <table class="table table-hover m-0 mt-2">
			<thead class=" border-bottom border-top bg-light">
                <tr>
                    <th class="text-center border-bottom-0 align-middle border-top-0 px-1" style="width: 28px">
                        <div>
                            <input type='checkbox' name='selectall' value='selectall' onclick='selectAll(this)' />
                        </div>
                    </th>
                    <th class="text-center border-bottom-0 border-top-0 px-2" style="width: 140px">이미지</th>
                    <th class="text-center border-bottom-0 border-top-0 px-2" style="width: auto">상품 정보</th>
                    <th class="text-center border-bottom-0 border-top-0 px-2" style="width: 80px">판매가</th>
                    <th class="text-center border-bottom-0 border-top-0 px-2" style="width: 80px">수량</th>
                    <th class="text-center border-bottom-0 border-top-0 px-2" style="width: 66px">적립금</th>
                    <th class="text-center border-bottom-0 border-top-0 px-2" style="width: 90px">배송구분</th>
                    <th class="text-center border-bottom-0 border-top-0 px-2" style="width: 98px">배송비</th>
                    <th class="text-center border-bottom-0 border-top-0 px-2" style="width: 100px">합계</th>
                    <th class="text-center border-bottom-0 border-top-0 px-2" style="width: 90px">선택</th>
                </tr>
            </thead>
           
            <tbody>
                <c:if test="${empty cartList }">
                	<tr>
                		<th class="text-center align-middle align-middle px-1"></th>
                	</tr>
                </c:if>
            	<c:forEach items="${cartList}" var="cartList" varStatus="indexNum">
            		<tr id="${cartList.s_optionId }">
                        <th style="display: none;">
                            <input type="text" name="optionId[${indexNum.index}]" value="${cartList.s_optionId }" >
                        </th>
            			<th class="text-center align-middle align-middle px-1">
	                        <div style="height: 14px;">
	                            <input type='checkbox' name='Choice' value='Choice1' onclick='checkSelectAll()'/>
	                        </div>
                    	</th>
                    	
                    	<c:forEach items="${cartList.product }" var="product">
	                    	<td class="text-center align-middle px-2">            
	                    		<img src="${contextPath }/resources/img/${product.p_group }/${product.imgURL }"  class="img-thumbnail" alt="#">
	                    	</td>
	                    	<td class="align-middle align-middle px-2 ">
		                        <div class="font-weight-bold pb-1 bd-highlight">
		                            <a href="${contextPath}/prodList/prodDetail.do${pageMaker.makeQueryPage(bList.IDX, pageMaker.cri.page) }&productId=${cartList.productId}" style="color: black">
		                                ${product.productName }
		                             </a>
		                        </div>
		                        <div class="bd-highlight">
		                            ${cartList.p_option }
		                        </div>
		                    </td>
		                    <td class="text-center align-middle px-1">
								<c:choose>
									<c:when test="${product.discountYN == 'Y'}">
                                        <input type="text" class="discountYN" value="${product.discountYN}" style="display: none;">
										<div class="bd-highlight text-black-50 discountBox" style="font-size:.9rem;">
											<fmt:formatNumber value="${product.price}" pattern="##,###" /><span>원</span>	
                                            <input type="text" class="price" name="price" value="${product.price}" style="display: none;">	
										</div>
										<div class="bd-highlight text-danger font-weight-bold">
											<fmt:formatNumber value="${product.discount}" pattern="##,###" /><span>원</span>	
                                            <input type="text" class="discount" name="discount" value="${product.discount}" style="display: none;">	
										</div>
									</c:when>
									<c:otherwise>
                                        <input type="text" class="discountYN" value="${product.discountYN}" style="display: none;">
										<div class="bd-highlight text-danger font-weight-bold">
											<fmt:formatNumber value="${product.price}" pattern="##,###" /><span>원</span>	
                                            <input type="text" class="price" name="price" value="${product.price}" style="display: none;">
                                            <input type="text" class="discount" name="discount" value="${product.discount}" style="display: none;">
										</div>
									</c:otherwise>
								</c:choose>
							</td>
							<td class="text-center align-middle px-2">
		                        <input type="number" class="form-control s_stockBox" name="s_stock[${indexNum.index}]" data-index="${indexNum.index}" step="1" value="${cartList.s_stock}" min="1" max="${cartList.p_stock}">
		                    </td>
		                    <td class="text-center align-middle px-2">
                                <input type="text" class="form-control inputBoxReadonly" name="productMileage[${indexNum.index}]"  value="${product.productMileage}" style="padding: 0; border: 0; text-align: center;" readonly>
		                    </td>
		                    <td class="text-center align-middle px-2" style="font-size: .8rem;">
		                    	기본 배송
		                    </td>
		                    <td class="text-center align-middle px-2">
		                    	<input type="text" class="form-control inputReadonly shipTotalList" value="" readonly>
							    <input type="text" class="shipTotal_V_List" name="shipTotal" value="" style="display: none;">
		                    </td>
		                    <td class="text-center align-middle px-2 total">
		                    	
		                    </td>
		                    <td class="text-center align-middle px-2">
		                        <div class="bd-highlight mb-2">
		                            <button type="button" class="btn btn-sm btn-outline-secondary"
		                                style="font-size: 0.7rem; width: 100%;">주문하기</button>
		                        </div>
		                        <div class="bd-highlight">
		                            <button type="button" class="btn btn-outline-danger btn-sm" onclick="return cartDelete('${cartList.s_optionId }')"
		                                style="font-size: 0.7rem; width: 100%;">삭제</button>
		                        </div>
                    		</td>
                    	</c:forEach>
            		</tr>
            	</c:forEach>           
            </tbody>        
        </table>

        <div class="row" style="padding: 0 15px">
            <div class="col bg-light border rounded p-2">
                <div class="d-flex justify-content-between">
                    <div class="bd-highlight">[기본 배송]</div>
                    <div class="bd-highlight">상품 구매금액(<span class="totalBoxPrice"></span>)+배송비(<span class="totalBoxShip"></span>)-상품 할인금액(<span class="totalBoxDiscount"></span>)=합계:(<span class="duePayment"></span>)원
                    </div>
                </div>
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
                                <span class="totalBoxPrice"></span> 원
                            </div>
                        </div>
                    </div>
                    <div class="col-3 border border-left-0">
                        <div class="row text-center bg-light p-3 border-bottom">
                            <div class="col ">총 배송비</div>
                         </div>
                         <div class="row text-center font-weight-bold p-4">
                             <div class="col">
                                 + <span class="totalBoxShip"></span> 원
                             </div>
                         </div>
                    </div>
                    <div class="col-3 border border-left-0">
                        <div class="row text-center bg-light p-3 border-bottom">
                            <div class="col">총 할인금액</div>
                         </div>
                         <div class="row text-center font-weight-bold p-4">
                             <div class="col">
                                 - <span class="totalBoxDiscount"></span> 원
                             </div>
                         </div>
                    </div>
                    <div class="col-4 border border-left-0" >
                        <div class="row text-center bg-light p-3 border-bottom">
                            <div class="col">결제예정금액</div>
                         </div>
                         <div class="row text-center font-weight-bold p-4">
                             <div class="col">
                                 = <span class="duePayment"></span> 원
                             </div>
                         </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col">
                <div class="d-flex justify-content-between bd-highlight">
                    <div class=" bd-highlight">
                        <a class="" href="${contextPath }/main.do"><button type="button" class="btn btn-outline-secondary">쇼핑 계속하기</button></a>
                    </div>
                    <div class="d-flex flex-row">
                        <div class="px-2 bd-highlight">
                            <button type="button" class="btn btn-outline-success" onclick="return productOrder()">선택 상품주문</button>
                       </div>
                       <div class=" bd-highlight">
                            <a class="" href="${contextPath }/orderList.do"><button type="button" class="btn btn-success">전체 상품주문</button></a>
                       </div>
                    </div>
                   
                </div>
            </div>
        </div>

        <div class="row my-5" style="padding: 0 15px">
            <div class="col border">
                <div class="row py-2 bg-light border-bottom">
                    <div class="col">이용 안내</div>
                </div>
                <div class="row">
                    <div class="col pb-4">
                        <div class="bd-highlight mt-4 mb-2">장바구니 이용안내</div>
                        <div class="bd-highlight text-black-50" style="font-size: .8rem;">
                            <p class="m-0">
                                1. 해외배송 상품과 국내배송 상품은 함께 결제하실 수 없으니 장바구니 별로 따로 결제해 주시기 바랍니다.
                            </p>
                            <p class="m-0">
                                2. 해외배송 가능 상품의 경우 국내배송 장바구니에 담았다가 해외배송 장바구니로 이동하여 결제하실 수 있습니다.
                            </p>
                            <p class="m-0">
                                3. [쇼핑계속하기] 버튼을 누르시면 쇼핑을 계속 하실 수 있습니다.
                            </p>
                            <p class="m-0">
                                4. 장바구니와 관심상품을 이용하여 원하시는 상품만 주문하거나 관심상품으로 등록하실 수 있습니다.
                            </p>
                            <p class="m-0">
                                5. 파일첨부 옵션은 동일상품을 장바구니에 추가할 경우 마지막에 업로드 한 파일로 교체됩니다.
                            </p>
                        </div>

                        <div class="bd-highlight mt-4 mb-2">무이자할부 이용안내</div>
                        <div class="bd-highlight text-black-50" style="font-size: .8rem;">
                            <p class="m-0">
                                1. 상품별 무이자할부 혜택을 받으시려면 무이자할부 상품만 선택하여 [주문하기] 버튼을 눌러 주문/결제 하시면 됩니다.
                            </p>
                            <p class="m-0">
                                2. [전체 상품 주문] 버튼을 누르시면 장바구니의 구분없이 선택된 모든 상품에 대한 주문/결제가 이루어집니다.
                            </p>
                            <p class="m-0">
                                3. 단, 전체 상품을 주문/결제하실 경우, 상품별 무이자할부 혜택을 받으실 수 없습니다.
                            </p>
                            <p class="m-0">
                                4. 무이자할부 상품은 장바구니에서 별도 무이자할부 상품 영역에 표시되어, 무이자할부 상품 기준으로 배송비가 표시됩니다.
                                실제 배송비는 함께 주문하는 상품에 따라 적용되오니 주문서 하단의 배송비 정보를 참고해주시기 바랍니다.
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
		
	</div>
</main>


<script>
//전체 선택 
function checkSelectAll()  {
	  // 전체 체크박스
	  const checkboxes 
	    = document.querySelectorAll('input[name="Choice"]');
	  // 선택된 체크박스
	  const checked 
	    = document.querySelectorAll('input[name="Choice"]:checked');
	  // select all 체크박스
	  const selectAll 
	    = document.querySelector('input[name="selectall"]');
	  
	  if(checkboxes.length === checked.length)  {
	    selectAll.checked = true;
	  }else {
	    selectAll.checked = false;
	  }

	}

	function selectAll(selectAll)  {
	  const checkboxes 
	     = document.getElementsByName('Choice');
	  
	  checkboxes.forEach((checkbox) => {
	    checkbox.checked = selectAll.checked
	  })
	}

    //로딩시 금액 입력
    window.onload = function(){

        var shipTotal_O = 2500;
        var shipTotal =  shipTotal_O.toLocaleString();
        
        var shipTotalList = document.getElementsByClassName('shipTotalList');
        var shipTotal_V_List = document.getElementsByClassName('shipTotal_V_List');

        var totalBoxShip = document.getElementsByClassName('totalBoxShip');

        for(var i=0; i<shipTotalList.length; i++){
            shipTotalList[i].value = shipTotal+"원";
            shipTotal_V_List[i].value = shipTotal;
        }

        for (var i = 0; i < totalBoxShip.length; i++) {
            totalBoxShip[i].innerText = shipTotal;
        }
    
        totalChk();
        totalBoxChk();
    }

    //수량 클릭시 합계 변경
    function totalChk() {

        var s_stockBox = document.getElementsByClassName('s_stockBox');
        var totalList = document.getElementsByClassName('total');

        for(var i=0; i<s_stockBox.length; i++){

            totalList[i].innerText = (s_stockBox[i].value * discountYNCHk(i)).toLocaleString()+ "원";

            s_stockBox[i].addEventListener('change', function(){

                var max_V = event.target.max;
                if(event.target.value > max_V){
				    alert("재고 수량은 \"" + max_V +"\" 개 입니다.");
				    event.target.value = max_V;
			    }

                var Num = event.target.dataset['index'];

                var price = discountYNCHk(Num);

                var stock_V = event.target.value;
                var total_V = stock_V * price;
                var total_V_Text = total_V.toLocaleString();

                var optionId = event.target.parentNode.parentNode.id;

                totalList[Num].innerText = total_V_Text + "원";
                totalBoxChk();
                stockChange(optionId, stock_V);
            });
        }

    }

    //가격 체크 
    function discountYNCHk(NUM){
        var discountYN = document.getElementsByClassName('discountYN')[NUM].value;

            if(discountYN == "Y"){
                var price = document.getElementsByClassName('discount')[NUM].value;
            }else{
                var price = document.getElementsByClassName('price')[NUM].value;
            }

            return price;
    };


    //장바구니리스트 삭제
    function cartDelete(optionId){
        if (confirm("해당 상품을 장바구니에서 삭제 하시겠습니까?") == true) {
            var optionId = optionId;

            document.location.href = "${contextPath}/cartList/cartDelete.do?optionId="+optionId;
		} else {
			return;
		}
    };

    //총 금액 세팅 
    function totalBoxChk(){
        var s_stockBox = document.getElementsByClassName('s_stockBox');
        var totalBoxPrice = document.getElementsByClassName('totalBoxPrice');
        var totalBoxDiscount = document.getElementsByClassName('totalBoxDiscount');
        var duePayment = document.getElementsByClassName('duePayment');
        var totalProductPrice = 0;
        
        var price = document.getElementsByClassName('price');
        var totalPrice = 0;

        var shipTotal_O = 2500;

        for (var i = 0; i < price.length; i++) {
            totalPrice += (s_stockBox[i].value * price[i].value);
        }

        for (var i = 0; i < s_stockBox.length; i++) {
           totalProductPrice += (s_stockBox[i].value * discountYNCHk(i));
        }

        for (var i = 0; i < totalBoxPrice.length; i++) {
            totalBoxPrice[i].innerText = totalPrice.toLocaleString();
        }

        for (var i = 0; i < totalBoxDiscount.length; i++) {
            totalBoxDiscount[i].innerText = (totalPrice - totalProductPrice).toLocaleString();
        }

        for (var i = 0; i < duePayment.length; i++) {
            duePayment[i].innerText = (totalPrice + shipTotal_O - (totalPrice - totalProductPrice)).toLocaleString();
        }
    };

    //장바구니 수량 변경
    function stockChange(optionId, stockCount){
							
	    $.ajax({
		    type: "POST",
		    async: true,
		    url: "${contextPath}/cartList/stockChange.do",
		    dataType: "text",
		    data: { optionId: optionId, stockCount: stockCount },

		    success: function (result) {
		    
		    },
		    error: function (data, textStatus) {

		    },
	        complete: function (data, textStatus) {

		    }
	    });
	};

    //선택상품 주문 s_stockBox
    function productOrder(){
        
        var checkList = document.getElementsByName('Choice');
        var choiceProductList = [];
        

        for(var i=0; i<checkList.length; i++){
            if(checkList[i].checked){

                var choiceProduct = new Map(); 
                choiceProduct.set("p_optionId",checkList[i].parentElement.parentElement.parentElement.id);
                choiceProduct.set("stock",document.getElementsByClassName('s_stockBox')[i].value);
                choiceProductList.push(choiceProduct);
            }
        }

        if(choiceProductList.length == 0){
            alert("한개 이상은 상품을 선택해야 합니다.");
            return false;
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


    

</script>