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
.my_title{
	text-align:center;
	padding-top:50px;
	font-size:50px;
	margin-bottom:50px;
}
</style>
<body>
	<header>
		<%@ include file="header.jsp"%>
	</header>
	<sql:query var="rs" dataSource="jdbc/maria">
		   SELECT * FROM donation
	</sql:query>
	<div class="my_title">
			기부내역
		</div>
		<div class="my_do">
			<table border="1">
				<tr>
					<th>아이디</th>
					<th>게시글번호</th>
					<th>기부일자</th>
					<th>기부금액</th>
					<th>응원댓글</th>
				</tr>
				<c:forEach var="row" items="${rs.rows }">
					<tr>
						<td>${row.id }</td>
						<td>${row.bno }</td>
						<td>${row.donation_date }</td>
						<td>${row.donation }원</td>
						<td>${row.comments }</td>
					</tr>
				</c:forEach>
			</table>
		</div>
</body>
</html>