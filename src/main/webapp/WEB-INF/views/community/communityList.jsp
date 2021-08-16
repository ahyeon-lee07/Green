<!--규찬9 상진1-->
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
		<table class="table table-hover m-0">
			<thead class=" border-bottom-0 border-top bg-light">
				<tr>
					<th class="text-center border-bottom-0 border-top-0 px-2" style="width: 68px">번호</th>
					<c:choose>
						<c:when test="${pageTitle == 'QnA' || pageTitle == '리뷰' }">
							<th class="text-center border-bottom-0 border-top-0 px-2" style="width: 140px">상품정보</th>
						</c:when>
					</c:choose>
					<c:choose>
						<c:when test="${pageTitle == 'QnA' }">
							<th class="text-center border-bottom-0 border-top-0 px-0" style="width: 26px"></th>
						</c:when>
					</c:choose>
					<th class="text-center border-bottom-0 border-top-0 px-2" style="width: auto">제목</th>
					<c:choose>
						<c:when test="${pageTitle == 'QnA' }">
							<th class="text-center border-bottom-0 border-top-0 px-1" style="width: 40px">댓글</th>
						</c:when>
					</c:choose>
					<th class="text-center border-bottom-0 border-top-0 px-2" style="width: 120px">작성자</th>
					<th class="text-center border-bottom-0 border-top-0 px-2" style="width: 120px">작성일</th>
					<th class="text-center border-bottom-0 border-top-0 px-2" style="width: 80px">조회수</th>
				</tr>
			</thead>
			<tbody class="border-bottom">
				<c:forEach items="${list }" var="list">
					<tr id="${list.num }" class="" style="font-size: .8rem; cursor:pointer;"  onclick="location.href='${contextPath}/communityDetail/detailPage.do${pageMaker.makeQueryPage(bList.IDX, pageMaker.cri.page) }&communityNum=${list.num }&communityType=${communityType }'" >
						<td class="text-center align-middle px-2">
							${list.num }
						</td>
						<c:choose>
							<c:when test="${pageTitle == 'QnA' || pageTitle == '리뷰' }">
								<c:choose>
									<c:when test="${list.imgURL != null }">
										<td class="text-center align-middle px-2">
											<img src="${contextPath}/resources/img/${list.p_group }/${list.imgURL }" class="img-thumbnail" alt="#">
										</td>
									</c:when>
									<c:otherwise>
										<td class="text-center align-middle px-2">
											기타문의
										</td>
									</c:otherwise>
								</c:choose>
							</c:when>
						</c:choose>
						<c:choose>
							<c:when test="${pageTitle == 'QnA'}">
								<c:choose>
									<c:when test="${list.pwYN == 'Y' }">
										<td class="text-center align-middle px-0">
											<img src="${contextPath}/resources/img/lock.svg"alt="#">
										</td>
									</c:when>
									<c:otherwise>
										<td class="text-center align-middle px-0">
										</td>
									</c:otherwise>
								</c:choose>
							</c:when>
						</c:choose>
						
						<td class="text-left align-middle px-2 font-weight-bold">
							<c:if test="${list.masterYN == 'Y'}">
								<img src="${contextPath }/resources/img/chat-dots.svg"> 
							</c:if>
							${list.title }
						</td>
						<c:if test="${pageTitle == 'QnA'}">
							<td class="text-center align-middle px-2">
								${list.commentCount }
							</td>
						</c:if>
						
						<td class="text-center align-middle px-2">
							${list.id }
						</td>
						<td class="text-center align-middle px-2" style="font-size: .8rem">
							${list.date }
						</td>
						<td class="text-center align-middle px-2" style="font-size: .8rem">
							${list.hits }
						</td>
					</tr>
				</c:forEach>
				
			
			</tbody>
		</table>

		<div class="row justify-content-between px-4 mt-3">
			<div class="">
				<div class="btn-group">
					<form action="${contextPath }/community/search.do" method="GET" name="searchBox">
						<div class="form-row">
							<div class="form-group d-flex justify-content-start ">
								<select id="inputState" class="form-control form-control-sm" name="searchKeyWordOption" style="width: 90px;">
									<option value="title" selected>제목</option>
									<option value="content" >내용</option>
								</select> 
								<input class="form-control form-control-sm mx-2" type="text" placeholder=""  name="keyWord">
								<button type="submit" class="btn btn-secondary btn-sm col-2" onclick="return search()">검색</button>
							</div>
						</div>
						<input type="text" name="communityType" value="${communityType }" style="display: none">
					</form>
				</div>
			</div>
			<c:choose>
				<c:when test="${member != null }">
					<c:choose>
						<c:when test="${communityType == 'qna' }">
							<div class="">
								<a class="" href="${contextPath }/community/communityAdd.do?communityType=${communityType }">
									<button type="button" class="btn btn-success btn-sm">글쓰기</button>
								</a>
							</div>
						</c:when>
						<c:when test="${communityType == 'notice' && member.masterYN == 'M' }">
							<div class="">
								<a class="" href="${contextPath }/community/communityAdd.do?communityType=${communityType }">
									<button type="button" class="btn btn-success btn-sm">글쓰기</button>
								</a>
							</div>
						</c:when>
						<c:when test="${communityType == 'event' && member.masterYN == 'M' }">
							<div class="">
								<a class="" href="${contextPath }/community/communityAdd.do?communityType=${communityType }">
									<button type="button" class="btn btn-success btn-sm">글쓰기</button>
								</a>
							</div>
						</c:when>
					</c:choose>
					
				</c:when>
			</c:choose>
			
		</div>

		<!-- 페이징 영역 -->
		<nav aria-label="Page navigation example row">
			<ul class="pagination d-flex justify-content-center">
				<c:if test="${pageMaker.prev }">
					<li class="page-item"><a class="page-link"
						href='<c:url value="${contextPath }/community.do?page=${pageMaker.startPage-1 }&communityType=${pageTitle }"/>'
						aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
					</a></li>
				</c:if>
				<c:forEach begin="${pageMaker.startPage }"
					end="${pageMaker.endPage }" var="pageNum">
					<li class="page-item"><a class="page-link"
						href='${contextPath }/community.do?page=${pageNum }&communityType=${pageTitle }'>${pageNum}</a>
					</li>
				</c:forEach>
				<c:if test="${pageMaker.next && pageMaker.endPage >0 }">
					<li class="page-item"><a class="page-link"
						href='<c:url value="${contextPath }/community.do?page=${pageMaker.endPage+1 }&communityType=${pageTitle }"/>'
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