<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
.mypage {
	width: 100vw;
	height: 100vh;
	text-align: center;
	background: #F4F4F4;
}

.my_title {
	padding-top: 50px;
	font-size: 36px;
}

.my_do {
	padding-top: 15px;
}

.mt_sub {
	font-size: 20px;
}
.mypage th{
}
.mypage table{
	background-color:white;
	border-radius: 12px;
	
}
.upsub {
	background-color: rgb(174, 174, 238);
}
</style>
<body>
	<header>
		<%@ include file="header.jsp"%>
	</header>
	<sql:query var="rs" dataSource="jdbc/maria">
		   SELECT * FROM member WHERE id = '${sessionScope.id }'
	</sql:query>
	<sql:query var="rs2" dataSource="jdbc/maria">
		   SELECT * FROM donation WHERE id = '${sessionScope.id }' ORDER BY donation_date DESC LIMIT 0,10
	</sql:query>
	<div class="mypage">
		<div class="my_title">
			내 정보 
		</div>
		<div class="my_do">
			<table border="1">
				<form action = "updatemember.do" method = "post">
				<c:forEach var="row" items="${rs.rows }">
					<tr>
						<th>아이디</th>
						<td><input type = "text" name = "id" value = "${row.id }" readonly></td>
					</tr>
					<tr>
						<th>비밀번호</th>
						<td><input type = "text" name = "pw" value = "${row.pw }" ></td>
					</tr>
					<tr>
						<th>이름</th>
						<td><input type = "text" name = "name" value = "${row.name }" ></td>
					</tr>
					<tr>
						<th>전화번호</th>
						<td><input type = "text" name = "tel" value = "${row.tel }" ></td>
					</tr>
					<tr>
						<td colspan = "2"><input type = "submit" value = "수정하기" id = "upsub"></td>
					</tr>
				</c:forEach>
				</form>
			</table>
		</div>
		<div class="my_title">
			내 기부내역 <span class="mt_sub">(최근 10개)</span>
		</div>
		<div class="my_do">
			<table border="1">
				<tr>
					<th>게시글번호</th>
					<th>기부일자</th>
					<th>기부금액</th>
					<th>응원댓글</th>
				</tr>
				<c:forEach var="row" items="${rs2.rows }">
					<tr>
						<td>${row.bno }</td>
						<td>${row.donation_date }</td>
						<td>${row.donation }원</td>
						<td>${row.comments }</td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
</body>
</html>