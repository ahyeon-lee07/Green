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
<main class="">
	<div class="container-fluid">
		<div class="row">
			<div class="col m-2" id="SearchBox">
				<div class="form-group d-flex bd-highlight justify-content-start mb-0">
					<input class="form-control form-control mr-2 bd-highlight flex-grow-1" type="text" id="keyWord" placeholder="상품명">
					<button type="button" class="btn btn-secondary bd-highlight" style="width: 100px;" onclick="btnSearch()">검색</button>
				</div>
			</div>
		</div>
		<table class="table table-hover border-top m-0">
			<thead class=" border-bottom-0 bg-light">
				<tr>
					<th class="text-center border-bottom-0 align-middle border-top-0 px-1" style="width: 50px">
						번호
					</th>
					<th class="text-center border-bottom-0 border-top-0 px-2" style="width: 120px">이미지</th>
					<th class="text-center border-bottom-0 border-top-0 px-2" style="width: auto">상품 정보</th>
					<th class="text-center border-bottom-0 border-top-0 px-2" style="width: 100px">판매가</th>
					<th class="text-center border-bottom-0 border-top-0 px-2" style="width: 90px">선택</th>
				</tr>
			</thead>

			<tbody class="border-bottom" id="productList">
				
			</tbody>
		</table>
			
	</div>
</main>

<script>
	function btnSearch(){
		var form = document.getElementById('SearchBox');

		var keyWord = document.getElementById('keyWord');

		if(keyWord.value != ''){
			fn_productSearch(keyWord.value);
			return true;
		}else{
			alert('상품명을 입력해 주세요');
			return false;
		}
	}

	function fn_productSearch(keyWord) {

			$.ajax({
				type: "POST",
				async: true,
				url: "${contextPath}/productSearch/search.do",
				dataType: "json",
				data: { keyWord: keyWord },
				success: function (result) {
					
					if(result == '' || result == 0){
						alert('해단 상품이 없습니다.');
						return false;
					}else{

						var str = '';

						for(var i=0; i< result.length; i++){

							var price = result[i]['price'].toLocaleString('ko-KR');
							var discount = result[i]['discount'].toLocaleString('ko-KR');

							str += '<tr id="' + result[i]["productId"] +'"> <td class="text-center align-middle align-middle px-1">'+(i+1)+'</td>';
							str += '<td class="text-center align-middle px-2"><img src="${contextPath}/resources/img/' + result[i]["p_group"] +'/' + result[i]["imgURL"] +'" class="img-thumbnail" alt="#"></td>';
							str += '<td class="align-middle flex-column"><div class="font-weight-bold pb-1 bd-highlight">' + result[i]["productName"] +'</div> </td>';
							
							str += '<td class="text-center align-middle px-2">';

							if (result[i]["discountYN"] == 'Y') {
								str += '<div class="discountBox">';
								str += price + '<span>원</span>';
								str += '<span class="discountBox text-danger">';
								str += discount + '<span>원</span>';
								str += '</span> </div>';
							} else {
								str += price + '<span>원</span>';
							}
							str += '</td>';
							
							str += '<td class="text-center align-middle px-2">';
							str += '<div class="bd-highlight">';
							str += '<a href="#"><button type="button" class="btn btn-outline-secondary btn-sm" style="font-size: 0.7rem; width: 100%;" onclick="choiceProduct(\'' + result[i]["productId"] +'\',\'' + result[i]["productName"] +'\')">선택</button></a>';
							str += '</div></td></tr>';
							
						}

						document.getElementById('productList').innerHTML = str;

					}
				},
				error: function (data, textStatus) {
					alert("에러가 발생하였습니다.")
				}
			
			});
		}

		function choiceProduct(id, name){
			opener.document.getElementById("product_Input_name").value = name;
			opener.document.getElementById("product_Input_id").value = id;

			window.close();
		}

</script>