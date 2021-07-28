<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
		<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
			<% request.setCharacterEncoding("UTF-8"); %>
				<c:set var="contextPath" value="${pageContext.request.contextPath}" />
				<!DOCTYPE html>
				<html lang="ko">

				<head>
					<meta charset="UTF-8">
					<meta http-equiv="X-UA-Compatible" content="IE=edge">
					<meta name="viewport" content="width=device-width, initial-scale=1.0">
					<title>오류페이지</title>

					<style>
						#errorPageBox {
							position: absolute;
							top: 50%;
							left: 50%;
							transform: translate(-50%, -50%);
							width: 800px;
							height: 500px;
						}
						a {
							position: absolute;
							left: 0;
							top: 45%;
						}
					</style>
				</head>

				<body>

					<div id="errorPageBox">
						<img src="${contextPath}/resources/img/errorBg.png" alt="그린케이스" /></a>
						<a href="${contextPath }/main.do">
							<button type="button" class="">메인으로 돌아가기</button>
						</a>
					</div>

				</body>

				</html>