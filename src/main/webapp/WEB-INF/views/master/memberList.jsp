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
		<div class="d-flex justify-content-between mt-5 mb-2">
			<div class="bd-highlight">
				<h4 class="page_title">회원 관리</h4>
			</div>
			<div class="bd-highlight page_subtitle">
				<nav aria-label="breadcrumb">
					<ol class="breadcrumb p-0 bg bg-transparent">
						<li class="breadcrumb-item"><a href="${contextPath }/main.do">홈</a></li>
						<li class="breadcrumb-item active" aria-current="page">회원 관리</li>
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
						style="width: 100px">회원권한</th>
					<th class="text-center border-bottom-0 border-top-0 px-2"
						style="width: 170px">ID</th>
					<th class="text-center border-bottom-0 border-top-0 px-2"
						style="width: 150px">이름</th>
					<th class="text-center border-bottom-0 border-top-0 px-2"
						style="width: auto">이메일</th>
					<th class="text-center border-bottom-0 border-top-0 px-2"
						style="width: 90px">회원등급</th>
					<th class="text-center border-bottom-0 border-top-0 px-2"
						style="width: 90px">적립금</th>
					<th class="text-center border-bottom-0 border-top-0 px-2"
						style="width: 150px">가입날짜</th>
					<th class="text-center border-bottom-0 border-top-0 px-2"
						style="width: 90px">상세정보</th>
				</tr>
			</thead>
			<tbody class="border-bottom">
				<c:forEach items="${list }" var="list">
					<tr id="${list.id }" class="">
						<td class="text-center align-middle align-middle px-1"><c:choose>
								<c:when test="${list.masterYN == 'M'}">
									<div class="text-primary">관리자</div>
								</c:when>
								<c:otherwise>
									<div></div>
								</c:otherwise>
							</c:choose></td>
						<td class="text-center align-middle px-2"><c:choose>
								<c:when test="${list.pw == '$2a$10$/1H.vjB3Wl9GtF5YfTDoF.4/SuH/Vty7.g.7cXnLhqZjCwYT8tnSq'}">
									<div class="text-black-50">SNS 가입 회원</div>
								</c:when>
								<c:otherwise>
									<div class="font-weight-bold pb-1 bd-highlight">
										${list.id }</div>
								</c:otherwise>
							</c:choose></td>
						<td class="text-center align-middle flex-column">
							<div>${list.name }</div>
						</td>
						<td class="text-center align-middle flex-column">
							<div>${list.email1 }@${list.email2 }</div>
						</td>
						<td class="text-center align-middle flex-column"
							style="font-size: .8rem;">
							<div>
								<c:choose>
									<c:when test="${list.grade == 'new' }">
																신규
														</c:when>
									<c:when test="${list.grade == 'gold' }">
																골드
														</c:when>
								</c:choose>
							</div>
						</td>
						<td class="text-center align-middle px-2"
							style="font-size: .8rem;">${list.mileage }</td>
						<td class="text-center align-middle px-2"
							style="font-size: .8rem;">${list.joinDate }</td>
						<td class="text-center align-middle px-2">
							<div class="bd-highlight">
								<a
									href="${contextPath }/memberList/memberEdit.do${pageMaker.makeQueryPage(bList.IDX, pageMaker.cri.page) }&productId=${list.id }&options=${options }">
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
					<form action="${contextPath }/memberList/search.do" method="GET"
						name="searchBox">
						<div class="form-row">
							<div class="form-group d-flex justify-content-start ">
								<select id="inputState" class="form-control form-control-sm"
									name="searchKeyWordOption" style="width: 98px;">
									<option value="name" selected>이름</option>
									<option value="id">아이디</option>
								</select> <input class="form-control form-control-sm mx-2" type="text"
									placeholder="" name="keyWord">
								<button type="submit" class="btn btn-secondary btn-sm col-2"
									onclick="return search()">검색</button>
							</div>
						</div>
						<input type="text" name="searchOptions" value="${options }"
							style="display: none">
					</form>
				</div>
			</div>
		</div>

		<!-- 페이징 영역 -->
		<nav aria-label="Page navigation example row">
			<ul class="pagination d-flex justify-content-center">
				<c:if test="${pageMaker.prev }">
					<li class="page-item"><a class="page-link"
						href='<c:url value="/memberList.do?page=${pageMaker.startPage-1 }"/>'
						aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
					</a></li>
				</c:if>
				<c:forEach begin="${pageMaker.startPage }"
					end="${pageMaker.endPage }" var="pageNum">
					<li class="page-item"><a class="page-link"
						href='${contextPath }/memberList.do?page=${pageNum }&options=${options }'>${pageNum}</a>
					</li>
				</c:forEach>
				<c:if test="${pageMaker.next && pageMaker.endPage >0 }">
					<li class="page-item"><a class="page-link"
						href='<c:url value="/memberList.do?page=${pageMaker.endPage+1 }"/>'
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
</script>