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
	<div class="container">
		<!-- 페이지 타이틀 부분 -->
		<div class="d-flex justify-content-between mt-5">
			<div class="bd-highlight">
				<h4>장바구니</h4>
			</div>
			<div class="bd-highlight">
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
                일반 상품 (
                <span>1</span>
                )
            </div>
        </div>

        <table class="table table-hover m-0">
            <thead class=" border-bottom-0">
                <tr>
                    <th class="text-center border-bottom-0 align-middle border-top-0 px-1" style="width: 28px">
                        <div style="height: 14px;">
                            <input type='checkbox' name='selectall' value='selectall' onclick='selectAll(this)'/>
                        </div>
                    </th>
                    <th class="text-center border-bottom-0 border-top-0 px-2" style="width: 120px">이미지</th>
                    <th class="text-center border-bottom-0 border-top-0 px-2" style="width: auto">상품 정보</th>
                    <th class="text-center border-bottom-0 border-top-0 px-2" style="width: 76px">판매가</th>
                    <th class="text-center border-bottom-0 border-top-0 px-2" style="width: 116px">수량</th>
                    <th class="text-center border-bottom-0 border-top-0 px-2" style="width: 66px">적립금</th>
                    <th class="text-center border-bottom-0 border-top-0 px-2" style="width: 90px">배송 구분</th>
                    <th class="text-center border-bottom-0 border-top-0 px-2" style="width: 70px">배송비</th>
                    <th class="text-center border-bottom-0 border-top-0 px-2" style="width: 80px">합계</th>
                    <th class="text-center border-bottom-0 border-top-0 px-2" style="width: 114px">선택</th>
                </tr>
            </thead>
            <tbody>
                <tr class="">
                    <th class="text-center align-middle align-middle px-1">
                        <div style="height: 14px;">
                            <input type='checkbox' name='Choice' value='Choice1' onclick='checkSelectAll()'/>
                        </div>
                    </th>
                    <td class="text-center align-middle px-2"><img src="${contextPath }/resources/img/img.webp"
                            class="img-thumbnail" alt="#"></td>
                    <td class="align-middle pl-3">
                        <div class="row font-weight-bold pb-1">
                        <a href="${contextPath }/HardCaseDetail.do" style="color: black">
                            컬러칩 케이스</a>
                        </div>
                        <div class="row" style="font-size: .8rem;">
                            [옵션: 2. 옐로우/아이폰6(s)]
                        </div>
                    </td>
                    <td class="text-center align-middle px-1">12,000원</td>
                    <td class="text-center align-middle px-2">
                        <div class="d-flex flex-column bd-highlight px-2">
                            <div class="bd-highlight d-flex">
                                <div class="flex-grow bd-highlight pr-3">
                                <input type="number" class="form-control" id="inputnumber" step="1" value="1" min="1" max="99">
                                </div>
                            </div>
                            <div class="bd-highlight mt-1"><button type="button" class="btn btn-outline-secondary btn-sm" style="font-size: .6rem">변경</button></div>
                          </div>
                    </td>
                    <td class="text-center align-middle px-2" style="font-size: .8rem;">150</td>
                    <td class="text-center align-middle px-2">기본 배송</td>
                    <td class="text-center align-middle px-2">2,000원</td>
                    <td class="text-center align-middle px-2">11,000원</td>
                    <td class="text-center align-middle px-2 d-flex flex-column">
                        <div class="bd-highlight">
                        	<a class="btn btn-sm btn-outline-success" href="${contextPath}/orderList.do"
                            style="font-size: 0.7rem; width: 100%; display: block;">주문하기</a>
                        </div>
                        <div class="bd-highlight my-1">
                        	<a href="${contextPath}/wist_list.do">
                            <button type="button" class="btn btn-outline-success btn-sm" style="font-size: 0.7rem; width: 100%; display: block;">관심상품 등록</button></a>
                        </div>
                        <div class="bd-highlight">
                        	<a href="${contextPath}/cart.do">
                            <button type="button" class="btn btn-outline-danger btn-sm" style="font-size: 0.7rem; width: 100%; display: block;">삭제</button></a>
                        </div>
                    </td>
                </tr>
            </tbody>
        </table>

        <div class="row" style="padding: 0 15px">
            <div class="col bg-light border rounded p-2">
                <div class="d-flex justify-content-between">
                    <div class="bd-highlight">[기본 배송]</div>
                    <div class="bd-highlight">상품 구매금액(<span>12,000</span>)+배송비(<span>2,000</span>)-상품 할인금액(<span>3,000</span>)=합계:(<span>11,000</span>)원
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
                                <span>12,000</span> 원
                            </div>
                        </div>
                    </div>
                    <div class="col-3 border border-left-0">
                        <div class="row text-center bg-light p-3 border-bottom">
                            <div class="col">총 배송비</div>
                         </div>
                         <div class="row text-center font-weight-bold p-4">
                             <div class="col">
                                 + <span>2,000</span> 원
                             </div>
                         </div>
                    </div>
                    <div class="col-3 border border-left-0">
                        <div class="row text-center bg-light p-3 border-bottom" style="height: 57px;">
                            <div class="col">총 할인금액
                                <button type="button" class="btn btn-outline-secondary btn-sm ml-1">내역 보기</button>
                            </div>
                         </div>
                         <div class="row text-center font-weight-bold p-4">
                             <div class="col">
                                 - <span>3,000</span> 원
                             </div>
                         </div>
                    </div>
                    <div class="col-4 border border-left-0" >
                        <div class="row text-center bg-light p-3 border-bottom">
                            <div class="col">결제예정금액</div>
                         </div>
                         <div class="row text-center font-weight-bold p-4">
                             <div class="col">
                                 = <span>11,000</span> 원
                             </div>
                         </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col">
                <div class="d-flex flex-row-reverse bd-highlight">
                    <div class=" bd-highlight">
                        <a class="" href="${contextPath }/orderList.do"><button type="button" class="btn btn-outline-success">전체 상품주문</button></a>
                    </div>
                    <div class="px-3 bd-highlight">
                         <a class="" href="${contextPath }/orderList.do"><button type="button" class="btn btn-outline-success">선택 상품주문</button></a>
                    </div>
                    <div class=" bd-highlight">
                        <a class="" href="${contextPath }/main.do"><button type="button" class="btn btn-outline-secondary">쇼핑 계속하기</button></a>
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

<!-- 전체 선택  -->
<script>
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
</script>