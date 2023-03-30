<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="style2.css" rel="stylesheet" type="text/css">
<div id = "header">
	<span class= "logo"><img src = "images/logo2.png" onclick = "location = 'main.jsp'"></span>
	<span class = "menu"><a href = "raise.jsp">모금중</a></span>
	<span class = "menu"><a href = "raiseReview.jsp">모금후기</a></span>
	<span class = "menu"><a href = "donationRanking.jsp">기부순위</a></span>
	<c:if test="${sessionScope.id != null }">
			<c:if test="${sessionScope.id eq 'admin' }">
			<span class= "rmenu"><a href="adminpage.jsp">관리자페이지</a></span>
			</c:if>			
			<c:if test="${sessionScope.id ne 'admin' }">
			<span class= "rmenu"><a href="mypage.jsp">마이페이지</a></span>
			</c:if>			
			<span class= "rmenu">${sessionScope.id }님 |<a href="logout.jsp">로그아웃</a></span>
	</c:if>
	<c:if test="${sessionScope.id == null }">			
			<span class= "rmenu"><a href="regForm.jsp">회원가입</a></span>
			<span class= "rmenu"><a href="loginForm.jsp">로그인</a></span>
	</c:if>	
</div>
