<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
	.box{
		padding-top:80px;
	}
	#tbl{
		font-size:36px;
	}
	#tbl table{
		 border-spacing: 30px;
 		 border-collapse: separate;
	}
</style>
<body>
	<header>
		<%@ include file="header.jsp"%>
	</header>
	<sql:query var="rs" dataSource="jdbc/maria">
		   SELECT id, SUM(donation) AS donation, RANK() over (ORDER BY donation DESC) AS 'RANK' FROM donation GROUP BY id ORDER BY RANK
	</sql:query>
	<div class="box">
		<div id="tbl">
			<table id = "tbll">
				<tr>
					<td>순위</td>
					<td>아이디</td>
					<td>기부금</td>
				</tr>
				<c:forEach var="row" items="${rs.rows }">
					<tr>
						<td>${row.RANK }</td>
						<td>${row.id }</td>
						<td>${row.donation }</td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
</body>
</html>