<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HowLand : FAQ</title>
<style>
	#board {
		width: 80%;
		height: auto;
		margin: auto;
		text-align: center;
	}
	.imgs {
		width: 100%;
		height: auto;
	}
</style>
</head>
<body>
	<header>
		<jsp:include page="/hdft/Header.jsp"/>
	</header>
	<br><p style="height:50px;"/>
	
	<div id="board">
		<img src="/howland/source/tutorial/faq1.png" class="imgs"/>
		<img src="/howland/source/tutorial/faq2.png" class="imgs"/>
	</div>
	
	<div style="height:200px;"></div>
	<footer>
		<jsp:include page="/hdft/Footer.jsp"/>
	</footer>
</body>
</html>