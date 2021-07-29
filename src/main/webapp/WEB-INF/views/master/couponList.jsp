<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
request.setCharacterEncoding("UTF-8");
%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:choose>
	<c:when test="${param.addMsg != null }">
			<script>
				window.onload = function () {
					var addMsg ="${param.addMsg}";
					alert(addMsg);
				}
			</script>
	</c:when>
</c:choose>
<!-- 메인 -->

<main class="mainH">
	<div class="container py-1">
		<!-- 페이지 타이틀 부분 -->
		<div class="d-flex justify-content-between mt-5 mb-2">
			<div class="bd-highlight">
				<h4 class="page_title">쿠폰 목록</h4>
			</div>
			<div class="bd-highlight page_subtitle">
				<nav aria-label="breadcrumb">
					<ol class="breadcrumb p-0 bg bg-transparent">
						<li class="breadcrumb-item"><a href="${contextPath }/main.do">홈</a></li>
						<li class="breadcrumb-item active" aria-current="page">쿠폰 목록</li>
					</ol>
				</nav>
			</div>
		</div>
		<%-- 날짜로 검색하는게 있으면 좋을듯  --%>
		<table class="table table-hover m-0">
			<thead class=" border-bottom border-top bg-light">
				<tr>
					<th
						class="text-center border-bottom-0 align-middle border-top-0 px-1"
						style="width: 36px">
					</th>
					<th
						class="text-center border-bottom-0 align-middle border-top-0 px-1"
						style="width: 200px">쿠폰아이디</th>
					<th class="text-center border-bottom-0 border-top-0 px-2"
						style="width: auto">쿠폰명</th>
					<th class="text-center border-bottom-0 border-top-0 px-2"
						style="width: 100px">할인금액</th>
					<th class="text-center border-bottom-0 border-top-0 px-2"
						style="width: 160px">사용기간</th>
					<th class="text-center border-bottom-0 border-top-0 px-2"
						style="width: 150px">등록날짜</th>
					<th class="text-center border-bottom-0 border-top-0 px-2"
						style="width: 90px">상세정보</th>
				</tr>
			</thead>
			<tbody class="border-bottom">
				<c:forEach items="${couponList }" var="list">
					<tr id="${list.couponId }" class="">
						<td class="text-center align-middle align-middle px-1">
							<div>
								<c:choose>
									<c:when test="${list.useYN eq 'Y' }">
										<input class="checkbox" type='checkbox' name='useYN' value='Y' onclick="fn_useYNChk()" checked />
									</c:when>
									<c:when test="${list.useYN eq 'N' || list.showYN eq ''}">
										<input class="checkbox" type='checkbox' name='useYN' value='N' onclick="fn_useYNChk()" />
									</c:when>
								</c:choose>
							</div>
						</td>
						<td class="text-center align-middle align-middle px-1">
								${list.couponId }
						</td>
						<td class="text-center align-middle align-middle px-1 font-weight-bold">
								${list.couponName }
						</td>
						<c:choose>
							<c:when test="${list.discountType == 'normal' }">
								<td class="text-center align-middle align-middle px-1">
									<fmt:formatNumber value="${list.couponPay }" pattern="#,###" /><span>원</span>
								</td>
							</c:when>
							<c:when test="${list.discountType == 'percent' }">
								<td class="text-center align-middle align-middle px-1">
									${list.couponPay } <span>%</span>
								</td>
							</c:when>
						</c:choose>
						<c:choose>
							<c:when test="${list.couponPeroid_start != NULL }">
								<td class="text-center align-middle align-middle px-1" style="font-size: .8rem;">
									${list.couponPeroid_start } ~ ${list.couponPeroid_end }
								</td>
							</c:when>
							<c:otherwise>
								<td class="text-center align-middle align-middle px-1" style="font-size: .8rem;">
									미입력
								</td>
							</c:otherwise>
						</c:choose>
						
						<td class="text-center align-middle align-middle px-1" style="font-size: .8rem;">
								${list.couponDate }
						</td>
						<td class="text-center align-middle px-2">
							<div class="bd-highlight">
								<a
									href="${contextPath }/couponList/couponDetail.do${pageMaker.makeQueryPage(bList.IDX, pageMaker.cri.page) }&couponId=${list.couponId }">
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
					<form action="${contextPath }/couponList/search.do" method="GET"
						name="searchBox">
						<div class="form-row">
							<div class="form-group d-flex justify-content-start ">
								<select id="inputState" class="form-control form-control-sm"
									name="searchKeyWordOption" style="width: 98px;">
									<option value="couponName" selected>쿠폰명</option>
									<option value="couponId">쿠폰아이디</option>
								</select> <input class="form-control form-control-sm mx-2" type="text"
									placeholder="" name="keyWord">
								<button type="submit" class="btn btn-secondary btn-sm col-2"
									onclick="return search()">검색</button>
							</div>
						</div>
					</form>
				</div>
			</div>
			<div class="">
				<a class="" href="${contextPath }/couponList/add.do">
					<button type="button" class="btn btn-primary">쿠폰 등록</button>
				</a>
			</div>
		</div>

		<!-- 페이징 영역 -->
		<nav aria-label="Page navigation example row">
			<ul class="pagination d-flex justify-content-center">
				<c:if test="${pageMaker.prev }">
					<li class="page-item"><a class="page-link"
						href='<c:url value="/couponList.do?page=${pageMaker.startPage-1 }"/>'
						aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
					</a></li>
				</c:if>
				<c:forEach begin="${pageMaker.startPage }"
					end="${pageMaker.endPage }" var="pageNum">
					<li class="page-item"><a class="page-link"
						href='${contextPath }/couponList.do?page=${pageNum }'>${pageNum}</a>
					</li>
				</c:forEach>
				<c:if test="${pageMaker.next && pageMaker.endPage >0 }">
					<li class="page-item"><a class="page-link"
						href='<c:url value="/couponList.do?page=${pageMaker.endPage+1 }"/>'
						aria-label="Next"> <span aria-hidden="true">&raquo;</span>
					</a></li>
				</c:if>
			</ul>

		</nav>
	</div>
</main>

<script>
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
	
	function fn_useYNChk() {
		var couponId = event.currentTarget.parentNode.parentNode.parentNode.id;
		var useYNChk = event.currentTarget.value;
		var useYNChk_V;

		if (useYNChk == 'Y') {
			useYNChk_V = event.currentTarget.value = 'N';
		} else {
			useYNChk_V = event.currentTarget.value = 'Y';
		}
		$.ajax({
			type : "POST",
			async : true,
			url : "${contextPath}/couponList/useYNChk.do",
			dataType : "text",
			data : {
				id : couponId,
				value : useYNChk_V
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