<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HowLand : 로그인</title>
<script>
	window.onload = function(){
		var check = getParameter("check");
		
		if (check == "id"){
			document.form.id.focus();
		} else if (check == "pw"){
			document.form.pw.focus();
		}
	}
	
	function findId(){
		window.open("/howland/user/FindIdPage.jsp", "", "innerWidth=530, innerHeight=420, left=1200, top=300");
	}
	function findPw(){
		window.open("/howland/user/FindPwPage.jsp", "", "innerWidth=530, innerHeight=420, left=1200, top=300");
	}
</script>
<style>
	#board {
		width: 1000px;
		height: 250px;
		border: 2px solid #00C6BD;
		border-radius: 50px;
		margin: auto;
	}
	#login {
		width: 45%;
		margin: 90px 50px 120px 60px;
	}
	#login p {
		display: inline;
		font-size: 15px;
	}
	#input input {
		padding: 4px 0 4px 0;
		margin: 5px 10px 5px 16px;
		border: 1px solid #00C6BD;
	}
	#loginBtn {
		width: 100px;
		height: 62px;
		position: relative;
		left: 270px;
		bottom: 66px;
		border: 1px solid #00C6BD;
		border-radius: 10px;
		background-color: #00C6BD;
		color: white;
		font-size: 15px;
	}
	#vertical-line {
		position: relative;
		right: 0px;
		bottom: 318px;
		margin: auto;
		border-right: thin solid #00C6BD;
		width: 1px;
		height: 200px;
	}
	#else {
		position: relative;
		bottom: 545px;
		left: 515px;
		width: 45%;
		margin: 90px 50px 120px 60px;
	}
	#else p {
		display: inline;
		font-size: 13px;
	}
	#else input {
		width: 120px;
		height: 24px;
		font-size: 11px;
		margin: 5px 15px 10px 17px;
		border: 1px solid #00C6BD;
		border-radius: 5px;
		color: #00C6BD;
	}
	#check {
		position: absolute;
		left: 24.8%;
		top: 405px;
		border: 2px solid red;
		border-radius: 100px;
		width: 250px;
		height: 32px;
		font-family: "Malgun Gothic";
		font-size: 14px;
		color: red;
		padding-top: 10px;
		text-align: center;
	}
</style>
</head>
<body>
	<header>
		<jsp:include page="/hdft/Header.jsp"/>
	</header>
	<div style="height:250px;"></div>
	
	<h1 style="margin:0 0 50px 500px;">로그인</h1>
	<br><p>
	<div id="board">
		<div id="login">
			<c:choose>
				<c:when test="${param.check == 'id'}">
					<div id="check">
						존재하지 않는 아이디입니다.
					</div>
				</c:when>
				<c:when test="${param.check == 'user'}">
					<div id="check">
						이미 탈퇴한 회원입니다.
					</div>
				</c:when>
				<c:when test="${param.check == 'pw'}">
					<div id="check">
						비밀번호를 다시 확인해주세요.
					</div>
				</c:when>
				<c:otherwise>
				</c:otherwise>
			</c:choose>
			<form name="form" action="login.do" method="post">
				<div id="input">			
					<p style="margin-right:20px;">아이디</p><input type="text" name="id" required="required"/>
					<br>
					<p style="margin-right:5px;">비밀번호</p><input type="password" name="pw" required="required"/>
				</div>
				<input type="submit" value="로그인" id="loginBtn"/>
			</form>
		</div>
		<div id="vertical-line"></div>
		<div id="else">			
			<p style="margin-right:100px;">회원이 아니신가요?</p>
			<input type="button" value="회원가입" style="background-color:#00C6BD; color:white;"
			onclick="location.href='/howland/user/JoinPage.jsp'"/>
			<br>
			<p style="margin-right:21px;">아이디 / 비밀번호를 잊으셨나요?</p>
			<input type="button" value="ID 찾기" style="background-color:white; width:56px; margin-left:20px;"
			onclick="findId()"/>
			<input type="button" value="PW 찾기" style="background-color:white; width:56px; margin-left:-10px;"
			onclick="findPw()"/>
		</div>
	</div>
	
	<div style="height:200px;"></div>
	<footer>
		<jsp:include page="/hdft/Footer.jsp"/>
	</footer>
</body>
</html>