<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
.rrfrm{
	padding-top:70px;
	text-align: center;
}
.rrfrm input{
	width:100%;
}

.rrfrm form{
	border-collapse: collapse;
	border : none;
}
.rr_title{
	font-size:50px;
	margin-bottom:50px;
}
</style>
<body>
	<header>
		<%@ include file="header.jsp"%>
	</header>
	<div class="container">
		<div class=rrfrm>
			<div class = "rr_title">모금 후기등록하기</div>
			<table>
			<form action = "regReview.do" method = "post" name = "rfrm">
				<tr>
				<th>제목</th>
				<td><input type = "text" name = "title"><td>
				</tr>
				<tr>
				<th>카테고리</th>
				<td><input type = "text" name = "cate"><td>
				</tr>
				<tr>
				<th>내용</th>
				<td><textarea rows="12" cols = "70" name = "content"></textarea><td>
				</tr>
				<tr>
				<th>목표금액</th>
				<td><input type = "text" name = "target_amount"><td>
				</tr>
				<tr>
				<th>최종모금액</th>
				<td><input type = "text" name = "price"><td>
				</tr>
				<tr>
				<td colspan = "2"><input type = "submit" value = "등록"><td>
				</tr>
			</form>
			</table>
		</div>
	</div>
</body>
</html>