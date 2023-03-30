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
#detail_top {
	text-align: center;
	background-color: #B1DECB;
	background-size: cover;
	width: 100%;
	height: 200px;
	line-height: 200px;
	font-size: 40px;
	color: white;
}

#detail_main {
	width: 1300px;
	margin-top: 30px;
}

#detail_content {
	width: 1300px;
	white-space: pre-wrap;
	font-size:24px;
}

#detail_img {
	text-align: center;
}

.price_box {
	width: 700px;
	margin: 50px auto;
	border-top: 1px solid #cfcfcf;
	text-align: center;
	padding: 60px 0px 30px;
}

.price_box .txt_price {
	display: block;
	font-size: 42px;
	text-overflow: ellipsis;
	white-space: nowrap;
	line-height: 80px;
	color: #dc287c;
}

.price_box .txt_end {
	display: block;
	font-size: 42px;
	text-overflow: ellipsis;
	white-space: nowrap;
	line-height: 80px;
}

.price_box .txt_won {
	font-size: 25px;
}

.price_box .txt_state {
	font-size: 30px;
	color: #444;
}

.detail_bottom {
	position: fixed;
	bottom: 5px;
	width: 1800px;
	text-align: center;
}

#donation_button {
	width: 250px;
	height: 50px;
	background-color: #B1DECB;
	line-height: 50px;
	font-size: 24px;
	border-radius: 15px;
}

#detail_title {
	margin-right: 400px;
}

#modal_bg {
	display: none;
	position: fixed;
	width: 100%;
	height: 100%;
	background-color: rgb(206, 201, 202);
	opacity: 50%;
	top: 0px;
	left: 0px;
}

#modal {
	display: none;
	padding: 20px 10px;
	background-color: #fefefe;
	border: 1px solid #888;
	border-radius: 3px;
	position: fixed;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	font-size: 24px;
	border-radius: 15px;
}
#modal button{
	width:100%;
	height:50px;
	background-color: #B1DECB;
	font-size:24px;
	border-radius:12px;
}
.comments{
	width: 1300px;
	margin-bottom: 30px;
	text-align:center;
}
.co_idpr{
	margin-top:10px;
	width:500px;
	height:50px;
	text-align:left;
}
.co_comment{
	width:500px;
	text-align:left;
	font-size:24px;
	backgorund-color:#F4F4F4;
	
}
.co_price{
	color: #444;
}
.co_id{
	font-size:28px;
}
.co_title{
	font-size:30px;
	text-align:left;
}
.co_date{
	font-size:16px;
	text-align:left;
	width:500px;
	border-bottom: 1px solid #cfcfcf;
}

.dbt button{
	width:100px;
	height:60px;
	background-color:red;
	border-radius:12px;
	color:white;
	font-size:24px;
}
.comments{
	margin-bottom:60px;
}
</style>
<body>
	<header>
		<%@ include file="header.jsp"%>
	</header>
	<sql:query var="rs" dataSource="jdbc/maria">
		   SELECT * FROM green_board WHERE bno = <%=request.getParameter("bno")%>
	</sql:query>
	<c:forEach var="row" items="${rs.rows }">
		<div id="detail_top">
			<span id="detail_title">${row.title } &nbsp;&nbsp;&nbsp;&nbsp;<button onclick="location.href='raiseDelete.do?bno=<%=request.getParameter("bno")%>'">삭제</button></span>
			<c:if test="${sessionScope.id eq 'admin' }">
			<span class= "dbt"></span>
			</c:if>
		</div>
		<div id="detail_main">
			<div id="detail_content">${row.content }</div>
			<div id="detail_img">
			<c:if test="${row.fname2 ne null}">
				<img src="images/${row.fname2 }">
			</c:if>
			<c:if test="${row.fname2 eq null}">
				<img src="images/${row.fname }">
			</c:if>
			<c:if test="${row.youtube ne null}">
			<div>
			<iframe width="300" height="300"  src="${row.youtube }"
			sandbox="allow-forms allow-scripts allow-same-origin"></iframe>
			</div>
			</c:if>
			</div>
		</div>
		<div class="price_box">
			<span class="txt_end">종료일 : ${row.endDate }</span> <span
				class="txt_price">현재까지 모인금액 : ${row.price }<span
				class="txt_won">원</span></span> <span class="txt_state">
				${row.target_amount }원 목표</span>
		</div>
	</c:forEach>
		<sql:query var="rs2" dataSource="jdbc/maria">
		   SELECT * FROM donation WHERE bno = <%=request.getParameter("bno")%> ORDER BY donation_date DESC
		</sql:query>
		<div class = "comments">
			<span class = "co_title">댓글</span>
			<c:forEach var="row" items="${rs2.rows }">
			<div class = "co_idpr"><span class = "co_id">${row.id }</span><span class=co_price>${row.donation }원</span></div>	
			<div class = "co_comment">${row.comments }</div>	
			<div class = "co_date">${row.donation_date }</div>	
			</c:forEach>
		</div>
		<div class="detail_bottom">
			<div id="donation_button" >기부하기</div>
		</div>
		<div id="modal_bg"></div>
		<div id="modal">
			<div id="modal_title">당신의 착한 마음을 같이가치가 응원합니다❤</div>
			<input type="text" name="donation" placeholder="기부금을 입력하세요"><br>
			<input type="text" name="comments" placeholder="따뜻한 한마디를 남겨주세요"><br>
			<button id="modal_button" onclick="regDonation()">기부하기</button>
		</div>
	<script>
		const donation_button = document.querySelector("#donation_button");

		const modal_bg = document.querySelector("#modal_bg");

		donation_button.addEventListener("click", function(e) {
			var uid = '<%=(String)session.getAttribute("id")%>';
			if(uid=="null"){
				alert('로그인 후 기부가 가능합니다');
			}else{
			document.querySelector("#modal").style.display = 'block';
			document.querySelector("#modal_bg").style.display = 'block';

			const modal_bg = document.querySelector("#modal_bg");

			modal_bg.addEventListener("click", function() {
				document.querySelector("#modal_bg").style.display = 'none';
				document.querySelector("#modal").style.display = 'none';
			})
			}
		})

		function regDonation() {
			
			const xhttp = new XMLHttpRequest();
			xhttp.onload = function() {
				let data = this.responseText;
				alert('기부해주셔서 감사합니다');
				window.location.reload();
			}
			xhttp.open("POST", "regDonation.do");
			xhttp.setRequestHeader("Content-type",
					"application/x-www-form-urlencoded");
			let bno = <%=request.getParameter("bno")%>;
			let pdonation = document.querySelector("input[name='donation']").value;
			let pcomments = document.querySelector("input[name='comments']").value;
			let data = "donation=" + pdonation + "&comments=" + pcomments
					+ "&bno=" + bno;
			xhttp.send(data);
			
		}
	</script>
</body>
</html>
