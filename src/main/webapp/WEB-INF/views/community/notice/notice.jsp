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
<script>
	function fn_articleForm(isLogOn, addNewNotice, login) {
		if (isLogOn != '' && isLogOn != 'false') {
			location.href = addNewNotice;
		} else {
			alert("로그인 후 글쓰기가 가능합니다.")
			location.href = login + '?action=/addNewNotice.do';
		}
	}
</script>
<!-- 메인 -->
<main class="mainH">
	<div class="container py-1">
		<!-- 페이지 타이틀 부분 -->
		<div class="d-flex justify-content-between mt-5">
			<div class="bd-highlight">
				<h4>공지사항</h4>
			</div>
			<div class="bd-highlight">
				<nav aria-label="breadcrumb">
					<ol class="breadcrumb p-0 bg bg-transparent">
						<li class="breadcrumb-item active" aria-current="page">공지사항</li>
					</ol>
				</nav>
			</div>
		</div>

		<table class="table table-hover">
			<thead class="table-primary border-bottom-0">
				<tr>
					<th class="text-center border-bottom-0" style="width: 68px">번호</th>
					<th class="text-center border-bottom-0" style="width: auto">제목</th>
					<th class="text-center border-bottom-0" style="width: 100px">작성자</th>
					<th class="text-center border-bottom-0" style="width: 116px">작성일</th>

				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${listNotice ==null }">
						<tr height="10">
							<td colspan="4">
								<p align="center">
									<b><span style="font-size: 9pt;">등록된 글이 없습니다.</span></b>
								</p>
							</td>
						</tr>
					</c:when>
					<c:when test="${listNotice !=null }">
						<c:forEach var="listNotice" items="${listNotice}">
							<tr class="border-bottom ">
								<th class="text-center align-middle">${listNotice.noticeNum}</th>
								<td class="text-center align-middle"><a
									href="${contextPath }/viewNotice.do?noticeNum=${listNotice.noticeNum}">${listNotice.noticeTitle }</a></td>
								<td class="text-center align-middle">${listNotice.id }</td>
								<td class="text-center align-middle">${listNotice.noticeDate}</td>
							</tr>
						</c:forEach>
					</c:when>
				</c:choose>
			</tbody>
		</table>
		<div class="row justify-content-between px-4">
			<div class="">
				<div class="btn-group">
					<form action="#">
						<div class="form-row">
							<div class="form-group d-flex justify-content-start ">
								<select id="inputState" class="form-control form-control-sm"
									style="width: 90px;">
									<option selected>제목</option>
									<option selected>내용</option>
								</select> <input class="form-control form-control-sm mx-2" type="text"
									placeholder="">
								<button type="submit" class="btn btn-outline-secondary btn-sm col-2">검색</button>
							</div>
						</div>
					</form>
				</div>
			</div>
			<div class="">
				<a class=""
					href="javascript:fn_articleForm('${isLogOn}','${contextPath}/addNewNotice.do', 
                                                    '${contextPath}/login.do')"><button
						type="button" class="btn btn-outline-success btn-sm">글쓰기</button></a>
			</div>
		</div>
	</div>
	<nav aria-label="Page navigation example row">
		<ul class="pagination d-flex justify-content-center">
			<li class="page-item"><a class="page-link" href="#"
				aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
			</a></li>
			<li class="page-item"><a class="page-link" href="#">1</a></li>
			<li class="page-item"><a class="page-link" href="#">2</a></li>
			<li class="page-item"><a class="page-link" href="#">3</a></li>
			<li class="page-item"><a class="page-link" href="#"
				aria-label="Next"> <span aria-hidden="true">&raquo;</span>
			</a></li>
		</ul>
	</nav>
</main>