<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Footer</title>
<style>
	#footer {
		width: 100%;
		height: 300px;
		background-color: black;
	}
	#info {
		float: left;
		width: 500px;
		height: 120px;
		padding: 40px 0 0 100px;
	}
	#info p {
		color: #d9d9d9;
		font-size: 11px;
	}
	
	
	#serv {
		float: right;
		padding: 20px;
		margin-right: 100px;
		text-align: center;
	}
	#serv a {
		text-decoration: none;
		color: #d9d9d9;
		font-size: 13px;
	}
	
	
	#agrmt {
		float: right;
		padding: 20px;
		margin: 20px 40px 0 0;
		text-align: center;
	}
	#agrmt a {
		text-decoration: none;
		color: #d9d9d9;
		font-size: 13px;
	}
</style>
</head>
<body>
	<div id="footer">
		<div id="info">
			<p style="margin-bottom:20px;">상호: 하울랜드 | 대표자명: 지윤호</p>
			<p style="margin-bottom:20px;">사업자등록번호: 123-45-67890 | 이메일: help@howland.com</p>
			<p>주소: 서울시 망우동 봉우제로 55길</p>
		</div>
		<div id="serv">
			<h4 style="margin-bottom:30px; color:#d9d9d9;">고객센터</h4>
			<a href="/howland/static/NoticePage.jsp">이용안내</a><br><p>
			<a href="/howland/static/FAQPage.jsp">FAQ</a><br><p>
		</div>
		<div id="agrmt">
			<a href="#">이용약관</a><br>
			<div style="height:30px;"></div>
			<a href="#">개인정보처리방침</a>
		</div>
		<hr style="width:90%; height:1px; border:0; background-color:#696969;"/>
		<p style="color:#d9d9d9; font-size:15px; text-align:center;">Copyright&copy;&nbsp;HowLand All Rights Reserved</p>
	</div>
</body>
</html>