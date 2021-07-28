<!--상진8 규찬2-->
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
				<h4 class="page_title">상품등록</h4>
			</div>
			<div class="bd-highlight page_subtitle">
				<nav aria-label="breadcrumb">
					<ol class="breadcrumb p-0 bg bg-transparent">
						<li class="breadcrumb-item"><a href="${contextPath }/main.do">홈</a></li>
						<li class="breadcrumb-item active" aria-current="page">상품등록</li>
					</ol>
				</nav>
			</div>
		</div>

		<!-- 필터영역 -->
		<form action="${contextPath }/productList.do" method="GET"
			name="productlist">
			<div class="d-flex justify-content-start border-bottom mt-2">
				<div class="bd-highlight btn-group btn-group-toggle mb-2"
					data-toggle="buttons" onclick="listFilter()">
					<label class="btn btn-outline-secondary"> <input
						type="radio" name="options" id="option1" value="" checked>
						All
					</label> <label class="btn btn-outline-secondary"> <input
						type="radio" name="options" id="option2" value="hard">
						hard
					</label> <label class="btn btn-outline-secondary"> <input
						type="radio" name="options" id="option3" value="gel"> gel
					</label> <label class="btn btn-outline-secondary"> <input
						type="radio" name="options" id="option4" value="card">
						card
					</label> <label class="btn btn-outline-secondary"> <input
						type="radio" name="options" id="option5" value="airPods">
						airPods
					</label> <label class="btn btn-outline-secondary"> <input
						type="radio" name="options" id="option6" value="buds">
						buds
					</label> <label class="btn btn-outline-secondary"> <input
						type="radio" name="options" id="option7" value="keyring">
						keyring
					</label> <label class="btn btn-outline-secondary"> <input
						type="radio" name="options" id="option8" value="smart">
						smart
					</label>
				</div>
			</div>
		</form>
		<c:choose>
			<c:when test="${options != null}">
				<div id="filterV" style="display: none">${options }</div>
			</c:when>
		</c:choose>

		<table class="table table-hover m-0">
			<thead class=" border-bottom-0 bg-light">
				<tr>
					<th
						class="text-center border-bottom-0 align-middle border-top-0 px-1"
						style="width: 36px">
						<div>
							<!-- <input type='checkbox' name='selectall' value='selectall'
													onclick='selectAll(this)' /> -->
						</div>
					</th>
					<th class="text-center border-bottom-0 border-top-0 px-2"
						style="width: 120px">이미지</th>
					<th class="text-center border-bottom-0 border-top-0 px-2"
						style="width: 86px">상품구분</th>
					<th class="text-center border-bottom-0 border-top-0 px-2"
						style="width: auto">상품 정보</th>
					<th class="text-center border-bottom-0 border-top-0 px-2"
						style="width: 76px">판매가</th>
					<th class="text-center border-bottom-0 border-top-0 px-2"
						style="width: 66px">적립금</th>
					<th class="text-center border-bottom-0 border-top-0 px-2"
						style="width: 90px">상세정보</th>
				</tr>
			</thead>
			<tbody class="border-bottom">
				<c:forEach items="${list }" var="list">
					<tr id="${list.productId }" class="">
						<td class="text-center align-middle align-middle px-1">
							<div>
								<c:choose>
									<c:when test="${list.showYN eq 'Y' }">
										<input class="checkbox" type='checkbox' name='Choice'
											value='Y' onclick="fn_showYNChk()" checked />
									</c:when>
									<c:when test="${list.showYN eq 'N' || list.showYN eq ''}">
										<input class="checkbox" type='checkbox' name='Choice'
											value='N' onclick="fn_showYNChk()" />
									</c:when>
								</c:choose>
							</div>
						</td>
						<td class="text-center align-middle px-2"><img
							src="${contextPath}/resources/img/${list.p_group }/${list.imgURL }"
							class="img-thumbnail" alt="#"></td>
						<td class="text-center align-middle px-2">${list.p_group }</td>
						<td class="align-middle flex-column">
							<div class="font-weight-bold pb-1 bd-highlight">
								${list.productName }</div> <!-- 상품 옵션 --> <c:forEach
								items="${optionList }" var="optionList1">
								<c:forEach items="${optionList1 }" var="optionList"
									varStatus="Num">
									<c:if test="${list.productId eq optionList.productId}">
										<div class="bd-highlight">
											${Num.count}. ${optionList.p_option } <span class="pl-4">재고:
												${optionList.p_stock } 개</span>
										</div>
									</c:if>
								</c:forEach>
							</c:forEach>
						</td>
						<!-- 판매가 discountYN 여부에 따라 할인 가격 표시  -->
						<td class="text-center align-middle px-2"><c:choose>
								<c:when test="${list.discountYN =='Y'}">
									<div class="discountBox">
										<fmt:formatNumber value="${list.price }" pattern="#,###" />
										<span class="discountBox text-danger"> <fmt:formatNumber
												value="${list.discount }" pattern="#,###" />
										</span>
									</div>
								</c:when>
								<c:otherwise>
									<fmt:formatNumber value="${list.price }" pattern="#,###" />
								</c:otherwise>
							</c:choose></td>
						<td class="text-center align-middle px-2"
							style="font-size: .8rem;">${list.productMileage }</td>
						<td class="text-center align-middle px-2">
							<div class="bd-highlight">
								<a
									href="${contextPath }/productList/productDetail_M.do${pageMaker.makeQueryPage(bList.IDX, pageMaker.cri.page) }&productId=${list.productId }&options=${options }">
									<button type="button" class="btn btn-outline-secondary btn-sm"
										style="font-size: 0.7rem; width: 100%; display: block;">상세정보</button>
								</a>
							</div>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

		<!-- 검색 및 등록 버튼 영역 -->
		<div class="row justify-content-between px-3 mt-3">
			<div class="">
				<div class="btn-group">
					<form action="${contextPath }/productList/search.do" method="GET"
						name="searchBox">
						<div class="form-row">
							<div class="form-group d-flex justify-content-start ">
								<select id="inputState" class="form-control form-control-sm" name="searchKeyWordOption" style="width: 90px;">
									<option value="productName" selected>상품명</option>
								</select> <input class="form-control form-control-sm mx-2" type="text" placeholder="" name="keyWord">
								<button type="submit" class="btn btn-secondary btn-sm col-2" onclick="return search()">검색</button>
							</div>
						</div>
						<input type="text" name="searchOptions" value="${options }" style="display: none">
					</form>
				</div>
			</div>
			<div class="">
				<a class="" href="${contextPath }/addProduct.do">
					<button type="button" class="btn btn-primary">상품 등록하기</button>
				</a>
			</div>
		</div>

		<!-- 페이징 영역 -->
		<nav aria-label="Page navigation example row">
			<ul class="pagination d-flex justify-content-center">
				<c:if test="${pageMaker.prev }">
					<li class="page-item"><a class="page-link"
						href='<c:url value="/board/boardList?page=${pageMaker.startPage-1 }"/>'
						aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
					</a></li>
				</c:if>
				<!-- ${contextPath }/productListTest.do?page=${pageNum }"/> <c:url value="/productListTest.do?page=${pageNum }"/>-->
				<c:forEach begin="${pageMaker.startPage }"
					end="${pageMaker.endPage }" var="pageNum">
					<li class="page-item"><a class="page-link"
						href='${contextPath }/productList.do?page=${pageNum }&options=${options }'>${pageNum}</a>
					</li>
				</c:forEach>
				<c:if test="${pageMaker.next && pageMaker.endPage >0 }">
					<li class="page-item"><a class="page-link"
						href='<c:url value="/board/boardList?page=${pageMaker.endPage+1 }"/>'
						aria-label="Next"> <span aria-hidden="true">&raquo;</span>
					</a></li>
				</c:if>
			</ul>

		</nav>
	</div>
</main>

<script>
	//필터 버튼 활성화 처리
	window.onload = function() {
		var filterV = document.getElementById('filterV').innerText;
		var optins = document.getElementsByName('options');

		for (var i = 0; i < optins.length; i++) {
			var optin = optins[i];
			optin.parentNode.setAttribute('class', 'btn btn-outline-secondary');
			if (optin.value == filterV) {
				optin.parentNode.setAttribute('class',
						'btn btn-outline-secondary active');
				optin.checked = true;
			}
		}

	}

	//필터 form 전송
	function listFilter() {
		var form = document.productlist;
		form.submit();
	}

	//검색
	function search() {
		var form = document.searchBox;

		if (form.keyWord.value == "") {
			alert("키워드를 입력해주세요.");
			return false;
		} else {
			form.submit();
		}
	}

	function fn_showYNChk() {
		var productId = event.currentTarget.parentNode.parentNode.parentNode.id;
		var showYNChk = event.currentTarget.value;
		var showYNChk_V;
		if (showYNChk == 'Y') {
			showYNChk_V = event.currentTarget.value = 'N';
		} else {
			showYNChk_V = event.currentTarget.value = 'Y';
		}
		$.ajax({
			type : "POST",
			async : true,
			url : "${contextPath}/productList/showYNChk.do",
			dataType : "text",
			data : {
				id : productId,
				value : showYNChk_V
			},
			success : function(data, textStatus) {

			},
			error : function(data, textStatus) {

			},
			complete : function(data, textStatus) {

			}
		});

	}
</script>