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
				<h4>Q&A 수정/삭제</h4>
			</div>
			<div class="bd-highlight">
				<nav aria-label="breadcrumb">
					<ol class="breadcrumb p-0 bg bg-transparent">
						<li class="breadcrumb-item"><a href="${contextPath }/listQnA.do">Q&A</a></li>
						<li class="breadcrumb-item active" aria-current="page">Q&A 수정/삭제</li>
					</ol>
				</nav>
			</div>
		</div>

		<div class="row mb-4">
            <div class="col-12">
                <form action="#">
                    <div class="row border-bottom border-top d-flex bd-highlight py-2">
                        <label for="inputTitle" class="bd-highlight col-form-label pl-2"
                            style="width: 100px;">제목</label>
                        <div class="flex-grow-1 bd-highlight pr-2">
                            <input type="text" class="form-control" id="inputTitle">
                        </div>
                    </div>
                    <div class="row border-bottom py-2">
                        <div class="col p-0">
                            <div class="d-flex bd-highlight">
                                <label for="inputUser" class="bd-highlight col-form-label pl-2"
                                    style="width: 100px;">작성자</label>
                                <div class="flex-grow-1 bd-highlight pr-2">
                                    <input type="text" class="form-control" id="disabledinputUser" disabled>
                                </div>
                            </div>
                        </div>
                        <div class="col p-0">
                            <div class="d-flex bd-highlight">
                                <label for="inputDay" class="bd-highlight col-form-label pl-2"
                                    style="width: 100px;">작성일</label>
                                <div class="flex-grow-1 bd-highlight pr-2">
                                    <input type="text" class="form-control" id="inputDay">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row border-bottom py-2">
                        <label for="inputEmail" class="bd-highlight col-form-label pl-2"
                            style="width: 100px;">이메일</label>
                        <div class="flex-grow-1 bd-highlight pr-2">
                            <div class="d-flex flex-row">
                                <input type="email" class="form-control" id="inputEmail" style="width: 260px;">
                                <div class="p-2">
                                    @
                                </div>
                                <select id="inputState" class="form-control" style="width: 200px;">
                                    <option selected>선택</option>
                                    <option>naver.com</option>
                                    <option>hanmail.net</option>
                                    <option>nate.com</option>
                                    <option>gmail.com</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="row border-bottom p-2">
                        <textarea class="form-control" id="exampleFormControlTextarea1" rows="14"></textarea>
                    </div>

                    <div class="row border-bottom py-2">
                        <label for="inputCk" class="bd-highlight col-form-label pl-2"
                            style="width: 100px;">비밀글설정</label>
                        <div class="flex-grow-1 bd-highlight pr-2">
                            <div class="d-flex flex-row p-2">
                                <div class="custom-control custom-radio">
                                    <input id="credit" name="paymentMethod" type="radio" class="custom-control-input"
                                        checked="" required="">
                                    <label class="custom-control-label" for="credit">공개글</label>
                                </div>
                                <div class="custom-control custom-radio ml-3">
                                    <input id="debit" name="paymentMethod" type="radio" class="custom-control-input"
                                        required="">
                                    <label class="custom-control-label" for="debit">비밀글</label>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row border-bottom py-2">
                        <label for="exampleInputPassword1" class="bd-highlight col-form-label pl-2"
                            style="width: 100px;">비밀번호</label>
                        <div class="bd-highlight pr-2" style="">
                            <input type="password" class="form-control" id="exampleInputPassword1">
                        </div>
                    </div>

                </form>
            </div>
        </div>

        <div class="row justify-content-between mb-5">
            <div class="">
            	<a class="" href="${contextPath }/product.do">
            		<button type="button" class="btn btn-outline-secondary btn-sm">목록</button>
            	</a>	
            </div>
            <div class="">
            	<!-- Button trigger modal -->
				<button type="button" class="btn btn-outline-success btn-sm"
					data-toggle="modal" data-target="#complete">수정</button>

				<!-- Modal -->
				<div class="modal fade" id="complete" tabindex="-1" role="dialog"
					aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
					<div class="modal-dialog modal-dialog-centered" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="exampleModalCenterTitle">
									Q&A의 글을 작성 중입니다.<br>이대로 글을 수정하시겠습니까?
								</h5>
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<div class="modal-body">
								확인을 누르면 수정이 완료됩니다.<br> 글을 다시 작성하려면 취소를 눌러주세요.
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-outline-success btn-sm">확인</button>
								<button type="button" class="btn btn-outline-danger btn-sm"
									data-dismiss="modal">취소</button>
							</div>
						</div>
					</div>
				</div>
							
                <!-- Button trigger modal -->
				<button type="button" class="btn btn-outline-danger btn-sm"
					data-toggle="modal" data-target="#cancel">삭제</button>

				<!-- Modal -->
				<div class="modal fade" id="cancel" tabindex="-1" role="dialog"
					aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
					<div class="modal-dialog modal-dialog-centered" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="exampleModalCenterTitle">
									Q&A의 작성된 글입니다.<br>게시글을 삭제하시겠습니까?
								</h5>
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<div class="modal-body">
								확인을 누르면 게시글이 삭제됩니다.<br> 되돌아가려면 취소를 눌러주세요.
							</div>
							<div class="modal-footer">
								<a href="${contextPath }/product.do"><button type="button" class="btn btn-outline-success btn-sm">확인</button></a>
								<button type="button" class="btn btn-outline-danger btn-sm"
									data-dismiss="modal">취소</button>
							</div>
							</div>
							</div>
        </div>
		<a href="${contextPath }/product_in.do"><button type="button" class="btn btn-outline-danger btn-sm">취소</button></a>
	</div>
</main>

<!-- 유효성 검사 -->
<script type="text/javascript">
	function checkLogin() {
		var form = document.loginForm;
		if (form.password.value == "") {
			alert("비밀번호를 입력해주세요!");
			form.password.focus();
			return false;
		}
    }
</script>