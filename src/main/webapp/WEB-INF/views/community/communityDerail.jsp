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
<c:choose>
	<c:when test="${community.id == member.id}">
		<c:set var="inputBoxReadonly" value=""/>
		<c:set var="readonly" value=""/>
	</c:when>
	<c:otherwise>
		<c:set var="inputBoxReadonly" value="inputBoxReadonly"/>
		<c:set var="readonly" value="readonly"/>
	</c:otherwise>
</c:choose>
<!-- 메인  -->
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
		<div class="row mb-4 mt-2">
			<div class="col-12">
				<c:choose>
					<c:when test="${community.id == member.id}">
						<form action="${contextPath }/community/edit.do?communityType=${communityType}&communityNum=${community.num }" name="community" method="POST">
					</c:when>
					<c:otherwise>
						<form action="" name="community" method="POST">
					</c:otherwise>
				</c:choose>
				
				<c:choose>
					<c:when test="${communityType == 'qna' }">
						<div class="row border-bottom border-top border-bottom-0 d-flex bd-highlight py-2">
							<label for="inputTitle" class="bd-highlight col-form-label pl-2" style="width: 100px;">QnA 구분</label>
							<c:choose>
								<c:when test="${community.productId != null }">
									<select id="inputState" class="form-control form-control-sm mr-3 ${inputBoxReadonly }"  style="width: 100px; height: 38px" ${readonly }>
										<option value="nomal" >기타문의</option>
										<option value="product" selected>상품관련</option>
									</select>
									<c:if test="${community.id == member.id}">
										<button id="btn_product" type="button" class="btn btn-secondary mr-3" onclick="productSearch()" style="display: block">상품검색</button>
									</c:if>
									<input id="product_Input_name"  type="text" class="form-control" value="${community.productName }" style="display: block; width: 50%;" readonly>
									<input id="product_Input_id" type="text" class="form-control ${inputBoxReadonly }" name="productId" value="${community.productId }" style="display: none;">
								</c:when>
								<c:otherwise>
									<select id="inputState" class="form-control form-control-sm mr-2  ${inputBoxReadonly }"  style="width: 100px; height: 38px" ${readonly }>
										<option value="nomal" selected>기타문의</option>
										<option value="product" >상품관련</option>
									</select>
									<c:if test="${community.id == member.id}">
										<button id="btn_product" type="button" class="btn btn-secondary mr-2" onclick="productSearch()" style="display: none">상품검색</button>
									</c:if>
									<input id="product_Input_name"  type="text" class="form-control" value="" style="display: none; width: 50%;" readonly>
									<input id="product_Input_id" type="text" class="form-control" name="productId" value="" style="display: none;">
								</c:otherwise>
							</c:choose>
						</div>
					</c:when>
				</c:choose>
					
					<div class="row border-bottom border-top d-flex bd-highlight py-2">
						<label for="inputTitle" class="bd-highlight col-form-label pl-2" style="width: 100px;">제목</label>
						<div class="flex-grow-1 bd-highlight pr-2">
							<input type="text" class="form-control ${inputBoxReadonly }" id="title" name="title" value="${community.title }" ${readonly }>
						</div>
					</div>
					<div class="row border-bottom d-flex py-2">
						<div class="d-flex bd-highlight">
							<label for="inputUser" class="bd-highlight col-form-label pl-2" style="width: 100px;">작성자</label>
							<div class="flex-grow-1 bd-highlight pr-2">
								<input type="text" class="form-control inputBoxReadonly" id="id" name="id" value="${community.id}" readonly>
							</div>
						</div>
						<c:choose>
							<c:when test="${communityType == 'qna' }">
								<c:if test="${community.id == member.id}">
									<div class="d-flex bd-highlight ml-4">
										<label for="inputPwYN" class="bd-highlight col-form-label pl-2" style="width: 140px;">비밀글 설정</label>
										<div class="d-flex flex-row bd-highlight pr-2">
											<c:choose>
												<c:when test="${community.pwYN == 'Y' }">
													<div class="custom-control custom-switch pt-2">
														<input type="checkbox" class="custom-control-input YNChk" id="inputPwYN" value="Y" checked> 
														<input id="pwYN_V" class="input_V" type="text" name="pwYN" value="Y" style=" display: none;"> 
														<label id="inputPwYNLabel" class="custom-control-label" for="inputPwYN" style="width: 70px;">비밀글</label>
													</div>
													<div class="bd-highlight pr-2" id="pwBox" style="display: block;">
														<input type="text" class="form-control" id="exampleInputPassword1" name="questionPw" maxlength="4" value="${community.questionPw}">
													</div>
												</c:when>
												<c:otherwise>
													<div class="custom-control custom-switch pt-2">
														<input type="checkbox" class="custom-control-input YNChk" id="inputPwYN" value="N" > 
														<input id="pwYN_V" class="input_V" type="text" name="pwYN" value="N" style="display: none;"> 
														<label id="inputPwYNLabel" class="custom-control-label" for="inputPwYN" style="width: 70px;">공개글</label>
													</div>
													<div class="bd-highlight pr-2" id="pwBox" style="display: none;">
														<input type="text" class="form-control" id="exampleInputPassword1" name="questionPw" maxlength="4">
													</div>
												</c:otherwise>
											</c:choose>
										</div>
									</div>
								</c:if>
						</c:when>
						</c:choose>
						
					</div>
					<div class="row border-bottom d-flex bd-highlight py-2">
						<label for="content" class="bd-highlight col-form-label pl-2" style="width: 100px;">내용</label>
						<div class="flex-grow-1 bd-highlight pr-2">
							<textarea class="form-control ${inputBoxReadonly }" id="content" name="content" rows="14" ${readonly }>${community.content } </textarea>
						</div>
						
					</div>
				</form>
			</div>
		</div>
		
		<div class="row mb-4">
			<div  id="commentBox" class="col-12 p-0">
				<c:forEach items="${commentList }" var="commentList">
					<div class="d-flex justify-content-between border-top border-dark py-2 mt-3">
						<div class="d-flex bd-highlight">
							<label for="commentId" class="bd-highlight col-form-label pl-2" style="width: 100px;">작성자</label>
							<div class="d-flex flex-row bd-highlight pr-2">
								<input type="text" class="form-control inputBoxReadonly" id="" name="" value="${commentList.id }" style="width: 160px;" readonly> <span class="pt-2" style="font-size: .8rem">${commentList.commentDate }</span>
							</div>
						</div>
						<div class="d-flex bd-highlight">
							<c:if test="${commentList.id == member.id}">
								<button type="button" class="btn btn-outline-danger ml-3" onclick="return commentDelete('${commentList.commentNum}')">삭제</button>
							</c:if>
						</div>
					</div>
					<div class="border-bottom border-top d-flex bd-highlight py-2">
						<label for="commentContent" class="bd-highlight col-form-label pl-2" style="width: 100px;">내용</label>

						<c:choose>
							<c:when test="${commentList.id == member.id }">
								<div class="flex-grow-1 bd-highlight pr-2">
									<textarea class="form-control inputBoxReadonly" id="" name="commentContent" rows="2" readonly>${commentList.commentContent}</textarea>
								</div>
							</c:when>
							<c:otherwise>
								<div class="flex-grow-1 bd-highlight pr-2">
									<textarea class="form-control inputBoxReadonly" id="" name="commentContent" rows="2" readonly>${commentList.commentContent}</textarea>
								</div>
							</c:otherwise>
						</c:choose>
						
					</div>
				</c:forEach>

			</div>
		</div>
		
		<div class="row justify-content-between mb-5">
			<div class="">
				<a class="" href="${contextPath }/community.do${pageMaker.makeQueryPage(bList.IDX, pageMaker.cri.page) }&communityType=${communityType}">
					<button type="button" class="btn btn-secondary">목록</button>
				</a>
			</div>
			<div class="text-center d-flex justify-content-end">
				<c:choose>
					<c:when test="${community.id == member.id}">
						<a href="#" onclick="communityDelete()">
							<button type="button" class="btn bg-danger text-white" >삭제 </button>
						</a>
						<button type="submit" class="btn btn-success ml-3" onclick="return checkEdit()">수정</button>
						<c:if test="${pageTitle == 'QnA' }">
							<button type="button" class="btn btn-secondary ml-3" onclick="return commentEdit()">댓글</button>
						</c:if>
					</c:when>
					<c:when test="${member.id != null}">
						<c:if test="${pageTitle == 'QnA' }">
							<button type="button" class="btn btn-secondary ml-3" onclick="return commentEdit()">댓글</button>
						</c:if>
	`				</c:when>
				</c:choose>
			</div>
		</div>
	</div>
</main>


<script>
	//글 삭제
	function communityDelete(){
			if(confirm("정말 삭제 하시겠습니까?") == true){
				location.href = "${contextPath }/community/delete.do?communityType=${communityType}&communityNum=${community.num }";
				return true;
			}else {
				return false;
			}
		};

	//댓글 폼
	function commentEdit(){
		var newComment = document.getElementById("newComment");
		var str = '';

		if(newComment == null){
			var plusUl = document.createElement('div');
             plusUl.id = "newComment";
             plusUl.setAttribute('class', 'd-flex flex-column bd-highlight border-top border-dark mt-3');

								 
			str += '<div class="d-flex justify-content-between border-bottom py-2">';
			str += '<div class="d-flex bd-highlight">';
			str += '<label for="commentId" class="bd-highlight col-form-label pl-2" style="width: 100px;">작성자</label>';
			str += '<div class="bd-highlight pr-2">';
			str += '<input type="text" class="form-control inputBoxReadonly" id="commentId" name="commentId" value="${member.id}" readonly>';
			str += '</div></div>';
			str += '<div class="d-flex bd-highlight">';
			str += '<button type="button" class="btn btn-primary ml-3" onclick="commentAdd()">등록</button>';
			str += '<button type="button" class="btn btn-secondary ml-3" onclick="commentClose()">닫기</button>';
			str += '</div></div>';
			str += '<div class="border-bottom d-flex bd-highlight py-2">';
			str += '<label for="commentContent" class="bd-highlight col-form-label pl-2" style="width: 100px;">내용</label>';
			str += '<div class="flex-grow-1 bd-highlight pr-2">';
			str += '<textarea class="form-control" id="commentContent" name="commentContent" rows="2" ></textarea>';
			str += '</div></div>';

			plusUl.innerHTML = str;

			document.getElementById("commentBox").append(plusUl);

		}else{
			return false;
		}
	};

	function commentClose(){
		document.getElementById('newComment').remove();
	}

	//댓글
	function commentAdd(){
		var id = document.getElementById('commentId').value;
		var qnANum = "'"+${community.num}+"'";
		var commentContent = document.getElementById('commentContent').value;

		$.ajax({
			type : "POST",
			async : true,
			url : "${contextPath}/communityDerail/commentAdd.do",
			dataType : "json",
			data : {
				id : id,
				qnANum : qnANum,
				commentContent : commentContent
			},
			success : function(commentList) {

				var memberId = '${member.id}';
			
				commentListBox(commentList, memberId);
			},
			error : function(data, textStatus) {

			},
			complete : function(data, textStatus) {

			}
		});

	};

	

	//댓글 삭제
	function commentDelete(num){
		if(confirm("정말 삭제 하시겠습니까?") == true){

			var qnANum = "'"+${community.num}+"'";

			$.ajax({
				type : "POST",
				async : true,
				url : "${contextPath}/communityDerail/commentDelete.do",
				dataType : "json",
				data : {
					qnANum : qnANum,
					num: num
				},
				success : function(commentList) {

					var memberId = '${member.id}';

					commentListBox(commentList, memberId);
				},
				error : function(data, textStatus) {

				},
				complete : function(data, textStatus) {

				}
			});




			}else {
				return false;
			}

	};

	//댓글 폼
	function commentListBox(commentList, memberId){
		var str = '';
		for(var i=0; i<commentList.length; i ++){


		var timestamp = commentList[i]["commentDate"];
		var date = new Date(timestamp);
		var dateTime = (date.getFullYear()+ "-"+(date.getMonth()+1)+  "-"+date.getDate()+  " "+date.getHours()+ ":"+date.getMinutes()+  ":"+date.getSeconds());
								
			str += '<div class="d-flex flex-column bd-highlight border-top border-dark mt-3">';
			str += '<div class="d-flex justify-content-between border-dark py-2">';
			str += '<div class="d-flex bd-highlight">';
			str += '<label for="commentId" class="bd-highlight col-form-label pl-2" style="width: 100px;">작성자</label>';
			str += '<div class="d-flex flex-row bd-highlight pr-2">';
			str += '<input type="text" class="form-control inputBoxReadonly" id="" name="" style="width: 160px;" value="'+commentList[i]["id"]+'" readonly><span class="pt-2" style="font-size: .8rem">'+dateTime+'</span>';
			str += '</div></div>';
			str += '<div class="d-flex bd-highlight">';

			if(commentList[i]["id"] == memberId){
				str += '<button type="button" class="btn btn-outline-danger ml-3" onclick="commentDelete(\''+commentList[i]["commentNum"]+'\')">삭제</button>';
			}
			str += '</div></div>';
			str += '<div class="border-bottom border-top d-flex bd-highlight py-2">';
			str += '<label for="commentContent" class="bd-highlight col-form-label pl-2" style="width: 100px;">내용</label>';
			str += '<div class="flex-grow-1 bd-highlight pr-2">';

			if(commentList[i]["id"] == memberId){
				str += '<textarea class="form-control inputBoxReadonly" id="" name="commentContent" rows="2" readonly>'+commentList[i]["commentContent"]+'</textarea>';
			}else{
				str += '<textarea class="form-control inputBoxReadonly" id="" name="commentContent" rows="2" readonly>'+commentList[i]["commentContent"]+'</textarea>';
			}
			
			str += '</div></div></div>';
		}
		document.getElementById("commentBox").innerHTML = str;
	}

	<c:if test="${communityType == 'qna' }">
		//Qna 구분
		var inputState = document.getElementById('inputState');
		inputState.addEventListener('change', function(){
			
			var inputState_V = inputState.value;
			var btn_product = document.getElementById('btn_product');
			var product_Input = document.getElementById('product_Input_name');
			
			if(inputState_V == "nomal") {
				btn_product.value = '';
				product_Input.value = '';
				
				btn_product.style.display = "none";
				product_Input.style.display = "none";
			}else if(inputState_V == "product"){
				btn_product.style.display = "block";
				product_Input.style.display = "block";
			}
		});
		
		//상품 검색
		function productSearch(){
			window.open("${contextPath }/productSearch.do", "productSearch", "width=800px, height=500px, left=100, top=50");
		}
		
		//로딩시 스위치 YN 체크
		window.onload = function() {
			var YNChk = document.getElementsByClassName('YNChk');
			var input_V = document.getElementsByClassName('input_V');

			for (var i = 0; i <= YNChk.length; i++) {
				var Chk = YNChk[i];
				var IV = input_V[i];

				if (YNChk.value == "Y") {
					YNChk.value = "Y"
					IV.value = "Y"
				} else {
					YNChk.value = "N"
					YNChk.value = "N"
				}
			}
		};
		// 비밀글 여부 pwBox
		var showYN = document.getElementById('inputPwYN');
		if(showYN != null){
			
			showYN.addEventListener('click', function() {
				var showYN_V = showYN.value;
				var Label = document.getElementById('inputPwYNLabel');
				var V = document.getElementById('pwYN_V');
				var pwBox = document.getElementById('pwBox');

				if (showYN_V != "N") {
					showYN.value = "N";
					V.value = "N";
					Label.innerHTML = "공개글";
					pwBox.childNodes[1].value = '';
					pwBox.style.display = "none";
				} else {
					showYN.value = "Y";
					V.value = "Y";
					Label.innerHTML = "비밀글";
					pwBox.style.display = "block";
				}
			});
		}
	</c:if>
	

	

	function checkEdit() {
		var form = document.community;
		
		<c:if test="${communityType == 'qna' }">
		
			//숫자, 4~16자
			var pwExp = form.questionPw.value.search(/^[0-9]*$/);
			
			var inputState = document.getElementById('inputState').value;
			var product_Input_id = document.getElementById('product_Input_id').value;
			var pwYN_V = document.getElementById('pwYN_V').value;
	
			
			if(inputState == 'product' && product_Input_id.value == ''){
				alert('상품을 선택해 주세요.');
				return false;
			}
		</c:if>
		
		 
		if (form.title.value == "") {
			alert("제목을 입력해 주세요.");
			return false;
		} 

		<c:if test="${communityType == 'qna' }">
		else if (pwYN_V == "Y" && form.questionPw.value == '') {
			alert("비밀번호를 입력해주세요.");
			return false;
		} else if (pwExp) {
			alert("비밀번호는 숫자만 입력 가능 합니다.");
			return false;
		} 
		</c:if>

		else if (form.content.value == "") {
			alert("내용을 입력해 주세요.");
			return false;
		}else {
			form.submit();
		}
	};
</script>