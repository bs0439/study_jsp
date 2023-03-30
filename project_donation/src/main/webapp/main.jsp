<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.main_section {
	width: 1300px;
	display: flex;
	margin-bottom: 70px;
}

.main_board {
	width: 700px;
	height: 250px;
	float: left;
	display: flex;
	border: solid 0px black;
	border-radius: 8px;
	background-color: white;
	box-shadow: 5px 5px 5px #E8E8E8;
}

#main_alert {
	width: 360px;
	height: 250px;
	float: right;
	border: solid 0px black;
	background-color: #B1DECB;
	border-radius: 8px;
	text-align: center;
}

#main_review {
	width: 360px;
	height: 250px;
	float: right;
	border: solid 0px black;
	background-color: white;
	border-radius: 8px;
}

.main_img img {
	width: 250px;
	height: 250px;
	border-radius: 8px;
	float: left;
}

.main_text {
	margin-top: 25px;
}

.main_tag {
	width: 385px;
	height: 26px;
}

.main_title {
	width: 385px;
	height: 34px;
	padding-top: 7px;
}

.main_content {
	width: 385px;
	height: 80px;
	padding-top: 11px;
	overflow: hidden;
	text-overflow: ellipsis;
}

.main_rmoney {
	padding-top: 5px;
	width: 150px;
	height: 30px;
}

.right_logo {
	display: inline-block;
	width: 64px;
	height: 80px;
	vertical-align: top;
	margin-top: 30px;
	background:
		url("//t1.kakaocdn.net/together_image/common/img_choonsik_220823.png")
		center center/cover no-repeat;
}

.top_right {
	margin-top: 50px;
}
.alert_title{
	margin-top: 15px;	
	font-size:24px;
}
.total_price{
	width:240px;
	height: 50px;
	line-height:50px;
	margin-top: 30px;
	background-color: white;	
	border-radius:8px;
}
.riv_msg{
	margin-top:15px;
	margin-left:15px;
}
.riv_title{
	margin-top:15px;
	margin-left:15px;
}
.riv_content{
	margin-top:15px;
	margin-left:15px;
	overflow: hidden;
	text-overflow: ellipsis;
	height: 130px;
}
</style>
</head>
<body>
	<header>
		<%@ include file="header.jsp"%>
	</header>
	<sql:query var="rs" dataSource="jdbc/maria">
		   SELECT * FROM green_board WHERE bno = '1'
	</sql:query>
	<sql:query var="rs2" dataSource="jdbc/maria">
		   SELECT * FROM green_board WHERE bno = '2'
	</sql:query>
	<div class="container">
		<div id="main_top">
			<span id="top_left">당신의 착한 마음을 같이가치가 응원합니다❤</span>
			<span class="top_right"> </span>
		</div>
		<div class="main_section">
			<c:forEach var="row" items="${rs.rows }">
				<div class="main_board" onclick="location.href='raiseDetailView.jsp?bno=${row.bno }'">
					<div class="main_img">
						<img src="images/${row.fname }">
					</div>
					<div class="main_text">
						<div class="main_tag"># ${row.cate }</div>
						<div class="main_title">${row.title }</div>
						<div class="main_content">${row.content }</div>
						<div class="main_rmoney">목표 모금액 : ${row.target_amount }원</div>
					</div>
				</div>
			</c:forEach>
			<div id="main_alert">
				<div class= "alert_title">우리가 같이 만든 변화들</div>
				<div class="right_logo"></div>
				<sql:query var="rs3" dataSource="jdbc/maria">
		   			SELECT SUM(price) AS price FROM green_board
				</sql:query>
				<c:forEach var="row" items="${rs3.rows }">
					<div class = "total_price"> 총 기부금 ${row.price }원</div>
				</c:forEach>
			</div>

		</div>
		<div class="main_section">
			<c:forEach var="row" items="${rs2.rows }">
				<div class="main_board" onclick="location.href='raiseDetailView.jsp?bno=${row.bno }'">
					<div class="main_img">
						<img src="images/${row.fname }">
					</div>
					<div class="main_text">
						<div class="main_tag"># ${row.cate }</div>
						<div class="main_title">${row.title }</div>
						<div class="main_content">${row.content }</div>
						<div class="main_rmoney">목표 모금액 : ${row.target_amount }원</div>
					</div>
				</div>
			</c:forEach>
			<sql:query var="rs4" dataSource="jdbc/maria">
		   		SELECT * FROM review_board WHERE bno = '1'
			</sql:query>
			<c:forEach var="row" items="${rs4.rows }">
			<div id="main_review" onclick="location.href='reviewDetailView.jsp?bno=${row.bno }'">
				<div class= "riv_msg"> 따뜻한 후기</div>
				<div class= "riv_title">${row.title } </div>
				<div class= "riv_content">${row.content } </div>
			</div>
			</c:forEach>
		</div>
	</div>
<script>
function comma(){
	
	
}
</script>
</body>
</html>
