<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>

</style>
<body>
	<header>
		<%@ include file="header.jsp"%>
	</header>
	<div class="form">
	<div id="logtitle">그린같이가치</div>
		<form action = "loginServlet" method="post">
			<input type = "text" name="id" placeholder="아이디"><br>
			<input type = "password" name="pw" placeholder="비밀번호"><br>
			<input class = "sub"type = "submit" value="로그인">
		</form>
	</div>
</body>
</html>