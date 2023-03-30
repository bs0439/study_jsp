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
.do_main {
	margin-top: 25px;
	width: 1300px;
	display: flex;
	flex-direction : row;
	flex-wrap : wrap;
}

.do_list {
	margin-top: 40px;
	width: 400px;
	height: 300px;
	border-radius: 8px;
	background-color: white;
	box-shadow: 5px 5px 5px #E8E8E8;
	float:left;
}

.list_img img {
	border-radius: 8px 8px 0px 0px;
	width: 400px;
	height: 200px;
}
</style>
<body>
	<header>
		<%@ include file="header.jsp"%>
	</header>
	<sql:query var="rs" dataSource="jdbc/maria">
		   SELECT * FROM review_board ORDER BY bno DESC
	</sql:query>

	<div class="container">
		<div class="do_main">
			<c:forEach var="row" items="${rs.rows }">
				<div class="do_list" onclick="location.href='reviewDetailView.jsp?bno=${row.bno }'">
					<div class="list_img">
						<img src="images/r_${row.bno }.png">
					</div>
					<br>
					<div># ${row.cate }</div>
					<div>${row.title }</div>
					<div>최종 모금액 : ${row.price }원</div>
				</div>
			</c:forEach>
		</div>
	</div>
</body>
</html>