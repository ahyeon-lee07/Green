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
				<h4>Q&A 상세</h4>
			</div>
			<div class="bd-highlight">
				<nav aria-label="breadcrumb">
					<ol class="breadcrumb p-0 bg bg-transparent">
						<li class="breadcrumb-item">
						<a href="${contextPath }/listQnA.do">Q&A</a></li>
						<li class="breadcrumb-item active" aria-current="page">Q&A 상세</li>
					</ol>
				</nav>
			</div>
		</div>
		<div class="row mb-4">
			<div class="col-12">
				<form name="frmArticle" method="post" action="${contextPath}"
					enctype="multipart/form-data">
					<div class="row border-bottom border-top d-flex bd-highlight py-2">
						<label for="inputTitle" class="bd-highlight col-form-label pl-2"
							style="width: 100px;">제목</label>
						<div class="flex-grow-1 bd-highlight pr-2">
							<input type=text value="${viewQnA.questionTitle }"
								class="form-control" name="questionTitle" id="questionTitle"
								disabled />
						</div>
					</div>
					<div class="row border-bottom py-2">
                        <div class="col p-0">
                            <div class="d-flex bd-highlight">
                                <label for="inputUser" class="bd-highlight col-form-label pl-2"
                                    style="width: 100px;">작성자</label>
                                <div class="flex-grow-1 bd-highlight pr-2">
                                    <input type="text" name="id" value="${viewQnA.id}"
                                        id="id" class="
                                        form-control" disabled />
                                </div>
                            </div>
                        </div>
                        <div class="col p-0">
                            <div class="d-flex bd-highlight">
                                <label for="inputDay" class="bd-highlight col-form-label pl-2"
                                    style="width: 100px;">작성일</label>
                                <div class="flex-grow-1 bd-highlight pr-2">
                                    <input type="text" value="<fmt:formatDate value="${viewQnA.questionDate}" />"
                                     class="
                                        form-control" disabled />
                                </div>
                            </div>
                        </div>
                    </div>
					<div class="row border-bottom p-2">
						<textarea class="form-control" rows="14" name="questionContent"
							id="questionContent" disabled>${viewQnA.questionContent }</textarea>
					</div>
					<div id="tr_btn_modify" align="center">
						<input type=button class="btn btn-outline-success btn-sm" value="수정"
							onClick="fn_modify_article(frmArticle)"> <input
							type=button class="btn btn-outline-danger btn-sm" value="취소"
							onClick="backToList(frmArticle)">
					</div>
					<div id="tr_btn">
						<div class="row justify-content-between my-3">
							<div class="">
								<c:if test="${member.id == viewQnA.id }">
									<button type="button" class="btn btn-outline-success btn-sm"
										onClick="fn_enable(this.form)">수정</button>
									<button type="button" class="btn btn-outline-danger btn-sm"
										onClick="fn_remove_article('${contextPath}/removeQnA.do', ${viewQnA.questionNum})">삭제</button>
								</c:if>
								<a class="" href="${contextPath }/listQnA.do">
									<button type="button" class="btn btn-outline-secondary btn-sm">목록</button>
									<input type="button" class="btn btn-outline-success btn-sm" value="답글쓰기"
									onClick="fn_reply_form('${isLogOn}','${contextPath }/QnA_reWrite.do', ${viewQnA.questionNum})">
								</a>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</main>

<style>
#tr_btn_modify {
	display: none;
}
</style>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
     function backToList(obj){
	    obj.action="${contextPath}/listQnA.do";
	    obj.submit();
     }
 
	 function fn_enable(obj){ // 수정하기 버튼
		 document.getElementById("questionTitle").disabled=false;
		 document.getElementById("questionContent").disabled=false;
		 document.getElementById("tr_btn_modify").style.display="block";
		 document.getElementById("tr_btn").style.display="none";
	 }
	 
	 function fn_modify_article(obj){	// 수정반영하기 버튼 
		 obj.action="${contextPath}/modQnA.do?questionNum=${viewQnA.questionNum}";
		 obj.submit();
	 }
	 
	 function fn_remove_article(url,questionNum){
		 var form = document.createElement("form");
		 form.setAttribute("method", "post");
		 form.setAttribute("action", url);
	     var articleNOInput = document.createElement("input");
	     articleNOInput.setAttribute("type","hidden");
	     articleNOInput.setAttribute("name","questionNum");
	     articleNOInput.setAttribute("value", questionNum);
		 
	     form.appendChild(articleNOInput);
	     document.body.appendChild(form);
	     form.submit();
	 
	 }
	 
	 function fn_reply(isLogOn, url, parentNO) {
		 if(isLogOn != )
	 }
 </script>