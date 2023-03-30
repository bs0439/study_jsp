<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%
	int result = (Integer)request.getAttribute("result");
	String inputId = (String)request.getAttribute("id");
	pageContext.setAttribute("result", result);
	pageContext.setAttribute("inputId", inputId);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:if test="${result == 1 }">
	<script>
		alert("로그인이 완료되었습니다.");
		location.href="main.jsp";
	</script>
	<%session.setAttribute("id", inputId); %>
</c:if>
<c:if test="${result != 1 }">
	<script>
		alert("아이디와 비밀번호를 확인하세요.");
		location.href="loginForm.jsp";
	</script>
</c:if>
</body>
</html>