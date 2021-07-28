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
				<h4>Review 상세</h4>
			</div>
			<div class="bd-highlight">
				<nav aria-label="breadcrumb">
					<ol class="breadcrumb p-0 bg bg-transparent">
						<li class="breadcrumb-item"><a href="${contextPath }/listReview.do">Review</a></li>
						<li class="breadcrumb-item active" aria-current="page">Review 상세</li>
					</ol>
				</nav>
			</div>
		</div>

		<div class="row mb-4">
			<div class="col-12">
				<form name="frmArticle" method="post" action="${contextPath}"
					enctype="multipart/form-data">


					<div class="row border-bottom py-2">
						<div class="col p-0">
							<div class="d-flex bd-highlight">
								<label for="inputImgURL_product_M"
									class="bd-highlight col-form-label pl-2" style="width: 140px;">상품이미지</label>



							</div>
						</div>
						<label for="inputTitle" class="bd-highlight col-form-label pl-2"
							style="width: 100px;">상품정보</label>
						<div class="flex-grow-1 bd-highlight pr-2">
							<input type="text" id="productId" value="${viewReview.productId}"
								class="
								form-control" readonly>
						</div>
					</div>
					<div class="row border-bottom py-2">
						<div class="col p-0">
							<div class="d-flex bd-highlight">
								<label for="inputUser" class="bd-highlight col-form-label pl-2"
									style="width: 100px;">작성자</label>
								<div class="flex-grow-1 bd-highlight pr-2">
									<!-- <input type="text" id="id" value="${viewReview.id}"	class="form-control" readonly> -->
									<input type=text value="${viewReview.id }" name="id"
										class="form-control" readonly>
								</div>
							</div>
						</div>
						<div class="col p-0">
							<div class="d-flex bd-highlight">
								<label for="inputDay" class="bd-highlight col-form-label pl-2"
									style="width: 100px;">작성일</label>
								<div class="flex-grow-1 bd-highlight pr-2">
									<!--  <input type="text" id="reviewDate" value="${viewReview.reviewDate}" class="form-control" readonly>-->
									<input type=text
										value="<fmt:formatDate value="${viewReview.reviewDate}" />"
										class="form-control" readonly>
								</div>
							</div>
						</div>
					</div>
					<div class="row border-bottom p-2">
						<textarea class="form-control" name="reviewContent"
							id="reviewContent" rows="14" disabled>${viewReview.reviewContent}</textarea>
					</div>
					<table border=0 align="center">
						<tr id="tr_btn_modify" align="center">
							<td colspan="2">
							<input type=button value="수정" onClick="fn_modify_article(frmArticle)">
							<input type=button value="취소" onClick="backToList(frmArticle)">
							</td>
						</tr>
					</table>
				</form>
			</div>
		</div>
		<div class="row justify-content-between my-3">
			<div class="">
				<c:if test="${member.id == viewReview.id }">
					<button type="button" class="btn btn-outline-success btn-sm"
						onClick="fn_enable(this.form)">수정</button>
					<button type="button" class="btn btn-outline-danger btn-sm"
						onClick="fn_remove_article('${contextPath}/removeReview.do', ${viewReview.reviewNum})">삭제</button>
				</c:if>
				<a class="" href="${contextPath }/listReview.do">
					<button type="button" class="btn btn-outline-secondary btn-sm">목록</button>
				</a>
				<button type="button" class="btn btn-outline-success btn-sm"
					onClick="fn_reply_form('${contextPath}/replyForm.do', ${viewReview.reviewNum})">답글쓰기</button>
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
	    obj.action="${contextPath}/listReview.do";
	    obj.submit();
     }
 
	 function fn_enable(obj){	//수정하기 누르면 화면 전환.
		 document.getElementById("productId").disabled=false;
		 document.getElementById("id").disabled=false;
		 document.getElementById("reviewDate").disabled=false;
		 document.getElementById("tr_btn_modify").style.display="block"; // 수정하기 클릭후 나오는 
		 document.getElementById("tr_btn").style.display="none"; // 글상세페이지
	 }
	 
	 function fn_modify_article(obj){	// 수정반영하기
		 obj.action="${contextPath}/modReview.do";
		 obj.submit();
	 }
	 
	 function fn_remove_article(url,reviewNum){
		 var form = document.createElement("form");
		 form.setAttribute("method", "post");
		 form.setAttribute("action", url);
	     var articleNOInput = document.createElement("input");
	     articleNOInput.setAttribute("type","text");
	     articleNOInput.setAttribute("name","reviewNum");
	     articleNOInput.setAttribute("value", reviewNum);
		 
	     form.appendChild(articleNOInput);
	     document.body.appendChild(form);
	     form.submit();
	 }
	 
	 function fn_reply_form(url, reviewNum){	// 답글쓰기
		 var form = document.createElement("form");
		 form.setAttribute("method", "post");
		 form.setAttribute("action", url);
	     var parentNOInput = document.createElement("input");
	     parentNOInput.setAttribute("type","text");
	     parentNOInput.setAttribute("name","reviewNum");
	     parentNOInput.setAttribute("value", reviewNum);
		 
	     form.appendChild(parentNOInput);
	     document.body.appendChild(form);
		 form.submit();
	 }
	 
 </script>