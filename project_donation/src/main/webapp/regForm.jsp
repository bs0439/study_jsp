<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
.form{
	padding-top:150px;
	text-align: center;
	width: 100vw;
	height: 100vh;
	background: #F4F4F4;
}

</style>
<body>
	<header>
		<%@ include file="header.jsp"%>
	</header>
	<div class="box">
		<section>
			<div class="form">
				<h1>회원등록</h1>
				<table>
					<form name="frm" action="regServlet" method="post">
						<tr>
							<td><input type="hidden" name="flag" value="0"></td>
						</tr>
						<tr>
							<td><input type="text" name="id" placeholder="아이디"> 
							<div><input type="button" onclick="idcheck()" value="중복확인" id="check" class = "sub" ></div>
								<div id="demo"></div></td>
						</tr>
						<tr>
							<td><input type="password" name="pw" placeholder="비밀번호"><br></td>
						</tr>
						<tr>
							<td><input type="text" name="name" placeholder="이름"><br></td>
						</tr>
						<tr>
							<td><input type="text" name="tel" placeholder="전화번호"><br></td>
						</tr>
						<tr>
							<td><input type="submit" value="등록" class = "sub" onclick="return check()">
								</td>
						</tr>
				</table>
				</form>
			</div>
		</section>
	</div>

	<script>
		function idcheck() {
			if (document.frm.id.value == "") {
				alert("아이디를 입력하세요.");
				document.frm.id.focus();
				return;
			}
			let param = document.frm.id.value;
			let url = "idcheckServlet?id=" + param;
			const xhttp = new XMLHttpRequest();
			xhttp.onload = function() {
				document.getElementById("demo").innerHTML = this.responseText;
			}
			xhttp.open("GET", url, true);
			xhttp.send(); //submit

		}
		
		function check() {
			
			if (document.frm.id.value == "") {
				alert("아이디가 입력되지 않았습니다.");
				document.frm.id.focus();
				return false;
			} else if (document.frm.pw.value == "") {
				alert("비밀번호가 입력되지 않았습니다.");
				document.frm.pw.focus();
				return false;
			} else if (document.frm.name.value == "") {
				alert("이름이 입력되지 않았습니다.");
				document.frm.name.focus();
				return false;
			} else if (document.getElementById("demo").innerText != "사용가능") {
				alert("아이디 중복체크를 하세요.");
				document.frm.id.focus();
				return false;
			} else {
				alert("회원가입이 완료되었습니다.");
				return true;
			}
			
		}
	</script>
</body>
</html>