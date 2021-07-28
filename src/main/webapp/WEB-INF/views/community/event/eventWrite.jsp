<!-- 상진10 -->
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
				<h4>이벤트 게시판 글쓰기</h4>
			</div>
			<div class="bd-highlight">
				<nav aria-label="breadcrumb">
					<ol class="breadcrumb p-0 bg bg-transparent">
						<li class="breadcrumb-item"><a href="${contextPath}/eventList.do">이벤트 게시판</a></li>
						<li class="breadcrumb-item active" aria-current="page">이벤트 게시판 글쓰기</li>
					</ol>
				</nav>
			</div>
		</div>

		<div class="row mb-4">
            <div class="col-12">
                <form name="addNewEvent" method="post" action="${contextPath}/addNewEvent.do" enctype="multipart/form-data">
                    <div class="row border-bottom border-top d-flex bd-highlight py-2">
                        <label for="eventTitle" class="bd-highlight col-form-label pl-2" style="width: 100px;">제목</label>
                        <div class="flex-grow-1 bd-highlight pr-2">
                            <input type="text" id="eventTitle" class="form-control" name="eventTitle">
                        </div>
                    </div>
                    <div class="row border-bottom py-2">
                        <div class="col p-0">
                            <div class="d-flex bd-highlight">
                                <label for="inputUser" class="bd-highlight col-form-label pl-2"
                                    style="width: 100px;">작성자</label>
                                <div class="flex-grow-1 bd-highlight pr-2">
                                    <input type="text" class="form-control" id="inputUser" value="${member.id}" readonly>
                                </div>
                            </div>
                        </div>
                        <div class="col p-0">
                        </div>
                    </div>
                    <div class="row border-bottom p-2">
                        <textarea class="form-control" id="eventContent" name="eventContent" rows="14" maxlength="4000"></textarea>
                    </div>
                </form>
            </div>
        </div>
        <div class="row justify-content-between mb-5">
            <div class="">
            	<a class="" href="${contextPath}/eventList.do">
            		<button type="button" class="btn btn-outline-secondary btn-sm">목록</button>
            	</a>
            </div>
            <div class="">
				<div class="text-center">
					<button type="submit" class="btn btn-outline-success btn-sm"
						onclick="return check_add()">등록</button>
				</div>
			</div>
        </div>
	</div>
</main>

<!-- 등록 확인 팝업창 -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
function check_add() {
	var form = document.addNewEvent;

	//상품 옵션. 이미지 필수 체크 추가 되어야 함.(?)
	if (form.eventTitle.value == "") {
		alert("제목을 입력해 주세요.");
		return false;
	} else if (form.eventContent.value == "") {
		alert("내용을 입력해 주세요.");
		return false;
	} else {
		form.submit();
	}
}
</script>