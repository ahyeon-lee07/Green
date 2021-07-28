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
				<h4>Review 댓글</h4>
			</div>
			<div class="bd-highlight">
				<nav aria-label="breadcrumb">
					<ol class="breadcrumb p-0 bg bg-transparent">
						<li class="breadcrumb-item"><a href="${contextPath }/listReview.do">Review</a></li>
						<li class="breadcrumb-item active" aria-current="page">Review 댓글</li>
					</ol>
				</nav>
			</div>
		</div>

		<div class="row mb-4">
            <div class="col-12">
                <form action="#">
                    <div class="row border-bottom border-top d-flex bd-highlight py-2">
                        <label for="inputTitle" class="bd-highlight col-form-label pl-2" style="width: 100px;">제목</label>
                        <div class="flex-grow-1 bd-highlight pr-2">
                            <input type="email" class="form-control" id="inputTitle" readonly>
                        </div>
                    </div>
                    <div class="row border-bottom py-2">
                        <div class="col p-0">
                            <div class="d-flex bd-highlight">
                                <label for="inputUser" class="bd-highlight col-form-label pl-2"
                                    style="width: 100px;">작성자</label>
                                <div class="flex-grow-1 bd-highlight pr-2">
                                    <input type="email" class="form-control" id="inputUser" readonly>
                                </div>
                            </div>
                        </div>
                        <div class="col p-0">
                            <div class="d-flex bd-highlight">
                                <label for="inputDay" class="bd-highlight col-form-label pl-2"
                                    style="width: 100px;">작성일</label>
                                <div class="flex-grow-1 bd-highlight pr-2">
                                    <input type="email" class="form-control" id="inputDay" readonly >
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row border-bottom p-2">
                        <textarea class="form-control" id="exampleFormControlTextarea1" rows="6" readonly></textarea>
                    </div>

                    <div class="row border-bottom py-2">
                        <div class="col p-0">
                            <div class="d-flex bd-highlight">
                                <label for="inputUser" class="bd-highlight col-form-label pl-2"
                                    style="width: 100px;">작성자</label>
                                <div class="flex-grow-1 bd-highlight pr-2">
                                    <input type="email" class="form-control" id="inputUser" readonly>
                                </div>
                            </div>
                        </div>
                        <div class="col p-0">
                            
                        </div>
                    </div>
                    <div class="row border-bottom p-2">
                        <textarea class="form-control" id="exampleFormControlTextarea1" rows="6" ></textarea>
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
            <!-- Button trigger modal -->
				<button type="button" class="btn btn-outline-success btn-sm"
					data-toggle="modal" data-target="#complete">등록</button>

				<!-- Modal -->
				<div class="modal fade" id="complete" tabindex="-1" role="dialog"
					aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
					<div class="modal-dialog modal-dialog-centered" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="exampleModalCenterTitle">
									Q&A 게시글의 댓글을 작성 중이셨습니다.<br>글을 등록하시겠습니까?
								</h5>
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<div class="modal-body">
								확인을 누르면 등록이 완료됩니다.<br> 글을 수정하려면 취소를 눌러주세요.
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-outline-success btn-sm">확인</button>
								<button type="button" class="btn btn-outline-danger btn-sm"
									data-dismiss="modal">취소</button>
							</div>
						</div>
					</div>
				</div>
	</div>
</main>