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
	<div class="container-fluid p-0">
		<table class="table table-hover border-top m-0 ">
			<thead class=" border-bottom-0 bg-light">
				<tr>
					<th class="text-center border-bottom-0 border-top-0 px-1" style="width: 120px">쿠폰ID</th>
					<th class="text-center border-bottom-0 border-top-0 px-2" style="width: 160px">쿠폰명</th>
					<th class="text-center border-bottom-0 border-top-0 px-2" style="width: auto">쿠폰혜택</th>
					<th class="text-center border-bottom-0 border-top-0 px-2" style="width: 96px">할인금액</th>
					<th class="text-center border-bottom-0 border-top-0 px-2" style="width: 100px">사용기간</th>
					<th class="text-center border-bottom-0 border-top-0 px-2" style="width: 100px">사용일</th>
					<th class="text-center border-bottom-0 border-top-0 px-2" style="width: 60px">선택</th>
				</tr>
			</thead>

			<tbody class="border-bottom" id="productList">
				<c:forEach items="${hasCouponList }" var="hasCouponList">
					<tr id="${hasCouponList.hasCouponNum }">
						<td class="text-center align-middle align-middle px-2" style="font-size: .8rem">
							${hasCouponList.couponId }
						</td>
						<td id=${hasCouponList.hasCouponNum }_couponName class="text-center align-middle px-2">
							${hasCouponList.couponName }
						</td>
						<td class="text-center align-middle px-2">
							${hasCouponList.couponContent }
						</td>
						<c:choose>
							<c:when test="${hasCouponList.discountType == 'normal' }">
								<td id=${hasCouponList.hasCouponNum }_couponPay class="text-center align-middle px-2" data-discountType="${hasCouponList.discountType}">
									<span>${hasCouponList.couponPay }</span> 원 
								</td>
							</c:when>
							<c:otherwise>
								<td id=${hasCouponList.hasCouponNum }_couponPay class="text-center align-middle px-2" data-discountType="${hasCouponList.discountType}">
									<span>${hasCouponList.couponPay }</span> %
								</td>
							</c:otherwise>
						</c:choose>
						<td class="text-center align-middle px-2" style="font-size: .8rem">
							${hasCouponList.couponPeriod_start } ~ ${hasCouponList.couponPeriod_end }
						</td>
						<td class="text-center align-middle px-2" style="font-size: .8rem">
							${hasCouponList.couponUseDate }
						</td>
						<td class="text-center align-middle px-2">
							<div class="bd-highlight">
								<button type="button" class="btn btn-outline-secondary btn-sm" style="font-size: 0.7rem; width: 100%;" onclick="choiceCoupon('${hasCouponList.hasCouponNum }')">선택</button>
							</div>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
			
	</div>
</main>

<script>

	function choiceCoupon(num){
		var couponName = document.getElementById(num + "_couponName").innerText;
		var couponPay = document.getElementById(num + "_couponPay").childNodes[1].innerText;
		var discountType = document.getElementById(num + "_couponPay").dataset.discounttype;

		opener.document.getElementById("coupon_Input_Num").value = num;
		opener.document.getElementById("coupon_Input_name").value = couponName;
		opener.document.getElementById("coupon_Input_CountType").value = discountType;
		opener.document.getElementById("coupon_Input_Pay").value = couponPay;

		window.close();
	}

</script>