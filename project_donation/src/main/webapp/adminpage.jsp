<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
.admin_page {
	margin: 0 auto;
	width: 1300px;
}

.admin_main {
	text-align: center;
}

.admin_title {
	padding-top:50px;
	text-align: center;
	font-size:50px;
	margin-bottom:50px;
}

.admin_menu {
	margin-top:20px;
	text-align: center;
	font-size:30px;
}
</style>
<body>
	<header>
		<%@ include file="header.jsp"%>
	</header>
	<div class="container">
		<div class="admin_page">
			<div class="admin_title">관리자 페이지</div>
			<div class="admin_menu"><a href = "regRaise.jsp">모금글 등록</a></div>
			<div class="admin_menu"><a href = "regReview.jsp">모금후기 등록</a></div>
			<div class="admin_menu"><a href = "donationList.jsp">기부내역보기</a></div>
		</div>
	</div>
</body>
</html>