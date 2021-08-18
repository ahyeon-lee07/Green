<!--아연3 상진4 규찬3-->
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
				<h4 class="page_title">회원 관리</h4>
			</div>
			<div class="bd-highlight page_subtitle">
				<nav aria-label="breadcrumb">
					<ol class="breadcrumb p-0 bg bg-transparent">
						<li class="breadcrumb-item"><a href="${contextPath }/main.do">홈</a></li>
						<li class="breadcrumb-item active" aria-current="page">회원관리</li>
					</ol>
				</nav>
			</div>
		</div>
		<div class="bd-highlight" style="text-align: right;">
			<img src="${contextPath }/resources/img/require.png"> <span
				class="">필수입력사항</span>
		</div>
		<div class="row border-bottom pm-2"></div>
		<div class="row mb-4">
			<div class="col-12">
				<form name="memberEdit" method="POST">
					<div class="row border-bottom py-2">
						<div class="col p-0">
							<div class="d-flex bd-highlight">
								<label for="inputMasterYN" class="bd-highlight col-form-label pl-2" style="width: 140px;">회원권한</label>
								<div class="d-flex flex-row bd-highlight pr-2">
									<div class="custom-control custom-switch pt-2">
										<input type="checkbox" class="custom-control-input YNChk" id="inputMasterYN" value="${memberInf.masterYN }">
										<input id="masterYN_V" class="input_V" type="text" name="masterYN" value="${memberInf.masterYN }" style="display: none;">
										<label id="inputMasterYNLabel" class="custom-control-label" for="inputMasterYN" style="width: 70px;"></label>
									</div>
								</div>
							</div>
						</div>
					</div>
					<c:choose>
						<c:when test="${memberInf.pw == 'SNSJoin'}">
							<div class="row border-bottom py-2">
								<div class="col p-0">
									<div class="d-flex bd-highlight">
										<label for="inputId" class="bd-highlight col-form-label pl-2"
											style="width: 140px;">아이디</label>
										<div class="flex-grow bd-highlight pr-2">
											<input type="text" class="form-control" id="inputId" name=""
												value="SNS가입자" readonly> <input type="text"
												class="form-control" id="inputId" name="id"
												value="${memberInf.id}" style="display: none;">
										</div>
										<input type="hidden" name="checked_id" value="Y">
									</div>
								</div>
							</div>
							<div class="row border-bottom py-2"  style="display: none;">
								<div class="col p-0">
									<div class="d-flex bd-highlight">
										<label for="Password" class="bd-highlight col-form-label pl-2"
											style="width: 140px;"><img
											src="${contextPath }/resources/img/require.png">비밀번호</label>
										<div class="flex-grow bd-highlight pr-2">
											<input type="password" class="form-control" id="Password"
												name="pw" value="">
										</div>
										<p class="my-2" style="font-size: .8rem;">(영문 대소문자/숫자/특수문자
											중 2가지 이상 조합, 10자~16자)</p>
									</div>
								</div>
							</div>
							<div class="row border-bottom py-2"  style="display: none;">
								<div class="col p-0">
									<div class="d-flex bd-highlight">
										<label for="re_password"
											class="bd-highlight col-form-label pl-2"
											style="width: 140px;"><img
											src="${contextPath }/resources/img/require.png">비밀번호 확인</label>
										<div class="flex-grow bd-highlight pr-2">
											<input type="password" class="form-control" id="re_password"
												name="re_pw" value="">
										</div>
									</div>
								</div>
							</div>
						</c:when>
						<c:otherwise>
							<div class="row border-bottom py-2">
								<div class="col p-0">
									<div class="d-flex bd-highlight">
										<label for="inputId" class="bd-highlight col-form-label pl-2"
											style="width: 140px;">아이디</label>
										<div class="flex-grow bd-highlight pr-2">
											<input type="text" class="form-control" id="inputId"
												name="id" value="${memberInf.id}" readonly>
										</div>
										<input type="hidden" name="checked_id" value="Y">
									</div>
								</div>
							</div>
							<div class="row border-bottom py-2">
								<div class="col p-0">
									<div class="d-flex bd-highlight">
										<label for="Password" class="bd-highlight col-form-label pl-2"
											style="width: 140px;">비밀번호</label>
										<div class="flex-grow bd-highlight pr-2">
											<input type="password" class="form-control" id="Password"
												name="pw" value="">
										</div>
										<p class="my-2" style="font-size: .8rem;">(영문 대소문자/숫자/특수문자
											중 2가지 이상 조합, 10자~16자)</p>
									</div>
								</div>
							</div>
							<div class="row border-bottom py-2">
								<div class="col p-0">
									<div class="d-flex bd-highlight">
										<label for="re_password"
											class="bd-highlight col-form-label pl-2"
											style="width: 140px;">비밀번호 확인</label>
										<div class="flex-grow bd-highlight pr-2">
											<input type="password" class="form-control" id="re_password"
												name="re_pw" value="">
										</div>
									</div>
								</div>
							</div>
						</c:otherwise>
					</c:choose>
					<div class="row border-bottom py-2">
						<div class="col p-0">
							<div class="d-flex bd-highlight">
								<label for="inputName" class="bd-highlight col-form-label pl-2"
									style="width: 140px;"><img
									src="${contextPath }/resources/img/require.png">이름</label>
								<div class="flex-grow bd-highlight pr-2">
									<input type="text" class="form-control" id="inputName"
										name="name" value="${memberInf.name}">
								</div>
							</div>
						</div>
					</div>
					<div class="row border-bottom py-2">
						<div class="col p-0">
							<div class="d-flex bd-highlight">
								<label for="inputBirth" class="bd-highlight col-form-label pl-2"
									style="width: 140px;">생년월일</label>
								<div class="flex-grow bd-highlight pr-2">
									<input type="text" class="form-control" id="inputBirth"
										name="birth" maxlength='8' value="${memberInf.birth}" placeholder="'-' 없이 입력해주세요.">
								</div>
							</div>
						</div>
					</div>
					<div class="row border-bottom py-2">
						<div class="col p-0">
							<div class="d-flex bd-highlight">
								<label for="inputUser" class="bd-highlight col-form-label pl-2"
									style="width: 140px;"><img
									src="${contextPath }/resources/img/require.png">주소</label>
								<div class="flex-grow-1 bd-highlight flex-column">
									<div class="bd-highlight mb-2">
										<div class="d-flex flex-row bd-highlight">
											<div class="bd-highlight">
												<input type="text" class="form-control"
													id="sample6_postcode" placeholder="우편번호" name="zipCode" value="${memberInf.zipCode}"
													readonly>
											</div>
											<div class="bd-highlight ml-2">

												<button type="button" onclick="sample6_execDaumPostcode()"
													class="btn btn-secondary"
													style="font-size: .8rem; height: 38px;">우편번호 찾기</button>
											</div>
										</div>
									</div>
									<div class="bd-highlight mb-2">
										<div class="d-flex flex-row bd-highlight">
											<div class="bd-highlight">
												<input type="text" class="form-control" id="sample6_address"
													placeholder="주소" style="width: 316px;" name="addr1" value="${memberInf.addr1}"
													readonly>
											</div>
										</div>
									</div>

									<div class="bd-highlight mb-2">
										<div class="d-flex bd-highlight">
											<div class="d-flex flex-row">
												<input type="text" class="form-control"
													style="width: 316px;" id="sample6_detailAddress"
													placeholder="상세주소" name="addr2" value="${memberInf.addr2}"> 
													<input type="text" class="form-control" style="display: none;" id="sample6_extraAddress" placeholder="참고항목" name="addr3" value="${memberInf.addr3}" readonly>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="row border-bottom py-2">
						<div class="col p-0">
							<div class="d-flex bd-highlight">
								<label for="inputNumber"
									class="bd-highlight col-form-label pl-2" style="width: 140px;"><img
									src="${contextPath }/resources/img/require.png">휴대전화</label>
								<div class="flex-grow bd-highlight pr-2">
									<input type="text" class="form-control" id="inputNumber"
										name="phone" maxlength='11' placeholder="'-' 없이 입력해주세요." value="${memberInf.phone}">
								</div>
							</div>
						</div>
					</div>
					<div class="row border-bottom py-2">
						<div class="col p-0">
							<div class="d-flex bd-highlight">
								<label for="inputEmail" class="bd-highlight col-form-label pl-2"
									style="width: 140px;">이메일</label>
								<div class="flex-grow-1 bd-highlight flex-column pr-2">
									<div class="flex-grow-1 bd-highlight pr-2">
										<div class="d-flex flex-row">
											<input type="text" class="form-control" id="inputEmail1"
												style="width: 150px;" name="email1" value="${memberInf.email1}">
											<div class="p-2">@</div>
											<select id="inputEmail2" class="form-control"
												style="width: 140px;" name="email2">
												<option value="" selected>선택</option>
												<option value="naver.com">naver.com</option>
												<option value="hanmail.net">hanmail.net</option>
												<option value="nate.com">nate.com</option>
												<option value="gmail.com">gmail.com</option>
											</select>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="row border-bottom py-2">
						<div class="col p-0">
							<div class="d-flex bd-highlight">
								<label for="inputGrade" class="bd-highlight col-form-label pl-2" style="width: 140px;">회원등급</label>
								<div class="flex-grow-1 bd-highlight flex-column pr-2">
									<select id="inputGrade" class="form-control" style="width: 140px;" name="grade">
										<option value="new" selected>신규</option>
										<option value="general">일반</option>
										<option value="vip">우수</option>
									</select>
								</div>
							</div>
						</div>
					</div>
					<div class="row border-bottom py-2">
						<div class="col p-0">
							<div class="d-flex bd-highlight">
								<label for="inputMileage" class="bd-highlight col-form-label pl-2" style="width: 140px;">마일리지</label>
								<div class="flex-grow bd-highlight pr-2">
									<input type="number" class="form-control" id="inputMileage" name="mileage" min="0" value="${memberInf.mileage}">
								</div>
							</div>
						</div>
					</div>
					<div class="row border-bottom py-2">
						<div class="col p-0">
							<div class="d-flex bd-highlight">
								<label for="inputOrderPriceSum" class="bd-highlight col-form-label pl-2" style="width: 140px;">누적 구매 금액</label>
								<div class="flex-grow bd-highlight pr-2">
									<input type="number" class="form-control" id="inputOrderPriceSum" name="orderPriceSum" min="0"
										value='<fmt:formatNumber value="${memberInf.orderPriceSum }" pattern="#,###" />' readonly>
								</div>
							</div>
						</div>
					</div>
					<!-- Button trigger modal -->
					<div class="row py-2 mt-3">
						<div class="d-flex flex-fill justify-content-between">
							<div class="bd-highlight">
								<button id="btn_memberDelete" type="button"
									class="btn btn-outline-danger">회원 탈퇴</button>
							</div>
							<div class="d-highlight">
								<a href="${contextPath }/memberList.do${pageMaker.makeQueryPage(bList.IDX, pageMaker.cri.page) }&options=${options }"><button type="button"
										class="btn btn-outline-secondary">취소</button></a>
								<button id="btn_memberEdit" type="button"
									class="btn btn-success ml-2">회원정보 수정</button>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</main>

<script>
//페이지가 노드 되면서 memver의 email2 주소는 입력 , 회면 로딩시 스위치 YN 체크 
window.onload = function() {
	document.getElementById('inputEmail2').value = "${memberInf.email2}";
	document.getElementById('inputGrade').value = "${memberInf.grade}";

	var YNChk = document.getElementById('inputMasterYN');
	var input_V = document.getElementById('masterYN_V');


		if (YNChk.value == "M") {
			YNChk.value = "M"
			input_V.value = "M"
			YNChk.checked = true;
			document.getElementById('inputMasterYNLabel').innerHTML = "관리자";
		} else {
			YNChk.value = "N"
			input_V.value = "N"
			YNChk.checked = false;
			document.getElementById('inputMasterYNLabel').innerHTML = "일반";
		}

}
	// 활성화 여부
	var showYN = document.getElementById('inputMasterYN');
	showYN.addEventListener('click', function () {
		var showYN_V = showYN.value;
		var Label = document.getElementById('inputMasterYNLabel');
		var V = document.getElementById('masterYN_V');

		if (showYN_V != "N") {
			showYN.value = "N";
			V.value = "N";
			Label.innerHTML = "일반";
		} else {
			showYN.value = "M";
			V.value = "M";
			Label.innerHTML = "관리자";
		}
	});

//회원정보 수정 
	document.getElementById('btn_memberEdit').addEventListener('click',function() {
						var form = document.memberEdit;
						//영문,숫자,특수문자 혼합하여 10자리~16자리 이내.(비밀번호 표준)
						var pwExp = document.getElementById('Password').value;
						var num = pwExp.search(/[0-9]/g);
						var eng = pwExp.search(/[a-z]/ig);
						var spe = pwExp.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);

						//영문 한글 공백 허용
						var nameExp = document.getElementById('inputName').value
								.search(/^[ㄱ-ㅎ|가-힣|a-z|A-Z|]*$/);

						if (pwExp != '') {
							if (pwExp.search(/\s/) != -1) {
								alert("비밀번호는 공백 없이 입력해주세요.");
								form.pw.focus();
								return false;
							} else if ((num < 0 && eng < 0)
									|| (eng < 0 && spe < 0)
									|| (spe < 0 && num < 0)) {
								alert("영문,숫자, 특수문자 중 2가지 이상을 혼합하여 입력해주세요.");
								form.pw.focus();
								return false;
							} else if (form.re_pw.value == "") {
								alert("비밀번호 확인을 입력해주세요!");
								form.re_pw.focus();
								return false;
							} else if (form.pw.value != form.re_pw.value) {
								alert("비밀번호를 확인해주세요!");
								form.pw.focus();
								return false;
							}
						}
						if (form.name.value == "") {
							alert("이름을 입력해주세요!");
							form.name.focus();
							return false;
						} else if (nameExp) {
							alert("이름에 숫자는 입력 할수 없습니다.");
							form.name.focus();
							return false;
						} else if (form.addr1.value == "" || form.addr2.value == "" || form.addr3.value == "") {
							alert("주소을 입력해주세요!");
							form.addr1.focus();
							return false;
						} else if (form.phone.value == "") {
							alert("휴대전화를 입력해주세요!");
							form.phone.focus();
							return false;
						} else {
							if (confirm("입력한 내용을 정보를 변경하기겠습니까? ") == true) {
								if (pwExp == '') {
									document.getElementById('Password').value = '${memberInf.pw}';
								};
								form.action = "${contextPath }/memberList/memberEdit/Edit.do${pageMaker.makeQueryPage(bList.IDX, pageMaker.cri.page) }&productId=${memberInf.id }&options=${options }";
								form.submit();
							} else {
								return;
							}
						}
					});
</script>
<!-- 우편번호 API -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
						function sample6_execDaumPostcode() {
							new daum.Postcode(
								{
									oncomplete: function (data) {
										// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

										// 각 주소의 노출 규칙에 따라 주소를 조합한다.
										// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
										var addr = ''; // 주소 변수
										var extraAddr = ''; // 참고항목 변수

										//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
										if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
											addr = data.roadAddress;
										} else { // 사용자가 지번 주소를 선택했을 경우(J)
											addr = data.jibunAddress;
										}

										// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
										if (data.userSelectedType === 'R') {
											// 법정동명이 있을 경우 추가한다. (법정리는 제외)
											// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
											if (data.bname !== ''
												&& /[동|로|가]$/g.test(data.bname)) {
												extraAddr += data.bname;
											}
											// 건물명이 있고, 공동주택일 경우 추가한다.
											if (data.buildingName !== ''
												&& data.apartment === 'Y') {
												extraAddr += (extraAddr !== '' ? ', '
													+ data.buildingName : data.buildingName);
											}
											// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
											if (extraAddr !== '') {
												extraAddr = ' (' + extraAddr + ')';
											}
											// 조합된 참고항목을 해당 필드에 넣는다.
											document.getElementById("sample6_extraAddress").value = extraAddr;

										} else {
											document.getElementById("sample6_extraAddress").value = '';
										}

										// 우편번호와 주소 정보를 해당 필드에 넣는다.
										document.getElementById('sample6_postcode').value = data.zonecode;
										document.getElementById("sample6_address").value = addr;
										// 커서를 상세주소 필드로 이동한다.
										document.getElementById("sample6_detailAddress")
											.focus();
									}
								}).open();
						}
						
						//멘버 삭제
						document.getElementById('btn_memberDelete').addEventListener('click', function() {
									var form = document.memberEdit;
									if (confirm("탈퇴시 모든 정보는 삭제됩니다. 그래도 탈퇴 하시겠습니까?") == true) {
										form.action = "${ contextPath }/memberList/memberDelete.do";
										form.submit();
									} else {
										return;
									}
								});
					</script>

